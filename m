Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id A689E783CA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Sep 2017 19:02:14 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m15so2093551pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Sep 2017 12:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6r75aYpND2LkoLVc/G3KlQbuyvH5O5zNVPGeVww51P8=;
	b=jKaF1W4pr+wSa/MywTGr7dhuR/hAPT+IR/Y5nn68nvS4ytq1luiVKPSC1Ae1DPZUBG
	beSAjoaVjvOdOBxV6VknSWS78eGKvckf3c4J7EA1lhZWODYskoP28KwmM1KbOCKGUxS5
	qQGPkVTbKM8W+bMtrQOPdyWp9Cd+AHzqguyMZ2NIhpJ+mREAkeRRjxto8fmxQ30WCCs9
	4FAxZJooJmFU0/8UugK5q2HuglKJ9tabwpl/uml9SkUBbaVd/Z76xdLieTZSYv/+cFKn
	MYYe+xLOTL1jRh31mSvFTmqhwiQfbRkR76lgc5sXVwAqSfv1mysLYYwMRUZ+2+2yNTBe
	D4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6r75aYpND2LkoLVc/G3KlQbuyvH5O5zNVPGeVww51P8=;
	b=VNceEO2dS/FfUhLujOK5ceItWsIdRApMpIv0ZMnG65k76ylRlTM/DmZaqc6iBkF9sN
	tdx+PQOJjVrGnjT6gNLISLP9XrWAKUJ2SpIR3B1VW4zw7RqjgSgYJQbppDP7TfzhVDBg
	sL5pIw/P2e5n+GqylcG/2CBd33Pa3cvv6GR5TXNDbktY7e0LgUQgn2jIcovD+QH24PD9
	4bJW5UYfhj/G0q/Kcd+w0kDYKvYhYkPNYwDOXZsY+k0a0JQV+aAQn0ZY485/6ksaaa8t
	9FBrK2OL/YVT7LfzAnRLci2aT91FvqvIdCb4bimOep3YTMA5jZDV8gBodSaneCUjHYZt
	yA9w==
X-Gm-Message-State: AHPjjUhtX8/IbuA2UlpcsaWCkicoZyQuabrIYpJke2fLCjcrwUEiZxa8
	IvvaF5C2iCVUoMWy
X-Google-Smtp-Source: ADKCNb5/g4EuYowozgI0478hPW7uoA/a27MmsMCxZi3bXUeFHohegw9S8t8SE31n+y47RmPc4Bbn7g==
X-Received: by 10.99.9.2 with SMTP id 2mr6911616pgj.411.1504378935829;
	Sat, 02 Sep 2017 12:02:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	n18sm4989232pgd.13.2017.09.02.12.02.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Sep 2017 12:02:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Sep 2017 12:02:05 -0700
Message-Id: <20170902190205.18257-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170902190205.18257-1-raj.khem@gmail.com>
References: <20170902190205.18257-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mongodb: Disable for armv7
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
X-List-Received-Date: Sat, 02 Sep 2017 19:02:14 -0000

32bit arm is not supported
Add patches to compile with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...__-to-control-use-of-gnu_get_libc_version.patch | 50 ++++++++++++++++
 .../0001-Use-long-long-instead-of-int64_t.patch    | 67 ++++++++++++++++++++++
 meta-oe/recipes-support/mongodb/mongodb_git.bb     |  8 +++
 3 files changed, 125 insertions(+)
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch

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
diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index b38641cff..1f7af2228 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-mongo-Add-using-std-string.patch \
            file://0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch \
+           file://0001-Use-long-long-instead-of-int64_t.patch \
+           file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -28,6 +30,8 @@ PACKAGECONFIG_remove_armv6 = "tcmalloc"
 #std::current_exception is undefined for arm < v6
 COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
+COMPATIBLE_MACHINE_armv7a = "(!.*armv7a).*"
+COMPATIBLE_MACHINE_armv7ve = "(!.*armv7ve).*"
 COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
 
@@ -48,6 +52,10 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
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


