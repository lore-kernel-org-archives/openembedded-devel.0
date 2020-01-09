Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 844E07FE82
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 10:36:59 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d16so6781651wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7w3In73slDbG7nyiv+YEDKNKDXn+Z2ihwzUDkdCydb8=;
	b=ZjQtCYlBxD9MlYu8zpYfm3QXalBemwIrEAcgG9okJp2t4JN0xdoETgaMH5fBzUvdNT
	P3w/bfecPwS8Hqz8CdojLjthiDHIzoE3N9q2fWpF1MedWfZNy+n4gk/UpJcvTgxuSotX
	8Jo/KRe0BK+7KomTiChDZ0PIQMp5mu53EHlM55x+iqua48EUGkojWd1DYOlrBbOoegmp
	4BqhdBCqR9iU3GnA4LTW53fq76QcwwdcproplLZq+mpRIsw1onHpmUDWuFEkrQykbGwe
	juJ7uOsmQ6/poBt8V6elHytxuJIfnrpLNziyAi9eX+xFEEfTTE/TSzRbu2BK1PEHmXOy
	jU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7w3In73slDbG7nyiv+YEDKNKDXn+Z2ihwzUDkdCydb8=;
	b=sGTSG+xeOVoZjtw+r2HbF07hIFbaZd7ZRzxX6Yl5N1JnyXIXiUh3soIaC29zGcWVHb
	kgRG+0hFs1RjMkdRqzGiVfZ7YXo+2tA0iuXTeXVdUBSSuT/h2bXaGve04D2rxcOhhuer
	wo+2jo32kvtNPeTyJ2T7LJqFLGClDzbkMOfwoKxiwxNb6PEkS5rifp9LWcB0QmqcINv5
	EHK/bJ18jzAnlQaVg+1RQIzbZsibpFuy011dwO0+emgddPFrpmCVi8FBd4CIbytXz/+M
	Cfrg4XAQgkzWgfup/3QYr+6wNFvnDsxMOhwixWpgivTWomFXy3CEHQVCIjJ29K/Crz+8
	5KMA==
X-Gm-Message-State: APjAAAUebWp8FM4PcfHA/r2vHmxayu6f5yUuOqyvthndHYlUmehppKMU
	HbobMxSXw8kxoWR0tWqNPQSgBS/8Nws=
X-Google-Smtp-Source: APXvYqyzgsWZOt443JkvI0VuD4SdCFXwV5xeV8glKFOax2q8BI1RWJQRxu+T4c1D6Wv8UCjm9cHn6Q==
X-Received: by 2002:a5d:488c:: with SMTP id g12mr10029162wrq.67.1578566219666; 
	Thu, 09 Jan 2020 02:36:59 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d32:c012:51ed:b4fa:d66:b069])
	by smtp.gmail.com with ESMTPSA id
	v3sm7766186wru.32.2020.01.09.02.36.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 02:36:58 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 11:36:51 +0100
Message-Id: <20200109103651.16788-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] websocketpp: add various upstream accepted and proposed patches to fix various issues, including:
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
X-List-Received-Date: Thu, 09 Jan 2020 10:37:01 -0000

- build failure with boost 1.71
- bad installation of header files correct version on some OSes.
- fix version minor number
- fix Scons script not being Python3 ready
- build examples and tests only if ptest is enabled in DISTRO_FEATURES
- do not depend on websocketpp from -dev package, because this is an header only dev package for now

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../websocketpp/websocketpp-0.8.1/771.patch   |  22 +++
 .../websocketpp/websocketpp-0.8.1/842.patch   |  30 ++++
 .../websocketpp/websocketpp-0.8.1/855.patch   |  23 +++
 .../websocketpp/websocketpp-0.8.1/857.patch   | 132 ++++++++++++++++++
 .../websocketpp/websocketpp_0.8.1.bb          |  15 +-
 5 files changed, 221 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
