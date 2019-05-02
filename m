Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 229656BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 May 2019 21:08:17 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id c13so4388133qtn.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2019 14:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=adU4R1F9JyKQni6F9ojvfpspzK9SdhRjQwRanQCll8Q=;
	b=H4352BFLmYU893hp36FcFlZQK8XUI3MtG+c8QCx0ll87I3jvBuo+DPH/trgaExvABz
	5p+Ear5tc+csFieYh9Y6TV2MHgTGVTwjv5juX7Tj2aP+bsYpJSyIFiivSQ5u5wxK8qHj
	OslIACN8sSpDWR+xqmgHTjHwp6WIss5kKZEP9P4dhaLirF54+by1ATDnNCmNh/nJFp/M
	pVHX5sp1yU9Ptpv1LFm3vwW+mzwHyygzotk3fOyIwby87fFlSY2TKYHZ9HSLHRxuyCQp
	5dPGJPUq/yDzPgWpjr0XZ2PlvA1q/SeGENUV/3YJKgBcIYagfhUg5edFKYar4fu5MgAt
	SVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=adU4R1F9JyKQni6F9ojvfpspzK9SdhRjQwRanQCll8Q=;
	b=NrTWk4XxpgSODF7egLIPgHBcYLN8n4hQBB32lyOyIq2XmlNl/uI9dr/V0JWkjQ4dqZ
	+OpskRIhlQcXPK4jFrKj10KHLgJ4F1LF45VflXKFndLeFWYPiCGsEyLxqBwBf0Op7/3Z
	Sy9qoXxtHknPy/eZZbnyPR0mjAeU/YLbmQbPqyp5/MQUz/r8TPF1aQVqQ6Rs3CU/8EiQ
	b6Yvhy49GxwGL3x2jW6EywNRJH1Q51tGydMIQPI74qnqN8PCNiXLyPbB5FZxbNNZw/c1
	zdvP3h06f9Iq2g/S+Et3OgJMViing0Hr7/bEEUuKCSSfe/USUs+XumByYiZ5ELA6UwAN
	SSyQ==
X-Gm-Message-State: APjAAAW1HFMKPq9RpoLkykB5EonzJeK5LbntXerxrHRu1pTJYnEBhsW4
	3o22J1LqQ7djiUKkJbULBlcZ84ZZshdXF4Y5fM4=
X-Google-Smtp-Source: APXvYqy0qxteW+q6R7ZU0eyxSt8x8yRezkjbm/viLQLI0snNViP3uajn/S8/8kudWSoW4hrriElVBNq8vVaHI0Dv2ZE=
X-Received: by 2002:ac8:2d35:: with SMTP id n50mr1008729qta.253.1556831298516; 
	Thu, 02 May 2019 14:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <9ede5b50-8c4f-eaaf-8d8b-74d688ef5a4f@gmail.com>
In-Reply-To: <9ede5b50-8c4f-eaaf-8d8b-74d688ef5a4f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 May 2019 14:07:52 -0700
Message-ID: <CAMKF1sq4HaU8hELGqPPLgw+dBrv_J3RfCkaW5nRx76UWoGH_uQ@mail.gmail.com>
To: Parthiban <parthitce@gmail.com>
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
X-List-Received-Date: Thu, 02 May 2019 21:08:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2019 at 10:36 AM Parthiban <parthitce@gmail.com> wrote:
>
> Hello All,
>
> I am trying to compile the python3-tinydb and the compilation is successf=
ul, but install
> fails with below error,
>
> *| ModuleNotFoundError: No module named '_sysconfigdata'*
>
> I could fix this error by copying,
>
> cp ./recipe-sysroot-native/usr/lib/python-sysconfigdata/_sysconfigdata.py=
 recipe-sysroot-native/usr/lib/python3.7/
>

this should be done via do_install to move this file into
${D}${libdir}/${PYTHON_DIR}

