Subject: [meta-python][Question] python3-dlib recipe?
To: openembedded-devel@lists.openembedded.org
From: open.prac@gmail.com
X-Originating-Location: Amealco, Querétaro, MX (187.145.20.250)
X-Originating-Platform: Linux Firefox 84
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 20 Jan 2021 13:12:08 -0800
Message-ID: <qCdQ.1611177128438633625.2UtR@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="buXKzggm0mYZvuhbSTwh"

--buXKzggm0mYZvuhbSTwh
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

Hi everyone, first time in the mailing list...

I was wondering if anybody is already working in a recipe for the package =
dlib pyhon3 module,
so far this is the recipe I've been working on
```bitbake
# python3-dlib_19.21.1.bb
SUMMARY =3D "A toolkit for making real world machine learning and data ana=
lysis applications"
HOMEPAGE =3D "https://pypi.python.org/pypi/dlib"
PYPI_PACKAGE =3D "dlib"
LICENSE =3D "Boost-Software"
SRC_URI[md5sum] =3D "1e7e357d7d54e86267ef60f606cb40e1"
LIC_FILES_CHKSUM =3D "file://dlib/LICENSE.txt;md5=3D2c7a3fa82e66676005cd4e=
e2608fd7d2 \                                
                    file://dlib/external/libpng/LICENSE;md5=3D243135ddedf7=
02158f9170807cbcfb66 \
                    file://dlib/external/pybind11/LICENSE;md5=3Dbeb87117af=
69fd10fbf9fb14c22a2e62 \
                    file://python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.tx=
t;md5=3D064f53ab40ea2b6a4bba1324149e4fde \
"
DEPENDS =3D "cmake-native"

inherit  pypi setuptools3
BBCLASSEXTEND =3D "native nativesdk"

```


I'm not a bitbake or cmake expert, during do_compile() task i get the foll=
owing error message
```
| [ 95%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/shape_predi=
ctor.cpp.o
| [ 96%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/correlation=
_tracker.cpp.o
| [ 96%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/face_recogn=
ition.cpp.o
| [ 97%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/cnn_face_de=
tector.cpp.o
| [ 98%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/global_opti=
mization.cpp.o
| [ 98%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/image_datas=
et_metadata.cpp.o
| [ 99%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/numpy_retur=
ns.cpp.o
| [100%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/line.cpp.o
| [100%] Linking CXX shared module build_dunfell/tmp/work/aarch64-poky-lin=
ux/python3-dlib/19.21.1-r0/build/lib.linux-x86_64-3.8/_dlib_pybind11.cpytho=
n-38-aarch64-linux-gnu.so
| build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r0/recipe=
-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux=
/gcc/aarch64-poky-linux/8.3.0/ld: build_dunfell/tmp/work/aarch64-poky-linux=
/python3-dlib/19.21.1-r0/recipe-sysroot-native/usr/lib/libsqlite3.so: error=
 adding symbols: file in wrong format
| collect2: error: ld returned 1 exit status
| CMakeFiles/_dlib_pybind11.dir/build.make:445: recipe for target 'build_d=
unfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r0/build/lib.linux-=
x86_64-3.8/_dlib_pybind11.cpython-38-aarch64-linux-gnu.so' failed
| make[2]: *** [build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.=
21.1-r0/build/lib.linux-x86_64-3.8/_dlib_pybind11.cpython-38-aarch64-linux-=
gnu.so] Error 1
| CMakeFiles/Makefile2:116: recipe for target 'CMakeFiles/_dlib_pybind11.d=
ir/all' failed
| make[1]: *** [CMakeFiles/_dlib_pybind11.dir/all] Error 2
| Makefile:83: recipe for target 'all' failed
| make: *** [all] Error 2
| Traceback (most recent call last):
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/dlib-19.21.1/setup.py", line 223, in <module>
|     setup(
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/recipe-sysroot-native/usr/lib/python3.8/site-packages/setuptools/__init__=
.py", line 144, in setup
|     return distutils.core.setup(**attrs)
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/recipe-sysroot-native/usr/lib/python3.8/distutils/core.py", line 148, in =
setup
|     dist.run_commands()
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py", line 966, in =
run_commands
|     self.run_command(cmd)
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py", line 985, in =
run_command
|     cmd_obj.run()
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/recipe-sysroot-native/usr/lib/python3.8/distutils/command/build.py", line=
 135, in run
|     self.run_command(cmd_name)
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/recipe-sysroot-native/usr/lib/python3.8/distutils/cmd.py", line 313, in r=
un_command
|     self.distribution.run_command(command)
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py", line 985, in =
run_command
|     cmd_obj.run()
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/dlib-19.21.1/setup.py", line 135, in run
|     self.build_extension(ext)
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/dlib-19.21.1/setup.py", line 175, in build_extension
|     subprocess.check_call(cmake_build, cwd=3Dbuild_folder)
|   File "build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r=
0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py", line 364, in chec=
k_call
|     raise CalledProcessError(retcode, cmd)
| subprocess.CalledProcessError: Command '['cmake', '--build', '.', '--con=
fig', 'Release', '--', '-j8']' returned non-zero exit status 2.
| WARNING: exit code 1 from a shell command.
|=20

```

