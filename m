Return-Path: <stuartvivian@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1241D6ACEF
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 15:38:10 +0000 (UTC)
Subject: [meta-python] Issue with scikit-build-core finding python interpreter
To: openembedded-devel@lists.openembedded.org
From: stuartvivian@gmail.com
X-Originating-Location: Coventry, England, GB (5.151.159.97)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 07:38:09 -0800
Message-ID: <N58a.1732721889771436025.Jglx@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sC16WG508mqupYPJUnl4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 15:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114092

--sC16WG508mqupYPJUnl4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I'm attempting to write a recipe set against the scarthgap release to build=
 the latest version of pyzmq. This now uses the scikit-build-core instead o=
f scikit-build. I'm attempting to use the following versions:
yocto: scarthgap
pyzmq: 26.2.0
scikit-build-core: 0.10.7

During do_compile() scikit-build-core appears to be executing cmake but cma=
ke is unable to locate the python interpreter producing this error:

>=20
> CMake Error at
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPack=
ageHandleStandardArgs.cmake:230
> (message):
> Could NOT find Python (missing: Interpreter Development.Module)
>=20
>=20

As far as I can tell the python environment is being populated into the rec=
ipe's native sysroot and the PYTHON environment variable is set up correctl=
y. So I'm wondering if I am doing something wrong in the recipes or if ther=
e is an issue in scikit-build-core.
These are the only recipes I am having an issue with. Without these the ove=
rall image build goes through fine and I have a useable system with plenty =
of the python modules installed and working, including the previous version=
s of pyzmq and scikit-build, from which the following recipes were based.

I'm in-lining the recipes as I have them today. Note that there maybe some =
unnecessary debugging extras in these right now.

Thanks in advance for any help you could give me!

recipes-devtools/python/python3-pyzmq_26.2.0.bb

>=20
>=20
> SUMMARY =3D "Python bindings for 0MQ"
> HOMEPAGE =3D "None"
> AUTHOR =3D "Brian E. Granger, Min Ragan-Kelley <PyZMQ Contributors
> <zeromq-dev@lists.zeromq.org>>"
> LICENSE =3D "BSD-3-Clause"
> LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D1787206f198344195a671b60326c59dc"
> SRC_URI =3D
> "https://files.pythonhosted.org/packages/fd/05/bed626b9f7bb2322cdbbf7b4bd=
8f54b1b617b0d2ab2d3547d6e39428a48e/pyzmq-26.2.0.tar.gz"
>=20
> SRC_URI[md5sum] =3D "5beb3ba3df4ee3651dd06661623dabb9"
> SRC_URI[sha256sum] =3D
> "070672c258581c8e4f640b5159297580a9974b026043bd4ab0470be9ed324f1f"
> S =3D "${WORKDIR}/pyzmq-26.2.0"
> inherit cmake pypi pkgconfig python_setuptools_build_meta
> DEPENDS =3D "python3-packaging-native python3-cython-native
> python3-setuptools-scm-native python3-scikit-build-core-native zeromq"
> RDEPENDS:${PN} +=3D "\
> python3-json \
> python3-multiprocessing \
> python3-tornado \
> "
> EXTRA_OECMAKE +=3D "\
> --debug-find \
> -DCMAKE_MODULE_PATH=3D${STAGING_LIBDIR}/cmake \
> -DCMAKE_PREFIX_PATH=3D${STAGING_LIBDIR} \
> "
> do_compile:prepend() {
> export
> export CMAKE_EXECUTABLE=3D"${STAGING_BINDIR_NATIVE}/cmake"
> echo [global] > ${S}/setup.cfg
> echo zmq_prefix =3D ${STAGING_DIR_HOST} >> ${S}/setup.cfg
> echo have_sys_un_h =3D True >> ${S}/setup.cfg
> echo skip_check_zmq =3D True >> ${S}/setup.cfg
> echo libzmq_extension =3D False >> ${S}/setup.cfg
> echo no_libzmq_extension =3D True >> ${S}/setup.cfg
> }
>=20

recipes-devtools/python/python3-scikit-build-core_0.10.7.bb

