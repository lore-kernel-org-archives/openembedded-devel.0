Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5FB65E7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 13:04:23 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id x48so7862193wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 06:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lWwZipdAM+XbshgNeVTjJNb4OOZiUvIb1xEZQQJQNys=;
	b=bGdsz5jqREjznGVmxadeQoCnQf4J1oU9JutZ0yTWwVwGqpDFrfZSNUblxCgBIJaf7z
	Ghy+B920frygHPCbqzvmMORwFWzqqMdgNjXbhAZBuWwevZpHrapcG/LTwYEJAmaJr6l3
	Lpnj8hqWQ5G7q/ec2yBXC8/HXGEnJI3nTMkIunoeFJ52jMv5ESXP+2g9XiKK+bHyvHi7
	GFHQ1Lf59RTOs2Oqo56hF6xXA/9V6bd6j0PSI4IofgSWS/TDJw9jKYemAHkKWyoiGB62
	sIhU3yLh97DOGbiiAq25ApLVGXXdAYBAdXAqgJ1AFXu8eZvf+be0+u4ai5fyxNGK0uj0
	XgNQ==
X-Gm-Message-State: ALoCoQlcLN7UbvDT/uFF3fub7kqhgdM3vuMifz73gxqWixgPjJHLS5PXIESkhGjZVRCm9mZQq5p1
X-Received: by 10.194.103.36 with SMTP id ft4mr1327223wjb.66.1397480663435;
	Mon, 14 Apr 2014 06:04:23 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	lh6sm24966108wjb.27.2014.04.14.06.04.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Apr 2014 06:04:22 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Apr 2014 15:04:18 +0200
Message-Id: <1397480658-10634-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] mongodb: update to 2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Apr 2014 13:04:27 -0000

Also fix build on armv5

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...Make-it-possible-to-disable-the-use-of-v8.patch |  23 ++--
 ...02-Fix-linking-when-scripting-is-disabled.patch |   6 +-
 ...d-mongo-binary-when-scripting-is-disabled.patch |  18 +--
 ...e-os.uname-with-os.getenv-OE_TARGET_ARCH.patch} |  14 +--
 ...ports-atomic-ops-for-armv5-and-up-but-onl.patch | 127 +++++++++++++++++++++
 meta-oe/recipes-support/mongodb/mongodb_git.bb     |   9 +-
 6 files changed, 163 insertions(+), 34 deletions(-)
 rename meta-oe/recipes-support/mongodb/mongodb/{0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch => 0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.patch} (81%)
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-onl.patch

diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch b/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch
index 311ac6c..650389e 100644
--- a/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch
+++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Make-it-possible-to-disable-the-use-of-v8.patch
@@ -1,21 +1,21 @@
-From bffde38f3b3d6285019e38a30c4573326e1dd2ea Mon Sep 17 00:00:00 2001
+From f1bd00e7f54aad6479bc809c27d5cd3c2fb993eb Mon Sep 17 00:00:00 2001
 From: Michael Hudson-Doyle <michael.hudson@linaro.org>
 Date: Fri, 20 Dec 2013 11:10:43 +1300
-Subject: [PATCH 1/3] Make it possible to disable the use of v8.
+Subject: [PATCH 1/5] Make it possible to disable the use of v8.
 
 Currently v8 is always built in, no matter what you pass to scons.
 
 This removes the (useless) --usev8 flag for scons and replaces it with a
 --disable-scripting option instead.
 ---
- SConstruct | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
+ SConstruct | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index fd92fe4..1f14083 100644
+index 3886d1b..6e0ef3b 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -222,7 +222,7 @@ add_option( "asio" , "Use Asynchronous IO (NOT READY YET)" , 0 , True )
+@@ -225,7 +225,7 @@ add_option( "asio" , "Use Asynchronous IO (NOT READY YET)" , 0 , True )
  add_option( "ssl" , "Enable SSL" , 0 , True )
  
  # library choices
@@ -24,7 +24,7 @@ index fd92fe4..1f14083 100644
  add_option( "libc++", "use libc++ (experimental, requires clang)", 0, True )
  
  # mongo feature options
-@@ -439,7 +439,7 @@ static = has_option( "static" )
+@@ -442,7 +442,7 @@ static = has_option( "static" )
  
  noshell = has_option( "noshell" ) 
  
@@ -33,17 +33,18 @@ index fd92fe4..1f14083 100644
  
  asio = has_option( "asio" )
  
