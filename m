Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 89446601D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 13:24:20 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p63so68404621wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 05:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:references:in-reply-to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding:thread-index
	:content-language;
	bh=KlT5ImisrguzYfe6lVkonUSHhZegTU7qMw0Z+VSK1h0=;
	b=NPW0vg6009DJbb/TW0m0+OXnYXE0+RQ3van0rEzzPYozn5DrWSVcVqcXduYfqf7U7G
	2cApD0itW3qJ3SJOVV+v5b7LEv4ruYNdlIxhB6udSGLeZQgPceCckQXY4xe22PqXlmSt
	1Mu0RmKICqHQyI0qEduxEKupSTnYwbYeR0t3awcIQP9iwdHjCPG6JPD1WVH+Kp0GNq61
	t2swFLEtFrTbKbKoORgC1YgSYY+u5Jpy+JV51FAhdgvUWlWRhYzeqJ1AbFOsIysyf01J
	9oejU1QhEhBW2YA/JDgjP4RONetFIQi3D+1UYHuaKW9Zwpgfz5D9JzZGVota4PKqw4PC
	lYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:references:in-reply-to:subject:date
	:message-id:mime-version:content-type:content-transfer-encoding
	:thread-index:content-language;
	bh=KlT5ImisrguzYfe6lVkonUSHhZegTU7qMw0Z+VSK1h0=;
	b=kb9iHiblmo5icYYGe7eq2zihYLoI2QbDJTmPVCrtxJ3t0kOEAx4svZ43J6LPPqlqWH
	mI36Nb+KaZbki0/G242FxRflYpAiK1UABMj7zfAJIHXsu1xlJqnRyxRpclHbZQWU9Der
	JnbYac6+DpKVpfatbYby+hb+CPEFWU7DarC5q68xKC8LCzED+0VVhgCIuYlEFpSnjzi3
	cmksdJtMb1Xaga+yGtWDNVilWox19yF9FmjD+620PpGEJQ9gmrBF/IfgpqG69pisAb6F
	u61Y3v/v1pO2QlXgrndB5GccZ4AkmirTqu9DO1xkXujW2RkpobQzcUGe+1tDoNAVPYMN
	4msA==
X-Gm-Message-State: AG10YOQq9wxHPTf7//n4RWeDMbAEWEmRSx0qVmscM6K18UUU9B3vPUq/P88OTAaFnEOn1w==
X-Received: by 10.28.144.196 with SMTP id s187mr9384528wmd.9.1454073860313;
	Fri, 29 Jan 2016 05:24:20 -0800 (PST)
Received: from svenpc ([2001:470:1f0a:1031:a459:5c06:5f1a:8537])
	by smtp.gmail.com with ESMTPSA id
	aq3sm15700852wjc.1.2016.01.29.05.24.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jan 2016 05:24:19 -0800 (PST)
From: "Sven Ebenfeld" <sven.ebenfeld@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1452990367-11666-1-git-send-email-sven.ebenfeld@gmail.com>
	<20160127114119.GB2574@jama>
In-Reply-To: <20160127114119.GB2574@jama>
Date: Fri, 29 Jan 2016 14:24:40 +0100
Message-ID: <003501d15a98$698640f0$3c92c2d0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQEZjHawa1SB1C+lC3MNaUBBKlyEYQIGXuqvoHHkLXA=
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
X-List-Received-Date: Fri, 29 Jan 2016 13:24:21 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: de

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Martin Jansa
> Sent: Wednesday, January 27, 2016 12:41 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] mongodb: 2.6.0 -> 3.3.0 and remove
> from pnblacklist
> 
> On Sun, Jan 17, 2016 at 01:26:07AM +0100, Sven Ebenfeld wrote:
> > Since building mongodb was impossible currently, I updated the recipe
> > and got it working on arm >= v6, x86 and x86_64. Unfortunately, it
> > fails building with system-boost for the current version 1.60. The
> > corresponding ticket SERVER-17294 of mongodb jira is still in
> > progress. So we use the built-in version of boost.
> 
> Please fix this first:
> 
> mongodb-3.3.0+gitAUTOINC+aacd231be0: mongodb rdepends on libpcap,
> but it isn't a build dependency? [build-deps]

