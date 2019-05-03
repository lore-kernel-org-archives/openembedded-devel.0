Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E4B1E7DE21
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 May 2019 18:34:53 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id g4so7819815qtq.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2019 11:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yeWgS3Js7jHihcIjSBzLDlX0ixdBLB92pqqm1cQ/JpE=;
	b=qdHAtRBeFd22GKlh5V8750LsoVVmFOic4BCShhx+Q66tKz7/gQZw5SK3dzXSKELK1a
	4cE2qpysNc2d07fIhiC8qr0R3NMLh/u5jzqHSzCO3nqjyqcC5TVvzr1HrKjHi/EzvTmQ
	CDZ89aTrmBFNDzWDR0dHWUflbo7sCr/ZBznYOOhY9K0IGJ7lr/SH4dR6GHlE3ZxMRPDd
	P2qKVLUJlzvRiO+HsQ2XBFRW9+J0h7L+3Z8U3lDXj1WqgQhE7frSlViDjU3c/hCwdrd8
	JsRZMS+e+Q/SJiAZ9B1cGdSgtPtGO7zabtiHQhgt4U3tyke30o3PsFLVvEKLvSW50D5O
	gPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yeWgS3Js7jHihcIjSBzLDlX0ixdBLB92pqqm1cQ/JpE=;
	b=d1pxN0qUDBzaVHPKDrbovVuulbPoTLtGV93lY5DiYYu1S8s/IsHy1Rb8J/vC/edde4
	Tr7Ih6qxlAiHGUn73ZAsr+BuqInq4N99z1HJ8U/l2qH/+FP3HxouWihc9UHZx0SpSLak
	ydfZYGVr9yQqMSPPrS6Qu/kLbGtXw3cgsmMuem2Uf5HPAuaMU0RMAq998aFxL7Cio8Y8
	QjRpkmRIz94Mspyag5Ds0Bz/Jtx9pN38FmjLmMvyqUnytzK++FSjAjimBKGWU4KF74Q1
	vbyC9sGl4Wu8P5BMJqRvNwYRGqNUReifQYlB5x8Q/sjII0MFs32J4XeF/2PzRZ1P+bvS
	48QA==
X-Gm-Message-State: APjAAAXBHqHenQZcPQkK2IFbUSCDjnm3WNk3floZaU1GuHTZBGy3wkn9
	GXLwphOI+B3slmRWmTD+a5nlvifilZTflqoyRXA=
X-Google-Smtp-Source: APXvYqyDapRGjMUeGTMRTPW4B5UEv7PcWBtiHoigivCrtRQfgWQeZozlSc8hvYNgyqCmTcYsYuRHg2F6mPvu2gYnRyM=
X-Received: by 2002:a0c:b64c:: with SMTP id q12mr9724347qvf.50.1556908494735; 
	Fri, 03 May 2019 11:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <9ede5b50-8c4f-eaaf-8d8b-74d688ef5a4f@gmail.com>
	<CAMKF1sq4HaU8hELGqPPLgw+dBrv_J3RfCkaW5nRx76UWoGH_uQ@mail.gmail.com>
	<1eb730dd-b240-5d41-e8c1-492dff13fec1@gmail.com>
In-Reply-To: <1eb730dd-b240-5d41-e8c1-492dff13fec1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 May 2019 11:34:28 -0700
Message-ID: <CAMKF1srGZMg4e99hTD=DDRbfSRMAAf79rh4G-YUo4aBm=kwfoQ@mail.gmail.com>
To: Parthiban Nallathambi <parthitce@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: python3-tinydb: Install failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2019 18:34:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2019 at 1:32 AM Parthiban Nallathambi
<parthitce@gmail.com> wrote:
>
> Hello Khem,
>
> On 5/2/19 11:07 PM, Khem Raj wrote:
> > On Wed, May 1, 2019 at 10:36 AM Parthiban <parthitce@gmail.com> wrote:
> >>
> >> Hello All,
> >>
> >> I am trying to compile the python3-tinydb and the compilation is succe=
ssful, but install
> >> fails with below error,
> >>
> >> *| ModuleNotFoundError: No module named '_sysconfigdata'*
> >>
> >> I could fix this error by copying,
> >>
> >> cp ./recipe-sysroot-native/usr/lib/python-sysconfigdata/_sysconfigdata=
.py recipe-sysroot-native/usr/lib/python3.7/
> >>
> >
> > this should be done via do_install to move this file into
> > ${D}${libdir}/${PYTHON_DIR}
>
> Do you meant to fix this in python3_3.7.2.bb by copying it?
>

yes

> Thanks,
> Parthiban N
> >
> >> But not sure the way to fix it in build environment and not sure about=
 the proper
