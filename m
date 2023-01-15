Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956EDC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 21:55:53 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.151501.1673819747603240738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Jan 2023 13:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout02.t-online.de (Postfix) with SMTP id 2000120682;
	Sun, 15 Jan 2023 22:55:45 +0100 (CET)
Received: from [192.168.0.150] ([24.134.105.89]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pHAyW-4KLo8m0; Sun, 15 Jan 2023 22:55:36 +0100
Date: Sun, 15 Jan 2023 22:55:29 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-python] Build recipe with pypa/build
To: Florian Frank <ffrank.os@ffrnk.de>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <HKRJOR.GVPO6JMFGBGT1@t-online.de>
In-Reply-To: <OiM6.1673818791556733074.T0ut@lists.openembedded.org>
References: <OiM6.1673818791556733074.T0ut@lists.openembedded.org>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ZZY1fQk1dm8eL93fy3g2"
X-TOI-MSGID: 24b68c12-9ad7-46a1-9db4-0e8038034548
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 21:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100578

--=-ZZY1fQk1dm8eL93fy3g2
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

You can try to 'inherit python_setuptools_build_meta' for your recipe

On Sun, Jan 15 2023 at 01:39:51 PM -0800, Florian Frank=20
<ffrank.os@ffrnk.de> wrote:
> I am trying to create a recipe for adafruit-circuitpython-busdevice=20
> in version 5.2.3 [1] on kirkstone. This package does not have a=20
> setup.py but only a pyproject.toml and a small setup.cfg and can=20
> apparently not be build using python_setuptools_build_meta.
>=20
> On my host system (Ubuntu 22.04) I can build the wheel with the=20
> python build package [2], so I tried to install that into my native=20
> environment with the following recipe (named python3-build-0.10.0.bb).
>=20
>>  SUMMARY =3D "A simple, correct Python build frontend."
>>  HOMEPAGE =3D "<https://github.com/pypa/build>"
>>  AUTHOR =3D "Filipe La=EDns <filipe.lains@gmail.com=20
>> <mailto:filipe.lains@gmail.com>>"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c256c"=20
>> <file://license;md5=3D310439af287b0fb4780b2ad6907c256c/>
>>=20
>>  SRC_URI[sha256sum] =3D=20
>> "d5b71264afdb5951d6704482aac78de887c80691c52b88a9ad195983ca2c9269"
>>=20
>>  PYPI_PACKAGE =3D "build"
>>=20
>>  inherit pypi python_flit_core
>>=20
>>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> This works well, and I can now call "nativepython3 -m build" in a=20
> devshell of my actual recipe=20
> (python3-adafruit-circuitpython-busdevice_5.2.3.bb):
>=20
>>  SUMMARY =3D "CircuitPython bus device classes to manage bus sharing."
>>  HOMEPAGE =3D=20
>> "<https://github.com/adafruit/Adafruit_CircuitPython_BusDevice>"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D6ec69d6e9e6c85adfb7799d7f8cf044e"=20
>> <file://license;md5=3D6ec69d6e9e6c85adfb7799d7f8cf044e/>
>>=20
>>  SRC_URI[sha256sum] =3D=20
>> "faa572b613a0732de938ed008402dfb105d91adb5d0096bf2709f46669a94885"
>>=20
>>  PYPI_PACKAGE =3D "adafruit-circuitpython-busdevice"
>>=20
>>  inherit pypi
>>=20
>>  DEPENDS +=3D "python3-setuptools-scm-native python3-build-native"
>>=20
>>  RDEPENDS:${PN} +=3D " \
>>      python3-adafruit-blinka \
>>      python3-core \
>>  "
>=20
> However, I have issues with creating the wheel. My attempted devshell=20
> commands executed in ${S} so far are:
>=20
> nativepython3 -m build --outdir ../dist
>=20
> This produces the following output:> * Creating venv isolated=20
> environment...
>>=20
>>  Traceback (most recent call last):
>>    File=20
>> "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py",=20
>> line 375, in main
>>      built =3D build_call(
>>    File=20
>> "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py",=20
>> line 235, in build_package_via_sdist
>>      sdist =3D _build(isolation, builder, outdir, 'sdist',=20
>> config_settings, skip_dependency_check)
>>    File=20
>> "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py",=20
>> line 145, in _build
>>      return _build_in_isolated_env(builder, outdir, distribution,=20
>> config_settings)
>>    File=20
>> "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py",=20
>> line 109, in _build_in_isolated_env
>>      with _IsolatedEnvBuilder() as env:
>>    File "/home/ff/.local/lib/python3.10/site-packages/build/env.py",=20
>> line 107, in __enter__
>>      executable, scripts_dir =3D _create_isolated_env_venv(self._path)
>>    File "/home/ff/.local/lib/python3.10/site-packages/build/env.py",=20
>> line 279, in _create_isolated_env_venv
>>      pip_distribution =3D next(iter(metadata.distributions(name=3D'pip',=
=20
>> path=3D[purelib])))  # type: ignore[no-untyped-call]
>>  StopIteration
>>=20
>>  ERROR
>=20
> I am confused why I see local path here?
>=20
> If I then disable isolation after this (without cleaning) it produces=20
> a wheel:
>=20
> nativepython3 -m build --outdir ../dist --no-isolation> * Getting=20
> build dependencies for sdist...
>>  running egg_info
>>  writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
>>  writing dependency_links to=20
>> adafruit_circuitpython_busdevice.egg-info/dependency_links.txt
>>  writing requirements to=20
>> adafruit_circuitpython_busdevice.egg-info/requires.txt
>>  writing top-level names to=20
>> adafruit_circuitpython_busdevice.egg-info/top_level.txt
>>  reading manifest file=20
>> 'adafruit_circuitpython_busdevice.egg-info/SOURCES.txt'
>>  adding license file 'LICENSE'
>>  writing manifest file=20
>> 'adafruit_circuitpython_busdevice.egg-info/SOURCES.txt'
>>  * Building sdist...
>>  running sdist
>>  running egg_info
>>  writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
>>  writing dependency_links to=20
>> adafruit_circuitpython_busdevice.egg-info/dependency_links.txt
>>  writing requirements to=20
>> adafruit_circuitpython_busdevice.egg-info/requires.txt
>>  writing top-level names to=20
>> adafruit_circuitpython_busdevice.egg-info/top_level.txt
>>  reading manifest file=20
>> 'adafruit_circuitpython_busdevice.egg-info/SOURCES.txt'
>>  adding license file 'LICENSE'
>>  writing manifest file=20
>> 'adafruit_circuitpython_busdevice.egg-info/SOURCES.txt'
>>  running check
>>  creating adafruit-circuitpython-busdevice-5.2.3
>>  creating adafruit-circuitpython-busdevice-5.2.3/.github
>>  creating=20
>> adafruit-circuitpython-busdevice-5.2.3/.github/PULL_REQUEST_TEMPLATE
>>  creating adafruit-circuitpython-busdevice-5.2.3/.github/workflows
>>  creating adafruit-circuitpython-busdevice-5.2.3/LICENSES
>>  creating adafruit-circuitpython-busdevice-5.2.3/adafruit_bus_device
>>  creating=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.=
egg-info
>>  creating adafruit-circuitpython-busdevice-5.2.3/docs
>>  creating adafruit-circuitpython-busdevice-5.2.3/docs/_static
>>  creating adafruit-circuitpython-busdevice-5.2.3/examples
>>  copying files to adafruit-circuitpython-busdevice-5.2.3...
>>  copying .gitignore -> adafruit-circuitpython-busdevice-5.2.3
>>  copying .pre-commit-config.yaml ->=20
>> adafruit-circuitpython-busdevice-5.2.3
>>  copying .pylintrc -> adafruit-circuitpython-busdevice-5.2.3
>>  copying .readthedocs.yaml -> adafruit-circuitpython-busdevice-5.2.3
>>  copying CODE_OF_CONDUCT.md -> adafruit-circuitpython-busdevice-5.2.3
>>  copying LICENSE -> adafruit-circuitpython-busdevice-5.2.3
>>  copying README.rst -> adafruit-circuitpython-busdevice-5.2.3
>>  copying README.rst.license -> adafruit-circuitpython-busdevice-5.2.3
>>  copying optional_requirements.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3
>>  copying pyproject.toml -> adafruit-circuitpython-busdevice-5.2.3
>>  copying requirements.txt -> adafruit-circuitpython-busdevice-5.2.3
>>  copying setup.cfg -> adafruit-circuitpython-busdevice-5.2.3
>>  copying .github/PULL_REQUEST_TEMPLATE/adafruit_circuitpython_pr.md=20
>> ->=20
>> adafruit-circuitpython-busdevice-5.2.3/.github/PULL_REQUEST_TEMPLATE
>>  copying .github/workflows/build.yml ->=20
>> adafruit-circuitpython-busdevice-5.2.3/.github/workflows
>>  copying .github/workflows/failure-help-text.yml ->=20
>> adafruit-circuitpython-busdevice-5.2.3/.github/workflows
>>  copying .github/workflows/release.yml ->=20
>> adafruit-circuitpython-busdevice-5.2.3/.github/workflows
>>  copying LICENSES/CC-BY-4.0.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3/LICENSES
>>  copying LICENSES/MIT.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3/LICENSES
>>  copying LICENSES/Unlicense.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3/LICENSES
>>  copying adafruit_bus_device/__init__.py ->=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_bus_device
>>  copying adafruit_bus_device/i2c_device.py ->=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_bus_device
>>  copying adafruit_bus_device/spi_device.py ->=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_bus_device
>>  copying adafruit_circuitpython_busdevice.egg-info/PKG-INFO ->=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.=
egg-info
>>  copying adafruit_circuitpython_busdevice.egg-info/SOURCES.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.=
egg-info
>>  copying=20
>> adafruit_circuitpython_busdevice.egg-info/dependency_links.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.=
egg-info
>>  copying adafruit_circuitpython_busdevice.egg-info/requires.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.=
egg-info
>>  copying adafruit_circuitpython_busdevice.egg-info/top_level.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.=
egg-info
>>  copying docs/api.rst -> adafruit-circuitpython-busdevice-5.2.3/docs
>>  copying docs/api.rst.license ->=20
>> adafruit-circuitpython-busdevice-5.2.3/docs
>>  copying docs/conf.py -> adafruit-circuitpython-busdevice-5.2.3/docs
>>  copying docs/examples.rst ->=20
>> adafruit-circuitpython-busdevice-5.2.3/docs
>>  copying docs/examples.rst.license ->=20
>> adafruit-circuitpython-busdevice-5.2.3/docs
>>  copying docs/index.rst ->=20
>> adafruit-circuitpython-busdevice-5.2.3/docs
>>  copying docs/index.rst.license ->=20
>> adafruit-circuitpython-busdevice-5.2.3/docs
>>  copying docs/requirements.txt ->=20
>> adafruit-circuitpython-busdevice-5.2.3/docs
>>  copying docs/_static/favicon.ico ->=20
>> adafruit-circuitpython-busdevice-5.2.3/docs/_static
>>  copying docs/_static/favicon.ico.license ->=20
>> adafruit-circuitpython-busdevice-5.2.3/docs/_static
>>  copying examples/busdevice_read_register_i2c_simpletest.py ->=20
>> adafruit-circuitpython-busdevice-5.2.3/examples
>>  copying examples/busdevice_read_register_spi_simpletest.py ->=20
>> adafruit-circuitpython-busdevice-5.2.3/examples
>>  Writing adafruit-circuitpython-busdevice-5.2.3/setup.cfg
>>  Creating tar archive
>>  removing 'adafruit-circuitpython-busdevice-5.2.3' (and everything=20
>> under it)
>>  * Building wheel from sdist
>>  * Getting build dependencies for wheel...
>>  running egg_info
>>  writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
>>  writing dependency_links to=20
>> adafruit_circuitpython_busdevice.egg-info/dependency_links.txt
>>  writing requirements to=20
>> adafruit_circuitpython_busdevice.egg-info/requires.txt
>>  writing top-level names to=20
>> adafruit_circuitpython_busdevice.egg-info/top_level.txt
>>  reading manifest file=20
>> 'adafruit_circuitpython_busdevice.egg-info/SOURCES.txt'
>>  adding license file 'LICENSE'
>>  writing manifest file=20
>> 'adafruit_circuitpython_busdevice.egg-info/SOURCES.txt'
>>  * Building wheel...
>>  running bdist_wheel
>>  running build
>>  running build_py
>>  creating build
>>  creating build/lib
>>  creating build/lib/adafruit_bus_device
>>  copying adafruit_bus_device/i2c_device.py ->=20
>> build/lib/adafruit_bus_device
>>  copying adafruit_bus_device/spi_device.py ->=20
>> build/lib/adafruit_bus_device
>>  copying adafruit_bus_device/__init__.py ->=20
>> build/lib/adafruit_bus_device
>>  running egg_info
>>  writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
>>  writing dependency_links to=20
>> adafruit_circuitpython_busdevice.egg-info/dependency_links.txt
>>  writing requirements to=20
>> adafruit_circuitpython_busdevice.egg-info/requires.txt
>>  writing top-level names to=20
>> adafruit_circuitpython_busdevice.egg-info/top_level.txt
>>  reading manifest file=20
>> 'adafruit_circuitpython_busdevice.egg-info/SOURCES.txt'
>>  adding license file 'LICENSE'
>>  writing manifest file=20
>> 'adafruit_circuitpython_busdevice.egg-info/SOURCES.txt'
>>  installing to build/bdist.linux-x86_64/wheel
>>  running install
>>  running install_lib
>>  creating build/bdist.linux-x86_64
>>  creating build/bdist.linux-x86_64/wheel
>>  creating build/bdist.linux-x86_64/wheel/adafruit_bus_device
>>  copying build/lib/adafruit_bus_device/i2c_device.py ->=20
>> build/bdist.linux-x86_64/wheel/adafruit_bus_device
>>  copying build/lib/adafruit_bus_device/spi_device.py ->=20
>> build/bdist.linux-x86_64/wheel/adafruit_bus_device
>>  copying build/lib/adafruit_bus_device/__init__.py ->=20
>> build/bdist.linux-x86_64/wheel/adafruit_bus_device
>>  running install_egg_info
>>  Copying adafruit_circuitpython_busdevice.egg-info to=20
>> build/bdist.linux-x86_64/wheel/adafruit_circuitpython_busdevice-5.2.3-py=
3.10.egg-info
>>  running install_scripts
>>  adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
>>  creating=20
>> build/bdist.linux-x86_64/wheel/adafruit_circuitpython_busdevice-5.2.3.di=
st-info/WHEEL
>>  creating=20
>> '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-poky-linux-m=
usleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/tmp0so8qe26/=
adafruit_circuitpython_busdevice-5.2.3-py3-none-any.whl'=20
>> and adding 'build/bdist.linux-x86_64/wheel' to it
>>  adding 'adafruit_bus_device/__init__.py'
>>  adding 'adafruit_bus_device/i2c_device.py'
>>  adding 'adafruit_bus_device/spi_device.py'
>>  adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/LICENSE'
>>  adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/METADATA'
>>  adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/WHEEL'
>>  adding=20
>> 'adafruit_circuitpython_busdevice-5.2.3.dist-info/top_level.txt'
>>  adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/RECORD'
>>  removing build/bdist.linux-x86_64/wheel
>>  Successfully built adafruit-circuitpython-busdevice-5.2.3.tar.gz=20
>> and adafruit_circuitpython_busdevice-5.2.3-py3-none-any.whl
>=20
> If I disable isolation with a clean recipe workdir instead, it builds=20
> an "empty" wheel:
>=20
>>  * Getting build dependencies for sdist...
>>  running egg_info
>>  creating UNKNOWN.egg-info
>>  writing UNKNOWN.egg-info/PKG-INFO
>>  writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
>>  writing top-level names to UNKNOWN.egg-info/top_level.txt
>>  writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  adding license file 'LICENSE'
>>  writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  * Building sdist...
>>  running sdist
>>  running egg_info
>>  writing UNKNOWN.egg-info/PKG-INFO
>>  writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
>>  writing top-level names to UNKNOWN.egg-info/top_level.txt
>>  reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  adding license file 'LICENSE'
>>  writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  running check
>>  creating UNKNOWN-0.0.0
>>  creating UNKNOWN-0.0.0/UNKNOWN.egg-info
>>  copying files to UNKNOWN-0.0.0...
>>  copying LICENSE -> UNKNOWN-0.0.0
>>  copying README.rst -> UNKNOWN-0.0.0
>>  copying pyproject.toml -> UNKNOWN-0.0.0
>>  copying setup.cfg -> UNKNOWN-0.0.0
>>  copying UNKNOWN.egg-info/PKG-INFO -> UNKNOWN-0.0.0/UNKNOWN.egg-info
>>  copying UNKNOWN.egg-info/SOURCES.txt ->=20
>> UNKNOWN-0.0.0/UNKNOWN.egg-info
>>  copying UNKNOWN.egg-info/dependency_links.txt ->=20
>> UNKNOWN-0.0.0/UNKNOWN.egg-info
>>  copying UNKNOWN.egg-info/top_level.txt ->=20
>> UNKNOWN-0.0.0/UNKNOWN.egg-info
>>  Writing UNKNOWN-0.0.0/setup.cfg
>>  Creating tar archive
>>  removing 'UNKNOWN-0.0.0' (and everything under it)
>>  * Building wheel from sdist
>>  * Getting build dependencies for wheel...
>>  running egg_info
>>  writing UNKNOWN.egg-info/PKG-INFO
>>  writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
>>  writing top-level names to UNKNOWN.egg-info/top_level.txt
>>  reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  adding license file 'LICENSE'
>>  writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  * Building wheel...
>>  running bdist_wheel
>>  running build
>>  installing to build/bdist.linux-x86_64/wheel
>>  running install
>>  running install_egg_info
>>  running egg_info
>>  writing UNKNOWN.egg-info/PKG-INFO
>>  writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
>>  writing top-level names to UNKNOWN.egg-info/top_level.txt
>>  reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  adding license file 'LICENSE'
>>  writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
>>  Copying UNKNOWN.egg-info to=20
>> build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0-py3.10.egg-info
>>  running install_scripts
>>  adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
>>  creating=20
>> build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0.dist-info/WHEEL
>>  creating=20
>> '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-poky-linux-m=
usleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/tmpfoz232kv/=
UNKNOWN-0.0.0-py3-none-any.whl'=20
>> and adding 'build/bdist.linux-x86_64/wheel' to it
>>  adding 'UNKNOWN-0.0.0.dist-info/LICENSE'
>>  adding 'UNKNOWN-0.0.0.dist-info/METADATA'
>>  adding 'UNKNOWN-0.0.0.dist-info/WHEEL'
>>  adding 'UNKNOWN-0.0.0.dist-info/top_level.txt'
>>  adding 'UNKNOWN-0.0.0.dist-info/RECORD'
>>  removing build/bdist.linux-x86_64/wheel
>>  Successfully built UNKNOWN-0.0.0.tar.gz and=20
>> UNKNOWN-0.0.0-py3-none-any.whl
>=20
> So, the first failed call without parameter "--no-isolation" modifies=20
> the python installation in recipe-sysroot-native so that the second=20
> call with the parameter succeeds. I confirmed this with looking at=20
> touched files before and after executing the command. Mostly cache=20
> files were created and some files changed.
>=20
> How can I put the python installation in recipe-sysroot-native into a=20
> state so that the build command succeeds right away? Or is my=20
> approach wrong in the first place?
>=20
> Best regards, FF
>=20
> [1] <https://pypi.org/project/adafruit-circuitpython-busdevice/>
> [2] <https://pypi.org/project/build/>
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100577):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/100577>
> Mute This Topic: <https://lists.openembedded.org/mt/96294851/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-ZZY1fQk1dm8eL93fy3g2
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>You can try to 'inherit&nbsp;pytho=
n_setuptools_build_meta' for your recipe</div></div><div id=3D"geary-quote"=
 dir=3D"auto"><br>On Sun, Jan 15 2023 at 01:39:51 PM -0800, Florian Frank &=
