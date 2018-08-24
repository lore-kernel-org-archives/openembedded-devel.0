Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id C6C0F79620
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 20:35:13 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id s13-v6so4887814pfi.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=L3DNn4WFhYv35QPMNioQtz2Gq+Ah5ovJODMay7fQHW4=;
	b=hlmi+hhkbWGZ09+aa2LSX2bTAgQhB/0Q3W/1D3oDOolyD+EzrXlE+JXyRnA7V9qyrq
	BOcRR0ehqjF51gEM8g1eTXdYfbzZYRrTJdAlWfGAYIzZ9IKCRkQmow025pdGbZNs8nw/
	NjIF7cyACcmhvVvF0HOmJLoO8PhbBYoTL+fDDiGGNQSHjB+MCG7UWEEUg1LhsuM7hh/E
	jOySL3iv1aGG/7uA2K/Mtkvh52fZTf4J99knmrAC2D8RHIgZBvu7QxcoUSMHkerLlsBc
	bx6ilatCB2pqEyJboBbLk7AHqyywL+IhVuHrWWau2IcmIVps/j+Rv8ITxBVTfEIi/Wg4
	bdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L3DNn4WFhYv35QPMNioQtz2Gq+Ah5ovJODMay7fQHW4=;
	b=BtcY5oDle86z0c7YLmtVyPjGWEI8VMwmvDF+oEYTUePTpB0fAD31AwV4GVZaDmLM2h
	HY1CJu6uydm5bMZTkRAoRC3tenSiBVL+GFCEXBeWB6CQ+ZQYN2thAXAMXOe/dKxpAI6X
	5LTJE+4g4YzMEIeuREQNfcmqVkHtLvEK56ZniI0hj8r3zNZaKD1BAKL/KK/Rr8m54MBD
	nqqWvOo7GvkwRmVaUskFt+SlIqHG1PDElhMBe81sPPGcuulidK4B8bjNBQydGc7xsZgh
	mzSywi70cifI6s20Uhp5+IZmVZmbXGn40/v/BIZsmawRTXW2BKP0/t9ARoSIFfxV73AU
	HZ+Q==
X-Gm-Message-State: APzg51Caypa2mT1bsWqYMPWl4eznSQpMgaOKNUH54/R+mz32oFxu46C+
	N79FiDqx2IBIy3m9B0oecBF1ojqn
X-Google-Smtp-Source: ANB0VdbF3o115RyxSUcno4rfd3wX0rEyBrPI1ZN4vU4EGsbHgIGg7hdjipmcqOWX3+FEyE0ciESZnA==
X-Received: by 2002:a63:4663:: with SMTP id
	v35-v6mr3088475pgk.178.1535142914324; 
	Fri, 24 Aug 2018 13:35:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	b14-v6sm15241540pfc.178.2018.08.24.13.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Aug 2018 13:35:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Aug 2018 13:35:04 -0700
Message-Id: <20180824203504.699-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180824203504.699-1-raj.khem@gmail.com>
References: <20180824203504.699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mongodb: Upgrade to 4.0.1 release
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
X-List-Received-Date: Fri, 24 Aug 2018 20:35:14 -0000

Drop/adapt patches as some of them are not needed anymore
Add patches to support musl especially thread stack and resolver
functionality

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...hLib20U1-Check-for-__DEFINED_wchar_t.patch | 17 +++----
 ...upport-deprecated-resolver-functions.patch | 33 ++++++++++++++
 ...e-build-settings-from-environment-va.patch | 12 ++---
 ...-control-use-of-gnu_get_libc_version.patch | 44 +++++++------------
 ...001-Use-long-long-instead-of-int64_t.patch |  4 +-
 ...Use-strerror_r-only-on-glibc-systems.patch | 26 -----------
 .../0002-Fix-default-stack-size-to-256K.patch | 39 ++++++++++++++++
 ...missing-dependenncy-on-local_shardin.patch | 25 -----------
 ...itionalize-glibc-specific-strerror_r.patch | 39 ----------------
 ...4-wiredtiger-Disable-strtouq-on-musl.patch | 13 +++---
 .../mongodb/mongodb/arm64-support.patch       |  6 +--
 .../disable-hw-crc32-on-arm64-s390x.patch     |  6 +--
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb    | 19 ++++----
 13 files changed, 125 insertions(+), 158 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
 delete mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
 create mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
 delete mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
 delete mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
index 5da34480e7..4d7ac3aa56 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
@@ -18,19 +18,16 @@ Upstream-Status: Pending
  src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h b/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