-@@ -599,7 +599,9 @@ if has_option( "durableDefaultOn" ):
+@@ -600,7 +600,10 @@ if has_option( "durableDefaultOn" ):
  if has_option( "durableDefaultOff" ):
      env.Append( CPPDEFINES=[ "_DURABLEDEFAULTOFF" ] )
  
--if ( not ( usev8 or justClientLib) ):
+-usev8 = True
 +if disable_scripting or justClientLib:
 +    usev8 = False
 +else:
-     usev8 = True
++    usev8 = True
  
  extraLibPlaces = []
+ 
 -- 
-1.8.4.2
+1.9.0
 
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch b/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch
index d8d5a3b..b4388d8 100644
--- a/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch
+++ b/meta-oe/recipes-support/mongodb/mongodb/0002-Fix-linking-when-scripting-is-disabled.patch
@@ -1,7 +1,7 @@
-From 52d68642205626cad3bac3a53e269c765ccff676 Mon Sep 17 00:00:00 2001
+From 5b22f64a2e2237082d2733698b07147d27b09ad2 Mon Sep 17 00:00:00 2001
 From: Michael Hudson-Doyle <michael.hudson@linaro.org>
 Date: Fri, 20 Dec 2013 12:28:27 +1300
-Subject: [PATCH 2/3] Fix linking when scripting is disabled.
+Subject: [PATCH 2/5] Fix linking when scripting is disabled.
 
 ---
  src/mongo/scripting/engine_none.cpp | 4 ++++
@@ -21,5 +21,5 @@ index f5c7109..9ae9d57 100644
 +    }
  }
 -- 
-1.8.4.2
+1.9.0
 
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch b/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
index 5c314b1..016ac35 100644
--- a/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
+++ b/meta-oe/recipes-support/mongodb/mongodb/0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch
@@ -1,7 +1,7 @@
-From 1f8e10747af3988e8ddee609bea990f622dd746a Mon Sep 17 00:00:00 2001
+From eab4316597a8e9e7bbf845a054564c6daa4a95b7 Mon Sep 17 00:00:00 2001
 From: Michael Hudson-Doyle <michael.hudson@linaro.org>
 Date: Wed, 22 Jan 2014 13:53:10 +1300
-Subject: [PATCH 3/3] * Do not build 'mongo' binary when scripting is disabled
+Subject: [PATCH 3/5] * Do not build 'mongo' binary when scripting is disabled
  * Do not build the jstests when scripting is disabled
 
 ---
@@ -10,10 +10,10 @@ Subject: [PATCH 3/3] * Do not build 'mongo' binary when scripting is disabled
  2 files changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index 1f14083..a69cf0a 100644
+index 6e0ef3b..c84a669 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -437,10 +437,13 @@ else:
+@@ -440,10 +440,13 @@ else:
  
  static = has_option( "static" )
  
@@ -29,16 +29,16 @@ index 1f14083..a69cf0a 100644
  asio = has_option( "asio" )
  
  usePCH = has_option( "usePCH" )
-@@ -1671,6 +1674,7 @@ Export("get_option")
+@@ -1662,6 +1665,7 @@ Export("get_option")
  Export("has_option use_system_version_of_library")
- Export("installSetup mongoCodeVersion")
+ Export("mongoCodeVersion")
  Export("usev8")
 +Export("disable_scripting")
  Export("darwin windows solaris linux freebsd nix")
  Export('module_sconscripts')
  Export("debugBuild optBuild")
 diff --git a/src/mongo/SConscript b/src/mongo/SConscript
-index d84267e..dc0ca3a 100644
+index 58f8406..b4379e7 100644
 --- a/src/mongo/SConscript
 +++ b/src/mongo/SConscript
 @@ -6,6 +6,7 @@ import os
@@ -49,7 +49,7 @@ index d84267e..dc0ca3a 100644
  Import("env")
  Import("shellEnv")
  Import("testEnv")