new file mode 100644
index 000000000..bc65efb7d
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
@@ -0,0 +1,22 @@
+From 4bccfb04a264704ec9b80ba332ee1cf113ce7f1b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Wolfgang=20St=C3=B6ggl?= <c72578@yahoo.de>
+Date: Thu, 1 Nov 2018 20:58:10 +0100
+Subject: [PATCH] Update version number in CMakeLists.txt to 0.8.1
+
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2786aba9..2d13117b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -24,7 +24,7 @@ endif ()
+ ############ Project name and version
+ set (WEBSOCKETPP_MAJOR_VERSION 0)
+ set (WEBSOCKETPP_MINOR_VERSION 8)
+-set (WEBSOCKETPP_PATCH_VERSION 0)
++set (WEBSOCKETPP_PATCH_VERSION 1)
+ set (WEBSOCKETPP_VERSION ${WEBSOCKETPP_MAJOR_VERSION}.${WEBSOCKETPP_MINOR_VERSION}.${WEBSOCKETPP_PATCH_VERSION})
+ 
+ if(POLICY CMP0048)
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
new file mode 100644
index 000000000..c3651e94a
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
@@ -0,0 +1,30 @@
+From 7f7e2be01b4fa6580ce27f668e61adf37853ad67 Mon Sep 17 00:00:00 2001
+From: Schrijvers Luc <begasus@gmail.com>
+Date: Wed, 18 Sep 2019 11:35:43 +0200
+Subject: [PATCH] Fix "include" directory installation. the variable
+ INSTALL_INCLUDE_DIR already exists, and defaults to include if not
+ specificied otherwise. Using it allows people to customize the installation
+ from outside, fixing issues with other OS like Haiku
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
+---
+ cmake/CMakeHelpers.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/CMakeHelpers.cmake b/cmake/CMakeHelpers.cmake
+index 1478f4b..f603632 100644
+--- a/cmake/CMakeHelpers.cmake
++++ b/cmake/CMakeHelpers.cmake
+@@ -80,7 +80,7 @@ macro (final_target)
+     endif ()
+ 
+     install (DIRECTORY ${CMAKE_SOURCE_DIR}/${TARGET_NAME}
+-             DESTINATION include/
++             DESTINATION ${INSTALL_INCLUDE_DIR}/
+              FILES_MATCHING PATTERN "*.hpp*")
+ endmacro ()
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
new file mode 100644
index 000000000..a1ee627b3
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
@@ -0,0 +1,23 @@
+From 3590d77bb9753fbbf076028e2395182ced6466ba Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Wed, 8 Jan 2020 17:59:48 +0100
+Subject: [PATCH] Fix cmake find boost with version >= 1.71
+
+For some reasons "system;thread;random;unit_test_framework" was seen as a single module, because of the quotes.
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2d13117b..9a46bc10 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -213,7 +213,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+     set (Boost_USE_MULTITHREADED TRUE)
+     set (Boost_ADDITIONAL_VERSIONS "1.39.0" "1.40.0" "1.41.0" "1.42.0" "1.43.0" "1.44.0" "1.46.1") # todo: someone who knows better spesify these!
+ 
+-    find_package (Boost 1.39.0 COMPONENTS "${WEBSOCKETPP_BOOST_LIBS}")
++    find_package (Boost 1.39.0 COMPONENTS ${WEBSOCKETPP_BOOST_LIBS})
+ 
+     if (Boost_FOUND)
+         # Boost is a project wide global dependency.
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch
new file mode 100644
index 000000000..f221cd699
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/857.patch
@@ -0,0 +1,132 @@
+From 931a55347a322f38eb82d5f387b2924e6c7a1746 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Thu, 9 Jan 2020 10:07:20 +0100
+Subject: [PATCH] Update SConstruct with new Python3 syntax: - new raise
+ keyword syntax - has_key deprecated method is now removed - commands
+ deprecated library is replaced by subprocess - print function fixes
+
+This should fix FTBFS against new scons 3.1.2
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=947584
+---
+ SConstruct | 45 +++++++++++++++++++++++----------------------
+ 1 file changed, 23 insertions(+), 22 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index ae3df10b..9d1c8914 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1,18 +1,19 @@
+-import os, sys, commands
++import os, sys
++from subprocess import check_output
+ env = Environment(ENV = os.environ)
+ 
+ # figure out a better way to configure this
+-if os.environ.has_key('CXX'):
++if 'CXX' in os.environ:
+     env['CXX'] = os.environ['CXX']
+ 
+-if os.environ.has_key('DEBUG'):
++if 'DEBUG' in os.environ:
+     env['DEBUG'] = os.environ['DEBUG']
+ 
+-if os.environ.has_key('CXXFLAGS'):
++if 'CXXFLAGS' in os.environ:
+     #env['CXXFLAGS'] = os.environ['CXXFLAGS']
+     env.Append(CXXFLAGS = os.environ['CXXFLAGS'])
+ 
+-if os.environ.has_key('LINKFLAGS'):
++if 'LINKFLAGS' in os.environ:
+     #env['LDFLAGS'] = os.environ['LDFLAGS']
+     env.Append(LINKFLAGS = os.environ['LINKFLAGS'])
+ 
+@@ -22,24 +23,24 @@ if os.environ.has_key('LINKFLAGS'):
+ ## or set BOOST_INCLUDES and BOOST_LIBS if Boost comes with your OS distro e.g. and
+ ## needs BOOST_INCLUDES=/usr/include/boost and BOOST_LIBS=/usr/lib like Ubuntu.
+ ##
+-if os.environ.has_key('BOOSTROOT'):
++if 'BOOSTROOT' in os.environ:
+     os.environ['BOOST_ROOT'] = os.environ['BOOSTROOT']
+ 
+-if os.environ.has_key('BOOST_ROOT'):
++if 'BOOST_ROOT' in os.environ:
+    env['BOOST_INCLUDES'] = os.environ['BOOST_ROOT']
+    env['BOOST_LIBS'] = os.path.join(os.environ['BOOST_ROOT'], 'stage', 'lib')
+-elif os.environ.has_key('BOOST_INCLUDES') and os.environ.has_key('BOOST_LIBS'):
++elif 'BOOST_INCLUDES' in os.environ and 'BOOST_LIBS' in os.environ:
+    env['BOOST_INCLUDES'] = os.environ['BOOST_INCLUDES']
+    env['BOOST_LIBS'] = os.environ['BOOST_LIBS']
+ else:
+-   raise SCons.Errors.UserError, "Neither BOOST_ROOT, nor BOOST_INCLUDES + BOOST_LIBS was set!"
++   raise SCons.Errors.UserError("Neither BOOST_ROOT, nor BOOST_INCLUDES + BOOST_LIBS were set!")
+ 
+ ## Custom OpenSSL
+-if os.environ.has_key('OPENSSL_PATH'):
++if 'OPENSSL_PATH' in os.environ:
+    env.Append(CPPPATH = os.path.join(os.environ['OPENSSL_PATH'], 'include'))
+    env.Append(LIBPATH = os.environ['OPENSSL_PATH'])
+ 
+-if os.environ.has_key('WSPP_ENABLE_CPP11'):
++if 'WSPP_ENABLE_CPP11' in os.environ:
+    env['WSPP_ENABLE_CPP11'] = True
+ else:
+    env['WSPP_ENABLE_CPP11'] = False
+@@ -76,7 +77,7 @@ if env['PLATFORM'].startswith('win'):
+    env['CCFLAGS'] = '%s /EHsc /GR /GS- /MD /nologo %s %s' % (warn_flags, arch_flags, opt_flags)
+    env['LINKFLAGS'] = '/INCREMENTAL:NO /MANIFEST /NOLOGO /OPT:REF /OPT:ICF /MACHINE:X86'
+ elif env['PLATFORM'] == 'posix':
+-   if env.has_key('DEBUG'):
++   if 'DEBUG' in env:
+       env.Append(CCFLAGS = ['-g', '-O0'])
+    else:
+       env.Append(CPPDEFINES = ['NDEBUG'])
+@@ -84,9 +85,9 @@ elif env['PLATFORM'] == 'posix':
+    env.Append(CCFLAGS = ['-Wall'])
+    #env['LINKFLAGS'] = ''
+ elif env['PLATFORM'] == 'darwin':
+-   if not os.environ.has_key('CXX'):
++   if not 'CXX' in os.environ:
+       env['CXX'] = "clang++"
+-   if env.has_key('DEBUG'):
++   if 'DEBUG' in env:
+       env.Append(CCFLAGS = ['-g', '-O0'])
+    else:
+       env.Append(CPPDEFINES = ['NDEBUG'])
+@@ -157,29 +158,29 @@ env_cpp11 = env.Clone ()
+ 
+ if env_cpp11['CXX'].startswith('g++'):
+    # TODO: check g++ version
+-   GCC_VERSION = commands.getoutput(env_cpp11['CXX'] + ' -dumpversion')
++   GCC_VERSION = check_output([env_cpp11['CXX'], '-dumpversion'])
+ 
+-   if GCC_VERSION > "4.4.0":
+-      print "C++11 build environment partially enabled"
++   if GCC_VERSION.decode('utf-8') > "4.4.0":
++      print("C++11 build environment partially enabled")
+       env_cpp11.Append(WSPP_CPP11_ENABLED = "true",CXXFLAGS = ['-std=c++0x'],TOOLSET = ['g++'],CPPDEFINES = ['_WEBSOCKETPP_CPP11_STL_'])
+    else:
+-      print "C++11 build environment is not supported on this version of G++"
++      print("C++11 build environment is not supported on this version of G++")
+ elif env_cpp11['CXX'].startswith('clang++'):
+-   print "C++11 build environment enabled"
++   print("C++11 build environment enabled")
+    env.Append(CXXFLANGS = ['-stdlib=libc++'],LINKFLAGS=['-stdlib=libc++'])
+    env_cpp11.Append(WSPP_CPP11_ENABLED = "true",CXXFLAGS = ['-std=c++0x','-stdlib=libc++'],LINKFLAGS = ['-stdlib=libc++'],TOOLSET = ['clang++'],CPPDEFINES = ['_WEBSOCKETPP_CPP11_STL_'])
+ 
+    # look for optional second boostroot compiled with clang's libc++ STL library
+    # this prevents warnings/errors when linking code built with two different
+    # incompatible STL libraries.
+-   if os.environ.has_key('BOOST_ROOT_CPP11'):
++   if 'BOOST_ROOT_CPP11' in os.environ:
+       env_cpp11['BOOST_INCLUDES'] = os.environ['BOOST_ROOT_CPP11']
+       env_cpp11['BOOST_LIBS'] = os.path.join(os.environ['BOOST_ROOT_CPP11'], 'stage', 'lib')
+-   elif os.environ.has_key('BOOST_INCLUDES_CPP11') and os.environ.has_key('BOOST_LIBS_CPP11'):
++   elif 'BOOST_INCLUDES_CPP11' in os.environ and 'BOOST_LIBS_CPP11' in os.environ:
+       env_cpp11['BOOST_INCLUDES'] = os.environ['BOOST_INCLUDES_CPP11']
+       env_cpp11['BOOST_LIBS'] = os.environ['BOOST_LIBS_CPP11']
+ else:
+-   print "C++11 build environment disabled"
++   print("C++11 build environment disabled")
+ 
+ # if the build system is known to allow the isystem modifier for library include
+ # values then use it for the boost libraries. Otherwise just add them to the
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 05f14d2f4..8a2a3e1b8 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
@@ -3,14 +3,27 @@ SECTION = "libs/network"
 HOMEPAGE = "https://github.com/zaphoyd/websocketpp"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=4d168d763c111f4ffc62249870e4e0ea"
-DEPENDS = "openssl boost zlib"
+
+DEPENDS = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'openssl boost zlib', '', d)} "
 
 SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
            file://0001-Replace-make_shared-with-new-in-some-cases.patch \
            file://0002-Fix-missed-entries-fix-testing.patch \
            file://0001-cmake-Use-GNUInstallDirs.patch \
+           file://842.patch \
+           file://771.patch \
+           file://855.patch \
+           file://857.patch \
           "
 
+EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON', '', d)} "
+
+# this is an header only library, do not depend on the main package
+RDEPENDS_${PN}-dev = ""
+
+# to add this package to an SDK, since it isn't a reverse-dependency of anything, just use something like this:
+# TOOLCHAIN_TARGET_TASK_append = " websocketpp-dev"
+
 # tag 0.8.1
 SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
 
-- 
2.17.1


