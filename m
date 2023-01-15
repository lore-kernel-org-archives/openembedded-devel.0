Return-Path: <ffrank.os@ffrnk.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E25CC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 21:39:53 +0000 (UTC)
Subject: [meta-python] Build recipe with pypa/build
To: openembedded-devel@lists.openembedded.org
From: "Florian Frank" <ffrank.os@ffrnk.de>
X-Originating-Location: Freising, Bavaria, DE (188.193.21.23)
X-Originating-Platform: Windows Firefox 108
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 15 Jan 2023 13:39:51 -0800
Message-ID: <OiM6.1673818791556733074.T0ut@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 21:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100577

I am trying to create a recipe for adafruit-circuitpython-busdevice in vers=
ion 5.2.3 [1] on kirkstone. This package does not have a setup.py but only =
a pyproject.toml and a small setup.cfg and can apparently not be build usin=
g python_setuptools_build_meta.

On my host system (Ubuntu 22.04) I can build the wheel with the python buil=
d package [2], so I tried to install that into my native environment with t=
he following recipe (named python3-build-0.10.0.bb).

> SUMMARY =3D "A simple, correct Python build frontend."
> HOMEPAGE =3D "https://github.com/pypa/build"
> AUTHOR =3D "Filipe La=C3=ADns <filipe.lains@gmail.com>"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c25=
6c"
>=20
> SRC_URI[sha256sum] =3D "d5b71264afdb5951d6704482aac78de887c80691c52b88a9a=
d195983ca2c9269"
>=20
> PYPI_PACKAGE =3D "build"
>=20
> inherit pypi python_flit_core
>=20
> BBCLASSEXTEND =3D "native nativesdk"

This works well, and I can now call "nativepython3 -m build" in a devshell =
of my actual recipe (python3-adafruit-circuitpython-busdevice_5.2.3.bb):

> SUMMARY =3D "CircuitPython bus device classes to manage bus sharing."
> HOMEPAGE =3D "https://github.com/adafruit/Adafruit_CircuitPython_BusDevic=
e"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ec69d6e9e6c85adfb7799d7f8cf04=
4e"
>=20
> SRC_URI[sha256sum] =3D "faa572b613a0732de938ed008402dfb105d91adb5d0096bf2=
709f46669a94885"
>=20
> PYPI_PACKAGE =3D "adafruit-circuitpython-busdevice"
>=20
> inherit pypi
>=20
> DEPENDS +=3D "python3-setuptools-scm-native python3-build-native"
>=20
> RDEPENDS:${PN} +=3D " \
>     python3-adafruit-blinka \
>     python3-core \
> "

However, I have issues with creating the wheel. My attempted devshell comma=
nds executed in ${S} so far are:

nativepython3 -m build --outdir ../dist

