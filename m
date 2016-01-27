Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 61D20770E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:39:07 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r129so141424248wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GorimglOu+eScNJ7U3DSViv2oebWHR5r2/cTYfz8Yfk=;
	b=GbP/+ImDw497vRmjXEXjfFUlyoU5YGuJYtXB0ku1OyJ3Uso0TWTO/0ZMZxI3JMJ321
	RinZmAzaO1mNuDJlFDaA2uz/y/uaZ12+9uupcMSKLcJVOEQis1xE29JgPVXZyqIPiWcu
	1CBZKiDigOSQJE2pnqmReP8+zv2Z248DAdY8P/k5uQOHaNPTuhknFWV4MJJW+FnSfDEy
	SMlkOqr6ytcP3GeMca3BmJI55sc8E+hfe6EAW8VDN11c1Oy9Qji/3brOIYnEn5uHHp4v
	lZHP5z5MRJHbUUYo8x8pZMt5HMeh5G0o3GZpakahVFMX+A2ZPT6jvTeA8nwQ64nLxWD5
	u97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=GorimglOu+eScNJ7U3DSViv2oebWHR5r2/cTYfz8Yfk=;
	b=I8z7ExEmn1XRKqMQG1x3aAPJdxUew5RCyQPugWYlxl2POVIxP2NgRydQcWrbsmwoO9
	9qqrQBgn7EszTd8HLWwDqFLKv85Wo6N9UmoVV0+YlD3IELkHJiSZ+LisLXn9MbgZSsO/
	2j271GfHRGZHGK0Sy4ZehyCWrXx/Vu94oySrCW0sqdfd0tOLVznDC7YLNpErfxJcQw6B
	yoh/D2kEAPSuveRbivvJaK6CWtIrJWSS5KgpxRkGPQ/mfysL8mCpz9ue5m0a0Nu/cbaT
	W8TFp5LuDVs2dJpo95Mau9WbJbX9OqUQwZhDkMs3VIjzX97Dx2B2ka8U9KOE2ZO9g8nw
	Htsw==
X-Gm-Message-State: AG10YORqEu8QN4ihI6dtrw+B//j0uB+vQeOXOdqf/A95+nnIgxva+5EFy8fR78Z79OAcow==
X-Received: by 10.194.250.39 with SMTP id yz7mr31999714wjc.92.1453894748397;
	Wed, 27 Jan 2016 03:39:08 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kw1sm5823493wjb.12.2016.01.27.03.39.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 03:39:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 12:41:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160127114119.GB2574@jama>
References: <1452990367-11666-1-git-send-email-sven.ebenfeld@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1452990367-11666-1-git-send-email-sven.ebenfeld@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist
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
X-List-Received-Date: Wed, 27 Jan 2016 11:39:08 -0000
X-Groupsio-MsgNum: 59717
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline

--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 17, 2016 at 01:26:07AM +0100, Sven Ebenfeld wrote:
> Since building mongodb was impossible currently, I updated the recipe
> and got it working on arm >=3D v6, x86 and x86_64. Unfortunately, it fails
> building with system-boost for the current version 1.60. The corresponding
> ticket SERVER-17294 of mongodb jira is still in progress. So we use the
> built-in version of boost.

Please fix this first:

mongodb-3.3.0+gitAUTOINC+aacd231be0: mongodb rdepends on libpcap, but it
isn't a build dependency? [build-deps]