-index 2b3f76db86..cc80305775 100755
---- a/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
-+++ b/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
-@@ -42,7 +42,7 @@
- #include <ctype.h>
+Index: git/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
+===================================================================
+--- git.orig/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
++++ git/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
+@@ -43,7 +43,7 @@
  
+ #if 0 // MongoDB Modification -- just `#include <stddef.h>`
  // Fix system header issue on Sun solaris and define required type by ourselves
 -#if !defined(_WCHAR_T) && !defined(_WCHAR_T_DEFINED) && !defined(__QNX__)
 +#if !defined(_WCHAR_T) && !defined(_WCHAR_T_DEFINED) && !defined(__QNX__) && !defined(__DEFINED_wchar_t)
  typedef int   wchar_t;
  #endif
- 
--- 
-2.14.1
-
+ #else
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
new file mode 100644
index 0000000000..070411ab9f
--- /dev/null
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
@@ -0,0 +1,33 @@
+From 5994023a03634dfc0318976c293e7391fe6aa060 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 24 Aug 2018 12:56:22 -0700
+Subject: [PATCH 1/2] Support deprecated resolver functions
+
+Needed for  musl libc
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/util/dns_query_posix-impl.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/mongo/util/dns_query_posix-impl.h b/src/mongo/util/dns_query_posix-impl.h
+index d19958010c..bbca3309ed 100644
+--- a/src/mongo/util/dns_query_posix-impl.h
++++ b/src/mongo/util/dns_query_posix-impl.h
+@@ -53,6 +53,12 @@
+ 
+ #include <boost/noncopyable.hpp>
+ 
++#ifndef res_ninit
++#define res_nclose(arg)
++#define res_ninit(arg)    res_init()
++#define res_nsearch(sta, nam, clas, typ, ans, alen)  res_search(nam, clas, typ, ans, alen)
++#endif
++
+ namespace mongo {
+ namespace dns {
+ // The anonymous namespace is safe, in this header, as it is not really a header.  It is only used
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
index aa01e954f7..a6d721ac54 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
@@ -13,7 +13,7 @@ Index: git/SConstruct
 ===================================================================
 --- git.orig/SConstruct
 +++ git/SConstruct
-@@ -548,6 +548,7 @@ def variable_arch_converter(val):
+@@ -564,6 +564,7 @@ def variable_arch_converter(val):
          'amd64':  'x86_64',
          'emt64':   'x86_64',
          'x86':    'i386',
@@ -21,7 +21,7 @@ Index: git/SConstruct
      }
      val = val.lower()
  
-@@ -627,7 +628,8 @@ env_vars.Add(
+@@ -652,7 +653,8 @@ env_vars.Add(
  )
  
  env_vars.Add('CC',
@@ -31,7 +31,7 @@ Index: git/SConstruct
  
  env_vars.Add('CCFLAGS',
      help='Sets flags for the C and C++ compiler',
-@@ -647,7 +649,8 @@ env_vars.Add('CPPPATH',
+@@ -672,7 +674,8 @@ env_vars.Add('CPPPATH',
      converter=variable_shlex_converter)
  
  env_vars.Add('CXX',
@@ -41,19 +41,19 @@ Index: git/SConstruct
  
  env_vars.Add('CXXFLAGS',
      help='Sets flags for the C++ compiler',
-@@ -895,6 +898,7 @@ envDict = dict(BUILD_ROOT=buildDir,
+@@ -961,6 +964,7 @@ envDict = dict(BUILD_ROOT=buildDir,
                 )
  
  env = Environment(variables=env_vars, **envDict)
 +env.PrependENVPath('PATH', os.getenv('PATH'))
  del envDict
  
- env.AddMethod(env_os_is_wrapper, 'TargetOSIs')
+ env.AddMethod(mongo_platform.env_os_is_wrapper, 'TargetOSIs')
 Index: git/src/mongo/util/SConscript
 ===================================================================
 --- git.orig/src/mongo/util/SConscript
 +++ git/src/mongo/util/SConscript
-@@ -274,6 +274,8 @@ if env['MONGO_ALLOCATOR'] == 'tcmalloc':
+@@ -329,6 +329,8 @@ if env['MONGO_ALLOCATOR'] == 'tcmalloc':
                  'MONGO_HAVE_GPERFTOOLS_SIZE_CLASS_STATS'
              ]
          )
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
index f8c419d8a3..c17ebf1e7e 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
@@ -9,34 +9,25 @@ Upstream-Status: Pending
  src/mongo/util/processinfo_linux.cpp | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/src/mongo/util/processinfo_linux.cpp b/src/mongo/util/processinfo_linux.cpp
-index 910015215e..bf8c1ffd15 100644
---- a/src/mongo/util/processinfo_linux.cpp
-+++ b/src/mongo/util/processinfo_linux.cpp
-@@ -40,7 +40,7 @@
- #include <sys/mman.h>
- #include <sys/utsname.h>
+Index: git/src/mongo/util/processinfo_linux.cpp
+===================================================================
+--- git.orig/src/mongo/util/processinfo_linux.cpp
++++ git/src/mongo/util/processinfo_linux.cpp
+@@ -44,10 +44,10 @@
  #include <unistd.h>
--#ifdef __UCLIBC__
-+#ifndef __GLIBC__
- #include <features.h>
- #else
+ #ifdef __BIONIC__
+ #include <android/api-level.h>
+-#elif __UCLIBC__
+-#include <features.h>
+-#else
++#elif defined(__GLIBC__) && !defined(__UCLIBC__)
  #include <gnu/libc-version.h>
-@@ -451,11 +451,13 @@ double ProcessInfo::getSystemMemoryPressurePercentage() {
- }
- 
- void ProcessInfo::getExtraInfo(BSONObjBuilder& info) {
-+#if defined(__GLIBC__)
-     LinuxProc p(_pid);
-     if (p._maj_flt <= std::numeric_limits<long long>::max())
-         info.appendNumber("page_faults", static_cast<long long>(p._maj_flt));
-     else
-         info.appendNumber("page_faults", static_cast<double>(p._maj_flt));
-+#endif
- }
++#else
++#include <features.h>
+ #endif
  
- /**
-@@ -491,7 +493,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() {
+ #include <boost/filesystem.hpp>
+@@ -503,7 +503,7 @@ void ProcessInfo::SystemInfo::collectSys
      stringstream ss;
      ss << "uClibc-" << __UCLIBC_MAJOR__ << "." << __UCLIBC_MINOR__ << "." << __UCLIBC_SUBLEVEL__;
      bExtra.append("libcVersion", ss.str());
@@ -45,6 +36,3 @@ index 910015215e..bf8c1ffd15 100644
      bExtra.append("libcVersion", gnu_get_libc_version());
  #endif
      if (!verSig.empty())
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
index 389b302c3c..99edad3c4b 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
@@ -44,7 +44,7 @@ Index: git/src/mongo/util/procparser.cpp
  
              if (!parseNumberFromString(stringValue, &value).isOK()) {
                  value = 0;
-@@ -426,7 +426,7 @@ Status parseProcDiskStats(const std::vec
+@@ -522,7 +522,7 @@ Status parseProcDiskStats(const std::vec
                            StringData data,
                            BSONObjBuilder* builder) {
      bool foundKeys = false;
@@ -53,7 +53,7 @@ Index: git/src/mongo/util/procparser.cpp
      stats.reserve(kDiskFieldCount);
  
      using string_split_iterator = boost::split_iterator<StringData::const_iterator>;
-@@ -501,7 +501,7 @@ Status parseProcDiskStats(const std::vec
+@@ -597,7 +597,7 @@ Status parseProcDiskStats(const std::vec
  
                  StringData stringValue((*partIt).begin(), (*partIt).end());
  
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
deleted file mode 100644
index 0334d994e4..0000000000
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a4dfc92ff342e59596ab64267a8d4f22f173c23b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 2 Sep 2017 12:40:41 -0700
-Subject: [PATCH 1/4] Use strerror_r only on glibc systems
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/util/log.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mongo/util/log.cpp b/src/mongo/util/log.cpp
-index 1957eb4791..ddf3908818 100644
---- a/src/mongo/util/log.cpp
-+++ b/src/mongo/util/log.cpp
-@@ -101,7 +101,7 @@ string errnoWithDescription(int errNumber) {
-     char buf[kBuflen];
-     char* msg{nullptr};
- 
--#if defined(__GNUC__) && defined(_GNU_SOURCE)
-+#if defined(__GNUC__) && defined(_GNU_SOURCE) && defined(__GLIBC__)
-     msg = strerror_r(errNumber, buf, kBuflen);
- #elif defined(_WIN32)
- 
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
new file mode 100644
index 0000000000..085fa50d90
--- /dev/null
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
@@ -0,0 +1,39 @@
+From 98543889f7ba38c02eb7cd9822f45e27d619edd6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 24 Aug 2018 13:07:01 -0700
+Subject: [PATCH 2/2] Fix default stack size to 256K
+
+On musl default stack size is ~80K which is too low
+for mongodb
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../platform/stack_locator_pthread_getattr_np.cpp      | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/mongo/platform/stack_locator_pthread_getattr_np.cpp b/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
+index 648d26a41c..6e398f00c9 100644
+--- a/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
++++ b/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
+@@ -35,6 +35,16 @@
+ #include "mongo/util/assert_util.h"
+ #include "mongo/util/scopeguard.h"
+ 
++__attribute__((constructor))
++static void set_default_stack_size(void)
++{
++    pthread_attr_t attr;
++    invariant(pthread_attr_init(&attr) == 0);
++    invariant(pthread_attr_setstacksize(&attr, 256*1024) == 0);
++    pthread_setattr_default_np(&attr);
++    invariant(pthread_attr_destroy(&attr) == 0);
++}
++
+ namespace mongo {
+ 
+ StackLocator::StackLocator() {
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
deleted file mode 100644
index dc488ad7ea..0000000000
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 5759878e5d278f11a1063e8fccd1e6b7b54caadf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Aug 2017 16:25:37 -0700
-Subject: [PATCH 2/2] d_state.cpp: Add missing dependenncy on
- local_sharding_info
-
-Fixes
-| src/mongo/s/d_state.cpp:81: error: undefined reference to 'mongo::enableLocalShardingInfo(mongo::ServiceContext*, std::function<bool (mongo::OperationContext*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>)'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/s/SConscript | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: git/src/mongo/s/SConscript
-===================================================================
---- git.orig/src/mongo/s/SConscript
-+++ git/src/mongo/s/SConscript
-@@ -317,5 +317,6 @@ env.Library(
-         "$BUILD_DIR/mongo/db/s/sharding",
-         "$BUILD_DIR/mongo/executor/network_interface_factory",
-         "$BUILD_DIR/mongo/s/client/shard_local",
-+        "$BUILD_DIR/mongo/s/local_sharding_info",
-     ],
- )
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch
deleted file mode 100644
index 1591f94c96..0000000000
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 458f80f482a201b427a1c92235804d0c3f98fd51 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 2 Sep 2017 13:01:11 -0700
-Subject: [PATCH 3/4] Conditionalize glibc specific strerror_r
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp    | 11 ++++-------
- 1 file changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/src/third_party/asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp b/src/third_party/asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp
-index 4e7badb14a..0eeae884e2 100644
---- a/src/third_party/asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp
-+++ b/src/third_party/asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp
-@@ -97,17 +97,14 @@ public:
- #if defined(__sun) || defined(__QNX__) || defined(__SYMBIAN32__)
-     using namespace std;
-     return strerror(value);
--#elif defined(__MACH__) && defined(__APPLE__) \
--  || defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__) \
--  || defined(_AIX) || defined(__hpux) || defined(__osf__) \
--  || defined(__ANDROID__)
-+#elif defined(__GLIBC__) && defined(_GNU_SOURCE)
-+    char buf[256] = "";
-+    return strerror_r(value, buf, sizeof(buf));
-+#else
-     char buf[256] = "";
-     using namespace std;
-     strerror_r(value, buf, sizeof(buf));
-     return buf;
--#else
--    char buf[256] = "";
--    return strerror_r(value, buf, sizeof(buf));
- #endif
- #endif // defined(ASIO_WINDOWS)
-   }
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
index e871f2ba90..a2e1f795b1 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
@@ -8,11 +8,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/third_party/wiredtiger/build_linux/wiredtiger_config.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/third_party/wiredtiger/build_linux/wiredtiger_config.h b/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
-index 1122e1e319..fdfd48687b 100644
---- a/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
-+++ b/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
-@@ -101,7 +101,7 @@
+Index: git/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
+===================================================================
+--- git.orig/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
++++ git/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
+@@ -104,7 +104,7 @@
  #define HAVE_STRING_H 1
  
  /* Define to 1 if you have the `strtouq' function. */
@@ -21,6 +21,3 @@ index 1122e1e319..fdfd48687b 100644
  
  /* Define to 1 if you have the `sync_file_range' function. */
  /* #undef HAVE_SYNC_FILE_RANGE */
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch b/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
index 9046bb2f45..c06898758a 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/arm64-support.patch
@@ -7,7 +7,7 @@ Index: git/SConstruct
 ===================================================================
 --- git.orig/SConstruct
 +++ git/SConstruct
-@@ -990,6 +990,7 @@ elif endian == "big":
+@@ -1055,6 +1055,7 @@ elif endian == "big":
  processor_macros = {
      'arm'     : { 'endian': 'little', 'defines': ('__arm__',) },
      'aarch64' : { 'endian': 'little', 'defines': ('__arm64__', '__aarch64__')},
@@ -19,7 +19,7 @@ Index: git/src/third_party/IntelRDFPMathLib20U1/SConscript
 ===================================================================
 --- git.orig/src/third_party/IntelRDFPMathLib20U1/SConscript
 +++ git/src/third_party/IntelRDFPMathLib20U1/SConscript
-@@ -301,7 +301,7 @@ if processor == 'i386':
+@@ -308,7 +308,7 @@ if processor == 'i386':
  elif processor == 'arm':
      cpp_defines['IA32'] = '1'
      cpp_defines['ia32'] = '1'
@@ -32,7 +32,7 @@ Index: git/src/third_party/wiredtiger/SConscript
 ===================================================================
 --- git.orig/src/third_party/wiredtiger/SConscript
 +++ git/src/third_party/wiredtiger/SConscript
-@@ -139,7 +139,7 @@ condition_map = {
+@@ -151,7 +151,7 @@ condition_map = {
      'POSIX_HOST'   : not env.TargetOSIs('windows'),
      'WINDOWS_HOST' : env.TargetOSIs('windows'),
  
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch b/meta-oe/recipes-dbs/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch
index 5c5c20ce34..23d4923d23 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch
@@ -5,7 +5,7 @@ Index: git/src/third_party/wiredtiger/SConscript
 ===================================================================
 --- git.orig/src/third_party/wiredtiger/SConscript
 +++ git/src/third_party/wiredtiger/SConscript
-@@ -169,7 +169,9 @@ if useSnappy:
+@@ -181,7 +181,9 @@ if useSnappy:
  # If not available at runtime, we fall back to software in some cases.
  #
  # On zSeries we may disable because SLES 11 kernel doe not support the instructions.
@@ -32,7 +32,7 @@ Index: git/src/third_party/wiredtiger/src/checksum/zseries/crc32-s390x.c
 ===================================================================
 --- git.orig/src/third_party/wiredtiger/src/checksum/zseries/crc32-s390x.c
 +++ git/src/third_party/wiredtiger/src/checksum/zseries/crc32-s390x.c
-@@ -78,6 +78,7 @@ unsigned int __wt_crc32c_le(unsigned int
+@@ -77,6 +77,7 @@ unsigned int __wt_crc32c_le(unsigned int
  		return crc;                                                 \
  	}
  
@@ -40,7 +40,7 @@ Index: git/src/third_party/wiredtiger/src/checksum/zseries/crc32-s390x.c
  /* Main CRC-32 functions */
  DEFINE_CRC32_VX(__wt_crc32c_le_vx, __wt_crc32c_le_vgfm_16, __wt_crc32c_le)
  
-@@ -90,6 +91,7 @@ __wt_checksum_hw(const void *chunk, size
+@@ -89,6 +90,7 @@ __wt_checksum_hw(const void *chunk, size
  {
  	return (~__wt_crc32c_le_vx(0xffffffff, chunk, len));
  }
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index bb3ff3b403..dd22388b57 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -3,25 +3,28 @@ LICENSE = "AGPL-3.0 & Apache-2.0 & Zlib"
 LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788 \
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl libpcre libpcap zlib python boost"
+DEPENDS = "openssl libpcre libpcap zlib boost curl python \
+           python-setuptools-native python-typing-native \
+           python-pyyaml-native python-cheetah-native \
+           "
 
-inherit scons dos2unix siteinfo
+inherit scons dos2unix siteinfo pythonnative
 
-PV = "3.4.13+git${SRCPV}"
-SRCREV = "fbdef2ccc53e0fcc9afb570063633d992b2aae42"
-SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
+PV = "4.0.1+git${SRCPV}"
+#v4.0.1
+SRCREV = "54f1582fc6eb01de4d4c42f26fc133e623f065fb"
+SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.0 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
-           file://0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
            file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
-           file://0001-Use-strerror_r-only-on-glibc-systems.patch \
            file://0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch \
-           file://0003-Conditionalize-glibc-specific-strerror_r.patch \
            file://arm64-support.patch \
            file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
            file://disable-hw-crc32-on-arm64-s390x.patch \
+           file://0001-Support-deprecated-resolver-functions.patch \
            "
 SRC_URI_append_libc-musl ="\
+           file://0002-Fix-default-stack-size-to-256K.patch \
            file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
            "
 S = "${WORKDIR}/git"
-- 
2.18.0