lt;ffrank.os@ffrnk.de&gt; wrote:<br><blockquote type=3D"cite"><div class=3D=
"plaintext" style=3D"white-space: break-spaces;">I am trying to create a re=
cipe for adafruit-circuitpython-busdevice in version 5.2.3 [1] on kirkstone=
. This package does not have a setup.py but only a pyproject.toml and a sma=
ll setup.cfg and can apparently not be build using python_setuptools_build_=
meta.

On my host system (Ubuntu 22.04) I can build the wheel with the python buil=
d package [2], so I tried to install that into my native environment with t=
he following recipe (named python3-build-0.10.0.bb).

<blockquote> SUMMARY =3D "A simple, correct Python build frontend."
 HOMEPAGE =3D "<a href=3D"https://github.com/pypa/build">https://github.com=
/pypa/build</a>"
 AUTHOR =3D "Filipe La=EDns &lt;<a href=3D"mailto:filipe.lains@gmail.com">f=
ilipe.lains@gmail.com</a>&gt;"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSE;md5=3D310439af287b0fb4780b=
2ad6907c256c" "=3D"">file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c256c"=
</a>
=20
 SRC_URI[sha256sum] =3D "d5b71264afdb5951d6704482aac78de887c80691c52b88a9ad=
195983ca2c9269"
=20
 PYPI_PACKAGE =3D "build"