>=20
> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> ---
>  ...Make-it-possible-to-disable-the-use-of-v8.patch |  50 --------
>  ...to-use-build-settings-from-environment-va.patch |  67 +++++++++++
>  ...02-Fix-linking-when-scripting-is-disabled.patch |  25 ----
>  ...d-mongo-binary-when-scripting-is-disabled.patch |  64 -----------
>  ...ce-os.uname-with-os.getenv-OE_TARGET_ARCH.patch |  50 --------
>  ...ports-atomic-ops-for-armv5-and-up-but-onl.patch | 127 ---------------=
------
>  meta-oe/recipes-support/mongodb/mongodb_git.bb     |  66 ++++++-----
>  7 files changed, 105 insertions(+), 344 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-=
possible-to-disable-the-use-of-v8.patch
>  create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Tell-sco=
ns-to-use-build-settings-from-environment-va.patch
>  delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0002-Fix-link=
ing-when-scripting-is-disabled.patch
>  delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-b=
uild-mongo-binary-when-scripting-is-disabled.patch
>  delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0004-replace-=
os.uname-with-os.getenv-OE_TARGET_ARCH.patch
>  delete mode 100644 meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-=
supports-atomic-ops-for-armv5-and-up-but-onl.patch
>=20
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possibl=
e-to-disable-the-use-of-v8.patch b/meta-oe/recipes-support/mongodb/mongodb/=
0001-Make-it-possible-to-disable-the-use-of-v8.patch
> deleted file mode 100644
> index 650389e..0000000
> --- a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-di=
sable-the-use-of-v8.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From f1bd00e7f54aad6479bc809c27d5cd3c2fb993eb Mon Sep 17 00:00:00 2001
> -From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> -Date: Fri, 20 Dec 2013 11:10:43 +1300
> -Subject: [PATCH 1/5] Make it possible to disable the use of v8.
> -
> -Currently v8 is always built in, no matter what you pass to scons.
> -
> -This removes the (useless) --usev8 flag for scons and replaces it with a
> ---disable-scripting option instead.
> ----
> - SConstruct | 9 ++++++---
> - 1 file changed, 6 insertions(+), 3 deletions(-)
> -
> -diff --git a/SConstruct b/SConstruct
> -index 3886d1b..6e0ef3b 100644
> ---- a/SConstruct
> -+++ b/SConstruct
> -@@ -225,7 +225,7 @@ add_option( "asio" , "Use Asynchronous IO (NOT READY=
 YET)" , 0 , True )
> - add_option( "ssl" , "Enable SSL" , 0 , True )
> -=20
> - # library choices
> --add_option( "usev8" , "use v8 for javascript" , 0 , True )
> -+add_option( "disable-scripting" , "do not build support for javascript"=
 , 0 , True )
