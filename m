Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E324777DCD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Sep 2017 20:29:56 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t193so2139320pgc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Sep 2017 13:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=D7JdaIAfMbZ34sYVG05BVegNV0nlAR5njaj6ZTa2iEY=;
	b=irlmhpTDleKcPYGQDuZy5QypdORaOb1M9DTdgpmBRv9ThY+faxKyqFGuoAK8KcMxAI
	dwC8meqP5+x5B9ibFoOM3lVXaTDQa4+FFwS/hVL+vmXFbhOYnJbWCssxM2az8fsuIycY
	0E+gWMazHHtZsV+irCuBotIfp4i6PnF4kw5UWFm8qy2spEuzzUG0J3IRQAr2cKuOIg20
	O/afTNMv1zMGoTtGFlgEjICvfsj9J2YE1zyHskvlQkSj4uPwnAqibH5flroIZLT66hnT
	DobgxcZfu8JzrfSE1qvXrG7UgLQnDp5KvmZv8WyCgm4X7+4t6QzEp4S8eHxnc15h1K/G
	rNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D7JdaIAfMbZ34sYVG05BVegNV0nlAR5njaj6ZTa2iEY=;
	b=aOJPNzpeAasz1ErrLKasWRocVR61lJIstmgIGoSLuFsstu/od1iEgJJ0To0MJtGqPx
	iq3gzqfmAaO2/cEqkwFkHfqm2ljfgs/A/yDX18vOhIGkWgB2SxwEifhUsTw02j4iNMjJ
	Z0BXtU2xkNRYlUouDQW/kDTRUSyFhjFNKPxNYIjv2lidG5Cl/sgVWpK+3fyjrIJm3QbT
	eGvBLWTYcVreLpjrDQldHQeqFbFJIu4YmtPWesrIfAfSpSbQX63WRKKx0vs2/k1CT1Aw
	PaPBH4shIGuhDpm/7IyYybqpHqS5iTb0b6taufXaCM9go+G+t6JmRAyp45vVJPXoGezC
	5ZEw==
X-Gm-Message-State: AHPjjUidCRiH9U0trGau0gRkle3yeo1lPRaoZRSsvfsFmIwohQ8FgBbh
	7zsLz5qO4HbtWcPA
X-Google-Smtp-Source: ADKCNb6AKt2w+IFgA0yTahi+SJtqCS7GLhsizkFiX9XVfPWgmMWcy5maVXPcvznvvIwQQUfxNHiqGg==
X-Received: by 10.84.210.2 with SMTP id z2mr5083637plh.312.1504384197777;
	Sat, 02 Sep 2017 13:29:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	f17sm5010162pff.90.2017.09.02.13.29.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Sep 2017 13:29:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Sep 2017 13:29:49 -0700
Message-Id: <20170902202949.25029-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH V2 2/2] mongodb: Disable for armv7 and fix build on musl
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
X-List-Received-Date: Sat, 02 Sep 2017 20:29:57 -0000

32bit arm is not supported
Add patches to compile with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes from v1->v2:
- Add patches to fix build on x86_64/musl

 ...__-to-control-use-of-gnu_get_libc_version.patch | 50 ++++++++++++++++
 .../0001-Use-long-long-instead-of-int64_t.patch    | 67 ++++++++++++++++++++++
 ...0001-Use-strerror_r-only-on-glibc-systems.patch | 26 +++++++++
 ...finition-for-the-macro-__ELF_NATIVE_CLASS.patch | 35 +++++++++++
 ...-Conditionalize-glibc-specific-strerror_r.patch | 39 +++++++++++++
 .../0004-wiredtiger-Disable-strtouq-on-musl.patch  | 26 +++++++++
 meta-oe/recipes-support/mongodb/mongodb_git.bb     | 16 +++++-
 7 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch

diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta-oe/recipes-support/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
new file mode 100644
index 000000000..f8c419d8a
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
@@ -0,0 +1,50 @@
+From 3eed8388b49d5d3cbc2db74fee1b017eb4b40d0a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Sep 2017 10:06:24 -0700
+Subject: [PATCH] Use __GLIBC__ to control use of gnu_get_libc_version
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+ src/mongo/util/processinfo_linux.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/mongo/util/processinfo_linux.cpp b/src/mongo/util/processinfo_linux.cpp
+index 910015215e..bf8c1ffd15 100644
+--- a/src/mongo/util/processinfo_linux.cpp
++++ b/src/mongo/util/processinfo_linux.cpp
+@@ -40,7 +40,7 @@
+ #include <sys/mman.h>
+ #include <sys/utsname.h>
+ #include <unistd.h>
+-#ifdef __UCLIBC__
++#ifndef __GLIBC__
+ #include <features.h>
+ #else
+ #include <gnu/libc-version.h>
+@@ -451,11 +451,13 @@ double ProcessInfo::getSystemMemoryPressurePercentage() {
+ }
+ 
+ void ProcessInfo::getExtraInfo(BSONObjBuilder& info) {
++#if defined(__GLIBC__)
+     LinuxProc p(_pid);
+     if (p._maj_flt <= std::numeric_limits<long long>::max())
+         info.appendNumber("page_faults", static_cast<long long>(p._maj_flt));
+     else
+         info.appendNumber("page_faults", static_cast<double>(p._maj_flt));
++#endif
+ }
+ 
+ /**
+@@ -491,7 +493,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() {
+     stringstream ss;
+     ss << "uClibc-" << __UCLIBC_MAJOR__ << "." << __UCLIBC_MINOR__ << "." << __UCLIBC_SUBLEVEL__;
+     bExtra.append("libcVersion", ss.str());
+-#else
++#elif defined(__GLIBC__)
+     bExtra.append("libcVersion", gnu_get_libc_version());
+ #endif
+     if (!verSig.empty())
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/recipes-support/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
new file mode 100644
index 000000000..c43beb4c1
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
@@ -0,0 +1,67 @@
+From a4951489d649c2b609cbb80f6cfb49fdcad8bd43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Sep 2017 10:03:37 -0700
+Subject: [PATCH] Use long long instead of int64_t
+
+Fixes
+error: call to member function 'appendNumber' is ambiguous
+since this function expects long long as parameter and not int64_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+ src/mongo/util/procparser.cpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/mongo/util/procparser.cpp b/src/mongo/util/procparser.cpp
+index 36f2ae0254..2c164bcbf3 100644
+--- a/src/mongo/util/procparser.cpp
++++ b/src/mongo/util/procparser.cpp
+@@ -260,7 +260,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
+ 
+                     StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
+ 
+-                    uint64_t value;
++                    long long  value;
+ 
+                     if (!parseNumberFromString(stringValue, &value).isOK()) {
+                         value = 0;
+@@ -272,7 +272,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
+             } else {
+                 StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
+ 
+-                uint64_t value;
++                long long value;
+ 
+                 if (!parseNumberFromString(stringValue, &value).isOK()) {
+                     value = 0;
+@@ -365,7 +365,7 @@ Status parseProcMemInfo(const std::vector<StringData>& keys,
+ 
+             StringData stringValue((*partIt).begin(), (*partIt).end());
+ 
+-            uint64_t value;
++            long long value;
+ 
+             if (!parseNumberFromString(stringValue, &value).isOK()) {
+                 value = 0;
+@@ -426,7 +426,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
+                           StringData data,
+                           BSONObjBuilder* builder) {
+     bool foundKeys = false;
+-    std::vector<uint64_t> stats;
++    std::vector<long long> stats;
+     stats.reserve(kDiskFieldCount);
+ 
+     using string_split_iterator = boost::split_iterator<StringData::const_iterator>;
+@@ -501,7 +501,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
+ 
+                 StringData stringValue((*partIt).begin(), (*partIt).end());
+ 
+-                uint64_t value;
++                long long value;
+ 
+                 if (!parseNumberFromString(stringValue, &value).isOK()) {
+                     value = 0;
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch b/meta-oe/recipes-support/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
new file mode 100644
index 000000000..0334d994e
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0001-Use-strerror_r-only-on-glibc-systems.patch
@@ -0,0 +1,26 @@
+From a4dfc92ff342e59596ab64267a8d4f22f173c23b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Sep 2017 12:40:41 -0700
+Subject: [PATCH 1/4] Use strerror_r only on glibc systems
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/util/log.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mongo/util/log.cpp b/src/mongo/util/log.cpp
+index 1957eb4791..ddf3908818 100644
+--- a/src/mongo/util/log.cpp
++++ b/src/mongo/util/log.cpp
+@@ -101,7 +101,7 @@ string errnoWithDescription(int errNumber) {
+     char buf[kBuflen];
+     char* msg{nullptr};
+ 
+-#if defined(__GNUC__) && defined(_GNU_SOURCE)
++#if defined(__GNUC__) && defined(_GNU_SOURCE) && defined(__GLIBC__)
+     msg = strerror_r(errNumber, buf, kBuflen);
+ #elif defined(_WIN32)
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-oe/recipes-support/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
new file mode 100644
index 000000000..098306f50
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
@@ -0,0 +1,35 @@
+From df7ef16afcc6ab55daa686e4f15c16e3d1280337 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Sep 2017 12:42:30 -0700
+Subject: [PATCH 2/4] Add a definition for the macro __ELF_NATIVE_CLASS
+
+It depends on the native arch's word size.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/util/stacktrace_posix.cpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/mongo/util/stacktrace_posix.cpp b/src/mongo/util/stacktrace_posix.cpp
+index 53ab85f56f..7c458e7ef2 100644
+--- a/src/mongo/util/stacktrace_posix.cpp
++++ b/src/mongo/util/stacktrace_posix.cpp
+@@ -37,6 +37,15 @@
+ #include <string>
+ #include <sys/utsname.h>
+ 
++#if !defined(__GLIBC__)
++#if defined __x86_64__ && !defined __ILP32__
++# define __WORDSIZE    64
++#else
++# define __WORDSIZE    32
++#endif
++#define __ELF_NATIVE_CLASS __WORDSIZE
++#endif
++
+ #include "mongo/base/init.h"
+ #include "mongo/config.h"
+ #include "mongo/db/jsobj.h"
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch b/meta-oe/recipes-support/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch
new file mode 100644
index 000000000..1591f94c9
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0003-Conditionalize-glibc-specific-strerror_r.patch
@@ -0,0 +1,39 @@
+From 458f80f482a201b427a1c92235804d0c3f98fd51 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Sep 2017 13:01:11 -0700
+Subject: [PATCH 3/4] Conditionalize glibc specific strerror_r
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp    | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/src/third_party/asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp b/src/third_party/asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp
+index 4e7badb14a..0eeae884e2 100644
+--- a/src/third_party/asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp
++++ b/src/third_party/asio-asio-1-11-0/asio/include/asio/impl/error_code.ipp
+@@ -97,17 +97,14 @@ public:
+ #if defined(__sun) || defined(__QNX__) || defined(__SYMBIAN32__)
+     using namespace std;
+     return strerror(value);
+-#elif defined(__MACH__) && defined(__APPLE__) \
+-  || defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__) \
+-  || defined(_AIX) || defined(__hpux) || defined(__osf__) \
+-  || defined(__ANDROID__)
++#elif defined(__GLIBC__) && defined(_GNU_SOURCE)
++    char buf[256] = "";
++    return strerror_r(value, buf, sizeof(buf));
++#else
+     char buf[256] = "";
+     using namespace std;
+     strerror_r(value, buf, sizeof(buf));
+     return buf;
+-#else
+-    char buf[256] = "";
+-    return strerror_r(value, buf, sizeof(buf));
+ #endif
+ #endif // defined(ASIO_WINDOWS)
+   }
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch b/meta-oe/recipes-support/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
new file mode 100644
index 000000000..e871f2ba9
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
@@ -0,0 +1,26 @@
+From a1c77702926eb8546ff96b00b5b994f7478dabae Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Sep 2017 13:13:15 -0700
+Subject: [PATCH 4/4] wiredtiger: Disable strtouq on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/third_party/wiredtiger/build_linux/wiredtiger_config.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/third_party/wiredtiger/build_linux/wiredtiger_config.h b/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
+index 1122e1e319..fdfd48687b 100644
+--- a/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
++++ b/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
+@@ -101,7 +101,7 @@
+ #define HAVE_STRING_H 1
+ 
+ /* Define to 1 if you have the `strtouq' function. */
+-#define HAVE_STRTOUQ 1
++/* #undef HAVE_STRTOUQ 1 */
+ 
+ /* Define to 1 if you have the `sync_file_range' function. */
+ /* #undef HAVE_SYNC_FILE_RANGE */
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index b38641cff..547f60850 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -13,8 +13,15 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-mongo-Add-using-std-string.patch \
            file://0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch \
+           file://0001-Use-long-long-instead-of-int64_t.patch \
+           file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
+           file://0001-Use-strerror_r-only-on-glibc-systems.patch \
+           file://0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch \
+           file://0003-Conditionalize-glibc-specific-strerror_r.patch \
+           "
+SRC_URI_append_libc-musl ="\
+           file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
            "
-
 S = "${WORKDIR}/git"
 
 # Wiredtiger supports only 64-bit platforms
@@ -24,10 +31,13 @@ PACKAGECONFIG ??= "tcmalloc"
 # gperftools compilation fails for arm below v7 because of missing support of
 # dmb operation. So we use system-allocator instead of tcmalloc
 PACKAGECONFIG_remove_armv6 = "tcmalloc"
+PACKAGECONFIG_remove_libc-musl = "tcmalloc"
 
 #std::current_exception is undefined for arm < v6
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
+COMPATIBLE_MACHINE_armv7a = "(!.*armv7a).*"
+COMPATIBLE_MACHINE_armv7ve = "(!.*armv7ve).*"
 COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
 
@@ -48,6 +58,10 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  ${PACKAGECONFIG_CONFARGS} \
                  mongod mongos"
 
+do_configure_prepend() {
+        # tests use hex floats, not supported in plain C++
+        sed -e 's|-std=c++11|-std=gnu++11|g' -i ${S}/SConstruct
+}
 scons_do_compile() {
         ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS} || \
         die "scons build execution failed."
-- 
2.14.1