> But not sure the way to fix it in build environment and not sure about th=
e proper
> way to make this module visible during build.
>
> Thanks,
> Parthiban N
>
> *Full error log:*
> ERROR: python3-tinydb-3.13.0-r0 do_install: 'python3 setup.py install --r=
oot=3D/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinyd=
b/3.13.0-r0/image     --prefix=3D/usr     --install-lib=3D/usr/lib/python3.=
7/site-packages     --install-data=3D/usr/share' execution failed.
> ERROR: python3-tinydb-3.13.0-r0 do_install: Function failed: do_install (=
log file is located at /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnue=
abi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311)
> ERROR: Logfile of failure stored in: /work/build/tmp/work/armv7at2hf-neon=
-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/log.do_install.3000311
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['virtual:native:/work/meta/recipes-devto=
ols/pseudo/pseudo_git.bb:do_populate_sysroot', '/work/meta/recipes-core/gli=
bc/glibc_2.29.bb:do_populate_sysroot', 'virtual:native:/work/meta/recipes-d=
evtools/python/python3_3.7.2.bb:do_populate_sysroot', 'virtual:native:/work=
/meta-openembedded/meta-python/recipes-devtools/python/python3-pytest-runne=
r_4.2.bb:do_populate_sysroot', '/work/meta/recipes-devtools/gcc/gcc-runtime=
_8.3.bb:do_populate_sysroot', '/work/meta/recipes-devtools/gcc/gcc-cross_8.=
3.bb:do_populate_sysroot', '/work/meta/recipes-devtools/quilt/quilt-native_=
0.65.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['pseudo-native', 'glibc',=
 'python3-native', 'python3-pytest-runner-native', 'gcc-runtime', 'gcc-cros=
s-arm', 'quilt-native', 'python3-setuptools-native', 'python3-py-native', '=
python3-setuptools-scm-native', 'linux-libc-headers', 'gdbm-native', 'xz-na=
tive', 'sqlite3-native', 'util-linux-native', 'automake-native', 'autoconf-=
native', 'pkgconfig-native', 'libffi-native', 'libtirpc-native', 'readline-=
native', 'gnu-config-native', 'openssl-native', 'libtool-native', 'libnsl2-=
native', 'zlib-native', 'bzip2-native', 'libgcc', 'binutils-cross-arm', 'te=
xinfo-dummy-native', 'libmpc-native', 'mpfr-native', 'flex-native', 'gmp-na=
tive', 'unzip-native', 'gettext-minimal-native', 'ncurses-native', 'm4-nati=
ve']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | running install
> | Traceback (most recent call last):
> |   File "setup.py", line 59, in <module>
> |     long_description=3Dread('README.rst'),
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/set=
uptools/__init__.py", line 145, in setup
> |     return distutils.core.setup(**attrs)
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/core.py=
", line 148, in setup
> |     dist.run_commands()
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/dist.py=
", line 966, in run_commands
> |     self.run_command(cmd)
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/dist.py=
", line 984, in run_command
> |     cmd_obj.ensure_finalized()
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/cmd.py"=
, line 107, in ensure_finalized
> |     self.finalize_options()
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/set=
uptools/command/install.py", line 38, in finalize_options
> |     orig.install.finalize_options(self)
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/command=
/install.py", line 284, in finalize_options
> |     (prefix, exec_prefix) =3D get_config_vars('prefix', 'exec_prefix')
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/sysconf=
ig.py", line 472, in get_config_vars
> |     func()
> |   File "/work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3=
-tinydb/3.13.0-r0/recipe-sysroot-native/usr/lib/python3.7/distutils/sysconf=
ig.py", line 432, in _init_posix
> |     _temp =3D __import__(name, globals(), locals(), ['build_time_vars']=
, 0)
> | ModuleNotFoundError: No module named '_sysconfigdata'
> | ERROR: 'python3 setup.py install --root=3D/work/build/tmp/work/armv7at2=
hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/image     --prefix=3D/u=
sr     --install-lib=3D/usr/lib/python3.7/site-packages     --install-data=
=3D/usr/share' execution failed.
> | WARNING: /work/build/tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python=
3-tinydb/3.13.0-r0/temp/run.do_install.3000311:1 exit 1 from 'exit 1'
> | ERROR: Function failed: do_install (log file is located at /work/build/=
tmp/work/armv7at2hf-neon-metr-linux-gnueabi/python3-tinydb/3.13.0-r0/temp/l=
og.do_install.3000311)
> ERROR: Task (/work/meta-openembedded/meta-python/recipes-devtools/python/=
python3-tinydb_3.13.0.bb:do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 920 tasks of which 919 didn't need to be r=
erun and 1 failed.
>
> Summary: 1 task failed:
>   /work/meta-openembedded/meta-python/recipes-devtools/python/python3-tin=
ydb_3.13.0.bb:do_install
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