> >> way to make this module visible during build.
> >>
> >> Thanks,
> >> Parthiban N
> >>
> >> *Full error log:*
> >> ERROR: python3-tinydb-3.13.0-r0 do_install: 'python3 setup.py install =
--root=3D/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-ti=
nydb/3.13.0-r0/image     --prefix=3D/usr     --install-lib=3D/usr/lib/pytho=
n3.7/site-packages     --install-data=3D/usr/share' execution failed.
> >> ERROR: python3-tinydb-3.13.0-r0 do_install: Function failed: do_instal=
l (log file is located at /work/build/tmp/work/armv7at2hf-neon-metr-linux-g=
nueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311)
> >> ERROR: Logfile of failure stored in: /work/build/tmp/work/armv7at2hf-n=
eon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311
> >> Log data follows:
> >> | DEBUG: Executing python function extend_recipe_sysroot
> >> | NOTE: Direct dependencies are ['virtual:native:/work/meta/recipes-de=
vtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/work/meta/recipes-core/=
glibc/glibc_2.29.bb:do_populate_sysroot', 'virtual:native:/work/meta/recipe=
s-devtools/python/python3_3.7.2.bb:do_populate_sysroot', 'virtual:native:/w=
ork/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-ru=
nner_4.2.bb:do_populate_sysroot', '/work/meta/recipes-devtools/gcc/gcc-runt=
ime_8.3.bb:do_populate_sysroot', '/work/meta/recipes-devtools/gcc/gcc-cross=
_8.3.bb:do_populate_sysroot', '/work/meta/recipes-devtools/quilt/quilt-nati=
ve_0.65.bb:do_populate_sysroot']
> >> | NOTE: Installed into sysroot: []
> >> | NOTE: Skipping as already exists in sysroot: ['pseudo-native', 'glib=
c', 'python3-native', 'python3-pytest-runner-native', 'gcc-runtime', 'gcc-c=
ross-arm', 'quilt-native', 'python3-setuptools-native', 'python3-py-native'=
, 'python3-setuptools-scm-native', 'linux-libc-headers', 'gdbm-native', 'xz=
-native', 'sqlite3-native', 'util-linux-native', 'automake-native', 'autoco=
nf-native', 'pkgconfig-native', 'libffi-native', 'libtirpc-native', 'readli=
ne-native', 'gnu-config-native', 'openssl-native', 'libtool-native', 'libns=
l2-native', 'zlib-native', 'bzip2-native', 'libgcc', 'binutils-cross-arm', =
'texinfo-dummy-native', 'libmpc-native', 'mpfr-native', 'flex-native', 'gmp=
-native', 'unzip-native', 'gettext-minimal-native', 'ncurses-native', 'm4-n=
ative']
> >> | DEBUG: Python function extend_recipe_sysroot finished
> >> | DEBUG: Executing shell function do_install
> >> | running install
> >> | Traceback (most recent call last):
> >> |   File "setup.py", line 59, in <module>
> >> |     long_description=3Dread('README.rst'),
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/=
setuptools/__init__.py", line 145, in setup
> >> |     return distutils.core.setup(**attrs)
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/core=
.py", line 148, in setup
> >> |     dist.run_commands()
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/dist=
.py", line 966, in run_commands
> >> |     self.run_command(cmd)
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/dist=
.py", line 984, in run_command
> >> |     cmd_obj.ensure_finalized()
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/cmd.=
py", line 107, in ensure_finalized
> >> |     self.finalize_options()
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/=
setuptools/command/install.py", line 38, in finalize_options
> >> |     orig.install.finalize_options(self)
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/comm=
and/install.py", line 284, in finalize_options
> >> |     (prefix, exec_prefix) =3D get_config_vars('prefix', 'exec_prefix=
')
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/sysc=
onfig.py", line 472, in get_config_vars
> >> |     func()
> >> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyth=
on3-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/sysc=
onfig.py", line 432, in _init_posix
> >> |     _temp =3D __import__(name, globals(), locals(), ['build_time_var=
s'], 0)
> >> | ModuleNotFoundError: No module named '_sysconfigdata'
> >> | ERROR: 'python3 setup.py install --root=3D/work/build/tmp/work/armv7=
at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/image     --prefix=
=3D/usr     --install-lib=3D/usr/lib/python3.7/site-packages     --install-=
data=3D/usr/share' execution failed.
> >> | WARNING: /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/pyt=
hon3-tinydb/3.13.0-r0/temp/run.do_install.3000311:1 exit 1 from 'exit 1'
> >> | ERROR: Function failed: do_install (log file is located at /work/bui=
ld/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/tem=
p/log.do_install.3000311)
> >> ERROR: Task (/work/meta-openembedded/meta-python/recipes-devtools/pyth=
on/python3-tinydb_3.13.0.bb:do_install) failed with exit code '1'
> >> NOTE: Tasks Summary: Attempted 920 tasks of which 919 didn't need to b=
e rerun and 1 failed.
> >>
> >> Summary: 1 task failed:
> >>    /work/meta-openembedded/meta-python/recipes-devtools/python/python3=
-tinydb_3.13.0.bb:do_install
> >> Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