> - add_option( "libc++", "use libc++ (experimental, requires clang)", 0, T=
rue )
> -=20
> - # mongo feature options
> -@@ -442,7 +442,7 @@ static =3D has_option( "static" )
> -=20
> - noshell =3D has_option( "noshell" )=20
> -=20
> --usev8 =3D has_option( "usev8" )=20
> -+disable_scripting =3D has_option( "disable-scripting" )
> -=20
> - asio =3D has_option( "asio" )
> -=20
> -@@ -600,7 +600,10 @@ if has_option( "durableDefaultOn" ):
> - if has_option( "durableDefaultOff" ):
> -     env.Append( CPPDEFINES=3D[ "_DURABLEDEFAULTOFF" ] )
> -=20
> --usev8 =3D True
> -+if disable_scripting or justClientLib:
> -+    usev8 =3D False
> -+else:
> -+    usev8 =3D True
> -=20
> - extraLibPlaces =3D []
> -=20
> ---=20
> -1.9.0
> -
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-u=
se-build-settings-from-environment-va.patch b/meta-oe/recipes-support/mongo=
db/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
> new file mode 100644
> index 0000000..09d49d2
> --- /dev/null
> +++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-use-buil=
d-settings-from-environment-va.patch
> @@ -0,0 +1,67 @@
> +From 53368d3f4adc09dd84234a9af31771bcd8ca2757 Mon Sep 17 00:00:00 2001
> +From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> +Date: Fri, 15 Jan 2016 22:41:28 +0100
> +Subject: [PATCH] Tell scons to use build settings from environment varia=
bles
> +
> +Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> +---
> + SConstruct                | 8 ++++++--
> + src/mongo/util/SConscript | 2 ++
> + 2 files changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/SConstruct b/SConstruct
> +index 5082a4b..3370f70 100644
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -507,6 +507,7 @@ def variable_arch_converter(val):
> +         'amd64':  'x86_64',
> +         'emt64':   'x86_64',
> +         'x86':    'i386',
> ++        'aarch64': 'arm64',
> +     }
> +     val =3D val.lower()
> +=20
> +@@ -568,7 +569,8 @@ env_vars.Add('ARFLAGS',
> +     converter=3Dvariable_shlex_converter)
> +=20
> + env_vars.Add('CC',
> +-    help=3D'Select the C compiler to use')
> ++    help=3D'Select the C compiler to use',
> ++    default=3Dos.getenv('CC'))
> +=20
> + env_vars.Add('CCFLAGS',
> +     help=3D'Sets flags for the C and C++ compiler',
> +@@ -588,7 +590,8 @@ env_vars.Add('CPPPATH',
> +     converter=3Dvariable_shlex_converter)
> +=20
> + env_vars.Add('CXX',
> +-    help=3D'Select the C++ compiler to use')
> ++    help=3D'Select the C++ compiler to use',
> ++    default=3Dos.getenv('CXX'))
> +=20
> + env_vars.Add('CXXFLAGS',
> +     help=3D'Sets flags for the C++ compiler',
> +@@ -818,6 +821,7 @@ envDict =3D dict(BUILD_ROOT=3DbuildDir,
> +                )
> +=20
> + env =3D Environment(variables=3Denv_vars, **envDict)
> ++env.PrependENVPath('PATH', os.getenv('PATH'))
> + del envDict
> +=20
> + env.AddMethod(env_os_is_wrapper, 'TargetOSIs')
> +diff --git a/src/mongo/util/SConscript b/src/mongo/util/SConscript
> +index 6add602..8d05a62 100644
> +--- a/src/mongo/util/SConscript
> ++++ b/src/mongo/util/SConscript
> +@@ -251,6 +251,8 @@ if get_option('allocator') =3D=3D 'tcmalloc':
> +                 'MONGO_HAVE_GPERFTOOLS_GET_THREAD_CACHE_SIZE'
> +             ]
> +         )
> ++    if not use_system_version_of_library('valgrind'):
> ++        tcmspEnv.InjectThirdPartyIncludePaths('valgrind')
> +=20
> +     tcmspEnv.Library(
> +         target=3D'tcmalloc_set_parameter',
> +--=20
> +1.9.1
> +
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-whe=
n-scripting-is-disabled.patch b/meta-oe/recipes-support/mongodb/mongodb/000=
2-Fix-linking-when-scripting-is-disabled.patch
> deleted file mode 100644
> index b4388d8..0000000
> --- a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scrip=
ting-is-disabled.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 5b22f64a2e2237082d2733698b07147d27b09ad2 Mon Sep 17 00:00:00 2001
> -From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> -Date: Fri, 20 Dec 2013 12:28:27 +1300
> -Subject: [PATCH 2/5] Fix linking when scripting is disabled.
> -
> ----
> - src/mongo/scripting/engine_none.cpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/mongo/scripting/engine_none.cpp b/src/mongo/scripting/e=
ngine_none.cpp
> -index f5c7109..9ae9d57 100644
> ---- a/src/mongo/scripting/engine_none.cpp
> -+++ b/src/mongo/scripting/engine_none.cpp
> -@@ -33,4 +33,8 @@ namespace mongo {
> -     void ScriptEngine::setup() {
> -         // noop
> -     }
> -+
> -+    std::string ScriptEngine::getInterpreterVersionString() {
> -+        return "none";
> -+    }
> - }
> ---=20
> -1.9.0
> -
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mo=
ngo-binary-when-scripting-is-disabled.patch b/meta-oe/recipes-support/mongo=
db/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
> deleted file mode 100644
> index 016ac35..0000000
> --- a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-bin=
ary-when-scripting-is-disabled.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From eab4316597a8e9e7bbf845a054564c6daa4a95b7 Mon Sep 17 00:00:00 2001
> -From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> -Date: Wed, 22 Jan 2014 13:53:10 +1300
> -Subject: [PATCH 3/5] * Do not build 'mongo' binary when scripting is dis=
abled
> - * Do not build the jstests when scripting is disabled
> -
> ----
> - SConstruct           | 8 ++++++--
> - src/mongo/SConscript | 4 +++-
> - 2 files changed, 9 insertions(+), 3 deletions(-)
> -
> -diff --git a/SConstruct b/SConstruct
> -index 6e0ef3b..c84a669 100644
> ---- a/SConstruct
> -+++ b/SConstruct
> -@@ -440,10 +440,13 @@ else:
> -=20
> - static =3D has_option( "static" )
> -=20
> --noshell =3D has_option( "noshell" )=20
> --
> - disable_scripting =3D has_option( "disable-scripting" )
> -=20
> -+if not disable_scripting:
> -+    noshell =3D has_option( "noshell" )
> -+else:
> -+    noshell =3D True
> -+
> - asio =3D has_option( "asio" )
> -=20
> - usePCH =3D has_option( "usePCH" )
> -@@ -1662,6 +1665,7 @@ Export("get_option")
> - Export("has_option use_system_version_of_library")
> - Export("mongoCodeVersion")
> - Export("usev8")
> -+Export("disable_scripting")
> - Export("darwin windows solaris linux freebsd nix")
> - Export('module_sconscripts')
> - Export("debugBuild optBuild")
> -diff --git a/src/mongo/SConscript b/src/mongo/SConscript
> -index 58f8406..b4379e7 100644
> ---- a/src/mongo/SConscript
> -+++ b/src/mongo/SConscript
> -@@ -6,6 +6,7 @@ import os
> - import itertools
> - from buildscripts import utils
> -=20
> -+Import("disable_scripting")
> - Import("env")
> - Import("shellEnv")
> - Import("testEnv")
> -@@ -1043,7 +1044,8 @@ test =3D testEnv.Install(
> -                     [ f for f in Glob("dbtests/*.cpp")
> -                       if not str(f).endswith('framework.cpp') and
> -                          not str(f).endswith('framework_options.cpp') a=
nd
> --                         not str(f).endswith('framework_options_init.cp=
p') ],
> -+                         not str(f).endswith('framework_options_init.cp=
p') and
> -+                         not (str(f).endswith('jstests.cpp') and disabl=
e_scripting)],
> -                     LIBDEPS =3D [
> -                        "mutable_bson_test_utils",
> -                        "mongocommon",
> ---=20
> -1.9.0
> -
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.unam=
e-with-os.getenv-OE_TARGET_ARCH.patch b/meta-oe/recipes-support/mongodb/mon=
godb/0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.patch
> deleted file mode 100644
> index ade7ec0..0000000
> --- a/meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-with-=
os.getenv-OE_TARGET_ARCH.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From d02f33d860f2d11f71e9056782a2e75603d6ec25 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen.kooi@linaro.org>
> -Date: Tue, 4 Feb 2014 10:56:35 +0100
> -Subject: [PATCH 4/5] replace os.uname with os.getenv(OE_TARGET_ARCH)
> -
> -This fixes crosscompilation
> -
> -Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> -Upstream-Status: Inappropiate [OE specific]
> ----
> - SConstruct | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/SConstruct b/SConstruct
> -index c84a669..05e2ea0 100644
> ---- a/SConstruct
> -+++ b/SConstruct
> -@@ -257,9 +257,9 @@ add_option( "pch" , "use precompiled headers to spee=
d up the build (experimental
> - add_option( "distcc" , "use distcc for distributing builds" , 0 , False=
 )
> -=20
> - # debugging/profiling help
> --if os.sys.platform.startswith("linux") and (os.uname()[-1] =3D=3D 'x86_=
64'):
> -+if os.sys.platform.startswith("linux") and (os.getenv("OE_TARGET_ARCH")=
 =3D=3D 'x86_64'):
> -     defaultAllocator =3D 'tcmalloc'
> --elif (os.sys.platform =3D=3D "darwin") and (os.uname()[-1] =3D=3D 'x86_=
64'):
> -+elif (os.sys.platform =3D=3D "darwin") and (os.getenv("OE_TARGET_ARCH")=
 =3D=3D 'x86_64'):
> -     defaultAllocator =3D 'tcmalloc'
> - else:
> -     defaultAllocator =3D 'system'
> -@@ -633,7 +633,7 @@ if has_option( "extralib" ):
> - # ---- other build setup -----
> -=20
> - if "uname" in dir(os):
> --    processor =3D os.uname()[4]
> -+    processor =3D os.getenv("OE_TARGET_ARCH")
> - else:
> -     processor =3D "i386"
> -=20
> -@@ -662,7 +662,7 @@ elif linux:
> -=20
> -     env.Append( LIBS=3D['m'] )
> -=20
> --    if os.uname()[4] =3D=3D "x86_64" and not force32:
> -+    if os.getenv("OE_TARGET_ARCH") =3D=3D "x86_64" and not force32:
> -         linux64 =3D True
> -         nixLibPrefix =3D "lib64"
> -         env.Append( EXTRALIBPATH=3D["/usr/lib64" , "/lib64" ] )
> ---=20
> -1.9.0
> -
> diff --git a/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-support=
s-atomic-ops-for-armv5-and-up-but-onl.patch b/meta-oe/recipes-support/mongo=
db/mongodb/0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-onl.patch
> deleted file mode 100644
> index 490d564..0000000
> --- a/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-atomi=
c-ops-for-armv5-and-up-but-onl.patch
> +++ /dev/null
> @@ -1,127 +0,0 @@
> -From e31f85e6915d4bf6ed76c5da71c235525fa4ecc3 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen.kooi@linaro.org>
> -Date: Mon, 14 Apr 2014 10:29:42 +0200
> -Subject: [PATCH 5/5] GCC 4.7+ supports atomic ops for armv5 and up, but =
only
> - exports the functions for armv6 and up. This patch works around the lin=
ker
> - problems associated with that.
> -
> -Forward ported from http://pkgs.fedoraproject.org/cgit/mongodb.git/tree/=
mongodb-2.4.5-atomics.patch
> -
> -Upstream-status: pending
> ----
> - src/mongo/bson/util/atomic_int.h                   | 26 ++++++++++++
> - src/mongo/platform/atomic_intrinsics_gcc_generic.h | 47 +++++++++++++++=
+++++++
> - 2 files changed, 73 insertions(+)
> -
> -diff --git a/src/mongo/bson/util/atomic_int.h b/src/mongo/bson/util/atom=
ic_int.h
> -index 0b85363..ed02c23 100644
> ---- a/src/mongo/bson/util/atomic_int.h
> -+++ b/src/mongo/bson/util/atomic_int.h
> -@@ -24,6 +24,10 @@
> -=20
> - #include "mongo/platform/compiler.h"
> -=20
> -+#define GCC_VERSION (__GNUC__ * 10000                 \
> -+                     + __GNUC_MINOR__ * 100           \
> -+                     + __GNUC_PATCHLEVEL__)
> -+
> - namespace mongo {
> -=20
> -     /**
> -@@ -72,6 +76,28 @@ namespace mongo {
> -         InterlockedAdd((volatile long *)&x,by);
> -     }
> - # endif
> -+#elif defined(GCC_VERSION) && GCC_VERSION >=3D 40700
> -+// in GCC version >=3D 4.7.0 we can use the built-in atomic operations
> -+
> -+    inline void AtomicUInt::set(unsigned newX) {
> -+        __atomic_store_n (&x, newX, __ATOMIC_SEQ_CST);
> -+    }
> -+    AtomicUInt AtomicUInt::operator++() {    // ++prefix
> -+        return __atomic_add_fetch(&x, 1, __ATOMIC_SEQ_CST);
> -+    }
> -+    AtomicUInt AtomicUInt::operator++(int) { // postfix++
> -+        return __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST);
> -+    }
> -+    AtomicUInt AtomicUInt::operator--() {    // --prefix
> -+        return __atomic_add_fetch(&x, -1, __ATOMIC_SEQ_CST);
> -+    }
> -+    AtomicUInt AtomicUInt::operator--(int) { // postfix--
> -+        return __atomic_fetch_add(&x, -1, __ATOMIC_SEQ_CST);
> -+    }
> -+    void AtomicUInt::signedAdd(int by) {
> -+        __atomic_fetch_add(&x, by, __ATOMIC_SEQ_CST);
> -+    }
> -+
> - #elif defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4)
> -     // this is in GCC >=3D 4.1
> -     inline void AtomicUInt::set(unsigned newX) { __sync_synchronize(); =
x =3D newX; }
> -diff --git a/src/mongo/platform/atomic_intrinsics_gcc_generic.h b/src/mo=
ngo/platform/atomic_intrinsics_gcc_generic.h
> -index 64a2499..b7cc176 100644
> ---- a/src/mongo/platform/atomic_intrinsics_gcc_generic.h
> -+++ b/src/mongo/platform/atomic_intrinsics_gcc_generic.h
> -@@ -22,8 +22,53 @@
> -=20
> - #include <boost/utility.hpp>
> -=20
> -+#define GCC_VERSION (__GNUC__ * 10000                 \
> -+                     + __GNUC_MINOR__ * 100           \
> -+                     + __GNUC_PATCHLEVEL__)
> -+
> - namespace mongo {
> -=20
> -+// If GCC version >=3D 4.7.0, we can use the built-in atomic operations
> -+#if defined(GCC_VERSION) && GCC_VERSION >=3D 40700
> -+
> -+    /**
> -+     * Instantiation of AtomicIntrinsics<>.
> -+     */
> -+    template <typename T>
> -+    class AtomicIntrinsics {
> -+    public:
> -+
> -+        static T compareAndSwap(volatile T* dest, T expected, T newValu=
e) {
> -+            return __atomic_compare_exchange_n (dest, &expected, newVal=
ue, 0, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
> -+        }
> -+
> -+        static T swap(volatile T* dest, T newValue) {
> -+            return __atomic_exchange_n (dest, newValue, __ATOMIC_SEQ_CS=
T);
> -+        }
> -+
> -+        static T load(volatile const T* value) {
> -+            return __atomic_load_n (value, __ATOMIC_SEQ_CST);
> -+        }
> -+
> -+        static T loadRelaxed(volatile const T* value) {
> -+            return *value;
> -+        }
> -+
> -+        static void store(volatile T* dest, T newValue) {
> -+            __atomic_store_n (dest, newValue, __ATOMIC_SEQ_CST);
> -+        }
> -+
> -+        static T fetchAndAdd(volatile T* dest, T increment) {
> -+            return __atomic_fetch_add (dest, increment, __ATOMIC_SEQ_CS=
T);
> -+        }
> -+
> -+    private:
> -+        AtomicIntrinsics();
> -+        ~AtomicIntrinsics();
> -+    };
> -+
> -+#else // GCC version < 4.7, so we must use legacy (platform-specific) a=
tomic operations
> -+
> -     /**
> -      * Instantiation of AtomicIntrinsics<> for all word types T.
> -      */
> -@@ -67,4 +112,6 @@ namespace mongo {
> -         ~AtomicIntrinsics();
> -     };
> -=20
> -+#endif // GCC_VERSION >=3D 40700
> -+
> - }  // namespace mongo
> ---=20
> -1.9.0
> -
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/rec=
ipes-support/mongodb/mongodb_git.bb
> index 879fc7c..c358b94 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -3,44 +3,54 @@ LICENSE =3D "AGPL-3.0 & Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://GNU-AGPL-3.0.txt;md5=3D73f1eb20517c55bf9493=
b7dd6e480788 \
>                      file://APACHE-2.0.txt;md5=3D3b83ef96387f14655fc854dd=
c3c6bd57"
> =20
> -DEPENDS =3D "openssl libpcre boost libpcap"
> -# Mongo uses tcmalloc on x86_64, which is provided by gperftools
> -DEPENDS_append_x86-64 =3D " gperftools"
> +DEPENDS =3D "openssl libpcre zlib"
> =20
>  inherit scons
> =20
> -# Target 'build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl=
/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod' depends=
 on the availability of a system provided library for 'boost_program_option=
s', but no suitable library was found during configuration.
> -# | Target 'build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/s=
sl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod' depen=
ds on the availability of a system provided library for 'boost_program_opti=
ons', but no suitable library was found during configuration.
> -# | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g=
++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod] E=
rror 1
> -# | scons: building terminated because of errors.
> -# | ERROR: scons build execution failed.
> -PNBLACKLIST[mongodb] ?=3D "Fails to build with system boost"
> -
> -PV =3D "2.6.0+git${SRCPV}"
> -SRCREV =3D "be1905c24c7e5ea258e537fbf0d2c502c4fc6de2"
> -SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dv2.6 \
> -           file://0001-Make-it-possible-to-disable-the-use-of-v8.patch \
> -           file://0002-Fix-linking-when-scripting-is-disabled.patch \
> -           file://0003-Do-not-build-mongo-binary-when-scripting-is-disab=
led.patch \
> -           file://0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.pa=
tch \
> -           file://0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-=
onl.patch \
> -          "
> +PV =3D "3.3.0+git${SRCPV}"
> +SRCREV =3D "aacd231be0626a204cb40908afdf62c4b67bb0ad"
> +SRC_URI =3D "git://github.com/mongodb/mongo.git;branch=3Dmaster \
> +           file://0001-Tell-scons-to-use-build-settings-from-environment=
-va.patch \
> +           "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -export OE_TARGET_ARCH=3D"${TARGET_ARCH}"
> +# Wiredtiger supports only 64-bit platforms
> +PACKAGECONFIG_x86-64 ??=3D "tcmalloc wiredtiger"
> +PACKAGECONFIG_aarch64 ??=3D "tcmalloc wiredtiger"
> +PACKAGECONFIG ??=3D "tcmalloc"
> +# gperftools compilation fails for arm below v7 because of missing suppo=
rt of
> +# dmb operation. So we use system-allocator instead of tcmalloc
> +PACKAGECONFIG_remove_armv6 =3D "tcmalloc"
> +
> +#std::current_exception is undefined for arm < v6
> +COMPATIBLE_MACHINE_armv4 =3D "(!.*armv4).*"
> +COMPATIBLE_MACHINE_armv5 =3D "(!.*armv5).*"
> +COMPATIBLE_MACHINE_mips64 =3D "(!.*mips64).*"
> +
> +PACKAGECONFIG[tcmalloc] =3D "--use-system-tcmalloc,--allocator=3Dsystem,=
gperftools,"
> +PACKAGECONFIG[wiredtiger] =3D "--wiredtiger=3Don,--wiredtiger=3Doff,,"
> =20
>  EXTRA_OESCONS =3D "--prefix=3D${D}${prefix} \
> -                 --propagate-shell-environment \
> -                 --cc-use-shell-environment \
> -                 --cxx-use-shell-environment \
> -                 --ld=3D'${TARGET_PREFIX}g++' \
> +                 LIBPATH=3D${STAGING_LIBDIR} \
> +                 LINKFLAGS=3D'${LDFLAGS}' \
> +                 CXXFLAGS=3D'${CXXFLAGS}' \
> +                 TARGET_ARCH=3D${TARGET_ARCH} \
>                   --ssl \
> -                 --use-system-pcre \=20
> -                 --use-system-boost \
> -                 --use-system-tcmalloc \
> -                 --disable-scripting \
> +                 --disable-warnings-as-errors \
> +                 --use-system-pcre \
> +                 --use-system-zlib \
> +                 --js-engine=3Dnone \
>                   --nostrip \
> +                 ${EXTRA_OECONF} \
>                   mongod mongos"
> =20
> +scons_do_compile() {
> +        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS}=
 || \
> +        die "scons build execution failed."
> +}
> =20
> +scons_do_install() {
> +        ${STAGING_BINDIR_NATIVE}/scons install ${EXTRA_OESCONS}|| \
> +        die "scons install execution failed."
> +}
> \ No newline at end of file
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaorN4ACgkQN1Ujt2V2gBzH9ACeJdf8xToI3R8ic5ac5Tqj8LuW
owoAoJiLTJjP/TZ8Dte1P/haO9REAjbC
=6L+W
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