Not sure why the linker **gcc/aarch64-poky-linux/8.3.0/ld** is showing the=
 error
```
 error adding symbols: file in wrong format
```
Perhaps i'm messing things up with cmake-native environment but not sure h=
ow i can enable cmake to be used by setup.py if it is not with DEPENDS=3Dcm=
ake-native.

Any clue to solve this issue will be highly appreciated, or if you know wh=
o is already working on this it will be great to have its contact :)

Also i use dunfell branch for meta-oe

BR,

--buXKzggm0mYZvuhbSTwh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi everyone, first time in the mailing list...</p>

<p>I was wondering if anybody is already working in a recipe for the packa=
ge dlib pyhon3 module,
so far this is the recipe I've been working on</p>
<pre class=3D"prettyprint"><code class=3D"language-bitbake"># python3-dlib=
_19.21.1.bb
SUMMARY =3D &#34;A toolkit for making real world machine learning and data=
 analysis applications&#34;
HOMEPAGE =3D &#34;https://pypi.python.org/pypi/dlib&#34;
PYPI_PACKAGE =3D &#34;dlib&#34;
LICENSE =3D &#34;Boost-Software&#34;
SRC_URI[md5sum] =3D &#34;1e7e357d7d54e86267ef60f606cb40e1&#34;
LIC_FILES_CHKSUM =3D &#34;file://dlib/LICENSE.txt;md5=3D2c7a3fa82e66676005=
cd4ee2608fd7d2 \                                
                    file://dlib/external/libpng/LICENSE;md5=3D243135ddedf7=
02158f9170807cbcfb66 \
                    file://dlib/external/pybind11/LICENSE;md5=3Dbeb87117af=
69fd10fbf9fb14c22a2e62 \
                    file://python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.tx=
t;md5=3D064f53ab40ea2b6a4bba1324149e4fde \
&#34;
DEPENDS =3D &#34;cmake-native&#34;

inherit  pypi setuptools3
BBCLASSEXTEND =3D &#34;native nativesdk&#34;