This produces the following output:> * Creating venv isolated environment..=
.
>=20
> Traceback (most recent call last):
>   File "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py", =
line 375, in main
>     built =3D build_call(
>   File "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py", =
line 235, in build_package_via_sdist
>     sdist =3D _build(isolation, builder, outdir, 'sdist', config_settings=
, skip_dependency_check)
>   File "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py", =
line 145, in _build
>     return _build_in_isolated_env(builder, outdir, distribution, config_s=
ettings)
>   File "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py", =
line 109, in _build_in_isolated_env
>     with _IsolatedEnvBuilder() as env:
>   File "/home/ff/.local/lib/python3.10/site-packages/build/env.py", line =
107, in __enter__
>     executable, scripts_dir =3D _create_isolated_env_venv(self._path)
>   File "/home/ff/.local/lib/python3.10/site-packages/build/env.py", line =
279, in _create_isolated_env_venv
>     pip_distribution =3D next(iter(metadata.distributions(name=3D'pip', p=
ath=3D[purelib])))  # type: ignore[no-untyped-call]
> StopIteration
>=20
> ERROR=20

I am confused why I see local path here?

If I then disable isolation after this (without cleaning) it produces a whe=
el:

nativepython3 -m build --outdir ../dist --no-isolation> * Getting build dep=
endencies for sdist...
> running egg_info
> writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
> writing dependency_links to adafruit_circuitpython_busdevice.egg-info/dep=
endency_links.txt
> writing requirements to adafruit_circuitpython_busdevice.egg-info/require=
s.txt
> writing top-level names to adafruit_circuitpython_busdevice.egg-info/top_=
level.txt
> reading manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.=
txt'
> adding license file 'LICENSE'
> writing manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.=
txt'
> * Building sdist...
> running sdist
> running egg_info
> writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
> writing dependency_links to adafruit_circuitpython_busdevice.egg-info/dep=
endency_links.txt
> writing requirements to adafruit_circuitpython_busdevice.egg-info/require=
s.txt
> writing top-level names to adafruit_circuitpython_busdevice.egg-info/top_=
level.txt
> reading manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.=
txt'
> adding license file 'LICENSE'
> writing manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.=
txt'
> running check
> creating adafruit-circuitpython-busdevice-5.2.3
> creating adafruit-circuitpython-busdevice-5.2.3/.github
> creating adafruit-circuitpython-busdevice-5.2.3/.github/PULL_REQUEST_TEMP=
LATE
> creating adafruit-circuitpython-busdevice-5.2.3/.github/workflows
> creating adafruit-circuitpython-busdevice-5.2.3/LICENSES
> creating adafruit-circuitpython-busdevice-5.2.3/adafruit_bus_device
> creating adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_bu=
sdevice.egg-info
> creating adafruit-circuitpython-busdevice-5.2.3/docs
> creating adafruit-circuitpython-busdevice-5.2.3/docs/_static
> creating adafruit-circuitpython-busdevice-5.2.3/examples
> copying files to adafruit-circuitpython-busdevice-5.2.3...
> copying .gitignore -> adafruit-circuitpython-busdevice-5.2.3
> copying .pre-commit-config.yaml -> adafruit-circuitpython-busdevice-5.2.3
> copying .pylintrc -> adafruit-circuitpython-busdevice-5.2.3
> copying .readthedocs.yaml -> adafruit-circuitpython-busdevice-5.2.3
> copying CODE_OF_CONDUCT.md -> adafruit-circuitpython-busdevice-5.2.3
> copying LICENSE -> adafruit-circuitpython-busdevice-5.2.3
> copying README.rst -> adafruit-circuitpython-busdevice-5.2.3
> copying README.rst.license -> adafruit-circuitpython-busdevice-5.2.3
> copying optional_requirements.txt -> adafruit-circuitpython-busdevice-5.2=
.3
> copying pyproject.toml -> adafruit-circuitpython-busdevice-5.2.3
> copying requirements.txt -> adafruit-circuitpython-busdevice-5.2.3
> copying setup.cfg -> adafruit-circuitpython-busdevice-5.2.3
> copying .github/PULL_REQUEST_TEMPLATE/adafruit_circuitpython_pr.md -> ada=
fruit-circuitpython-busdevice-5.2.3/.github/PULL_REQUEST_TEMPLATE
> copying .github/workflows/build.yml -> adafruit-circuitpython-busdevice-5=
.2.3/.github/workflows
> copying .github/workflows/failure-help-text.yml -> adafruit-circuitpython=
-busdevice-5.2.3/.github/workflows
> copying .github/workflows/release.yml -> adafruit-circuitpython-busdevice=
-5.2.3/.github/workflows
> copying LICENSES/CC-BY-4.0.txt -> adafruit-circuitpython-busdevice-5.2.3/=
LICENSES
> copying LICENSES/MIT.txt -> adafruit-circuitpython-busdevice-5.2.3/LICENS=
ES
> copying LICENSES/Unlicense.txt -> adafruit-circuitpython-busdevice-5.2.3/=
LICENSES
> copying adafruit_bus_device/__init__.py -> adafruit-circuitpython-busdevi=
ce-5.2.3/adafruit_bus_device
> copying adafruit_bus_device/i2c_device.py -> adafruit-circuitpython-busde=
vice-5.2.3/adafruit_bus_device
> copying adafruit_bus_device/spi_device.py -> adafruit-circuitpython-busde=
vice-5.2.3/adafruit_bus_device
> copying adafruit_circuitpython_busdevice.egg-info/PKG-INFO -> adafruit-ci=
rcuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.egg-info
> copying adafruit_circuitpython_busdevice.egg-info/SOURCES.txt -> adafruit=
-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.egg-info
> copying adafruit_circuitpython_busdevice.egg-info/dependency_links.txt ->=
 adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.eg=
g-info
> copying adafruit_circuitpython_busdevice.egg-info/requires.txt -> adafrui=
t-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.egg-info
> copying adafruit_circuitpython_busdevice.egg-info/top_level.txt -> adafru=
it-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.egg-info
> copying docs/api.rst -> adafruit-circuitpython-busdevice-5.2.3/docs
> copying docs/api.rst.license -> adafruit-circuitpython-busdevice-5.2.3/do=
cs
> copying docs/conf.py -> adafruit-circuitpython-busdevice-5.2.3/docs
> copying docs/examples.rst -> adafruit-circuitpython-busdevice-5.2.3/docs
> copying docs/examples.rst.license -> adafruit-circuitpython-busdevice-5.2=
.3/docs
> copying docs/index.rst -> adafruit-circuitpython-busdevice-5.2.3/docs
> copying docs/index.rst.license -> adafruit-circuitpython-busdevice-5.2.3/=
docs
> copying docs/requirements.txt -> adafruit-circuitpython-busdevice-5.2.3/d=
ocs
> copying docs/_static/favicon.ico -> adafruit-circuitpython-busdevice-5.2.=
3/docs/_static
> copying docs/_static/favicon.ico.license -> adafruit-circuitpython-busdev=
ice-5.2.3/docs/_static
> copying examples/busdevice_read_register_i2c_simpletest.py -> adafruit-ci=
rcuitpython-busdevice-5.2.3/examples
> copying examples/busdevice_read_register_spi_simpletest.py -> adafruit-ci=
rcuitpython-busdevice-5.2.3/examples
> Writing adafruit-circuitpython-busdevice-5.2.3/setup.cfg
> Creating tar archive
> removing 'adafruit-circuitpython-busdevice-5.2.3' (and everything under i=
t)
> * Building wheel from sdist
> * Getting build dependencies for wheel...
> running egg_info
> writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
> writing dependency_links to adafruit_circuitpython_busdevice.egg-info/dep=
endency_links.txt
> writing requirements to adafruit_circuitpython_busdevice.egg-info/require=
s.txt
> writing top-level names to adafruit_circuitpython_busdevice.egg-info/top_=
level.txt
> reading manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.=
txt'
> adding license file 'LICENSE'
> writing manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.=
txt'
> * Building wheel...
> running bdist_wheel
> running build
> running build_py
> creating build
> creating build/lib
> creating build/lib/adafruit_bus_device
> copying adafruit_bus_device/i2c_device.py -> build/lib/adafruit_bus_devic=
e
> copying adafruit_bus_device/spi_device.py -> build/lib/adafruit_bus_devic=
e
> copying adafruit_bus_device/__init__.py -> build/lib/adafruit_bus_device
> running egg_info
> writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
> writing dependency_links to adafruit_circuitpython_busdevice.egg-info/dep=
endency_links.txt
> writing requirements to adafruit_circuitpython_busdevice.egg-info/require=
s.txt
> writing top-level names to adafruit_circuitpython_busdevice.egg-info/top_=
level.txt
> reading manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.=
txt'
> adding license file 'LICENSE'
> writing manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.=
txt'
> installing to build/bdist.linux-x86_64/wheel
> running install
> running install_lib
> creating build/bdist.linux-x86_64
> creating build/bdist.linux-x86_64/wheel
> creating build/bdist.linux-x86_64/wheel/adafruit_bus_device
> copying build/lib/adafruit_bus_device/i2c_device.py -> build/bdist.linux-=
x86_64/wheel/adafruit_bus_device
> copying build/lib/adafruit_bus_device/spi_device.py -> build/bdist.linux-=
x86_64/wheel/adafruit_bus_device
> copying build/lib/adafruit_bus_device/__init__.py -> build/bdist.linux-x8=
6_64/wheel/adafruit_bus_device
> running install_egg_info
> Copying adafruit_circuitpython_busdevice.egg-info to build/bdist.linux-x8=
6_64/wheel/adafruit_circuitpython_busdevice-5.2.3-py3.10.egg-info
> running install_scripts
> adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
> creating build/bdist.linux-x86_64/wheel/adafruit_circuitpython_busdevice-=
5.2.3.dist-info/WHEEL
> creating '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-poky=
-linux-musleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/tmp0=
so8qe26/adafruit_circuitpython_busdevice-5.2.3-py3-none-any.whl' and adding=
 'build/bdist.linux-x86_64/wheel' to it
> adding 'adafruit_bus_device/__init__.py'
> adding 'adafruit_bus_device/i2c_device.py'
> adding 'adafruit_bus_device/spi_device.py'
> adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/LICENSE'
> adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/METADATA'
> adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/WHEEL'
> adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/top_level.txt'
> adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/RECORD'
> removing build/bdist.linux-x86_64/wheel
> Successfully built adafruit-circuitpython-busdevice-5.2.3.tar.gz and adaf=
ruit_circuitpython_busdevice-5.2.3-py3-none-any.whl

If I disable isolation with a clean recipe workdir instead, it builds an "e=
mpty" wheel:

> * Getting build dependencies for sdist...
> running egg_info
> creating UNKNOWN.egg-info
> writing UNKNOWN.egg-info/PKG-INFO
> writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
> writing top-level names to UNKNOWN.egg-info/top_level.txt
> writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> adding license file 'LICENSE'
> writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> * Building sdist...
> running sdist
> running egg_info
> writing UNKNOWN.egg-info/PKG-INFO
> writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
> writing top-level names to UNKNOWN.egg-info/top_level.txt
> reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> adding license file 'LICENSE'
> writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> running check
> creating UNKNOWN-0.0.0
> creating UNKNOWN-0.0.0/UNKNOWN.egg-info
> copying files to UNKNOWN-0.0.0...
> copying LICENSE -> UNKNOWN-0.0.0
> copying README.rst -> UNKNOWN-0.0.0
> copying pyproject.toml -> UNKNOWN-0.0.0
> copying setup.cfg -> UNKNOWN-0.0.0
> copying UNKNOWN.egg-info/PKG-INFO -> UNKNOWN-0.0.0/UNKNOWN.egg-info
> copying UNKNOWN.egg-info/SOURCES.txt -> UNKNOWN-0.0.0/UNKNOWN.egg-info
> copying UNKNOWN.egg-info/dependency_links.txt -> UNKNOWN-0.0.0/UNKNOWN.eg=
g-info
> copying UNKNOWN.egg-info/top_level.txt -> UNKNOWN-0.0.0/UNKNOWN.egg-info
> Writing UNKNOWN-0.0.0/setup.cfg
> Creating tar archive
> removing 'UNKNOWN-0.0.0' (and everything under it)
> * Building wheel from sdist
> * Getting build dependencies for wheel...
> running egg_info
> writing UNKNOWN.egg-info/PKG-INFO
> writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
> writing top-level names to UNKNOWN.egg-info/top_level.txt
> reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> adding license file 'LICENSE'
> writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> * Building wheel...
> running bdist_wheel
> running build
> installing to build/bdist.linux-x86_64/wheel
> running install
> running install_egg_info
> running egg_info
> writing UNKNOWN.egg-info/PKG-INFO
> writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
> writing top-level names to UNKNOWN.egg-info/top_level.txt
> reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> adding license file 'LICENSE'
> writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> Copying UNKNOWN.egg-info to build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0-=
py3.10.egg-info
> running install_scripts
> adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
> creating build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0.dist-info/WHEEL
> creating '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-poky=
-linux-musleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/tmpf=
oz232kv/UNKNOWN-0.0.0-py3-none-any.whl' and adding 'build/bdist.linux-x86_6=
4/wheel' to it
> adding 'UNKNOWN-0.0.0.dist-info/LICENSE'
> adding 'UNKNOWN-0.0.0.dist-info/METADATA'
> adding 'UNKNOWN-0.0.0.dist-info/WHEEL'
> adding 'UNKNOWN-0.0.0.dist-info/top_level.txt'
> adding 'UNKNOWN-0.0.0.dist-info/RECORD'
> removing build/bdist.linux-x86_64/wheel
> Successfully built UNKNOWN-0.0.0.tar.gz and UNKNOWN-0.0.0-py3-none-any.wh=
l

So, the first failed call without parameter "--no-isolation" modifies the p=
ython installation in recipe-sysroot-native so that the second call with th=
e parameter succeeds. I confirmed this with looking at touched files before=
 and after executing the command. Mostly cache files were created and some =
files changed.

How can I put the python installation in recipe-sysroot-native into a state=
 so that the build command succeeds right away? Or is my approach wrong in =
the first place?

Best regards, FF

[1] https://pypi.org/project/adafruit-circuitpython-busdevice/
[2] https://pypi.org/project/build/