=20
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
</blockquote>
This works well, and I can now call "nativepython3 -m build" in a devshell =
of my actual recipe (python3-adafruit-circuitpython-busdevice_5.2.3.bb):

<blockquote> SUMMARY =3D "CircuitPython bus device classes to manage bus sh=
aring."
 HOMEPAGE =3D "<a href=3D"https://github.com/adafruit/Adafruit_CircuitPytho=
n_BusDevice">https://github.com/adafruit/Adafruit_CircuitPython_BusDevice</=
a>"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "<a href=3D"file://LICENSE;md5=3D6ec69d6e9e6c85adfb77=
99d7f8cf044e" "=3D"">file://LICENSE;md5=3D6ec69d6e9e6c85adfb7799d7f8cf044e"=
</a>
=20
 SRC_URI[sha256sum] =3D "faa572b613a0732de938ed008402dfb105d91adb5d0096bf27=
09f46669a94885"
=20
 PYPI_PACKAGE =3D "adafruit-circuitpython-busdevice"
=20
 inherit pypi
=20
 DEPENDS +=3D "python3-setuptools-scm-native python3-build-native"
=20
 RDEPENDS:${PN} +=3D " \
     python3-adafruit-blinka \
     python3-core \
 "
</blockquote>
However, I have issues with creating the wheel. My attempted devshell comma=
nds executed in ${S} so far are:

