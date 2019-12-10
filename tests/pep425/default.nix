{ writeText, stdenv, lib, pep425, pep425OSX, pep425Python37 }:

lib.debug.runTests {

  testLinuxSimple = 
  let
    cs = [
      "grpcio-1.25.0-cp27-cp27m-macosx_10_10_x86_64.whl"
      "grpcio-1.25.0-cp27-cp27m-manylinux2010_x86_64.whl"
    ];
  in
  {
    expr = (pep425.select cs);
    expected = ["grpcio-1.25.0-cp27-cp27m-manylinux2010_x86_64.whl"];
  };

  testOSXSimple = 
  let
    cs = [
      "grpcio-1.25.0-cp27-cp27m-macosx_10_10_x86_64.whl"
      "grpcio-1.25.0-cp27-cp27m-manylinux2010_x86_64.whl"
    ];
  in
  {
    expr = (pep425OSX.select cs);
    expected = ["grpcio-1.25.0-cp27-cp27m-macosx_10_10_x86_64.whl"];
  };

  testLinuxPickPython37 = 
  let
    cs = [ 
      "grpcio-1.25.0-cp27-cp27m-macosx_10_10_x86_64.whl"
      "grpcio-1.25.0-cp27-cp27m-macosx_10_9_x86_64.whl"
      "grpcio-1.25.0-cp27-cp27m-manylinux1_i686.whl"
      "grpcio-1.25.0-cp27-cp27m-manylinux2010_x86_64.whl"
      "grpcio-1.25.0-cp37-cp37m-manylinux1_i686.whl"
      "grpcio-1.25.0-cp37-cp37m-manylinux2010_x86_64.whl"
    ];
  in
  {
    expr = (pep425Python37.select cs);
    expected = ["grpcio-1.25.0-cp37-cp37m-manylinux2010_x86_64.whl"];
  };

  testOSXPreferNewer = 
  let
    cs = [ 
      "grpcio-1.25.0-cp27-cp27m-macosx_10_9_x86_64.whl"
      "grpcio-1.25.0-cp27-cp27m-macosx_10_12_x86_64.whl" 
    ];
  in
  {
    expr = (pep425OSX.select cs);
    expected = ["grpcio-1.25.0-cp27-cp27m-macosx_10_12_x86_64.whl"];
  };

  testOSXNoMatch = 
  let
    cs = [ 
      "grpcio-1.25.0-cp27-cp27m-manylinux1_x86_64.whl"
      "grpcio-1.25.0-cp27-cp27m-manylinux2010_x86_64.whl"
    ];
  in
  {
    expr = (pep425OSX.select cs);
    expected = [];
  };

  testLinuxPreferOlder = 
  let
    cs = [ 
      "grpcio-1.25.0-cp27-cp27m-manylinux1_x86_64.whl"
      "grpcio-1.25.0-cp27-cp27m-manylinux2010_x86_64.whl"
    ];
  in
  {
    expr = (pep425.select cs);
    expected = ["grpcio-1.25.0-cp27-cp27m-manylinux1_x86_64.whl"];
  };

  testLinuxNoMatch = 
  let
    cs = [ 
      "grpcio-1.25.0-cp27-cp27m-macosx_10_9_x86_64.whl"
      "grpcio-1.25.0-cp27-cp27m-macosx_10_12_x86_64.whl" 
    ];
  in
  {
    expr = (pep425.select cs);
    expected = [];
  };

  testLinuxEmptyList = {
    expr = pep425.select [];
    expected = [];
  };

  testOSXEmptyList = {
    expr = pep425OSX.select [];
    expected = [];
  };

  testLinuxCffiWhlFiles = 
  let
    cs = [
      "cffi-1.13.2-cp27-cp27m-macosx_10_6_intel.whl"
      "cffi-1.13.2-cp27-cp27m-manylinux1_i686.whl"
      "cffi-1.13.2-cp27-cp27m-manylinux1_x86_64.whl"
      "cffi-1.13.2-cp27-cp27m-win32.whl"
      "cffi-1.13.2-cp27-cp27m-win_amd64.whl"
      "cffi-1.13.2-cp27-cp27mu-manylinux1_i686.whl"
      "cffi-1.13.2-cp27-cp27mu-manylinux1_x86_64.whl"
      "cffi-1.13.2-cp34-cp34m-macosx_10_6_intel.whl"
      "cffi-1.13.2-cp34-cp34m-manylinux1_i686.whl"
      "cffi-1.13.2-cp34-cp34m-manylinux1_x86_64.whl"
      "cffi-1.13.2-cp34-cp34m-win32.whl"
      "cffi-1.13.2-cp34-cp34m-win_amd64.whl"
      "cffi-1.13.2-cp35-cp35m-macosx_10_6_intel.whl"
      "cffi-1.13.2-cp35-cp35m-manylinux1_i686.whl"
      "cffi-1.13.2-cp35-cp35m-manylinux1_x86_64.whl"
      "cffi-1.13.2-cp35-cp35m-win32.whl"
      "cffi-1.13.2-cp35-cp35m-win_amd64.whl"
      "cffi-1.13.2-cp36-cp36m-macosx_10_6_intel.whl"
      "cffi-1.13.2-cp36-cp36m-manylinux1_i686.whl"
      "cffi-1.13.2-cp36-cp36m-manylinux1_x86_64.whl"
      "cffi-1.13.2-cp36-cp36m-win32.whl"
      "cffi-1.13.2-cp36-cp36m-win_amd64.whl"
      "cffi-1.13.2-cp37-cp37m-macosx_10_6_intel.whl"
      "cffi-1.13.2-cp37-cp37m-manylinux1_i686.whl"
      "cffi-1.13.2-cp37-cp37m-manylinux1_x86_64.whl"
      "cffi-1.13.2-cp37-cp37m-win32.whl"
      "cffi-1.13.2-cp37-cp37m-win_amd64.whl"
      "cffi-1.13.2-cp38-cp38-macosx_10_9_x86_64.whl"
      "cffi-1.13.2-cp38-cp38-manylinux1_i686.whl"
      "cffi-1.13.2-cp38-cp38-manylinux1_x86_64.whl"
      "cffi-1.13.2-cp38-cp38-win32.whl"
      "cffi-1.13.2-cp38-cp38-win_amd64.whl"
      "cffi-1.13.2.tar.gz"
    ];
  in
  {
    expr = pep425.select cs;
    expected = ["cffi-1.13.2-cp27-cp27m-manylinux1_x86_64.whl"];
  };

}