>=20
> SUMMARY =3D "Build backend for Python that uses CMake to build extension
> modules"
> LICENSE =3D "Apache-2.0"
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b4e748e5f102e31c9390dcd6fa66f=
09"
>=20
> DEPENDS =3D "python3-hatch-vcs-native
> python3-hatch-fancy-pypi-readme-native"
>=20
> SRC_URI[sha256sum] =3D
> "04cbb59fe795202a7eeede1849112ee9dcbf3469feebd9b8b36aa541336ac4f8"
>=20
> inherit pypi python_hatchling
>=20
> OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
>=20
> PYPI_PACKAGE =3D "scikit_build_core"
>=20
> S =3D "${WORKDIR}/scikit_build_core-${PV}"
>=20
> RDEPENDS:${PN} =3D " \
> python3-dev \
> python3-distro \
> python3-packaging \
> python3-setuptools \
> python3-typing-extensions \
> python3-wheel \
> python3-modules \
> cmake \
> "
>=20
> BBCLASSEXTEND =3D "native nativesdk"
>=20
>=20
>=20

This is the log for python-pyzmq's do_compile()

>=20
> * Getting build dependencies for wheel...
> WARNING: Use build.targets instead of cmake.targets for scikit-build-core
> >=3D 0.10
> * Building wheel...
> WARNING: Use build.targets instead of cmake.targets for scikit-build-core
> >=3D 0.10
> *** scikit-build-core 0.10.7 using CMake 3.28.3 (wheel)
> *** Configuring CMake...
> loading initial cache file /tmp/tmpwaaodqce/build/CMakeInit.txt
> -- The C compiler identification is GNU 13.3.0
> -- The CXX compiler identification is GNU 13.3.0
> -- Detecting C compiler ABI info
> -- Detecting C compiler ABI info - done
> -- Check for working C compiler:
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/recipe-sysroot-native/usr/bin/arm-xilinx-linux-gnueabi/arm-=
xilinx-linux-gnueabi-gcc
> - skipped
> -- Detecting C compile features
> -- Detecting C compile features - done
> -- Detecting CXX compiler ABI info
> -- Detecting CXX compiler ABI info - done
> -- Check for working CXX compiler:
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/recipe-sysroot-native/usr/bin/arm-xilinx-linux-gnueabi/arm-=
xilinx-linux-gnueabi-g++
> - skipped
> -- Detecting CXX compile features
> -- Detecting CXX compile features - done
> CMake Error at
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPack=
ageHandleStandardArgs.cmake:230
> (message):
> Could NOT find Python (missing: Interpreter Development.Module)
> Call Stack (most recent call first):
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPack=
ageHandleStandardArgs.cmake:600
> (_FPHSA_FAILURE_MESSAGE)
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/recipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPyth=
on.cmake:616
> (find_package_handle_standard_args)
> CMakeLists.txt:6 (find_package)
>=20
>=20
> -- Configuring incomplete, errors occurred!
>=20
> *** CMake configuration failed
>=20
> ERROR Backend subprocess exited when trying to invoke build_wheel
> WARNING:
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/temp/run.do_compile.6987:164
> exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/dist
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/pyzmq-26.2.0'
>=20
> WARNING: Backtrace (BB generated script):
> #1: python_pep517_do_compile,
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/temp/run.do_compile.6987,
> line 164
> #2: do_compile,
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/temp/run.do_compile.6987,
> line 159
> #3: main,
> /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/pytho=
n3-pyzmq/26.2.0/temp/run.do_compile.6987,
> line 175
>=20
>=20
>

--sC16WG508mqupYPJUnl4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>I'm attempting to write a recipe set against the scarthgap release to =
build the latest version of pyzmq. This now uses the scikit-build-core inst=
ead of scikit-build. I'm attempting to use the following versions:</div>
<div>yocto: scarthgap</div>
<div>pyzmq: 26.2.0</div>
<div>scikit-build-core: 0.10.7</div>
<div>&nbsp;</div>
<div>During do_compile() scikit-build-core appears to be executing cmake bu=
t cmake is unable to locate the python interpreter producing this error:</d=
iv>
<blockquote>
<div>CMake Error at /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-l=
inux-gnueabi/python3-pyzmq/26.2.0/recipe-sysroot-native/usr/share/cmake-3.2=
8/Modules/FindPackageHandleStandardArgs.cmake:230 (message):<br />&nbsp; Co=
uld NOT find Python (missing: Interpreter Development.Module)</div>
<div>&nbsp;</div>
</blockquote>
<div>As far as I can tell the python environment is being populated into th=
e recipe's native sysroot and the PYTHON environment variable is set up cor=
rectly. So I'm wondering if I am doing something wrong in the recipes or if=
 there is an issue in scikit-build-core.</div>