nativepython3 -m build --outdir ../dist

This produces the following output:&gt; * Creating venv isolated environmen=
t...
<blockquote>=20
 Traceback (most recent call last):
   File "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py", l=
ine 375, in main
     built =3D build_call(
   File "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py", l=
ine 235, in build_package_via_sdist
     sdist =3D _build(isolation, builder, outdir, 'sdist', config_settings,=
 skip_dependency_check)
   File "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py", l=
ine 145, in _build
     return _build_in_isolated_env(builder, outdir, distribution, config_se=
ttings)
   File "/home/ff/.local/lib/python3.10/site-packages/build/__main__.py", l=
ine 109, in _build_in_isolated_env
     with _IsolatedEnvBuilder() as env:
   File "/home/ff/.local/lib/python3.10/site-packages/build/env.py", line 1=
07, in __enter__
     executable, scripts_dir =3D _create_isolated_env_venv(self._path)
   File "/home/ff/.local/lib/python3.10/site-packages/build/env.py", line 2=
79, in _create_isolated_env_venv
     pip_distribution =3D next(iter(metadata.distributions(name=3D'pip', pa=
th=3D[purelib])))  # type: ignore[no-untyped-call]
 StopIteration
=20
 ERROR=20
</blockquote>
I am confused why I see local path here?

If I then disable isolation after this (without cleaning) it produces a whe=
el:

nativepython3 -m build --outdir ../dist --no-isolation&gt; * Getting build =
dependencies for sdist...
<blockquote> running egg_info
 writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
 writing dependency_links to adafruit_circuitpython_busdevice.egg-info/depe=
ndency_links.txt
 writing requirements to adafruit_circuitpython_busdevice.egg-info/requires=
.txt
 writing top-level names to adafruit_circuitpython_busdevice.egg-info/top_l=
evel.txt
 reading manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.t=
xt'
 adding license file 'LICENSE'
 writing manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.t=
xt'
 * Building sdist...
 running sdist
 running egg_info
 writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
 writing dependency_links to adafruit_circuitpython_busdevice.egg-info/depe=
ndency_links.txt
 writing requirements to adafruit_circuitpython_busdevice.egg-info/requires=
.txt
 writing top-level names to adafruit_circuitpython_busdevice.egg-info/top_l=
evel.txt
 reading manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.t=
xt'
 adding license file 'LICENSE'
 writing manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.t=
xt'
 running check
 creating adafruit-circuitpython-busdevice-5.2.3
 creating adafruit-circuitpython-busdevice-5.2.3/.github
 creating adafruit-circuitpython-busdevice-5.2.3/.github/PULL_REQUEST_TEMPL=
ATE
 creating adafruit-circuitpython-busdevice-5.2.3/.github/workflows
 creating adafruit-circuitpython-busdevice-5.2.3/LICENSES
 creating adafruit-circuitpython-busdevice-5.2.3/adafruit_bus_device
 creating adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_bus=
device.egg-info
 creating adafruit-circuitpython-busdevice-5.2.3/docs
 creating adafruit-circuitpython-busdevice-5.2.3/docs/_static
 creating adafruit-circuitpython-busdevice-5.2.3/examples
 copying files to adafruit-circuitpython-busdevice-5.2.3...
 copying .gitignore -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying .pre-commit-config.yaml -&gt; adafruit-circuitpython-busdevice-5.2=
.3
 copying .pylintrc -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying .readthedocs.yaml -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying CODE_OF_CONDUCT.md -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying LICENSE -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying README.rst -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying README.rst.license -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying optional_requirements.txt -&gt; adafruit-circuitpython-busdevice-5=
.2.3
 copying pyproject.toml -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying requirements.txt -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying setup.cfg -&gt; adafruit-circuitpython-busdevice-5.2.3
 copying .github/PULL_REQUEST_TEMPLATE/adafruit_circuitpython_pr.md -&gt; a=
dafruit-circuitpython-busdevice-5.2.3/.github/PULL_REQUEST_TEMPLATE
 copying .github/workflows/build.yml -&gt; adafruit-circuitpython-busdevice=
-5.2.3/.github/workflows
 copying .github/workflows/failure-help-text.yml -&gt; adafruit-circuitpyth=
on-busdevice-5.2.3/.github/workflows
 copying .github/workflows/release.yml -&gt; adafruit-circuitpython-busdevi=
ce-5.2.3/.github/workflows
 copying LICENSES/CC-BY-4.0.txt -&gt; adafruit-circuitpython-busdevice-5.2.=
3/LICENSES
 copying LICENSES/MIT.txt -&gt; adafruit-circuitpython-busdevice-5.2.3/LICE=
NSES
 copying LICENSES/Unlicense.txt -&gt; adafruit-circuitpython-busdevice-5.2.=
3/LICENSES
 copying adafruit_bus_device/__init__.py -&gt; adafruit-circuitpython-busde=
vice-5.2.3/adafruit_bus_device
 copying adafruit_bus_device/i2c_device.py -&gt; adafruit-circuitpython-bus=
device-5.2.3/adafruit_bus_device
 copying adafruit_bus_device/spi_device.py -&gt; adafruit-circuitpython-bus=
device-5.2.3/adafruit_bus_device
 copying adafruit_circuitpython_busdevice.egg-info/PKG-INFO -&gt; adafruit-=
circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.egg-info
 copying adafruit_circuitpython_busdevice.egg-info/SOURCES.txt -&gt; adafru=
it-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.egg-info
 copying adafruit_circuitpython_busdevice.egg-info/dependency_links.txt -&g=
t; adafruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.=
egg-info
 copying adafruit_circuitpython_busdevice.egg-info/requires.txt -&gt; adafr=
uit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.egg-info
 copying adafruit_circuitpython_busdevice.egg-info/top_level.txt -&gt; adaf=
ruit-circuitpython-busdevice-5.2.3/adafruit_circuitpython_busdevice.egg-inf=
o
 copying docs/api.rst -&gt; adafruit-circuitpython-busdevice-5.2.3/docs
 copying docs/api.rst.license -&gt; adafruit-circuitpython-busdevice-5.2.3/=
docs
 copying docs/conf.py -&gt; adafruit-circuitpython-busdevice-5.2.3/docs
 copying docs/examples.rst -&gt; adafruit-circuitpython-busdevice-5.2.3/doc=
s
 copying docs/examples.rst.license -&gt; adafruit-circuitpython-busdevice-5=
.2.3/docs
 copying docs/index.rst -&gt; adafruit-circuitpython-busdevice-5.2.3/docs
 copying docs/index.rst.license -&gt; adafruit-circuitpython-busdevice-5.2.=
3/docs
 copying docs/requirements.txt -&gt; adafruit-circuitpython-busdevice-5.2.3=
/docs
 copying docs/_static/favicon.ico -&gt; adafruit-circuitpython-busdevice-5.=
2.3/docs/_static
 copying docs/_static/favicon.ico.license -&gt; adafruit-circuitpython-busd=
evice-5.2.3/docs/_static
 copying examples/busdevice_read_register_i2c_simpletest.py -&gt; adafruit-=
circuitpython-busdevice-5.2.3/examples
 copying examples/busdevice_read_register_spi_simpletest.py -&gt; adafruit-=
circuitpython-busdevice-5.2.3/examples
 Writing adafruit-circuitpython-busdevice-5.2.3/setup.cfg
 Creating tar archive
 removing 'adafruit-circuitpython-busdevice-5.2.3' (and everything under it=
)
 * Building wheel from sdist
 * Getting build dependencies for wheel...
 running egg_info
 writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
 writing dependency_links to adafruit_circuitpython_busdevice.egg-info/depe=
ndency_links.txt
 writing requirements to adafruit_circuitpython_busdevice.egg-info/requires=
.txt
 writing top-level names to adafruit_circuitpython_busdevice.egg-info/top_l=
evel.txt
 reading manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.t=
xt'
 adding license file 'LICENSE'
 writing manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.t=
xt'
 * Building wheel...
 running bdist_wheel
 running build
 running build_py
 creating build
 creating build/lib
 creating build/lib/adafruit_bus_device
 copying adafruit_bus_device/i2c_device.py -&gt; build/lib/adafruit_bus_dev=
ice
 copying adafruit_bus_device/spi_device.py -&gt; build/lib/adafruit_bus_dev=
ice
 copying adafruit_bus_device/__init__.py -&gt; build/lib/adafruit_bus_devic=
e
 running egg_info
 writing adafruit_circuitpython_busdevice.egg-info/PKG-INFO
 writing dependency_links to adafruit_circuitpython_busdevice.egg-info/depe=
ndency_links.txt
 writing requirements to adafruit_circuitpython_busdevice.egg-info/requires=
.txt
 writing top-level names to adafruit_circuitpython_busdevice.egg-info/top_l=
evel.txt
 reading manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.t=
xt'
 adding license file 'LICENSE'
 writing manifest file 'adafruit_circuitpython_busdevice.egg-info/SOURCES.t=
xt'
 installing to build/bdist.linux-x86_64/wheel
 running install
 running install_lib
 creating build/bdist.linux-x86_64
 creating build/bdist.linux-x86_64/wheel
 creating build/bdist.linux-x86_64/wheel/adafruit_bus_device
 copying build/lib/adafruit_bus_device/i2c_device.py -&gt; build/bdist.linu=
x-x86_64/wheel/adafruit_bus_device
 copying build/lib/adafruit_bus_device/spi_device.py -&gt; build/bdist.linu=
x-x86_64/wheel/adafruit_bus_device
 copying build/lib/adafruit_bus_device/__init__.py -&gt; build/bdist.linux-=
x86_64/wheel/adafruit_bus_device
 running install_egg_info
 Copying adafruit_circuitpython_busdevice.egg-info to build/bdist.linux-x86=
_64/wheel/adafruit_circuitpython_busdevice-5.2.3-py3.10.egg-info
 running install_scripts
 adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
 creating build/bdist.linux-x86_64/wheel/adafruit_circuitpython_busdevice-5=
.2.3.dist-info/WHEEL
 creating '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-poky-=
linux-musleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/tmp0s=
o8qe26/adafruit_circuitpython_busdevice-5.2.3-py3-none-any.whl' and adding =
'build/bdist.linux-x86_64/wheel' to it
 adding 'adafruit_bus_device/__init__.py'
 adding 'adafruit_bus_device/i2c_device.py'
 adding 'adafruit_bus_device/spi_device.py'
 adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/LICENSE'
 adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/METADATA'
 adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/WHEEL'
 adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/top_level.txt'
 adding 'adafruit_circuitpython_busdevice-5.2.3.dist-info/RECORD'
 removing build/bdist.linux-x86_64/wheel
 Successfully built adafruit-circuitpython-busdevice-5.2.3.tar.gz and adafr=
uit_circuitpython_busdevice-5.2.3-py3-none-any.whl
</blockquote>
If I disable isolation with a clean recipe workdir instead, it builds an "e=
mpty" wheel:

<blockquote> * Getting build dependencies for sdist...
 running egg_info
 creating UNKNOWN.egg-info
 writing UNKNOWN.egg-info/PKG-INFO
 writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
 writing top-level names to UNKNOWN.egg-info/top_level.txt
 writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 adding license file 'LICENSE'
 writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 * Building sdist...
 running sdist
 running egg_info
 writing UNKNOWN.egg-info/PKG-INFO
 writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
 writing top-level names to UNKNOWN.egg-info/top_level.txt
 reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 adding license file 'LICENSE'
 writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 running check
 creating UNKNOWN-0.0.0
 creating UNKNOWN-0.0.0/UNKNOWN.egg-info
 copying files to UNKNOWN-0.0.0...
 copying LICENSE -&gt; UNKNOWN-0.0.0
 copying README.rst -&gt; UNKNOWN-0.0.0
 copying pyproject.toml -&gt; UNKNOWN-0.0.0
 copying setup.cfg -&gt; UNKNOWN-0.0.0
 copying UNKNOWN.egg-info/PKG-INFO -&gt; UNKNOWN-0.0.0/UNKNOWN.egg-info
 copying UNKNOWN.egg-info/SOURCES.txt -&gt; UNKNOWN-0.0.0/UNKNOWN.egg-info
 copying UNKNOWN.egg-info/dependency_links.txt -&gt; UNKNOWN-0.0.0/UNKNOWN.=
egg-info
 copying UNKNOWN.egg-info/top_level.txt -&gt; UNKNOWN-0.0.0/UNKNOWN.egg-inf=
o
 Writing UNKNOWN-0.0.0/setup.cfg
 Creating tar archive
 removing 'UNKNOWN-0.0.0' (and everything under it)
 * Building wheel from sdist
 * Getting build dependencies for wheel...
 running egg_info
 writing UNKNOWN.egg-info/PKG-INFO
 writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
 writing top-level names to UNKNOWN.egg-info/top_level.txt
 reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 adding license file 'LICENSE'
 writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 * Building wheel...
 running bdist_wheel
 running build
 installing to build/bdist.linux-x86_64/wheel
 running install
 running install_egg_info
 running egg_info
 writing UNKNOWN.egg-info/PKG-INFO
 writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
 writing top-level names to UNKNOWN.egg-info/top_level.txt
 reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 adding license file 'LICENSE'
 writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
 Copying UNKNOWN.egg-info to build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0-p=
y3.10.egg-info
 running install_scripts
 adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
 creating build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0.dist-info/WHEEL
 creating '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-poky-=
linux-musleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/tmpfo=
z232kv/UNKNOWN-0.0.0-py3-none-any.whl' and adding 'build/bdist.linux-x86_64=
/wheel' to it
 adding 'UNKNOWN-0.0.0.dist-info/LICENSE'
 adding 'UNKNOWN-0.0.0.dist-info/METADATA'
 adding 'UNKNOWN-0.0.0.dist-info/WHEEL'
 adding 'UNKNOWN-0.0.0.dist-info/top_level.txt'
 adding 'UNKNOWN-0.0.0.dist-info/RECORD'
 removing build/bdist.linux-x86_64/wheel
 Successfully built UNKNOWN-0.0.0.tar.gz and UNKNOWN-0.0.0-py3-none-any.whl
</blockquote>
So, the first failed call without parameter "--no-isolation" modifies the p=
ython installation in recipe-sysroot-native so that the second call with th=
e parameter succeeds. I confirmed this with looking at touched files before=
 and after executing the command. Mostly cache files were created and some =
files changed.

How can I put the python installation in recipe-sysroot-native into a state=
 so that the build command succeeds right away? Or is my approach wrong in =
the first place?

Best regards, FF

[1] <a href=3D"https://pypi.org/project/adafruit-circuitpython-busdevice/">=
https://pypi.org/project/adafruit-circuitpython-busdevice/</a>
[2] <a href=3D"https://pypi.org/project/build/">https://pypi.org/project/bu=
ild/</a>
</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#100577): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/100577">https://lists.openembedded.org/g/openembed=
ded-devel/message/100577</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96294851/3618=
223">https://lists.openembedded.org/mt/96294851/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-ZZY1fQk1dm8eL93fy3g2--