</code></pre>
<p>I'm not a bitbake or cmake expert, during do_compile() task i get the f=
ollowing error message</p>
<pre class=3D"prettyprint"><code class=3D"language-unknown">| [ 95%] Build=
ing CXX object CMakeFiles/_dlib_pybind11.dir/src/shape_predictor.cpp.o
| [ 96%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/correlation=
_tracker.cpp.o
| [ 96%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/face_recogn=
ition.cpp.o
| [ 97%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/cnn_face_de=
tector.cpp.o
| [ 98%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/global_opti=
mization.cpp.o
| [ 98%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/image_datas=
et_metadata.cpp.o
| [ 99%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/numpy_retur=
ns.cpp.o
| [100%] Building CXX object CMakeFiles/_dlib_pybind11.dir/src/line.cpp.o
| [100%] Linking CXX shared module build_dunfell/tmp/work/aarch64-poky-lin=
ux/python3-dlib/19.21.1-r0/build/lib.linux-x86_64-3.8/_dlib_pybind11.cpytho=
n-38-aarch64-linux-gnu.so
| build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r0/recipe=
-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux=
/gcc/aarch64-poky-linux/8.3.0/ld: build_dunfell/tmp/work/aarch64-poky-linux=
/python3-dlib/19.21.1-r0/recipe-sysroot-native/usr/lib/libsqlite3.so: error=
 adding symbols: file in wrong format
| collect2: error: ld returned 1 exit status
| CMakeFiles/_dlib_pybind11.dir/build.make:445: recipe for target &#39;bui=
ld_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21.1-r0/build/lib.li=
nux-x86_64-3.8/_dlib_pybind11.cpython-38-aarch64-linux-gnu.so&#39; failed
| make[2]: *** [build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.=
21.1-r0/build/lib.linux-x86_64-3.8/_dlib_pybind11.cpython-38-aarch64-linux-=
gnu.so] Error 1
| CMakeFiles/Makefile2:116: recipe for target &#39;CMakeFiles/_dlib_pybind=
11.dir/all&#39; failed
| make[1]: *** [CMakeFiles/_dlib_pybind11.dir/all] Error 2
| Makefile:83: recipe for target &#39;all&#39; failed
| make: *** [all] Error 2
| Traceback (most recent call last):
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/dlib-19.21.1/setup.py&#34;, line 223, in &lt;module&gt;
|     setup(
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/recipe-sysroot-native/usr/lib/python3.8/site-packages/setuptools/__in=
it__.py&#34;, line 144, in setup
|     return distutils.core.setup(**attrs)
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/core.py&#34;, line =
148, in setup
|     dist.run_commands()
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py&#34;, line =
966, in run_commands
|     self.run_command(cmd)
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py&#34;, line =
985, in run_command
|     cmd_obj.run()
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/command/build.py&#3=
4;, line 135, in run
|     self.run_command(cmd_name)
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/cmd.py&#34;, line 3=
13, in run_command
|     self.distribution.run_command(command)
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/recipe-sysroot-native/usr/lib/python3.8/distutils/dist.py&#34;, line =
985, in run_command
|     cmd_obj.run()
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/dlib-19.21.1/setup.py&#34;, line 135, in run
|     self.build_extension(ext)
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/dlib-19.21.1/setup.py&#34;, line 175, in build_extension
|     subprocess.check_call(cmake_build, cwd=3Dbuild_folder)
|   File &#34;build_dunfell/tmp/work/aarch64-poky-linux/python3-dlib/19.21=
.1-r0/recipe-sysroot-native/usr/lib/python3.8/subprocess.py&#34;, line 364,=
 in check_call
|     raise CalledProcessError(retcode, cmd)
| subprocess.CalledProcessError: Command &#39;[&#39;cmake&#39;, &#39;--bui=
ld&#39;, &#39;.&#39;, &#39;--config&#39;, &#39;Release&#39;, &#39;--&#39;, =
&#39;-j8&#39;]&#39; returned non-zero exit status 2.
| WARNING: exit code 1 from a shell command.
|=20

</code></pre>
<p>Not sure why the linker <strong>gcc/aarch64-poky-linux/8.3.0/ld</strong=
> is showing the error</p>
<pre class=3D"prettyprint"><code class=3D"language-unknown"> error adding =
symbols: file in wrong format
</code></pre>
<p>Perhaps i'm messing things up with cmake-native environment but not sur=
e how i can enable cmake to be used by setup.py if it is not with DEPENDS=
=3Dcmake-native.</p>

<p>Any clue to solve this issue will be highly appreciated, or if you know=
 who is already working on this it will be great to have its contact :)</p>

<p>Also i use dunfell branch for meta-oe</p>

<p>BR,</p>

--buXKzggm0mYZvuhbSTwh--