<div>These are the only recipes I am having an issue with. Without these th=
e overall image build goes through fine and I have a useable system with pl=
enty of the python modules installed and working, including the previous ve=
rsions of pyzmq and scikit-build, from which the following recipes were bas=
ed.</div>
<div>&nbsp;</div>
<div>I'm in-lining the recipes as I have them today. Note that there maybe =
some unnecessary debugging extras in these right now.</div>
<div>&nbsp;</div>
<div>Thanks in advance for any help you could give me!</div>
<div>&nbsp;</div>
<div>recipes-devtools/python/python3-pyzmq_26.2.0.bb</div>
<blockquote>
<div>
<div><br />SUMMARY =3D "Python bindings for 0MQ"<br />HOMEPAGE =3D "None"<b=
r />AUTHOR =3D "Brian E. Granger, Min Ragan-Kelley &lt;PyZMQ Contributors &=
lt;zeromq-dev@lists.zeromq.org&gt;&gt;"<br />LICENSE =3D "BSD-3-Clause"<br =
/>LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D1787206f198344195a671b60326=
c59dc"</div>
<div>SRC_URI =3D "https://files.pythonhosted.org/packages/fd/05/bed626b9f7b=
b2322cdbbf7b4bd8f54b1b617b0d2ab2d3547d6e39428a48e/pyzmq-26.2.0.tar.gz"<br /=
>SRC_URI[md5sum] =3D "5beb3ba3df4ee3651dd06661623dabb9"<br />SRC_URI[sha256=
sum] =3D "070672c258581c8e4f640b5159297580a9974b026043bd4ab0470be9ed324f1f"=
</div>
<div>S =3D "${WORKDIR}/pyzmq-26.2.0"</div>
<div>inherit cmake pypi pkgconfig python_setuptools_build_meta</div>
<div>DEPENDS =3D "python3-packaging-native python3-cython-native python3-se=
tuptools-scm-native python3-scikit-build-core-native zeromq"</div>
<div>RDEPENDS:${PN} +=3D "\<br />&nbsp; &nbsp; &nbsp; &nbsp; python3-json \=
<br />&nbsp; &nbsp; &nbsp; &nbsp; python3-multiprocessing \<br />&nbsp; &nb=
sp; &nbsp; &nbsp; python3-tornado \<br />"<br />EXTRA_OECMAKE +=3D "\<br />=
&nbsp; &nbsp; --debug-find \<br />&nbsp; &nbsp; -DCMAKE_MODULE_PATH=3D${STA=
GING_LIBDIR}/cmake \<br />&nbsp; &nbsp; -DCMAKE_PREFIX_PATH=3D${STAGING_LIB=
DIR} \<br />"<br />do_compile:prepend() {<br />&nbsp; &nbsp; export<br />&n=
bsp; &nbsp; export CMAKE_EXECUTABLE=3D"${STAGING_BINDIR_NATIVE}/cmake"<br /=
>&nbsp; &nbsp; echo [global] &gt; ${S}/setup.cfg<br />&nbsp; &nbsp; echo zm=
q_prefix =3D ${STAGING_DIR_HOST} &gt;&gt; ${S}/setup.cfg<br />&nbsp; &nbsp;=
 echo have_sys_un_h =3D True &gt;&gt; ${S}/setup.cfg<br />&nbsp; &nbsp; ech=
