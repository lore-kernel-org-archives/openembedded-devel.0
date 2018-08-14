Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com
	[209.85.161.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2905374A12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 12:51:01 +0000 (UTC)
Received: by mail-yw1-f44.google.com with SMTP id r3-v6so16072276ywc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 05:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cY6CqBLZLPFwznn15Wiv0PQaL4KP4HXQYaF01PsYXJ8=;
	b=hwrkx+sXeBsaUIct+SjjUXsYELHzhnJtNRAmfXdK5HlkY45lJ86eNH3lpGJnKnAnZA
	flGOxDqov+zp8eod8aP8JGE7mw9QBkcJrt8T5qT2UOWriXKCC79F5YzvVi7Ko9POguGU
	lUVjfHJt/CDnTTTn0aEY+/5LIWwMS1UIJ70HQzDaTtb0D3ifcbWmngauvRZt+0bXsptt
	Cvjdwdf8mxsiZ46JE3Z8WwTnqzpRNrUzLb7JeVrLU5Z5NDlyGGwhkq28W2oRVaXGU37S
	adAjsI77i+Kca8E2tAwmaBunT6+4ntTq2zS09MJ37lszrIAjngjwnKmrWSxnzvumrhJl
	Fxaw==
X-Gm-Message-State: AOUpUlGO9khd7TN4+vfgVfef02pA/n+Jsjm5guIJMvpCWC8JfHUgm9g/
	QpYqrmfOQetEuAdnLHStfrClriFW
X-Google-Smtp-Source: AA+uWPzvtMjzSDqX7YAUej3o7ox4O3kW9cJvu9Wu5HAOykPbbKJhs6oa2q3vSzYriY84qDkbhaFrvA==
X-Received: by 2002:a25:2fc6:: with SMTP id
	v189-v6mr11365048ybv.445.1534251061123; 
	Tue, 14 Aug 2018 05:51:01 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	p186-v6sm9050862ywc.10.2018.08.14.05.50.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 05:51:00 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 13:50:58 +0100
Message-Id: <20180814125058.16842-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813193251.4079-1-git@andred.net>
References: <20180813193251.4079-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH v3] openjdk-8: gcc-8 fix #4: undefined behaviour (hotspot)
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
X-List-Received-Date: Tue, 14 Aug 2018 12:51:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Using gcc-8, Hotspot is being miscompiled, resulting in non-
working binaries.

The reason is undefined behaviour, which gcc-8 even warns about
and errors out. We have so far have taped over those warnings,
but it turns out that we simply cannot do that.

Add patches to address undefined behaviour causing miscompilation
of hotsport.

This also means we can remove the -Wno-error=return-type C compiler
flag again which was recently added in error in
commit 52fb41cec7d5 ("openjdk-8: fix build for gcc8.x") only hiding
the compiler warnings/errors that were flagging the incorrect code
in the first place.

With these patches applied, the openjdk-8 ARM port works again:
| RESULTS:
| RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED (0.04s)
| RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED (0.68s)
| RESULTS - java.JavaTest.test_java_exists - Testcase -1: PASSED (0.14s)
| RESULTS - java.JavaTest.test_java_jar_comp_mode - Testcase -1: FAILED (5.13s)
| RESULTS - java.JavaTest.test_java_jar_int_mode - Testcase -1: PASSED (4.48s)
| RESULTS - java.JavaTest.test_java_jar_works - Testcase -1: PASSED (4.44s)
| RESULTS - java.JavaTest.test_java_version - Testcase -1: PASSED (3.66s)
| RESULTS - javac.JavacTest.test_javac_exists - Testcase -1: PASSED (0.13s)
| RESULTS - javac.JavacTest.test_javac_works - Testcase -1: PASSED (30.87s)
| SUMMARY:
| openjdk-8-test-image () - Ran 9 tests in 50.263s

The java.JavaTest.test_java_jar_comp_mode failure can be ignored for now,
as that test verifies compiled mode which is not available on arm. The
testcase must be fixed instead.

(We need to refresh one unrelated existing patch to avoid patch fuzz warnings)

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v3:
* rebase against master-next

v2:
*  refresh musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch
   to avoid patch fuzz warnings
---
 recipes-core/openjdk/openjdk-8-common.inc     |   2 +-
 .../openjdk-8-release-172b11-common.inc       |  13 +
 ...4-fix-undefined-behaviour-gcc-v8-fix.patch |  41 +++
 ...Fix-further-functions-with-a-missing.patch |  38 +++
 ...o-fix-undefined-behaviour-gcc-v8-fix.patch |  42 ++++
 ...urn-type-issues-introduced-by-806165.patch |  56 +++++
 ...ero-build-requires-disabled-warnings.patch | 148 +++++++++++
 ...return-statement-in-__sync_val_compa.patch |  53 ++++
 ...g-build-after-8062808-Turn-on-the-Wr.patch |  47 ++++
 ...pot-Turn-on-the-Wreturn-type-warning.patch | 233 ++++++++++++++++++
 ..._x86-remove-glibc-dependencies-fpu_c.patch |   2 +-
 11 files changed, 673 insertions(+), 2 deletions(-)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0016-hotspot-Zero-build-requires-disabled-warnings.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0019-hotspot-Turn-on-the-Wreturn-type-warning.patch

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 1c33a3b..7348657 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -217,7 +217,7 @@ EXTRA_OECONF_append = "\
 # of these changes.
 FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
-FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks -Wno-error=return-type"
+FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 
 # flags for -native, and for bits that need a host-tool during -cross
 BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
index 8b30c37..4bcecef 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
@@ -17,6 +17,19 @@ PATCHES_URI = "\
     file://0009-jdk-disable-backtrace-musl-build-fix.patch \
     file://0010-build-fix-build-on-as-needed-toolchains-generic.patch \
     file://0011-hotspot-backport-patch-to-fix-misuses-of-strncpy-str.patch \
+    ${HOTSPOT_UB_PATCH} \
+"
+HOTSPOT_UB_PATCH = "\
+    file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
+    file://0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch \
+    file://0016-hotspot-Zero-build-requires-disabled-warnings.patch \
+    file://0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch \
+    file://0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch \
+    file://0019-hotspot-Turn-on-the-Wreturn-type-warning.patch \
+"
+HOTSPOT_UB_PATCH_prepend_aarch64 = "\
+    file://0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch \
+    file://0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch \
 "
 # some patches extracted from http://cr.openjdk.java.net/~rkennke/shark-build-hotspot/webrev.01/hotspot.patch
 # reported via http://mail.openjdk.java.net/pipermail/build-dev/2015-January/013972.html
diff --git a/recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch b/recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch
new file mode 100644
index 0000000..e11c19c
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch
@@ -0,0 +1,41 @@
+From 1fa1097d45afa2fe2bfd989fbd90578f5c5fc540 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 13 Aug 2018 12:14:21 +0100
+Subject: [PATCH] hotspot/aarch64: fix undefined behaviour (gcc v8 fix)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport patch from
+  http://hg.openjdk.java.net/aarch64-port/jdk8u/hotspot/rev/253b0c304db6
+to address segfaults due to undefined behaviour.
+
+|# HG changeset patch
+|# User shade
+|# Date 1526068247 -7200
+|# Node ID 253b0c304db6d31be3d3d7cf7cf1b3561a16dc3a
+|# Parent  1ced2ae00e35e6f855175fc44500b37fbac9e314
+UB in os_linux_aarch64.cpp SpinPause
+Reviewed-by: aph, shade, adinn
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Upstream-Status: Backport [http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916]
+---
+ hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp b/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
+index 8b985693..f536817e 100644
+--- a/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
++++ b/hotspot/src/os_cpu/linux_aarch64/vm/os_linux_aarch64.cpp
+@@ -699,6 +699,7 @@ void os::verify_stack_alignment() {
+ 
+ extern "C" {
+   int SpinPause() {
++    return 0;
+   }
+ 
+   void _Copy_conjoint_jshorts_atomic(jshort* from, jshort* to, size_t count) {
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch b/recipes-core/openjdk/patches-openjdk-8/0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch
new file mode 100644
index 0000000..0216c68
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0013-hotspot-aarch64-Fix-further-functions-with-a-missing.patch
@@ -0,0 +1,38 @@
+From 3dffe06da016a959f1d8c3afc292ab92a9d4d137 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 13 Aug 2018 17:03:56 +0100
+Subject: [PATCH] hotspot/aarch64: Fix further functions with a missing return
+ value.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+|# HG changeset patch
+|# User andrew
+|# Date 1518669922 0
+|#      Thu Feb 15 04:45:22 2018 +0000
+|# Node ID adaf109718c10888cce5b6e73af7f3e15a7ab0db
+|# Parent  3ade0115344b77e6d00462044e0cf68722685bfe
+PR3519: Fix further functions with a missing return value.
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Upstream-Status: Backport
+---
+ hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp b/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp
+index 4e98cb39..bbc81b4a 100644
+--- a/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp
++++ b/hotspot/src/cpu/aarch64/vm/c1_LIRAssembler_aarch64.cpp
+@@ -205,6 +205,7 @@ Address LIR_Assembler::as_Address(LIR_Address* addr, Register tmp) {
+       return Address(base, tmp, Address::lsl(addr->scale()));
+     }
+   }
++  return Address();
+ }
+ 
+ Address LIR_Assembler::as_Address_hi(LIR_Address* addr) {
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch b/recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
new file mode 100644
index 0000000..467a1cd
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch
@@ -0,0 +1,42 @@
+From 3bd88f93a90876f8ead05de40816da0bd1e39aac Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 13 Aug 2018 11:49:26 +0100
+Subject: [PATCH] hotspot/zero: fix undefined behaviour (gcc v8 fix)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backport patch from
+  https://bugs.openjdk.java.net/browse/JDK-8202600
+  http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916
+to address segfaults due to undefined behaviour.
+
+|# HG changeset patch
+|# User sgehwolf
+|# Date 1525366788 -7200
+|# Node ID ca4663e589160509d6aef8ec890815e1330b97bc
+|# Parent  a27880c1288ba776f65748b68c198df97427f950
+8202600: [Zero] Undefined behaviour in src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+Reviewed-by: stuefe, shade, dholmes
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Upstream-Status: Backport [http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/ca4663e58916]
+---
+ hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+index 1d069c6d..8dcf9d44 100644
+--- a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
++++ b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+@@ -408,6 +408,7 @@ void os::print_register_info(outputStream *st, void *context) {
+ 
+ extern "C" {
+   int SpinPause() {
++    return 0; // Shouldn't matter.
+   }
+ 
+ 
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch b/recipes-core/openjdk/patches-openjdk-8/0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
new file mode 100644
index 0000000..fb7bb59
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0015-hotspot-fix-Wreturn-type-issues-introduced-by-806165.patch
@@ -0,0 +1,56 @@
+From f6424c46b4af08d0662eec1a5897d5502270a3b1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 13 Aug 2018 16:40:34 +0100
+Subject: [PATCH 1/5] hotspot: fix -Wreturn-type issues introduced by 8061651
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+|# HG changeset patch
+|# User andrew
+|# Date 1529475043 -3600
+|#      Wed Jun 20 07:10:43 2018 +0100
+|# Node ID f6341f4635dacb56678264d29a88cd052b74036b
+|# Parent  30520d5018b509b0ae68f5fcc9a5c540e3e5b2de
+PR3601: Fix additional -Wreturn-type issues introduced by 8061651
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Upstream-Status: Backport
+---
+ hotspot/src/share/vm/prims/jvm.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/prims/jvm.cpp
+index 07c36de8..067fd3ac 100644
+--- a/hotspot/src/share/vm/prims/jvm.cpp
++++ b/hotspot/src/share/vm/prims/jvm.cpp
+@@ -835,7 +835,7 @@ JVM_END
+ JVM_ENTRY(jboolean, JVM_KnownToNotExist(JNIEnv *env, jobject loader, const char *classname))
+   JVMWrapper("JVM_KnownToNotExist");
+ #if INCLUDE_CDS
+-  return ClassLoaderExt::known_to_not_exist(env, loader, classname, CHECK_(false));
++  return ClassLoaderExt::known_to_not_exist(env, loader, classname, THREAD);
+ #else
+   return false;
+ #endif
+@@ -845,7 +845,7 @@ JVM_END
+ JVM_ENTRY(jobjectArray, JVM_GetResourceLookupCacheURLs(JNIEnv *env, jobject loader))
+   JVMWrapper("JVM_GetResourceLookupCacheURLs");
+ #if INCLUDE_CDS
+-  return ClassLoaderExt::get_lookup_cache_urls(env, loader, CHECK_NULL);
++  return ClassLoaderExt::get_lookup_cache_urls(env, loader, THREAD);
+ #else
+   return NULL;
+ #endif
+@@ -855,7 +855,7 @@ JVM_END
+ JVM_ENTRY(jintArray, JVM_GetResourceLookupCache(JNIEnv *env, jobject loader, const char *resource_name))
+   JVMWrapper("JVM_GetResourceLookupCache");
+ #if INCLUDE_CDS
+-  return ClassLoaderExt::get_lookup_cache(env, loader, resource_name, CHECK_NULL);
++  return ClassLoaderExt::get_lookup_cache(env, loader, resource_name, THREAD);
+ #else
+   return NULL;
+ #endif
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0016-hotspot-Zero-build-requires-disabled-warnings.patch b/recipes-core/openjdk/patches-openjdk-8/0016-hotspot-Zero-build-requires-disabled-warnings.patch
new file mode 100644
index 0000000..d6bedbc
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0016-hotspot-Zero-build-requires-disabled-warnings.patch
@@ -0,0 +1,148 @@
+From 43c1f744e5f6171df3158baf88dd0a64c4b5e439 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 13 Aug 2018 16:45:24 +0100
+Subject: [PATCH 2/5] hotspot: Zero build requires disabled warnings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+|# HG changeset patch
+|# User sgehwolf
+|# Date 1525714161 -3600
+|#      Mon May 07 18:29:21 2018 +0100
+|# Node ID afb31413c73cbc06420fdb447aa90a7a38258904
+|# Parent  bcbc64dfb629c5f188bbf59b8f986ad95963ed60
+8143245, PR3548: Zero build requires disabled warnings
+Reviewed-by: dholmes, coleenp
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Upstream-Status: Backport
+---
+ hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp  |  2 +-
+ hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp   |  4 ++--
+ .../src/os_cpu/linux_zero/vm/os_linux_zero.cpp   | 16 +++++++++++++---
+ .../os_cpu/linux_zero/vm/thread_linux_zero.hpp   |  3 ++-
+ 4 files changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp b/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
+index 242ce1cf..065471af 100644
+--- a/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
++++ b/hotspot/src/cpu/zero/vm/cppInterpreter_zero.cpp
+@@ -100,7 +100,7 @@ intptr_t narrow(BasicType type, intptr_t result) {
+     case T_DOUBLE:
+     case T_VOID:
+       return result;
+-    default  : ShouldNotReachHere();
++    default  : ShouldNotReachHere(); return NULL_WORD;
+   }
+ }
+ 
+diff --git a/hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp b/hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp
+index e23e3eaa..061ed8ce 100644
+--- a/hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp
++++ b/hotspot/src/cpu/zero/vm/interpreterRT_zero.cpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2003, 2012, Oracle and/or its affiliates. All rights reserved.
++ * Copyright (c) 2003, 2016, Oracle and/or its affiliates. All rights reserved.
+  * Copyright 2007, 2008, 2010 Red Hat, Inc.
+  * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+  *
+@@ -62,7 +62,7 @@ void InterpreterRuntime::SignatureHandlerGeneratorBase::pass_object() {
+ }
+ 
+ void InterpreterRuntime::SignatureHandlerGeneratorBase::push(BasicType type) {
+-  ffi_type *ftype;
++  ffi_type *ftype = NULL;
+   switch (type) {
+   case T_VOID:
+     ftype = &ffi_type_void;
+diff --git a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+index 8dcf9d44..508eb172 100644
+--- a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
++++ b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+@@ -1,6 +1,6 @@
+ /*
+  * Copyright (c) 2003, 2013, Oracle and/or its affiliates. All rights reserved.
+- * Copyright 2007, 2008, 2009, 2010 Red Hat, Inc.
++ * Copyright 2016 Red Hat, Inc.
+  * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+  *
+  * This code is free software; you can redistribute it and/or modify it
+@@ -61,6 +61,7 @@ address os::current_stack_pointer() {
+ 
+ frame os::get_sender_for_C_frame(frame* fr) {
+   ShouldNotCallThis();
++  return frame(NULL, NULL); // silence compile warning.
+ }
+ 
+ frame os::current_frame() {
+@@ -98,16 +99,19 @@ void os::initialize_thread(Thread * thr){
+ 
+ address os::Linux::ucontext_get_pc(ucontext_t* uc) {
+   ShouldNotCallThis();
++  return NULL; // silence compile warnings
+ }
+ 
+ ExtendedPC os::fetch_frame_from_context(void* ucVoid,
+                                         intptr_t** ret_sp,
+                                         intptr_t** ret_fp) {
+   ShouldNotCallThis();
++  return NULL; // silence compile warnings
+ }
+ 
+ frame os::fetch_frame_from_context(void* ucVoid) {
+   ShouldNotCallThis();
++  return frame(NULL, NULL); // silence compile warnings
+ }
+ 
+ extern "C" JNIEXPORT int
+@@ -247,11 +251,16 @@ JVM_handle_linux_signal(int sig,
+   }
+ #endif // !PRODUCT
+ 
+-  const char *fmt = "caught unhandled signal %d";
+   char buf[64];
+ 
+-  sprintf(buf, fmt, sig);
++  sprintf(buf, "caught unhandled signal %d", sig);
++
++// Silence -Wformat-security warning for fatal()
++PRAGMA_DIAG_PUSH
++PRAGMA_FORMAT_NONLITERAL_IGNORED
+   fatal(buf);
++PRAGMA_DIAG_POP
++  return true; // silence compiler warnings
+ }
+ 
+ void os::Linux::init_thread_fpu_state(void) {
+@@ -260,6 +269,7 @@ void os::Linux::init_thread_fpu_state(void) {
+ 
+ int os::Linux::get_fpu_control_word() {
+   ShouldNotCallThis();
++  return -1; // silence compile warnings
+ }
+ 
+ void os::Linux::set_fpu_control_word(int fpu) {
+diff --git a/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp b/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
+index 39f77f85..b9c73dc4 100644
+--- a/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
++++ b/hotspot/src/os_cpu/linux_zero/vm/thread_linux_zero.hpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2000, 2010, Oracle and/or its affiliates. All rights reserved.
++ * Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.
+  * Copyright 2007, 2008, 2009, 2010 Red Hat, Inc.
+  * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+  *
+@@ -110,6 +110,7 @@
+                                            void* ucontext,
+                                            bool isInJava) {
+     ShouldNotCallThis();
++    return false; // silence compile warning
+   }
+ 
+   // These routines are only used on cpu architectures that
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch b/recipes-core/openjdk/patches-openjdk-8/0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch
new file mode 100644
index 0000000..001e905
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch
@@ -0,0 +1,53 @@
+From 6e1d92639787ac8f506f810776a3f1c35f2cd070 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 13 Aug 2018 16:46:33 +0100
+Subject: [PATCH 3/5] hotspot: Missing return statement in
+ __sync_val_compare_and_swap_8
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+|# HG changeset patch
+|# User andrew
+|# Date 1518667645 0
+|#      Thu Feb 15 04:07:25 2018 +0000
+|# Node ID 1d35411eb7bdf16191e220ffe3b1dc4d5d0c6041
+|# Parent  999983606f5c61b093c6f6316a7b26c4cd4ca79e
+8197981, PR3548: Missing return statement in __sync_val_compare_and_swap_8
+Summary: Fix issue discovered by -Wreturn-type on systems without LP64.
+Reviewed-by: aph
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Upstream-Status: Backport
+---
+ hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp     | 1 +
+ hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp b/hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp
+index c857b552..4aaf78b1 100644
+--- a/hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp
++++ b/hotspot/src/os_cpu/bsd_zero/vm/os_bsd_zero.cpp
+@@ -457,6 +457,7 @@ extern "C" {
+     long long unsigned int oldval,
+     long long unsigned int newval) {
+     ShouldNotCallThis();
++    return 0;
+   }
+ };
+ #endif // !_LP64
+diff --git a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+index 508eb172..bb8fa1f1 100644
+--- a/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
++++ b/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.cpp
+@@ -498,6 +498,7 @@ extern "C" {
+     long long unsigned int oldval,
+     long long unsigned int newval) {
+     ShouldNotCallThis();
++    return 0;
+   }
+ };
+ #endif // !_LP64
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch b/recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
new file mode 100644
index 0000000..1421963
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch
@@ -0,0 +1,47 @@
+From dbf31e2dfd00e20ab49af70f3533a348e8a6515e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 13 Aug 2018 16:47:25 +0100
+Subject: [PATCH 4/5] hotspot: Fix debug build after 8062808: Turn on the
+ -Wreturn-type warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+|# HG changeset patch
+|# User goetz
+|# Date 1415873641 -3600
+|#      Thu Nov 13 11:14:01 2014 +0100
+|# Node ID 1878c4c1d04e1f3c6f67a19d36c35863d6b5f906
+|# Parent  533473c67de6ff767710594639033c8e83523fe5
+8064786, PR3599: Fix debug build after 8062808: Turn on the -Wreturn-type warning
+Reviewed-by: stefank, tschatzl
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Upstream-Status: Backport
+---
+ hotspot/src/share/vm/prims/jni.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/hotspot/src/share/vm/prims/jni.cpp b/hotspot/src/share/vm/prims/jni.cpp
+index 6a6ab936..e2f2ad3b 100644
+--- a/hotspot/src/share/vm/prims/jni.cpp
++++ b/hotspot/src/share/vm/prims/jni.cpp
+@@ -708,6 +708,7 @@ JNI_ENTRY(jint, jni_Throw(JNIEnv *env, jthrowable obj))
+ 
+   THROW_OOP_(JNIHandles::resolve(obj), JNI_OK);
+   ShouldNotReachHere();
++  return 0;  // Mute compiler.
+ JNI_END
+ 
+ #ifndef USDT2
+@@ -734,6 +735,7 @@ JNI_ENTRY(jint, jni_ThrowNew(JNIEnv *env, jclass clazz, const char *message))
+   Handle protection_domain (THREAD, k->protection_domain());
+   THROW_MSG_LOADER_(name, (char *)message, class_loader, protection_domain, JNI_OK);
+   ShouldNotReachHere();
++  return 0;  // Mute compiler.
+ JNI_END
+ 
+ 
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/0019-hotspot-Turn-on-the-Wreturn-type-warning.patch b/recipes-core/openjdk/patches-openjdk-8/0019-hotspot-Turn-on-the-Wreturn-type-warning.patch
new file mode 100644
index 0000000..0156978
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0019-hotspot-Turn-on-the-Wreturn-type-warning.patch
@@ -0,0 +1,233 @@
+From cc0d371f17c0ab060eb1e6b42d4bf053a2cbc3ba Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
+Date: Mon, 13 Aug 2018 16:48:32 +0100
+Subject: [PATCH 5/5] hotspot: Turn on the -Wreturn-type warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+|# HG changeset patch
+|# User stefank
+|# Date 1525453613 -3600
+|#      Fri May 04 18:06:53 2018 +0100
+|# Node ID 07a1135a327362f157955d470fad5df07cc35164
+|# Parent  de79964656fc652f2085dac4fe99bcc128b5a3b1
+8062808, PR3548: Turn on the -Wreturn-type warning
+Reviewed-by: mgerdin, tschatzl, coleenp, jrose, kbarrett
+
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+Upstream-Status: Backport
+---
+ hotspot/make/linux/makefiles/gcc.make               | 2 +-
+ hotspot/src/cpu/x86/vm/x86_32.ad                    | 1 +
+ hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp    | 1 +
+ hotspot/src/share/vm/classfile/defaultMethods.cpp   | 4 ++--
+ hotspot/src/share/vm/classfile/symbolTable.cpp      | 4 ++--
+ hotspot/src/share/vm/classfile/systemDictionary.cpp | 6 +++---
+ hotspot/src/share/vm/memory/heapInspection.hpp      | 2 +-
+ hotspot/src/share/vm/memory/metaspaceShared.hpp     | 2 +-
+ hotspot/src/share/vm/oops/constantPool.hpp          | 2 +-
+ hotspot/src/share/vm/prims/jvm.cpp                  | 2 +-
+ hotspot/src/share/vm/runtime/reflection.cpp         | 2 +-
+ hotspot/src/share/vm/runtime/sharedRuntime.cpp      | 2 +-
+ hotspot/src/share/vm/services/memTracker.hpp        | 2 +-
+ 13 files changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/hotspot/make/linux/makefiles/gcc.make b/hotspot/make/linux/makefiles/gcc.make
+index 272afcea..157afff2 100644
+--- a/hotspot/make/linux/makefiles/gcc.make
++++ b/hotspot/make/linux/makefiles/gcc.make
+@@ -207,7 +207,7 @@ ifeq ($(USE_CLANG), true)
+   WARNINGS_ARE_ERRORS += -Wno-return-type -Wno-empty-body
+ endif
+ 
+-WARNING_FLAGS = -Wpointer-arith -Wsign-compare -Wundef -Wunused-function -Wunused-value
++WARNING_FLAGS = -Wpointer-arith -Wsign-compare -Wundef -Wunused-function -Wunused-value -Wreturn-type
+ 
+ ifeq ($(USE_CLANG),)
+   # Since GCC 4.3, -Wconversion has changed its meanings to warn these implicit
+diff --git a/hotspot/src/cpu/x86/vm/x86_32.ad b/hotspot/src/cpu/x86/vm/x86_32.ad
+index f42d1a28..c8f4ee16 100644
+--- a/hotspot/src/cpu/x86/vm/x86_32.ad
++++ b/hotspot/src/cpu/x86/vm/x86_32.ad
+@@ -1250,6 +1250,7 @@ uint MachSpillCopyNode::implementation( CodeBuffer *cbuf, PhaseRegAlloc *ra_, bo
+ 
+ 
+   Unimplemented();
++  return 0; // Mute compiler
+ }
+ 
+ #ifndef PRODUCT
+diff --git a/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp b/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
+index fb96738a..4cdeb372 100644
+--- a/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
++++ b/hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp
+@@ -541,6 +541,7 @@ JVM_handle_linux_signal(int sig,
+   err.report_and_die();
+ 
+   ShouldNotReachHere();
++  return true; // Mute compiler
+ }
+ 
+ void os::Linux::init_thread_fpu_state(void) {
+diff --git a/hotspot/src/share/vm/classfile/defaultMethods.cpp b/hotspot/src/share/vm/classfile/defaultMethods.cpp
+index 0e3d5d7b..d3df1d15 100644
+--- a/hotspot/src/share/vm/classfile/defaultMethods.cpp
++++ b/hotspot/src/share/vm/classfile/defaultMethods.cpp
+@@ -506,7 +506,7 @@ Symbol* MethodFamily::generate_method_message(Symbol *klass_name, Method* method
+   ss.write((const char*)name->bytes(), name->utf8_length());
+   ss.write((const char*)signature->bytes(), signature->utf8_length());
+   ss.print(" is abstract");
+-  return SymbolTable::new_symbol(ss.base(), (int)ss.size(), CHECK_NULL);
++  return SymbolTable::new_symbol(ss.base(), (int)ss.size(), THREAD);
+ }
+ 
+ Symbol* MethodFamily::generate_conflicts_message(GrowableArray<Method*>* methods, TRAPS) const {
+@@ -521,7 +521,7 @@ Symbol* MethodFamily::generate_conflicts_message(GrowableArray<Method*>* methods
+     ss.print(".");
+     ss.write((const char*)name->bytes(), name->utf8_length());
+   }
+-  return SymbolTable::new_symbol(ss.base(), (int)ss.size(), CHECK_NULL);
++  return SymbolTable::new_symbol(ss.base(), (int)ss.size(), THREAD);
+ }
+ 
+ 
+diff --git a/hotspot/src/share/vm/classfile/symbolTable.cpp b/hotspot/src/share/vm/classfile/symbolTable.cpp
+index ec97077b..2621a7d6 100644
+--- a/hotspot/src/share/vm/classfile/symbolTable.cpp
++++ b/hotspot/src/share/vm/classfile/symbolTable.cpp
+@@ -249,7 +249,7 @@ Symbol* SymbolTable::lookup(const char* name, int len, TRAPS) {
+   MutexLocker ml(SymbolTable_lock, THREAD);
+ 
+   // Otherwise, add to symbol to table
+-  return the_table()->basic_add(index, (u1*)name, len, hashValue, true, CHECK_NULL);
++  return the_table()->basic_add(index, (u1*)name, len, hashValue, true, THREAD);
+ }
+ 
+ Symbol* SymbolTable::lookup(const Symbol* sym, int begin, int end, TRAPS) {
+@@ -288,7 +288,7 @@ Symbol* SymbolTable::lookup(const Symbol* sym, int begin, int end, TRAPS) {
+   // Grab SymbolTable_lock first.
+   MutexLocker ml(SymbolTable_lock, THREAD);
+ 
+-  return the_table()->basic_add(index, (u1*)buffer, len, hashValue, true, CHECK_NULL);
++  return the_table()->basic_add(index, (u1*)buffer, len, hashValue, true, THREAD);
+ }
+ 
+ Symbol* SymbolTable::lookup_only(const char* name, int len,
+diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hotspot/src/share/vm/classfile/systemDictionary.cpp
+index 8d2e7f49..62bdba3e 100644
+--- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
++++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
+@@ -229,15 +229,15 @@ Klass* SystemDictionary::resolve_or_null(Symbol* class_name, Handle class_loader
+                  class_name->as_C_string(),
+                  class_loader.is_null() ? "null" : class_loader->klass()->name()->as_C_string()));
+   if (FieldType::is_array(class_name)) {
+-    return resolve_array_class_or_null(class_name, class_loader, protection_domain, CHECK_NULL);
++    return resolve_array_class_or_null(class_name, class_loader, protection_domain, THREAD);
+   } else if (FieldType::is_obj(class_name)) {
+     ResourceMark rm(THREAD);
+     // Ignore wrapping L and ;.
+     TempNewSymbol name = SymbolTable::new_symbol(class_name->as_C_string() + 1,
+                                    class_name->utf8_length() - 2, CHECK_NULL);
+-    return resolve_instance_class_or_null(name, class_loader, protection_domain, CHECK_NULL);
++    return resolve_instance_class_or_null(name, class_loader, protection_domain, THREAD);
+   } else {
+-    return resolve_instance_class_or_null(class_name, class_loader, protection_domain, CHECK_NULL);
++    return resolve_instance_class_or_null(class_name, class_loader, protection_domain, THREAD);
+   }
+ }
+ 
+diff --git a/hotspot/src/share/vm/memory/heapInspection.hpp b/hotspot/src/share/vm/memory/heapInspection.hpp
+index 09ee6602..c5fec15c 100644
+--- a/hotspot/src/share/vm/memory/heapInspection.hpp
++++ b/hotspot/src/share/vm/memory/heapInspection.hpp
+@@ -367,7 +367,7 @@ class HeapInspection : public StackObj {
+       _csv_format(csv_format), _print_help(print_help),
+       _print_class_stats(print_class_stats), _columns(columns) {}
+   void heap_inspection(outputStream* st) NOT_SERVICES_RETURN;
+-  size_t populate_table(KlassInfoTable* cit, BoolObjectClosure* filter = NULL) NOT_SERVICES_RETURN;
++  size_t populate_table(KlassInfoTable* cit, BoolObjectClosure* filter = NULL) NOT_SERVICES_RETURN_(0);
+   static void find_instances_at_safepoint(Klass* k, GrowableArray<oop>* result) NOT_SERVICES_RETURN;
+  private:
+   void iterate_over_heap(KlassInfoTable* cit, BoolObjectClosure* filter = NULL);
+diff --git a/hotspot/src/share/vm/memory/metaspaceShared.hpp b/hotspot/src/share/vm/memory/metaspaceShared.hpp
+index 2f3abae6..d58ebecb 100644
+--- a/hotspot/src/share/vm/memory/metaspaceShared.hpp
++++ b/hotspot/src/share/vm/memory/metaspaceShared.hpp
+@@ -93,7 +93,7 @@ class MetaspaceShared : AllStatic {
+   static void preload_and_dump(TRAPS) NOT_CDS_RETURN;
+   static int preload_and_dump(const char * class_list_path,
+                               GrowableArray<Klass*>* class_promote_order,
+-                              TRAPS) NOT_CDS_RETURN;
++                              TRAPS) NOT_CDS_RETURN_(0);
+ 
+   static ReservedSpace* shared_rs() {
+     CDS_ONLY(return _shared_rs);
+diff --git a/hotspot/src/share/vm/oops/constantPool.hpp b/hotspot/src/share/vm/oops/constantPool.hpp
+index f170decc..a1e168b2 100644
+--- a/hotspot/src/share/vm/oops/constantPool.hpp
++++ b/hotspot/src/share/vm/oops/constantPool.hpp
+@@ -349,7 +349,7 @@ class ConstantPool : public Metadata {
+ 
+   Klass* klass_at(int which, TRAPS) {
+     constantPoolHandle h_this(THREAD, this);
+-    return klass_at_impl(h_this, which, CHECK_NULL);
++    return klass_at_impl(h_this, which, THREAD);
+   }
+ 
+   Symbol* klass_name_at(int which);  // Returns the name, w/o resolving.
+diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/prims/jvm.cpp
+index 067fd3ac..b9e5b322 100644
+--- a/hotspot/src/share/vm/prims/jvm.cpp
++++ b/hotspot/src/share/vm/prims/jvm.cpp
+@@ -4280,7 +4280,7 @@ JVM_ENTRY(jlong,JVM_DTraceActivate(
+     JVM_DTraceProvider* providers))
+   JVMWrapper("JVM_DTraceActivate");
+   return DTraceJSDT::activate(
+-    version, module_name, providers_count, providers, CHECK_0);
++    version, module_name, providers_count, providers, THREAD);
+ JVM_END
+ 
+ JVM_ENTRY(jboolean,JVM_DTraceIsProbeEnabled(JNIEnv* env, jmethodID method))
+diff --git a/hotspot/src/share/vm/runtime/reflection.cpp b/hotspot/src/share/vm/runtime/reflection.cpp
+index e2f282ee..679e1775 100644
+--- a/hotspot/src/share/vm/runtime/reflection.cpp
++++ b/hotspot/src/share/vm/runtime/reflection.cpp
+@@ -1093,7 +1093,7 @@ oop Reflection::invoke(instanceKlassHandle klass, methodHandle reflected_method,
+   } else {
+     if (rtype == T_BOOLEAN || rtype == T_BYTE || rtype == T_CHAR || rtype == T_SHORT)
+       narrow((jvalue*) result.get_value_addr(), rtype, CHECK_NULL);
+-    return box((jvalue*) result.get_value_addr(), rtype, CHECK_NULL);
++    return box((jvalue*) result.get_value_addr(), rtype, THREAD);
+   }
+ }
+ 
+diff --git a/hotspot/src/share/vm/runtime/sharedRuntime.cpp b/hotspot/src/share/vm/runtime/sharedRuntime.cpp
+index 8ffa8ab3..219bcd5c 100644
+--- a/hotspot/src/share/vm/runtime/sharedRuntime.cpp
++++ b/hotspot/src/share/vm/runtime/sharedRuntime.cpp
+@@ -1038,7 +1038,7 @@ Handle SharedRuntime::find_callee_info(JavaThread* thread, Bytecodes::Code& bc,
+   // last java frame on stack (which includes native call frames)
+   vframeStream vfst(thread, true);  // Do not skip and javaCalls
+ 
+-  return find_callee_info_helper(thread, vfst, bc, callinfo, CHECK_(Handle()));
++  return find_callee_info_helper(thread, vfst, bc, callinfo, THREAD);
+ }
+ 
+ 
+diff --git a/hotspot/src/share/vm/services/memTracker.hpp b/hotspot/src/share/vm/services/memTracker.hpp
+index 38a027ea..13436a4b 100644
+--- a/hotspot/src/share/vm/services/memTracker.hpp
++++ b/hotspot/src/share/vm/services/memTracker.hpp
+@@ -64,7 +64,7 @@ class MemTracker : AllStatic {
+     const NativeCallStack& stack, MEMFLAGS flag = mtNone) { }
+   static inline void record_virtual_memory_commit(void* addr, size_t size, const NativeCallStack& stack) { }
+   static inline Tracker get_virtual_memory_uncommit_tracker() { return Tracker(); }
+-  static inline Tracker get_virtual_memory_release_tracker() { }
++  static inline Tracker get_virtual_memory_release_tracker() { return Tracker(); }
+   static inline void record_virtual_memory_type(void* addr, MEMFLAGS flag) { }
+   static inline void record_thread_stack(void* addr, size_t size) { }
+   static inline void release_thread_stack(void* addr, size_t size) { }
+-- 
+2.18.0
+
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch
index fcad102..7dcb889 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch
@@ -32,7 +32,7 @@ index fb96738a..982ce84d 100644
  #ifdef AMD64
  #define REG_SP REG_RSP
 @@ -543,6 +542,9 @@ JVM_handle_linux_signal(int sig,
-   ShouldNotReachHere();
+   return true; // Mute compiler
  }
  
 +#define _FPU_GETCW(cw) __asm__ __volatile__ ("fnstcw %0" : "=m" (*&cw))
-- 
2.18.0


