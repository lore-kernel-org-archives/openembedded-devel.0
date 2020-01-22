Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 900647F8AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:28:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 20so276627wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LG7UK23MN3GSiJbfytpZh25GuGZhyd5e6AvFaPxtiSw=;
	b=bqGaxOrSI7MlFCCxMeCKmMY/yGybNU4jw/IoX3zJnJ97eVVNM8knewbIQxjXXn05tj
	TfyRAOZDtqZi4xalwEh90ZM0uey4Km4vFLFg9usAqXlbPGCQSdOlLkCoQ+sk1TILwrMA
	RY5K/9YgC/S6XQpR5ciok5b1zM8ICcIa++Oqnr+6Hz9IpKvow+9bktC/yzZTE8bLnO1J
	wwVeS/E4o1BFb17j7Nwu6GbWijGIN4ynDwpq/xFdlkIluqTsEet5OCZrqo+dMqJM0CtE
	KUTSMbp7hTlriaf42hAGZp5o0PvDSZ86AkNpbnRIej0O1YdwQaxJRFQMpQpNt1jCJThm
	XzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LG7UK23MN3GSiJbfytpZh25GuGZhyd5e6AvFaPxtiSw=;
	b=rTxFl42EVqGMrGGH6RRNi58GjUIqO5QyyOnN776ZlLLtHJLk82SJJOpk0V6a0h6OCV
	o6M/yw+TmX3kHUOJQiIFaA1Pp+8rlM7rgmP3bxcU3ct8qfBBYyRKmJ6qxfBMHmHnMaGd
	nnedKDUfYXkA9kLtd/Saj0FGEvNYo/yw7yrMzkKcpUQzgZerjF72DdbauiZqYUWR/+YW
	q3UnqUiGjzjAZV0Urz0okMJPBesPAuzJdmIs6oeKkQQgnuUlhgogovqAbnbZwJBPEZQn
	Ttg7XBaA0n9Xj5NM6j7tACyZv8Y5VLmgxCInXULHRGlApakSTlNUNcPS6kfuoohQf6hw
	/TOw==
X-Gm-Message-State: APjAAAVwcZUkPExiZpt9/IHz4eAuDMco6ROIhIi7udP7y/Dw6T2qH3MD
	psnGzaRuDYjJBZ5DT2HZgmY=
X-Google-Smtp-Source: APXvYqxZA3+sUW1ZW8ePp3ySJ7FqlavqnDwj9YUlDmg+YZfmkuuzzp9jCLmtyZdTvX4mhJHsKSakcQ==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr4618390wmg.38.1579721293079; 
	Wed, 22 Jan 2020 11:28:13 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	c15sm57827142wrt.1.2020.01.22.11.28.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 11:28:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Jan 2020 20:28:11 +0100
To: =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20200122192811.agrfqpad25mg7ao3@jama>
References: <20200120170426.15131-1-guillaume.burel@stormshield.eu>
	<CA+chaQc-rJqr-q8MvpyJbYnwn_URHs8iM1Q2RNaR2erSrGiBmA@mail.gmail.com>
	<f6ffda47-cfab-2efa-fa98-6d92765989ce@stormshield.eu>
	<CA+chaQe+Zq920qOAT96-YSXQy3K0N++8u9L9=OudVD8_FqT0Og@mail.gmail.com>
	<442f8a123e96f247f69d7fc249e95d558dd885f0.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <442f8a123e96f247f69d7fc249e95d558dd885f0.camel@andred.net>
User-Agent: NeoMutt/20180716
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
	Guillaume Burel <guillaume.burel@stormshield.eu>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: 10.17.0 -> 12.14.0
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
X-List-Received-Date: Wed, 22 Jan 2020 19:28:13 -0000
X-Groupsio-MsgNum: 82355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="owlvppr7zgvdjshb"
Content-Disposition: inline

--owlvppr7zgvdjshb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2020 at 06:55:47PM +0000, Andr=E9 Draszik wrote:
> > depend on meta-python2, there is e.g.
> > https://github.com/imyller/meta-nodejs already)
>=20
> This has seen it's last update 3 years ago and is at v7.x still

Yes, I'm aware of that. I was checking what version is there before
sending previous e-mail, but this might not be needed in the end,
because the python2 removal thread in yocto ML suggests that 12.x
works with python3:
https://lists.yoctoproject.org/g/yocto/message/48078