o skip_check_zmq =3D True &gt;&gt; ${S}/setup.cfg<br />&nbsp; &nbsp; echo l=
ibzmq_extension =3D False &gt;&gt; ${S}/setup.cfg<br />&nbsp; &nbsp; echo n=
o_libzmq_extension =3D True &gt;&gt; ${S}/setup.cfg<br />}</div>
</div>
</blockquote>
<div>recipes-devtools/python/python3-scikit-build-core_0.10.7.bb</div>
<blockquote>
<div>
<div>SUMMARY =3D "Build backend for Python that uses CMake to build extensi=
on modules"</div>
<div>LICENSE =3D "Apache-2.0"</div>
<div>LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b4e748e5f102e31c9390dcd6fa=
66f09"</div>
<div>&nbsp;</div>
<div>DEPENDS =3D "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-=
native"</div>
<div>&nbsp;</div>
<div>SRC_URI[sha256sum] =3D "04cbb59fe795202a7eeede1849112ee9dcbf3469feebd9=
b8b36aa541336ac4f8"</div>
<div>&nbsp;</div>
<div>inherit pypi python_hatchling</div>
<div>&nbsp;</div>
<div>OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"</div>
<div>&nbsp;</div>
<div>PYPI_PACKAGE =3D "scikit_build_core"</div>
<div>&nbsp;</div>
<div>S =3D "${WORKDIR}/scikit_build_core-${PV}"</div>
<div>&nbsp;</div>
<div>RDEPENDS:${PN} =3D " \</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-dev \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-distro \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-packaging \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-setuptools \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-typing-extensions \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-wheel \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>python3-modules \</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>cmake \</span></div>
<div>"</div>
<div>&nbsp;</div>
<div>BBCLASSEXTEND =3D "native nativesdk"</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>
</blockquote>
<div>&nbsp;</div>
<div>This is the log for python-pyzmq's do_compile()</div>
<blockquote>
<div>
<div>* Getting build dependencies for wheel...</div>
<div>WARNING: Use build.targets instead of cmake.targets for scikit-build-c=
ore &gt;=3D 0.10</div>
<div>* Building wheel...</div>
<div>WARNING: Use build.targets instead of cmake.targets for scikit-build-c=
ore &gt;=3D 0.10</div>
<div>*** scikit-build-core 0.10.7 using CMake 3.28.3 (wheel)</div>
<div>*** Configuring CMake...</div>
<div>loading initial cache file /tmp/tmpwaaodqce/build/CMakeInit.txt</div>
<div>-- The C compiler identification is GNU 13.3.0</div>
<div>-- The CXX compiler identification is GNU 13.3.0</div>
<div>-- Detecting C compiler ABI info</div>
<div>-- Detecting C compiler ABI info - done</div>
<div>-- Check for working C compiler: /src/platform/build/tmp/work/cortexa9=
t2hf-neon-xilinx-linux-gnueabi/python3-pyzmq/26.2.0/recipe-sysroot-native/u=
sr/bin/arm-xilinx-linux-gnueabi/arm-xilinx-linux-gnueabi-gcc - skipped</div=
>
<div>-- Detecting C compile features</div>
<div>-- Detecting C compile features - done</div>
<div>-- Detecting CXX compiler ABI info</div>
<div>-- Detecting CXX compiler ABI info - done</div>
<div>-- Check for working CXX compiler: /src/platform/build/tmp/work/cortex=
a9t2hf-neon-xilinx-linux-gnueabi/python3-pyzmq/26.2.0/recipe-sysroot-native=
/usr/bin/arm-xilinx-linux-gnueabi/arm-xilinx-linux-gnueabi-g++ - skipped</d=
iv>
<div>-- Detecting CXX compile features</div>
<div>-- Detecting CXX compile features - done</div>
<div>CMake Error at /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-l=
inux-gnueabi/python3-pyzmq/26.2.0/recipe-sysroot-native/usr/share/cmake-3.2=
8/Modules/FindPackageHandleStandardArgs.cmake:230 (message):</div>
<div>&nbsp; Could NOT find Python (missing: Interpreter Development.Module)=
</div>
<div>Call Stack (most recent call first):</div>
<div>&nbsp; /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnu=
eabi/python3-pyzmq/26.2.0/recipe-sysroot-native/usr/share/cmake-3.28/Module=
s/FindPackageHandleStandardArgs.cmake:600 (_FPHSA_FAILURE_MESSAGE)</div>
<div>&nbsp; /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnu=
eabi/python3-pyzmq/26.2.0/recipe-sysroot-native/usr/share/cmake-3.28/Module=
s/FindPython.cmake:616 (find_package_handle_standard_args)</div>
<div>&nbsp; CMakeLists.txt:6 (find_package)</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>-- Configuring incomplete, errors occurred!</div>
<div>&nbsp;</div>
<div>*** CMake configuration failed</div>
<div>&nbsp;</div>
<div>ERROR Backend subprocess exited when trying to invoke build_wheel</div=
>
<div>WARNING: /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-g=
nueabi/python3-pyzmq/26.2.0/temp/run.do_compile.6987:164 exit 1 from 'nativ=
epython3 -m build --no-isolation --wheel --outdir /src/platform/build/tmp/w=
ork/cortexa9t2hf-neon-xilinx-linux-gnueabi/python3-pyzmq/26.2.0/dist /src/p=
latform/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/python3-pyzmq=
/26.2.0/pyzmq-26.2.0'</div>
<div>WARNING: Backtrace (BB generated script):&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>#1: python_pep517_do_compile, /src/platform/build/tmp/work/cortexa=
9t2hf-neon-xilinx-linux-gnueabi/python3-pyzmq/26.2.0/temp/run.do_compile.69=
87, line 164</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>#2: do_compile, /src/platform/build/tmp/work/cortexa9t2hf-neon-xil=
inx-linux-gnueabi/python3-pyzmq/26.2.0/temp/run.do_compile.6987, line 159</=
span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>#3: main, /src/platform/build/tmp/work/cortexa9t2hf-neon-xilinx-li=
nux-gnueabi/python3-pyzmq/26.2.0/temp/run.do_compile.6987, line 175</span><=
/div>
</div>
<div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>
</blockquote>
<div>&nbsp;</div>

--sC16WG508mqupYPJUnl4--