I was wondering, because I don't get this message. But now I found out, why
you get it.
The build system looks if libpcap is available automatically and if it is,
it builds mongosniff which depends on it. 
If libpcap is not available, it will not build mongosniff and so it will not
depend on it.

I will send a new patch fixing this issue.

> 
> >
> > Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> > ---
> >  ...Make-it-possible-to-disable-the-use-of-v8.patch |  50 --------
> > ...to-use-build-settings-from-environment-va.patch |  67 +++++++++++
> > ...02-Fix-linking-when-scripting-is-disabled.patch |  25 ----
> > ...d-mongo-binary-when-scripting-is-disabled.patch |  64 -----------
> > ...ce-os.uname-with-os.getenv-OE_TARGET_ARCH.patch |  50 --------
> > ...ports-atomic-ops-for-armv5-and-up-but-onl.patch | 127
--------------------
> -
> >  meta-oe/recipes-support/mongodb/mongodb_git.bb     |  66 ++++++-----
> >  7 files changed, 105 insertions(+), 344 deletions(-)  delete mode
> > 100644
> > meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-
> disab
> > le-the-use-of-v8.patch  create mode 100644
> > meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-use-
> build-s
> > ettings-from-environment-va.patch  delete mode 100644
> > meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-
> scriptin
> > g-is-disabled.patch  delete mode 100644
> > meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-
> binary
> > -when-scripting-is-disabled.patch  delete mode 100644
> > meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-
> with-os.
> > getenv-OE_TARGET_ARCH.patch  delete mode 100644
> > meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-
> atomic-o
> > ps-for-armv5-and-up-but-onl.patch
> >
> > diff --git
> > a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-
> to-dis
> > able-the-use-of-v8.patch
> > b/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-
> to-dis
> > able-the-use-of-v8.patch
> > deleted file mode 100644
> > index 650389e..0000000
> > ---
> > a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-
> to-dis
> > able-the-use-of-v8.patch
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -From f1bd00e7f54aad6479bc809c27d5cd3c2fb993eb Mon Sep 17 00:00:00
> > 2001
> > -From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> > -Date: Fri, 20 Dec 2013 11:10:43 +1300
> > -Subject: [PATCH 1/5] Make it possible to disable the use of v8.
> > -
> > -Currently v8 is always built in, no matter what you pass to scons.
> > -
> > -This removes the (useless) --usev8 flag for scons and replaces it
> > with a ---disable-scripting option instead.
> > ----
> > - SConstruct | 9 ++++++---
> > - 1 file changed, 6 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/SConstruct b/SConstruct
> > -index 3886d1b..6e0ef3b 100644
> > ---- a/SConstruct
> > -+++ b/SConstruct
> > -@@ -225,7 +225,7 @@ add_option( "asio" , "Use Asynchronous IO (NOT
> > READY YET)" , 0 , True )
> > - add_option( "ssl" , "Enable SSL" , 0 , True )
> > -
> > - # library choices
> > --add_option( "usev8" , "use v8 for javascript" , 0 , True )
> > -+add_option( "disable-scripting" , "do not build support for
> > -+javascript" , 0 , True )
> > - add_option( "libc++", "use libc++ (experimental, requires clang)",
> > 0, True )
> > -
> > - # mongo feature options
> > -@@ -442,7 +442,7 @@ static = has_option( "static" )
> > -
> > - noshell = has_option( "noshell" )
> > -
> > --usev8 = has_option( "usev8" )
> > -+disable_scripting = has_option( "disable-scripting" )
> > -
> > - asio = has_option( "asio" )
> > -
> > -@@ -600,7 +600,10 @@ if has_option( "durableDefaultOn" ):
> > - if has_option( "durableDefaultOff" ):
> > -     env.Append( CPPDEFINES=[ "_DURABLEDEFAULTOFF" ] )
> > -
> > --usev8 = True
> > -+if disable_scripting or justClientLib:
> > -+    usev8 = False
> > -+else:
> > -+    usev8 = True
> > -
> > - extraLibPlaces = []
> > -
> > ---
> > -1.9.0
> > -
> > diff --git
> > a/meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-use-
> build
> > -settings-from-environment-va.patch
> > b/meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-use-
> build
> > -settings-from-environment-va.patch
> > new file mode 100644
> > index 0000000..09d49d2
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Tell-scons-to-
> use-b
> > +++ uild-settings-from-environment-va.patch
> > @@ -0,0 +1,67 @@
> > +From 53368d3f4adc09dd84234a9af31771bcd8ca2757 Mon Sep 17 00:00:00
> > +2001
> > +From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> > +Date: Fri, 15 Jan 2016 22:41:28 +0100
> > +Subject: [PATCH] Tell scons to use build settings from environment
> > +variables
> > +
> > +Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> > +---
> > + SConstruct                | 8 ++++++--
> > + src/mongo/util/SConscript | 2 ++
> > + 2 files changed, 8 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/SConstruct b/SConstruct
> > +index 5082a4b..3370f70 100644
> > +--- a/SConstruct
> > ++++ b/SConstruct
> > +@@ -507,6 +507,7 @@ def variable_arch_converter(val):
> > +         'amd64':  'x86_64',
> > +         'emt64':   'x86_64',
> > +         'x86':    'i386',
> > ++        'aarch64': 'arm64',
> > +     }
> > +     val = val.lower()
> > +
> > +@@ -568,7 +569,8 @@ env_vars.Add('ARFLAGS',
> > +     converter=variable_shlex_converter)
> > +
> > + env_vars.Add('CC',
> > +-    help='Select the C compiler to use')
> > ++    help='Select the C compiler to use',
> > ++    default=os.getenv('CC'))
> > +
> > + env_vars.Add('CCFLAGS',
> > +     help='Sets flags for the C and C++ compiler', @@ -588,7 +590,8
> > +@@ env_vars.Add('CPPPATH',
> > +     converter=variable_shlex_converter)
> > +
> > + env_vars.Add('CXX',
> > +-    help='Select the C++ compiler to use')
> > ++    help='Select the C++ compiler to use',
> > ++    default=os.getenv('CXX'))
> > +
> > + env_vars.Add('CXXFLAGS',
> > +     help='Sets flags for the C++ compiler', @@ -818,6 +821,7 @@
> > +envDict = dict(BUILD_ROOT=buildDir,
> > +                )
> > +
> > + env = Environment(variables=env_vars, **envDict)
> > ++env.PrependENVPath('PATH', os.getenv('PATH'))
> > + del envDict
> > +
> > + env.AddMethod(env_os_is_wrapper, 'TargetOSIs') diff --git
> > +a/src/mongo/util/SConscript b/src/mongo/util/SConscript index
> > +6add602..8d05a62 100644
> > +--- a/src/mongo/util/SConscript
> > ++++ b/src/mongo/util/SConscript
> > +@@ -251,6 +251,8 @@ if get_option('allocator') == 'tcmalloc':
> > +                 'MONGO_HAVE_GPERFTOOLS_GET_THREAD_CACHE_SIZE'
> > +             ]
> > +         )
> > ++    if not use_system_version_of_library('valgrind'):
> > ++        tcmspEnv.InjectThirdPartyIncludePaths('valgrind')
> > +
> > +     tcmspEnv.Library(
> > +         target='tcmalloc_set_parameter',
> > +--
> > +1.9.1
> > +
> > diff --git
> > a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-
> script
> > ing-is-disabled.patch
> > b/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-
> script
> > ing-is-disabled.patch
> > deleted file mode 100644
> > index b4388d8..0000000
> > ---
> > a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-
> script
> > ing-is-disabled.patch
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -From 5b22f64a2e2237082d2733698b07147d27b09ad2 Mon Sep 17 00:00:00
> > 2001
> > -From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> > -Date: Fri, 20 Dec 2013 12:28:27 +1300
> > -Subject: [PATCH 2/5] Fix linking when scripting is disabled.
> > -
> > ----
> > - src/mongo/scripting/engine_none.cpp | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/src/mongo/scripting/engine_none.cpp
> > b/src/mongo/scripting/engine_none.cpp
> > -index f5c7109..9ae9d57 100644
> > ---- a/src/mongo/scripting/engine_none.cpp
> > -+++ b/src/mongo/scripting/engine_none.cpp
> > -@@ -33,4 +33,8 @@ namespace mongo {
> > -     void ScriptEngine::setup() {
> > -         // noop
> > -     }
> > -+
> > -+    std::string ScriptEngine::getInterpreterVersionString() {
> > -+        return "none";
> > -+    }
> > - }
> > ---
> > -1.9.0
> > -
> > diff --git
> > a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-
> mongo-bina
> > ry-when-scripting-is-disabled.patch
> > b/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-
> mongo-bina
> > ry-when-scripting-is-disabled.patch
> > deleted file mode 100644
> > index 016ac35..0000000
> > ---
> > a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-
> mongo-bina
> > ry-when-scripting-is-disabled.patch
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -From eab4316597a8e9e7bbf845a054564c6daa4a95b7 Mon Sep 17 00:00:00
> > 2001
> > -From: Michael Hudson-Doyle <michael.hudson@linaro.org>
> > -Date: Wed, 22 Jan 2014 13:53:10 +1300
> > -Subject: [PATCH 3/5] * Do not build 'mongo' binary when scripting is
> > disabled
> > - * Do not build the jstests when scripting is disabled
> > -
> > ----
> > - SConstruct           | 8 ++++++--
> > - src/mongo/SConscript | 4 +++-
> > - 2 files changed, 9 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/SConstruct b/SConstruct
> > -index 6e0ef3b..c84a669 100644
> > ---- a/SConstruct
> > -+++ b/SConstruct
> > -@@ -440,10 +440,13 @@ else:
> > -
> > - static = has_option( "static" )
> > -
> > --noshell = has_option( "noshell" )
> > --
> > - disable_scripting = has_option( "disable-scripting" )
> > -
> > -+if not disable_scripting:
> > -+    noshell = has_option( "noshell" )
> > -+else:
> > -+    noshell = True
> > -+
> > - asio = has_option( "asio" )
> > -
> > - usePCH = has_option( "usePCH" )
> > -@@ -1662,6 +1665,7 @@ Export("get_option")
> > - Export("has_option use_system_version_of_library")
> > - Export("mongoCodeVersion")
> > - Export("usev8")
> > -+Export("disable_scripting")
> > - Export("darwin windows solaris linux freebsd nix")
> > - Export('module_sconscripts')
> > - Export("debugBuild optBuild")
> > -diff --git a/src/mongo/SConscript b/src/mongo/SConscript -index
> > 58f8406..b4379e7 100644
> > ---- a/src/mongo/SConscript
> > -+++ b/src/mongo/SConscript
> > -@@ -6,6 +6,7 @@ import os
> > - import itertools
> > - from buildscripts import utils
> > -
> > -+Import("disable_scripting")
> > - Import("env")
> > - Import("shellEnv")
> > - Import("testEnv")
> > -@@ -1043,7 +1044,8 @@ test = testEnv.Install(
> > -                     [ f for f in Glob("dbtests/*.cpp")
> > -                       if not str(f).endswith('framework.cpp') and
> > -                          not str(f).endswith('framework_options.cpp')
and
> > --                         not
str(f).endswith('framework_options_init.cpp') ],
> > -+                         not
str(f).endswith('framework_options_init.cpp') and
> > -+                         not (str(f).endswith('jstests.cpp') and
> > -+ disable_scripting)],
> > -                     LIBDEPS = [
> > -                        "mutable_bson_test_utils",
> > -                        "mongocommon",
> > ---
> > -1.9.0
> > -
> > diff --git
> > a/meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-
> with-o
> > s.getenv-OE_TARGET_ARCH.patch
> > b/meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-
> with-o
> > s.getenv-OE_TARGET_ARCH.patch
> > deleted file mode 100644
> > index ade7ec0..0000000
> > ---
> > a/meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-
> with-o
> > s.getenv-OE_TARGET_ARCH.patch
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -From d02f33d860f2d11f71e9056782a2e75603d6ec25 Mon Sep 17 00:00:00
> > 2001
> > -From: Koen Kooi <koen.kooi@linaro.org>
> > -Date: Tue, 4 Feb 2014 10:56:35 +0100
> > -Subject: [PATCH 4/5] replace os.uname with
> os.getenv(OE_TARGET_ARCH)
> > -
> > -This fixes crosscompilation
> > -
> > -Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > -Upstream-Status: Inappropiate [OE specific]
> > ----
> > - SConstruct | 8 ++++----
> > - 1 file changed, 4 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/SConstruct b/SConstruct
> > -index c84a669..05e2ea0 100644
> > ---- a/SConstruct
> > -+++ b/SConstruct
> > -@@ -257,9 +257,9 @@ add_option( "pch" , "use precompiled headers to
> > speed up the build (experimental
> > - add_option( "distcc" , "use distcc for distributing builds" , 0 ,
> > False )
> > -
> > - # debugging/profiling help
> > --if os.sys.platform.startswith("linux") and (os.uname()[-1] ==
'x86_64'):
> > -+if os.sys.platform.startswith("linux") and
> (os.getenv("OE_TARGET_ARCH") == 'x86_64'):
> > -     defaultAllocator = 'tcmalloc'
> > --elif (os.sys.platform == "darwin") and (os.uname()[-1] == 'x86_64'):
> > -+elif (os.sys.platform == "darwin") and (os.getenv("OE_TARGET_ARCH")
> == 'x86_64'):
> > -     defaultAllocator = 'tcmalloc'
> > - else:
> > -     defaultAllocator = 'system'
> > -@@ -633,7 +633,7 @@ if has_option( "extralib" ):
> > - # ---- other build setup -----
> > -
> > - if "uname" in dir(os):
> > --    processor = os.uname()[4]
> > -+    processor = os.getenv("OE_TARGET_ARCH")
> > - else:
> > -     processor = "i386"
> > -
> > -@@ -662,7 +662,7 @@ elif linux:
> > -
> > -     env.Append( LIBS=['m'] )
> > -
> > --    if os.uname()[4] == "x86_64" and not force32:
> > -+    if os.getenv("OE_TARGET_ARCH") == "x86_64" and not force32:
> > -         linux64 = True
> > -         nixLibPrefix = "lib64"
> > -         env.Append( EXTRALIBPATH=["/usr/lib64" , "/lib64" ] )
> > ---
> > -1.9.0
> > -
> > diff --git
> > a/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-
> atomic
> > -ops-for-armv5-and-up-but-onl.patch
> > b/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-
> atomic
> > -ops-for-armv5-and-up-but-onl.patch
> > deleted file mode 100644
> > index 490d564..0000000
> > ---
> > a/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-
> atomic
> > -ops-for-armv5-and-up-but-onl.patch
> > +++ /dev/null
> > @@ -1,127 +0,0 @@
> > -From e31f85e6915d4bf6ed76c5da71c235525fa4ecc3 Mon Sep 17 00:00:00
> > 2001
> > -From: Koen Kooi <koen.kooi@linaro.org>
> > -Date: Mon, 14 Apr 2014 10:29:42 +0200
> > -Subject: [PATCH 5/5] GCC 4.7+ supports atomic ops for armv5 and up,
> > but only
> > - exports the functions for armv6 and up. This patch works around the
> > linker
> > - problems associated with that.
> > -
> > -Forward ported from
> > http://pkgs.fedoraproject.org/cgit/mongodb.git/tree/mongodb-2.4.5-
> atom
> > ics.patch
> > -
> > -Upstream-status: pending
> > ----
> > - src/mongo/bson/util/atomic_int.h                   | 26 ++++++++++++
> > - src/mongo/platform/atomic_intrinsics_gcc_generic.h | 47
> > ++++++++++++++++++++++
> > - 2 files changed, 73 insertions(+)
> > -
> > -diff --git a/src/mongo/bson/util/atomic_int.h
> > b/src/mongo/bson/util/atomic_int.h
> > -index 0b85363..ed02c23 100644
> > ---- a/src/mongo/bson/util/atomic_int.h
> > -+++ b/src/mongo/bson/util/atomic_int.h
> > -@@ -24,6 +24,10 @@
> > -
> > - #include "mongo/platform/compiler.h"
> > -
> > -+#define GCC_VERSION (__GNUC__ * 10000                 \
> > -+                     + __GNUC_MINOR__ * 100           \
> > -+                     + __GNUC_PATCHLEVEL__)
> > -+
> > - namespace mongo {
> > -
> > -     /**
> > -@@ -72,6 +76,28 @@ namespace mongo {
> > -         InterlockedAdd((volatile long *)&x,by);
> > -     }
> > - # endif
> > -+#elif defined(GCC_VERSION) && GCC_VERSION >= 40700 // in GCC
> version
> > -+>= 4.7.0 we can use the built-in atomic operations
> > -+
> > -+    inline void AtomicUInt::set(unsigned newX) {
> > -+        __atomic_store_n (&x, newX, __ATOMIC_SEQ_CST);
> > -+    }
> > -+    AtomicUInt AtomicUInt::operator++() {    // ++prefix
> > -+        return __atomic_add_fetch(&x, 1, __ATOMIC_SEQ_CST);
> > -+    }
> > -+    AtomicUInt AtomicUInt::operator++(int) { // postfix++
> > -+        return __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST);
> > -+    }
> > -+    AtomicUInt AtomicUInt::operator--() {    // --prefix
> > -+        return __atomic_add_fetch(&x, -1, __ATOMIC_SEQ_CST);
> > -+    }
> > -+    AtomicUInt AtomicUInt::operator--(int) { // postfix--
> > -+        return __atomic_fetch_add(&x, -1, __ATOMIC_SEQ_CST);
> > -+    }
> > -+    void AtomicUInt::signedAdd(int by) {
> > -+        __atomic_fetch_add(&x, by, __ATOMIC_SEQ_CST);
> > -+    }
> > -+
> > - #elif defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4)
> > -     // this is in GCC >= 4.1
> > -     inline void AtomicUInt::set(unsigned newX) { __sync_synchronize();
x =
> newX; }
> > -diff --git a/src/mongo/platform/atomic_intrinsics_gcc_generic.h
> > b/src/mongo/platform/atomic_intrinsics_gcc_generic.h
> > -index 64a2499..b7cc176 100644
> > ---- a/src/mongo/platform/atomic_intrinsics_gcc_generic.h
> > -+++ b/src/mongo/platform/atomic_intrinsics_gcc_generic.h
> > -@@ -22,8 +22,53 @@
> > -
> > - #include <boost/utility.hpp>
> > -
> > -+#define GCC_VERSION (__GNUC__ * 10000                 \
> > -+                     + __GNUC_MINOR__ * 100           \
> > -+                     + __GNUC_PATCHLEVEL__)
> > -+
> > - namespace mongo {
> > -
> > -+// If GCC version >= 4.7.0, we can use the built-in atomic
> > -+operations #if defined(GCC_VERSION) && GCC_VERSION >= 40700
> > -+
> > -+    /**
> > -+     * Instantiation of AtomicIntrinsics<>.
> > -+     */
> > -+    template <typename T>
> > -+    class AtomicIntrinsics {
> > -+    public:
> > -+
> > -+        static T compareAndSwap(volatile T* dest, T expected, T
newValue) {
> > -+            return __atomic_compare_exchange_n (dest, &expected,
> newValue, 0, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
> > -+        }
> > -+
> > -+        static T swap(volatile T* dest, T newValue) {
> > -+            return __atomic_exchange_n (dest, newValue,
> __ATOMIC_SEQ_CST);
> > -+        }
> > -+
> > -+        static T load(volatile const T* value) {
> > -+            return __atomic_load_n (value, __ATOMIC_SEQ_CST);
> > -+        }
> > -+
> > -+        static T loadRelaxed(volatile const T* value) {
> > -+            return *value;
> > -+        }
> > -+
> > -+        static void store(volatile T* dest, T newValue) {
> > -+            __atomic_store_n (dest, newValue, __ATOMIC_SEQ_CST);
> > -+        }
> > -+
> > -+        static T fetchAndAdd(volatile T* dest, T increment) {
> > -+            return __atomic_fetch_add (dest, increment,
> __ATOMIC_SEQ_CST);
> > -+        }
> > -+
> > -+    private:
> > -+        AtomicIntrinsics();
> > -+        ~AtomicIntrinsics();
> > -+    };
> > -+
> > -+#else // GCC version < 4.7, so we must use legacy
> > -+(platform-specific) atomic operations
> > -+
> > -     /**
> > -      * Instantiation of AtomicIntrinsics<> for all word types T.
> > -      */
> > -@@ -67,4 +112,6 @@ namespace mongo {
> > -         ~AtomicIntrinsics();
> > -     };
> > -
> > -+#endif // GCC_VERSION >= 40700
> > -+
> > - }  // namespace mongo
> > ---
> > -1.9.0
> > -
> > diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> > b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> > index 879fc7c..c358b94 100644
> > --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> > +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> > @@ -3,44 +3,54 @@ LICENSE = "AGPL-3.0 & Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://GNU-AGPL-
> 3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788 \
> >
file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >
> > -DEPENDS = "openssl libpcre boost libpcap"
> > -# Mongo uses tcmalloc on x86_64, which is provided by gperftools
> > -DEPENDS_append_x86-64 = " gperftools"
> > +DEPENDS = "openssl libpcre zlib"
> >
> >  inherit scons
> >
> > -# Target 'build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-
> g++/ssl/use-system-boost/use-system-pcre/use-system-
> tcmalloc/mongo/mongod' depends on the availability of a system provided
> library for 'boost_program_options', but no suitable library was found
during
> configuration.
> > -# | Target 'build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-
> g++/ssl/use-system-boost/use-system-pcre/use-system-
> tcmalloc/mongo/mongod' depends on the availability of a system provided
> library for 'boost_program_options', but no suitable library was found
during
> configuration.
> > -# | scons: ***
> > [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-
> system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod] Error
> 1 -# | scons: building terminated because of errors.
> > -# | ERROR: scons build execution failed.
> > -PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
> > -
> > -PV = "2.6.0+git${SRCPV}"
> > -SRCREV = "be1905c24c7e5ea258e537fbf0d2c502c4fc6de2"
> > -SRC_URI = "git://github.com/mongodb/mongo.git;branch=v2.6 \
> > -           file://0001-Make-it-possible-to-disable-the-use-of-v8.patch
\
> > -           file://0002-Fix-linking-when-scripting-is-disabled.patch \
> > -           file://0003-Do-not-build-mongo-binary-when-scripting-is-
> disabled.patch \
> > -           file://0004-replace-os.uname-with-os.getenv-
> OE_TARGET_ARCH.patch \
> > -
file://0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-
> onl.patch \
> > -          "
> > +PV = "3.3.0+git${SRCPV}"
> > +SRCREV = "aacd231be0626a204cb40908afdf62c4b67bb0ad"
> > +SRC_URI = "git://github.com/mongodb/mongo.git;branch=master \
> > +
file://0001-Tell-scons-to-use-build-settings-from-environment-
> va.patch \
> > +           "
> >
> >  S = "${WORKDIR}/git"
> >
> > -export OE_TARGET_ARCH="${TARGET_ARCH}"
> > +# Wiredtiger supports only 64-bit platforms
> > +PACKAGECONFIG_x86-64 ??= "tcmalloc wiredtiger"
> > +PACKAGECONFIG_aarch64 ??= "tcmalloc wiredtiger"
> > +PACKAGECONFIG ??= "tcmalloc"
> > +# gperftools compilation fails for arm below v7 because of missing
> > +support of # dmb operation. So we use system-allocator instead of
> > +tcmalloc
> > +PACKAGECONFIG_remove_armv6 = "tcmalloc"
> > +
> > +#std::current_exception is undefined for arm < v6
> > +COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
> > +COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
> > +COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
> > +
> > +PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--
> allocator=system,gperftools,"
> > +PACKAGECONFIG[wiredtiger] = "--wiredtiger=on,--wiredtiger=off,,"
> >
> >  EXTRA_OESCONS = "--prefix=${D}${prefix} \
> > -                 --propagate-shell-environment \
> > -                 --cc-use-shell-environment \
> > -                 --cxx-use-shell-environment \
> > -                 --ld='${TARGET_PREFIX}g++' \
> > +                 LIBPATH=${STAGING_LIBDIR} \
> > +                 LINKFLAGS='${LDFLAGS}' \
> > +                 CXXFLAGS='${CXXFLAGS}' \
> > +                 TARGET_ARCH=${TARGET_ARCH} \
> >                   --ssl \
> > -                 --use-system-pcre \
> > -                 --use-system-boost \
> > -                 --use-system-tcmalloc \
> > -                 --disable-scripting \
> > +                 --disable-warnings-as-errors \
> > +                 --use-system-pcre \
> > +                 --use-system-zlib \
> > +                 --js-engine=none \
> >                   --nostrip \
> > +                 ${EXTRA_OECONF} \
> >                   mongod mongos"
> >
> > +scons_do_compile() {
> > +        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE}
> ${EXTRA_OESCONS} || \
> > +        die "scons build execution failed."
> > +}
> >
> > +scons_do_install() {
> > +        ${STAGING_BINDIR_NATIVE}/scons install ${EXTRA_OESCONS}|| \
> > +        die "scons install execution failed."
> > +}
> > \ No newline at end of file
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