If someone else can confirm that the version 12.x works fine with
python3, then we won't need Khem's patch:
https://patchwork.openembedded.org/patch/169336/
and it can stay in meta-oe without any issues (other than build issue on
mips khem reported).

Regards,

>=20
> Cheers,
> A.
>=20
>=20
> On Tue, 2020-01-21 at 18:32 +0100, Martin Jansa wrote:
> > Release branches like zeus don't receive new versions (unless it's bugf=
ix
> > only release), so backporting upgrade from 10.x to 12.x won't happen in
> > zeus.
> >=20
> > And because meta-oe/master currently doesn't have python2 nor plans to
> > depend on meta-python2, this recipe won't build in Khem's builds to mer=
ge
> > it.
> >=20
> > Maybe 12.x should be added to some other layer (which might not object =
to
> > depend on meta-python2, there is e.g.
> > https://github.com/imyller/meta-nodejs already)
> > and nodejs in meta-oe/master could be upgraded all the way to 13.x?
> >=20
> > On Tue, Jan 21, 2020 at 12:02 PM Guillaume Burel <
> > guillaume.burel@stormshield.eu> wrote:
> >=20
> > > Node.js v12.x uses python2 as part of its build process. Starting from
> > > Node v13.x, python3 might be enough.
> > > Perhaps should we discard the patch or backport it to zeus, and switc=
h to
> > > Node v13.x on master ?
> > >=20
> > > AFAIK, npm does not require python anymore.
> > >=20
> > > On 1/20/20 6:17 PM, Martin Jansa wrote:
> > >=20
> > > Does npm still depend on python2 in this release? python2 was removed=
 from
> > > oe-core yesterday, so nodejs doesn't build anymore in meta-oe.
> > >=20
> > > Please describe in commit message what changed in license (to explain
> > > LIC_FILES_CHKSUM change).
> > >=20
> > > On Mon, Jan 20, 2020 at 6:12 PM Guillaume Burel <
> > > guillaume.burel@stormshield.eu> wrote:
> > >=20
> > > > - update Node.js to active 12.x LTS release 12.14.0.
> > > > - remove compatibility with gcc 4.8 (has been removed upstream)
> > > >=20
> > > > Signed-off-by: Guillaume Burel <guillaume.burel@stormshield.eu>
> > > > ---
> > > >  ...e-running-gyp-files-for-bundled-deps.patch | 25 ++++---
> > > >  .../nodejs/0002-Using-native-binaries.patch   | 71 +++++++++++++++=
++++
> > > >  .../nodejs/0002-Using-native-torque.patch     | 36 ----------
> > > >  ...Install-both-binaries-and-use-libdir.patch | 17 +++--
> > > >  ...0004-Make-compatibility-with-gcc-4.8.patch | 69 ---------------=
---
> > > >  ...> 0004-v8-don-t-override-ARM-CFLAGS.patch} | 16 ++---
> > > >  .../nodejs/0005-Link-atomic-library.patch     | 20 ------
> > > >  .../{nodejs_10.17.0.bb =3D> nodejs_12.14.0.bb}  | 18 ++---
> > > >  8 files changed, 109 insertions(+), 163 deletions(-)
> > > >  create mode 100644
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.p=
atch
> > > >  delete mode 100644
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.pat=
ch
> > > >  delete mode 100644
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with=
-gcc-4.8.patch
> > > >  rename
> > > > meta-oe/recipes-devtools/nodejs/nodejs/{0007-v8-don-t-override-ARM-=
CFLAGS.patch
> > > > =3D> 0004-v8-don-t-override-ARM-CFLAGS.patch} (92%)
> > > >  delete mode 100644
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.pat=
ch
> > > >  rename meta-oe/recipes-devtools/nodejs/{nodejs_10.17.0.bb =3D>
> > > > nodejs_12.14.0.bb} (87%)
> > > >=20
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch
> > > > index 5d0dc03b6..4dd121f48 100644
> > > > ---
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch
> > > > +++
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch
> > > > @@ -4,23 +4,22 @@ Date: Thu, 27 Apr 2017 14:25:42 +0200
> > > >  Subject: [PATCH] Disable running gyp on shared deps
> > > >=20
> > > >  ---
> > > > - Makefile | 4 ++--
> > > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > + Makefile | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > >  diff --git a/Makefile b/Makefile
> > > > -index a98772f..f5663e2 100644
> > > > +index 0947300f24..6c98691984 100644
> > > >  --- a/Makefile
> > > >  +++ b/Makefile
> > > > -@@ -123,8 +123,8 @@ with-code-cache:
> > > > - test-code-cache: with-code-cache
> > > > -       $(PYTHON) tools/test.py $(PARALLEL_ARGS)
> > > > --mode=3D$(BUILDTYPE_LOWER) code-cache
> > > > +@@ -141,7 +141,7 @@ test-code-cache: with-code-cache
> > > > +       echo "'test-code-cache' target is a noop"
> > > >=20
> > > > --out/Makefile: common.gypi deps/uv/uv.gyp
> > > > deps/http_parser/http_parser.gyp \
> > > > --              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
> > > > -+out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
> > > > -+              deps/v8/gypfiles/toolchain.gypi \
> > > > -               deps/v8/gypfiles/features.gypi deps/v8/gypfiles/v8.=
gyp
> > > > node.gyp \
> > > > -               config.gypi
> > > > + out/Makefile: config.gypi common.gypi node.gyp \
> > > > +-      deps/uv/uv.gyp deps/http_parser/http_parser.gyp
> > > > deps/zlib/zlib.gyp \
> > > > ++      deps/http_parser/http_parser.gyp \
> > > > +       tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features=
=2Egypi \
> > > > +       tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
> > > >         $(PYTHON) tools/gyp_node.py -f make
> > > >  --
> > > > -2.19.2
> > > > +2.20.1
> > > > +
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries=
=2Epatch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries=
=2Epatch
> > > > new file mode 100644
> > > > index 000000000..b5142dc9c
> > > > --- /dev/null
> > > > +++
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries=
=2Epatch
> > > > @@ -0,0 +1,71 @@
> > > > +From 6c3ac20477a4bac643088f24df3c042e627fafa9 Mon Sep 17 00:00:00 =
2001
> > > > +From: Guillaume Burel <guillaume.burel@stormshield.eu>
> > > > +Date: Fri, 3 Jan 2020 11:25:54 +0100
> > > > +Subject: [PATCH] Using native binaries
> > > > +
> > > > +---
> > > > + node.gyp                 |  4 ++--
> > > > + tools/v8_gypfiles/v8.gyp | 11 ++++-------
> > > > + 2 files changed, 6 insertions(+), 9 deletions(-)
> > > > +
> > > > +diff --git a/node.gyp b/node.gyp
> > > > +index 8f4dc518..d9389190 100644
> > > > +--- a/node.gyp
> > > > ++++ b/node.gyp
> > > > +@@ -446,7 +446,7 @@
> > > > +                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
> > > > +               ],
> > > > +               'action': [
> > > > +-                '<@(_inputs)',
> > > > ++                'mkcodecache',
> > > > +                 '<@(_outputs)',
> > > > +               ],
> > > > +             },
> > > > +@@ -471,7 +471,7 @@
> > > > +                 '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
> > > > +               ],
> > > > +               'action': [
> > > > +-                '<@(_inputs)',
> > > > ++                'node_mksnapshot',
> > > > +                 '<@(_outputs)',
> > > > +               ],
> > > > +             },
> > > > +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
> > > > +index a506a67d..c91f7dde 100644
> > > > +--- a/tools/v8_gypfiles/v8.gyp
> > > > ++++ b/tools/v8_gypfiles/v8.gyp
> > > > +@@ -140,7 +140,8 @@
> > > > +             '<@(torque_outputs)',
> > > > +           ],
> > > > +           'action': [
> > > > +-            '<@(_inputs)',
> > > > ++            'torque',
> > > > ++            '<@(torque_files)',
> > > > +             '-o', '<(torque_output_root)/torque-generated',
> > > > +             '-v8-root', '<(V8_ROOT)'
> > > > +           ],
> > > > +@@ -247,9 +248,7 @@
> > > > +             '<(generate_bytecode_builtins_list_output)',
> > > > +           ],
> > > > +           'action': [
> > > > +-            'python',
> > > > +-            '<(V8_ROOT)/tools/run.py',
> > > > +-            '<@(_inputs)',
> > > > ++            'bytecode_builtins_list_generator',
> > > > +             '<@(_outputs)',
> > > > +           ],
> > > > +         },
> > > > +@@ -1396,9 +1395,7 @@
> > > > +             '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.c=
c',
> > > > +           ],
> > > > +           'action': [
> > > > +-            'python',
> > > > +-            '<(V8_ROOT)/tools/run.py',
> > > > +-            '<@(_inputs)',
> > > > ++            'gen-regexp-special-case',
> > > > +             '<@(_outputs)',
> > > > +           ],
> > > > +         },
> > > > +--
> > > > +2.20.1
> > > > +
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.p=
atch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.p=
atch
> > > > deleted file mode 100644
> > > > index e9035f9eb..000000000
> > > > ---
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.p=
atch
> > > > +++ /dev/null
> > > > @@ -1,36 +0,0 @@
> > > > -From 4bbee5e3d58bc4911999f3ec2cc5aab8ded6717b Mon Sep 17 00:00:00 =
2001
> > > > -From: "Winker Matthias (TT-CA/ENG1)" <Matthias.Winker@de.bosch.com>
> > > > -Date: Tue, 11 Dec 2018 10:44:29 +0100
> > > > -Subject: [PATCH] Using native torque
> > > > -
> > > > ----
> > > > - deps/v8/gypfiles/v8.gyp | 6 ++++--
> > > > - 1 file changed, 4 insertions(+), 2 deletions(-)
> > > > -
> > > > -diff --git a/deps/v8/gypfiles/v8.gyp b/deps/v8/gypfiles/v8.gyp
> > > > -index 8c78f02255..434168844e 100644
> > > > ---- a/deps/v8/gypfiles/v8.gyp
> > > > -+++ b/deps/v8/gypfiles/v8.gyp
> > > > -@@ -2831,7 +2831,6 @@
> > > > -         {
> > > > -           'action_name': 'run_torque',
> > > > -           'inputs': [  # Order matters.
> > > > --
> > > > '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
> > > > -             '../src/builtins/base.tq',
> > > > -             '../src/builtins/array.tq',
> > > > -             '../src/builtins/typed-array.tq',
> > > > -@@ -2845,7 +2844,10 @@
> > > > -
> > > >  '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-=
=66rom-dsl-gen.cc',
> > > > -
> > > >  '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-=
=66rom-dsl-gen.h',
> > > > -           ],
> > > > --          'action': ['<@(_inputs)', '-o',
> > > > '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
> > > > -+          'action': [
> > > > -+            'torque',
> > > > -+            '<@(_inputs)',
> > > > -+            '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
> > > > -         },
> > > > -       ],
> > > > -     }, # torque
> > > > ---
> > > > -2.19.2
> > > > -
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries=
-and-use-libdir.patch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries=
-and-use-libdir.patch
> > > > index 7aa70fec9..599f742b2 100644
> > > > ---
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries=
-and-use-libdir.patch
> > > > +++
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries=
-and-use-libdir.patch
> > > > @@ -15,17 +15,16 @@ Stolen from [1]
> > > >  Upstream-Status: Pending
> > > >=20
> > > >  Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com>
> > > > -
> > > >  ---
> > > >   configure.py     |  7 +++++++
> > > >   tools/install.py | 31 ++++++++++++++-----------------
> > > >   2 files changed, 21 insertions(+), 17 deletions(-)
> > > >=20
> > > >  diff --git a/configure.py b/configure.py
> > > > -index cfd4207..eb26f7d 100755
> > > > +index 20cce214db..e2d78a2a51 100755
> > > >  --- a/configure.py
> > > >  +++ b/configure.py
> > > > -@@ -552,6 +552,12 @@ parser.add_option('--shared',
> > > > +@@ -559,6 +559,12 @@ parser.add_option('--shared',
> > > >       help=3D'compile shared library for embedding node in another =
project.
> > > > ' +
> > > >            '(This mode is not officially supported for regular
> > > > applications)')
> > > >=20
> > > > @@ -38,19 +37,19 @@ index cfd4207..eb26f7d 100755
> > > >   parser.add_option('--without-v8-platform',
> > > >       action=3D'store_true',
> > > >       dest=3D'without_v8_platform',
> > > > -@@ -1095,6 +1101,7 @@ def configure_node(o):
> > > > -   if options.code_cache_path:
> > > > -     o['variables']['node_code_cache_path'] =3D options.code_cache=
_path
> > > > +@@ -1103,6 +1109,7 @@ def configure_node(o):
> > > > +   if o['variables']['want_separate_host_toolset'] =3D=3D 0:
> > > > +     o['variables']['node_code_cache'] =3D 'yes' # For testing
> > > >     o['variables']['node_shared'] =3D b(options.shared)
> > > >  +  o['variables']['libdir'] =3D options.libdir
> > > >     node_module_version =3D getmoduleversion.get_version()
> > > >=20
> > > >     if sys.platform =3D=3D 'darwin':
> > > >  diff --git a/tools/install.py b/tools/install.py
> > > > -index 028c32e..bf443c4 100755
> > > > +index 655802980a..fe4723bf15 100755
> > > >  --- a/tools/install.py
> > > >  +++ b/tools/install.py
> > > > -@@ -117,26 +117,23 @@ def subdir_files(path, dest, action):
> > > > +@@ -121,26 +121,23 @@ def subdir_files(path, dest, action):
> > > >=20
> > > >   def files(action):
> > > >     is_windows =3D sys.platform =3D=3D 'win32'
> > > > @@ -92,5 +91,5 @@ index 028c32e..bf443c4 100755
> > > >     if 'true' =3D=3D variables.get('node_use_dtrace'):
> > > >       action(['out/Release/node.d'], 'lib/dtrace/node.d')
> > > >  --
> > > > -2.23.0
> > > > +2.20.1
> > > >=20
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-wi=
th-gcc-4.8.patch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-wi=
th-gcc-4.8.patch
> > > > deleted file mode 100644
> > > > index 925c085e9..000000000
> > > > ---
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-wi=
th-gcc-4.8.patch
> > > > +++ /dev/null
> > > > @@ -1,69 +0,0 @@
> > > > -Implement function as wrapper for std::make_unique
> > > > -method to be compatible with gcc < 4.9 .
> > > > -"error::make_unique is not a member of 'std'"
> > > > -
> > > > -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > > -Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > > > -
> > > > -diff -Naur node-v10.15.1/src/cares_wrap.cc
> > > > node-v10.15.1/src/cares_wrap.cc
> > > > ---- node-v10.15.1/src/cares_wrap.cc    2019-01-29 08:20:50.0000000=
00
> > > > +0100
> > > > -+++ node-v10.15.1/src/cares_wrap.cc    2019-02-21 16:22:25.4891316=
65
> > > > +0100
> > > > -@@ -52,6 +52,16 @@
> > > > - # define AI_V4MAPPED 0
> > > > - #endif
> > > > -
> > > > -+#ifndef __cpp_lib_make_unique
> > > > -+namespace std {
> > > > -+  /// make_unique implementation
> > > > -+  template<typename T, typename... Args>
> > > > -+  std::unique_ptr<T> make_unique(Args&&... args) {
> > > > -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
> > > > -+  }
> > > > -+}
> > > > -+#endif
> > > > -+
> > > > - namespace node {
> > > > - namespace cares_wrap {
> > > > -
> > > > -diff -Naur node-v10.15.1/src/inspector_agent.cc
> > > > node-v10.15.1/src/inspector_agent.cc
> > > > ---- node-v10.15.1/src/inspector_agent.cc       2019-01-29
> > > > 08:20:50.000000000 +0100
> > > > -+++ node-v10.15.1/src/inspector_agent.cc       2019-02-21
> > > > 16:22:09.000185992 +0100
> > > > -@@ -24,6 +24,16 @@
> > > > - #include <pthread.h>
> > > > - #endif  // __POSIX__
> > > > -
> > > > -+#ifndef __cpp_lib_make_unique
> > > > -+namespace std {
> > > > -+  /// make_unique implementation
> > > > -+  template<typename T, typename... Args>
> > > > -+  std::unique_ptr<T> make_unique(Args&&... args) {
> > > > -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
> > > > -+  }
> > > > -+}
> > > > -+#endif
> > > > -+
> > > > - namespace node {
> > > > - namespace inspector {
> > > > - namespace {
> > > > -
> > > > -diff --git a/src/inspector/main_thread_interface.cc
> > > > b/src/inspector/main_thread_interface.cc
> > > > -index e374c0fd70..05d7d8c60f 100644
> > > > ---- a/src/inspector/main_thread_interface.cc
> > > > -+++ b/src/inspector/main_thread_interface.cc
> > > > -@@ -6,6 +6,16 @@
> > > > - #include <functional>
> > > > - #include <unicode/unistr.h>
> > > > -
> > > > -+#ifndef __cpp_lib_make_unique
> > > > -+namespace std {
> > > > -+  /// make_unique implementation
> > > > -+  template<typename T, typename... Args>
> > > > -+  std::unique_ptr<T> make_unique(Args&&... args) {
> > > > -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
> > > > -+  }
> > > > -+}
> > > > -+#endif
> > > > -+
> > > > - namespace node {
> > > > - namespace inspector {
> > > > - namespace {
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM=
-CFLAGS.patch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM=
-CFLAGS.patch
> > > > similarity index 92%
> > > > rename from
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-C=
FLAGS.patch
> > > > rename to
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-C=
FLAGS.patch
> > > > index eb2cbfb8b..97ed972ce 100644
> > > > ---
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM=
-CFLAGS.patch
> > > > +++
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM=
-CFLAGS.patch
> > > > @@ -24,14 +24,14 @@ problems have been noted during compilation or
> > > > runtime.
> > > >  Upstream-Status: Inappropriate [oe-specific]
> > > >  Signed-off-by: Andr=E9 Draszik <git@andred.net>
> > > >  ---
> > > > - deps/v8/gypfiles/toolchain.gypi | 52 ++--------------------------=
-----
> > > > + tools/v8_gypfiles/toolchain.gypi | 52 ++-------------------------=
-----
> > > >   1 file changed, 2 insertions(+), 50 deletions(-)
> > > >=20
> > > > -diff --git a/deps/v8/gypfiles/toolchain.gypi
> > > > b/deps/v8/gypfiles/toolchain.gypi
> > > > -index 910a212..1390b15 100644
> > > > ---- a/deps/v8/gypfiles/toolchain.gypi
> > > > -+++ b/deps/v8/gypfiles/toolchain.gypi
> > > > -@@ -199,31 +199,7 @@
> > > > +diff --git a/tools/v8_gypfiles/toolchain.gypi
> > > > b/tools/v8_gypfiles/toolchain.gypi
> > > > +index 264b3e478e..0b41848145 100644
> > > > +--- a/tools/v8_gypfiles/toolchain.gypi
> > > > ++++ b/tools/v8_gypfiles/toolchain.gypi
> > > > +@@ -211,31 +211,7 @@
> > > >           'target_conditions': [
> > > >             ['_toolset=3D=3D"host"', {
> > > >               'conditions': [
> > > > @@ -64,7 +64,7 @@ index 910a212..1390b15 100644
> > > >                   # Host not built with an Arm CXX compiler (simula=
tor
> > > > build).
> > > >                   'conditions': [
> > > >                     [ 'arm_float_abi=3D=3D"hard"', {
> > > > -@@ -242,31 +218,7 @@
> > > > +@@ -254,31 +230,7 @@
> > > >             }],  # _toolset=3D=3D"host"
> > > >             ['_toolset=3D=3D"target"', {
> > > >               'conditions': [
> > > > @@ -98,5 +98,5 @@ index 910a212..1390b15 100644
> > > >                   'conditions': [
> > > >                     [ 'arm_float_abi=3D=3D"hard"', {
> > > >  --
> > > > -2.23.0.rc1
> > > > +2.20.1
> > > >=20
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.p=
atch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.p=
atch
> > > > deleted file mode 100644
> > > > index 66ff18b4a..000000000
> > > > ---
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.p=
atch
> > > > +++ /dev/null
> > > > @@ -1,20 +0,0 @@
> > > > -Link atomic library to fix missing undefined referrences
> > > > -like "undefined reference to `__atomic_fetch_add_8'"
> > > > -
> > > > -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > > -
> > > > -diff -Naur node-v10.15.1/deps/v8/gypfiles/v8.gyp
> > > > node-v10.15.1/deps/v8/gypfiles/v8.gyp
> > > > ---- node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-13
> > > > 09:02:21.000000000 +0100
> > > > -+++ node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-15
> > > > 21:27:11.755679660 +0100
> > > > -@@ -452,6 +452,11 @@
> > > > -         '<(DEPTH)',
> > > > -         '<(SHARED_INTERMEDIATE_DIR)'
> > > > -       ],
> > > > -+      'link_settings': {
> > > > -+        'libraries': [
> > > > -+          '-latomic'
> > > > -+        ],
> > > > -+      },
> > > > -       'sources': [
> > > > -         '<@(inspector_all_sources)',
> > > > -         '../include//v8-inspector-protocol.h',
> > > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
> > > > similarity index 87%
> > > > rename from meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> > > > rename to meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
> > > > index 71a47636b..abe4be632 100644
> > > > --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> > > > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
> > > > @@ -1,7 +1,7 @@
> > > >  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> > > >  HOMEPAGE =3D "http://nodejs.org"
> > > >  LICENSE =3D "MIT & BSD & Artistic-2.0"
> > > > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbe980eb7ccafe287cb43807=
6a65e888c"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbe4d5107c64dc3d7c57e379=
7e1a0674b"
> > > >=20
> > > >  DEPENDS =3D "openssl"
> > > >  DEPENDS_append_class-target =3D " nodejs-native"
> > > > @@ -18,16 +18,14 @@ COMPATIBLE_HOST_riscv32 =3D "null"
> > > >  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
> > > >             file://0001-Disable-running-gyp-files-for-bundled-deps.=
patch
> > > > \
> > > >             file://0003-Install-both-binaries-and-use-libdir.patch \
> > > > -           file://0004-Make-compatibility-with-gcc-4.8.patch \
> > > > -           file://0007-v8-don-t-override-ARM-CFLAGS.patch \
> > > > +           file://0004-v8-don-t-override-ARM-CFLAGS.patch \
> > > >             "
> > > >  SRC_URI_append_class-target =3D " \
> > > > -           file://0002-Using-native-torque.patch \
> > > > -           file://0005-Link-atomic-library.patch \
> > > > +           file://0002-Using-native-binaries.patch \
> > > >             "
> > > >=20
> > > > -SRC_URI[md5sum] =3D "d5a56d0abf764a91f627f0690cd4b9f3"
> > > > -SRC_URI[sha256sum] =3D
> > > > "412667d76bd5273c07cb69c215998109fd5bb35c874654f93e6a0132d666c58e"
> > > > +SRC_URI[md5sum] =3D "6762f5629f6f68fb9bdf83a741cba038"
> > > > +SRC_URI[sha256sum] =3D
> > > > "088a217ba2af641b8cc15be29f6e2956b8a33e6badb85596bbc2cdea9df9be71"
> > > >=20
> > > >  S =3D "${WORKDIR}/node-v${PV}"
> > > >=20
> > > > @@ -129,9 +127,13 @@ do_install_append_class-native() {
> > > >      # npm-cli.js continues to use old shebang
> > > >      sed "1s^.*^#\!/usr/bin/env node^g" -i
> > > > ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> > > >=20
> > > > -    # Install the native torque to provide it within sysroot for t=
he
> > > > target compilation
> > > > +    # Install the native binaries to provide it within sysroot for=
 the
> > > > target compilation
> > > >      install -d ${D}${bindir}
> > > >      install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
> > > > +    install -m 0755 ${S}/out/Release/bytecode_builtins_list_genera=
tor
> > > > ${D}${bindir}/bytecode_builtins_list_generator
> > > > +    install -m 0755 ${S}/out/Release/gen-regexp-special-case
> > > > ${D}${bindir}/gen-regexp-special-case
> > > > +    install -m 0755 ${S}/out/Release/mkcodecache
> > > > ${D}${bindir}/mkcodecache
> > > > +    install -m 0755 ${S}/out/Release/node_mksnapshot
> > > > ${D}${bindir}/node_mksnapshot
> > > >  }
> > > >=20
> > > >  do_install_append_class-target() {
> > > > --
> > > > 2.20.1
> > > >=20
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >=20
>=20

--owlvppr7zgvdjshb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXiiiSgAKCRA3VSO3ZXaA
HG62AJ4nwo3jej9gkuAPBbOENsSWwLDJpQCgufHeiDUb9I7omX6yPo4jFNLvt/k=
=mNhK
-----END PGP SIGNATURE-----

--owlvppr7zgvdjshb--