-@@ -1022,7 +1023,8 @@ test = testEnv.Install(
+@@ -1043,7 +1044,8 @@ test = testEnv.Install(
                      [ f for f in Glob("dbtests/*.cpp")
                        if not str(f).endswith('framework.cpp') and
                           not str(f).endswith('framework_options.cpp') and
@@ -60,5 +60,5 @@ index d84267e..dc0ca3a 100644
                         "mutable_bson_test_utils",
                         "mongocommon",
 -- 
-1.8.4.2
+1.9.0
 
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch b/meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.patch
similarity index 81%
rename from meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch
rename to meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.patch
index 547c3bd..ade7ec0 100644
--- a/meta-oe/recipes-support/mongodb/mongodb/0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch
+++ b/meta-oe/recipes-support/mongodb/mongodb/0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.patch
@@ -1,7 +1,7 @@
-From ef482650fb6d990e4953104d7141d9a0fa4c872f Mon Sep 17 00:00:00 2001
+From d02f33d860f2d11f71e9056782a2e75603d6ec25 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 4 Feb 2014 10:56:35 +0100
-Subject: [PATCH] replace os.uname with os.getenv(OE_TARGET_ARCH)
+Subject: [PATCH 4/5] replace os.uname with os.getenv(OE_TARGET_ARCH)
 
 This fixes crosscompilation
 
@@ -12,10 +12,10 @@ Upstream-Status: Inappropiate [OE specific]
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index 4f26be7..a353323 100644
+index c84a669..05e2ea0 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -265,9 +265,9 @@ add_option( "pch" , "use precompiled headers to speed up the build (experimental
+@@ -257,9 +257,9 @@ add_option( "pch" , "use precompiled headers to speed up the build (experimental
  add_option( "distcc" , "use distcc for distributing builds" , 0 , False )
  
  # debugging/profiling help
@@ -27,7 +27,7 @@ index 4f26be7..a353323 100644
      defaultAllocator = 'tcmalloc'
  else:
      defaultAllocator = 'system'
-@@ -673,7 +673,7 @@ if has_option( "full" ):
+@@ -633,7 +633,7 @@ if has_option( "extralib" ):
  # ---- other build setup -----
  
  if "uname" in dir(os):
@@ -36,7 +36,7 @@ index 4f26be7..a353323 100644
  else:
      processor = "i386"
  
-@@ -702,7 +702,7 @@ elif linux:
+@@ -662,7 +662,7 @@ elif linux:
  
      env.Append( LIBS=['m'] )
  
@@ -46,5 +46,5 @@ index 4f26be7..a353323 100644
          nixLibPrefix = "lib64"
          env.Append( EXTRALIBPATH=["/usr/lib64" , "/lib64" ] )
 -- 
-1.8.4.2
+1.9.0
 
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-onl.patch b/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-onl.patch
new file mode 100644
index 0000000..490d564
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-onl.patch
@@ -0,0 +1,127 @@
+From e31f85e6915d4bf6ed76c5da71c235525fa4ecc3 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Mon, 14 Apr 2014 10:29:42 +0200
+Subject: [PATCH 5/5] GCC 4.7+ supports atomic ops for armv5 and up, but only
+ exports the functions for armv6 and up. This patch works around the linker
+ problems associated with that.
+
+Forward ported from http://pkgs.fedoraproject.org/cgit/mongodb.git/tree/mongodb-2.4.5-atomics.patch
+
+Upstream-status: pending
+---
+ src/mongo/bson/util/atomic_int.h                   | 26 ++++++++++++
+ src/mongo/platform/atomic_intrinsics_gcc_generic.h | 47 ++++++++++++++++++++++
+ 2 files changed, 73 insertions(+)
+
+diff --git a/src/mongo/bson/util/atomic_int.h b/src/mongo/bson/util/atomic_int.h
+index 0b85363..ed02c23 100644
+--- a/src/mongo/bson/util/atomic_int.h
++++ b/src/mongo/bson/util/atomic_int.h
+@@ -24,6 +24,10 @@
+ 
+ #include "mongo/platform/compiler.h"
+ 
++#define GCC_VERSION (__GNUC__ * 10000                 \
++                     + __GNUC_MINOR__ * 100           \
++                     + __GNUC_PATCHLEVEL__)
++
+ namespace mongo {
+ 
+     /**
+@@ -72,6 +76,28 @@ namespace mongo {
+         InterlockedAdd((volatile long *)&x,by);
+     }
+ # endif
++#elif defined(GCC_VERSION) && GCC_VERSION >= 40700
++// in GCC version >= 4.7.0 we can use the built-in atomic operations
++
++    inline void AtomicUInt::set(unsigned newX) {
++        __atomic_store_n (&x, newX, __ATOMIC_SEQ_CST);
++    }
++    AtomicUInt AtomicUInt::operator++() {    // ++prefix
++        return __atomic_add_fetch(&x, 1, __ATOMIC_SEQ_CST);
++    }
++    AtomicUInt AtomicUInt::operator++(int) { // postfix++
++        return __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST);
++    }
++    AtomicUInt AtomicUInt::operator--() {    // --prefix
++        return __atomic_add_fetch(&x, -1, __ATOMIC_SEQ_CST);
++    }
++    AtomicUInt AtomicUInt::operator--(int) { // postfix--
++        return __atomic_fetch_add(&x, -1, __ATOMIC_SEQ_CST);
++    }
++    void AtomicUInt::signedAdd(int by) {
++        __atomic_fetch_add(&x, by, __ATOMIC_SEQ_CST);
++    }
++
+ #elif defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4)
+     // this is in GCC >= 4.1
+     inline void AtomicUInt::set(unsigned newX) { __sync_synchronize(); x = newX; }
+diff --git a/src/mongo/platform/atomic_intrinsics_gcc_generic.h b/src/mongo/platform/atomic_intrinsics_gcc_generic.h
+index 64a2499..b7cc176 100644
+--- a/src/mongo/platform/atomic_intrinsics_gcc_generic.h
++++ b/src/mongo/platform/atomic_intrinsics_gcc_generic.h
+@@ -22,8 +22,53 @@
+ 
+ #include <boost/utility.hpp>
+ 
++#define GCC_VERSION (__GNUC__ * 10000                 \
++                     + __GNUC_MINOR__ * 100           \
++                     + __GNUC_PATCHLEVEL__)
++
+ namespace mongo {
+ 
++// If GCC version >= 4.7.0, we can use the built-in atomic operations
++#if defined(GCC_VERSION) && GCC_VERSION >= 40700
++
++    /**
++     * Instantiation of AtomicIntrinsics<>.
++     */
++    template <typename T>
++    class AtomicIntrinsics {
++    public:
++
++        static T compareAndSwap(volatile T* dest, T expected, T newValue) {
++            return __atomic_compare_exchange_n (dest, &expected, newValue, 0, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
++        }
++
++        static T swap(volatile T* dest, T newValue) {
++            return __atomic_exchange_n (dest, newValue, __ATOMIC_SEQ_CST);
++        }
++
++        static T load(volatile const T* value) {
++            return __atomic_load_n (value, __ATOMIC_SEQ_CST);
++        }
++
++        static T loadRelaxed(volatile const T* value) {
++            return *value;
++        }
++
++        static void store(volatile T* dest, T newValue) {
++            __atomic_store_n (dest, newValue, __ATOMIC_SEQ_CST);
++        }
++
++        static T fetchAndAdd(volatile T* dest, T increment) {
++            return __atomic_fetch_add (dest, increment, __ATOMIC_SEQ_CST);
++        }
++
++    private:
++        AtomicIntrinsics();
++        ~AtomicIntrinsics();
++    };
++
++#else // GCC version < 4.7, so we must use legacy (platform-specific) atomic operations
++
+     /**
+      * Instantiation of AtomicIntrinsics<> for all word types T.
+      */
+@@ -67,4 +112,6 @@ namespace mongo {
+         ~AtomicIntrinsics();
+     };
+ 
++#endif // GCC_VERSION >= 40700
++
+ }  // namespace mongo
+-- 
+1.9.0
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index f0fe240..d990da8 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -9,13 +9,14 @@ DEPENDS_append_x86-64 = " gperftools"
 
 inherit scons
 
-PV = "2.5.5+git${SRCPV}"
-SRCREV = "588dc81b0822ebb46f80e152b94527a882e6ea5e"
-SRC_URI = "git://github.com/mongodb/mongo.git \
+PV = "2.6.0+git${SRCPV}"
+SRCREV = "be1905c24c7e5ea258e537fbf0d2c502c4fc6de2"
+SRC_URI = "git://github.com/mongodb/mongo.git;branch=v2.6 \
            file://0001-Make-it-possible-to-disable-the-use-of-v8.patch \
            file://0002-Fix-linking-when-scripting-is-disabled.patch \
            file://0003-Do-not-build-mongo-binary-when-scripting-is-disabled.patch \
-           file://0001-replace-os.uname-with-os.getenv-TARGET_ARCH.patch \
+           file://0004-replace-os.uname-with-os.getenv-OE_TARGET_ARCH.patch \
+           file://0005-GCC-4.7-supports-atomic-ops-for-armv5-and-up-but-onl.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.9.0


