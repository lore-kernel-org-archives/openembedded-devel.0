Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10231.1795752928325383762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XORjgPPl;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386c71feeeaso4123707eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752928; x=1796357728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eh13kiA3DGI5mYO4I9OAEgYTzpdg+c7ODPkr/WIzuio=;
        b=XORjgPPlvlzJhgoyoYqVeEMWqjc+7I2bm23qq1GAyEiM/6eS+wkq1V9oEJIu7Mx5ZP
         jhtoNdkItlbNsIB9gpgjcYzv6QGy5LyulYGCp+vdP8PjCorYb21gqEW1B+DkGWcTE+96
         DpBKA4yXb7xc9K1jfOyprf0rlU03dctxVR35Ie5vzbMoh6KhiBlT+i7jafcWLrQFMYUC
         zFYeeEyIkuw32zGIuHoEFoxyG3xqC+9AnjUafowjTNhIWeJT4O9Z0c9C9lZ8eNzJ4uX7
         lSLqz5gcsI/TJt2pLNkGDOdzQ5DWWEc9xnoIoH51wJ7Z8R4wcop7tKCp22PhKZsfpLb5
         Ak0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752928; x=1796357728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eh13kiA3DGI5mYO4I9OAEgYTzpdg+c7ODPkr/WIzuio=;
        b=gxOiurqdLlSt9fMgg5wCTQdGNsCwTfDCUORBhmPqza3vIKRrh1yp+6svMrF+nbQWnb
         J0ZLBQu0jz18z2JZtM3qcy/h/e0wGyO3muK4zifYHaX8h22qEKCfUXc1MZYBIiF3Oliw
         lth1EyJI6WzHwaGyPMseN45LL463TOBsrkNivXv4SwE1pL4+WoyMA6mGk7GHNXqv310d
         gyTijmSLKAj+XmH8ooAl8crR+4Y3q1pEJxWCjxnvppfMO8eAGkADalLxXfA42qwaOuC8
         uDqrTka5qeTJDXg4Sm/zC08HJCl2/laHO/SndwaMBeoiRoX7kIVDaWc1OPvavXYg8bTR
         4CUw==
X-Gm-Message-State: APuU4Z9m0yXbl3NwjbZyA6Wo3Bvmt1y5mYmjVu9jqRxL2LzFjt15dQ5I
	QOqiZxN6tyiMcQqxGVjIJU7pdX+zDAwkNWSjxaNNqs5xIkpIAid3miEoO9FJBeIX
X-Gm-Gg: AZFdTZepgX+Wgg84+jUIHbSdOvTVeuEsJGL5C5uuxEILBj8RfrgugmuQ+xAHxq7Kzx/
	9smvZWW6avDvZdmi2Krt9bni6szHA64DL+oLQnDJ3GrroiXlQwg7H4o6QbGmnROX98Wg5GcLeO8
	GNb+64w9BfcbAasVtNRNzLwBsVi2mU1ws6JLBGaAsc2DVa+6zBDHKfL10VlhaIEgN2MCsYWdVBU
	CJlfR8wwJnFUeiKAYmzCuNglBNlKu3OOrU98anoRwO95WmZbGF/w93tZpd16pSW0kjsRoINzIp8
	y/4ZQp5KbgyRFCaTQ6B4EHLZiBQ/WvJTD1PijULxAhOp0yS0hOasSOIS+6arpy1Nr1OqHM87dOd
	EOL94oIKtigii9RuThnNUpGthzsNphP+VWozUH/iiAelntfnJ8Vlpvg9EJkWpIcPdCJybSfLiMa
	YTLb0OWt1Ph+noHtRUCD1VaXDcMu+ZW0n2bDiAYw5BGKlZITZotSe54a6Ld90ElMJV6JY2qYCml
	ZB3gb3CdiVzbbGPVp1g1MkC6cMRFo8QUno+XbiW3VJSR7dvk3gQ3iZ1Txz8upQoLLCXWGPSnnKz
	qfj4A4m8D4/iQtjaWTDWJT9+DjlMU1xOuBBbSej9bNW2D6EeToaLHr5LM2bFwprBcrLGFDpHexj
	VogC7kPkky44Cy15Cb3+WAMQJLcuuQ+zjxB+ppCIj/ZIFjjEZNmlYFaQm3W6EgJSqIga6uXRvz5
	AaX+ZFdIBUvi/lbU9pTFr6x9vlXSO36BW9UNfoTNwKbZNBub7nucpHjsk/2LqbI6POasgEZC3X0
	oKu7e6GmnLiZBRWxjeU3KPmP5TJ7YvfRMDwfSvhJJhXOCouDGJPGU8WImjwZhEu0ezhF4uI5ytq
	yn+gn3Hq1ybqjtMGHMcEnQ+AwA==
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr21934290eec.32.1795752926662;
        Thu, 26 Nov 2026 20:15:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm60340062eec.8.2026.11.26.20.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/8] mongodb: upgrade 4.4.30 -> 7.0.48
Date: Thu, 26 Nov 2026 20:15:13 -0800
Message-ID: <20261127041517.1773986-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
References: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133214
Content-Type: text/plain; charset="utf-8"

4.4 is EOL. 7.0 is the newest series that still builds with SCons (8.0
and later need Bazel). It drops the legacy mongo shell (use mongosh),
needs a C++20 compiler and only supports 64-bit hosts; existing data
must be upgraded through 5.0 and 6.0 (featureCompatibilityVersion).

Build with the SCons bundled in the source tree and upstream's etc/scons
variables files, install mongod and mongos from install-core with
upstream's mongod.conf and unit, and always build WiredTiger. Use system
pcre2 (system-pcre becomes system-pcre2) and rename the shell
PACKAGECONFIG to js, which controls server-side JavaScript (mozjs) and
stays off. Limit COMPATIBLE_HOST to x86_64, aarch64 and powerpc64le,
check upstream versions on 7.0 tags only, and depend on
python3-pymongo-native, whose bson module the IDL compiler imports.
std::atomic<Timestamp> needs libatomic.

Patches fixed upstream or obsolete for 7.0 are dropped and the rest are
refreshed. New ones backport SERVER-77007 and SERVER-79426 (current
clang and libstdc++), fix libstdc++ 16 and PCRE2 10.49, keep SConstruct
from overriding -mcpu/-march, make it honour --js-engine=none, and fix
the musl build (sys/prctl.h with linux/prctl.h, and the abseil
DirectMmap off64_t backport).

License-Update: APACHE-2.0.txt is gone; LICENSE now lists the vendored libraries built into mongod and mongos (README.third_party.md), checksummed via distsrc/THIRD-PARTY-NOTICES

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mongodb/0001-Fix-build-on-32bit.patch     |  38 --
 ...0001-Fix-compilation-with-fno-common.patch | 448 ------------------
 ...01-Fix-type-mismatch-on-32bit-arches.patch |  33 --
 ...hLib20U1-Check-for-__DEFINED_wchar_t.patch |  37 --
 ...rror_r-implementation-glibc-specific.patch |  31 --
 ...ct-the-CPU-selected-by-the-compiler-.patch |  48 ++
 ...goDB-fails-to-compile-with-Clang-15-.patch | 133 ++++++
 ...9426-fix-build-issues-under-clang-15.patch | 275 +++++++++++
 ...upport-deprecated-resolver-functions.patch |  15 +-
 ...e-build-settings-from-environment-va.patch |  57 ---
 ...y-binary_function-base-classes-are-d.patch |  25 +-
 ...-control-use-of-gnu_get_libc_version.patch |  15 +-
 ...001-Use-long-long-instead-of-int64_t.patch |  69 ---
 ...stead-of-pkg_resources-for-version-p.patch |  20 +-
 ...ic_cast-size_t-to-maxMemoryUsageByte.patch |  38 --
 ...1-apply-msvc-workaround-for-clang-16.patch |  15 +-
 ...sio-Dont-use-experimental-with-clang.patch |  31 --
 ...se-shutil.which-instead-of-distutils.patch |  40 ++
 .../0001-include-needed-c-header.patch        |  29 --
 ...econfig.py-python-3.12-compatibility.patch |   9 +-
 ...just-the-cache-alignment-assumptions.patch |  37 --
 ...-stacktrace-Define-ARCH_BITS-for-x86.patch |  29 --
 .../0001-wiredtiger-Avoid-using-off64_t.patch |   9 +-
 ...ion-for-the-macro-__ELF_NATIVE_CLASS.patch |  38 --
 .../0002-Fix-default-stack-size-to-256K.patch |  11 +-
 ...call-to-CheckLibWithHeader-as-a-keyw.patch |  56 ---
 .../mongodb/0003-Fix-unknown-prefix-env.patch |  21 -
 .../0003-boost-Fix-build-with-clang-23.patch  |  43 +-
 .../0004-ssl-Fix-build-with-OpenSSL-4.patch   |  74 ++-
 ...4-wiredtiger-Disable-strtouq-on-musl.patch |   9 +-
 ...ove-the-Node-swap-function-in-Biggie.patch |  58 ---
 ...-constructors-to-RowEq-and-RowHasher.patch |  46 ++
 ...0006-pcre-Fix-build-with-PCRE2-10.49.patch |  36 ++
 ...0007-SConstruct-Honor-js-engine-none.patch |  37 ++
 ...inux-prctl.h-together-with-sys-prctl.patch |  33 ++
 ...ff_t-instead-of-off64_t-for-the-offs.patch |  51 ++
 .../recipes-dbs/mongodb/mongodb/1296.patch    |  57 ---
 .../mongodb/mongodb/arm64-support.patch       |  56 ---
 .../mongodb/disable_runtime_check.patch       |  19 +-
 .../mongodb/mongodb/ppc64_ARCH_BITS.patch     |  22 +-
 .../{mongodb_git.bb => mongodb_7.0.48.bb}     | 121 +++--
 41 files changed, 914 insertions(+), 1355 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SConstruct-Respect-the-CPU-selected-by-the-compiler-.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-77007-MongoDB-fails-to-compile-with-Clang-15-.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-79426-fix-build-issues-under-clang-15.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-distsrc-Use-shutil.which-instead-of-distutils.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-sbe-Add-default-constructors-to-RowEq-and-RowHasher.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0006-pcre-Fix-build-with-PCRE2-10.49.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0007-SConstruct-Honor-js-engine-none.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0008-Do-not-include-linux-prctl.h-together-with-sys-prctl.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0009-DirectMmap-Use-off_t-instead-of-off64_t-for-the-offs.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/{mongodb_git.bb => mongodb_7.0.48.bb} (55%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
deleted file mode 100644
index 4abc044151..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b172ebe7e709b10338c1b260310dacc15c557cff Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Fri, 22 Sep 2023 15:37:29 +0200
-Subject: [PATCH] Fix build on 32bit
-
-* fixes:
-  src/mongo/util/net/http_client_curl.cpp: In function 'size_t mongo::{anonymous}::ReadMemoryCallback(char*, size_t, size_t, void*)':
-  src/mongo/util/net/http_client_curl.cpp:172:21: error: no matching function for call to 'min(size_t, long unsigned int)'
-    172 |             std::min(size * nitems, static_cast<unsigned long>(bufReader->remaining()));
-        |             ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-* reported in:
-  https://jira.mongodb.org/browse/SERVER-73007
-  but will probably get closed like:
-  mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
-  submitted in:
-  https://jira.mongodb.org/browse/SERVER-74633
-  as they don't support 32bit builds
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Pending
----
- src/mongo/util/net/http_client_curl.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mongo/util/net/http_client_curl.cpp b/src/mongo/util/net/http_client_curl.cpp
-index 57290d0f8ed..f251fe2a550 100644
---- a/src/mongo/util/net/http_client_curl.cpp
-+++ b/src/mongo/util/net/http_client_curl.cpp
-@@ -169,7 +169,7 @@ size_t ReadMemoryCallback(char* buffer, size_t size, size_t nitems, void* instre
- 
-     if (bufReader->remaining() > 0) {
-         size_t readSize =
--            std::min(size * nitems, static_cast<unsigned long>(bufReader->remaining()));
-+            std::min(size * nitems, static_cast<size_t>(bufReader->remaining()));
-         auto buf = bufReader->readBytes(readSize);
-         memcpy(buffer, buf.rawData(), readSize);
-         ret = readSize;
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
deleted file mode 100644
index f5c2cf2179..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-compilation-with-fno-common.patch
+++ /dev/null
@@ -1,448 +0,0 @@
-From 3690dc5f567906c45f057509305fbaa021b33adb Mon Sep 17 00:00:00 2001
-From: Yichao Yu <yyc1992@gmail.com>
-Date: Tue, 15 Sep 2020 12:35:46 -0700
-Subject: [PATCH] Fix compilation with -fno-common.
-
-Making all other archs consistent with IA64 which should not have this problem.
-Also move the FIXME to the correct place.
-
-Also add some minimum comments about this...
-
-Upstream-Status: Backport [https://github.com/libunwind/libunwind/pull/166/commits/29e17d8d2ccbca07c423e3089a6d5ae8a1c9cb6e]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/third_party/unwind/dist/src/aarch64/Ginit.c   | 15 +++++++--------
- src/third_party/unwind/dist/src/arm/Ginit.c       | 15 +++++++--------
- .../src/coredump/_UPT_get_dyn_info_list_addr.c    |  5 +++++
- src/third_party/unwind/dist/src/hppa/Ginit.c      | 15 +++++++--------
- src/third_party/unwind/dist/src/ia64/Ginit.c      |  1 +
- .../unwind/dist/src/mi/Gfind_dynamic_proc_info.c  |  1 +
- src/third_party/unwind/dist/src/mips/Ginit.c      | 15 +++++++--------
- src/third_party/unwind/dist/src/ppc32/Ginit.c     | 11 +++++++----
- src/third_party/unwind/dist/src/ppc64/Ginit.c     | 11 +++++++----
- .../dist/src/ptrace/_UPT_get_dyn_info_list_addr.c |  5 +++++
- src/third_party/unwind/dist/src/s390x/Ginit.c     | 15 +++++++--------
- src/third_party/unwind/dist/src/sh/Ginit.c        | 15 +++++++--------
- src/third_party/unwind/dist/src/tilegx/Ginit.c    | 15 +++++++--------
- src/third_party/unwind/dist/src/x86/Ginit.c       | 15 +++++++--------
- src/third_party/unwind/dist/src/x86_64/Ginit.c    | 15 +++++++--------
- 15 files changed, 89 insertions(+), 80 deletions(-)
-
-diff --git a/src/third_party/unwind/dist/src/aarch64/Ginit.c b/src/third_party/unwind/dist/src/aarch64/Ginit.c
-index dec235c829..35389762f2 100644
---- a/src/third_party/unwind/dist/src/aarch64/Ginit.c
-+++ b/src/third_party/unwind/dist/src/aarch64/Ginit.c
-@@ -61,13 +61,6 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -78,7 +71,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/arm/Ginit.c b/src/third_party/unwind/dist/src/arm/Ginit.c
-index 2720d063a2..0bac0d72da 100644
---- a/src/third_party/unwind/dist/src/arm/Ginit.c
-+++ b/src/third_party/unwind/dist/src/arm/Ginit.c
-@@ -57,18 +57,17 @@ tdep_uc_addr (unw_tdep_context_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/coredump/_UPT_get_dyn_info_list_addr.c b/src/third_party/unwind/dist/src/coredump/_UPT_get_dyn_info_list_addr.c
-index 0d11905566..739ed0569b 100644
---- a/src/third_party/unwind/dist/src/coredump/_UPT_get_dyn_info_list_addr.c
-+++ b/src/third_party/unwind/dist/src/coredump/_UPT_get_dyn_info_list_addr.c
-@@ -74,6 +74,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
- 
- #else
- 
-+/* XXX fix me: there is currently no way to locate the dyn-info list
-+       by a remote unwinder.  On ia64, this is done via a special
-+       unwind-table entry.  Perhaps something similar can be done with
-+       DWARF2 unwind info.  */
-+
- static inline int
- get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
-                int *countp)
-diff --git a/src/third_party/unwind/dist/src/hppa/Ginit.c b/src/third_party/unwind/dist/src/hppa/Ginit.c
-index 461e4b93da..265455a68c 100644
---- a/src/third_party/unwind/dist/src/hppa/Ginit.c
-+++ b/src/third_party/unwind/dist/src/hppa/Ginit.c
-@@ -64,13 +64,6 @@ _Uhppa_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -81,7 +74,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/ia64/Ginit.c b/src/third_party/unwind/dist/src/ia64/Ginit.c
-index b09a2ad57c..8601bb3ca8 100644
---- a/src/third_party/unwind/dist/src/ia64/Ginit.c
-+++ b/src/third_party/unwind/dist/src/ia64/Ginit.c
-@@ -68,6 +68,7 @@ get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-   if (!_U_dyn_info_list_addr)
-     return -UNW_ENOINFO;
- #endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-   *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
-diff --git a/src/third_party/unwind/dist/src/mi/Gfind_dynamic_proc_info.c b/src/third_party/unwind/dist/src/mi/Gfind_dynamic_proc_info.c
-index 98d3501286..2e7c62e5e8 100644
---- a/src/third_party/unwind/dist/src/mi/Gfind_dynamic_proc_info.c
-+++ b/src/third_party/unwind/dist/src/mi/Gfind_dynamic_proc_info.c
-@@ -49,6 +49,7 @@ local_find_proc_info (unw_addr_space_t as, unw_word_t ip, unw_proc_info_t *pi,
-     return -UNW_ENOINFO;
- #endif
- 
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-   list = (unw_dyn_info_list_t *) (uintptr_t) _U_dyn_info_list_addr ();
-   for (di = list->first; di; di = di->next)
-     if (ip >= di->start_ip && ip < di->end_ip)
-diff --git a/src/third_party/unwind/dist/src/mips/Ginit.c b/src/third_party/unwind/dist/src/mips/Ginit.c
-index 3df170c754..bf7a8f5a8f 100644
---- a/src/third_party/unwind/dist/src/mips/Ginit.c
-+++ b/src/third_party/unwind/dist/src/mips/Ginit.c
-@@ -69,13 +69,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -86,7 +79,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) (intptr_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/ppc32/Ginit.c b/src/third_party/unwind/dist/src/ppc32/Ginit.c
-index ba302448a3..7b45455807 100644
---- a/src/third_party/unwind/dist/src/ppc32/Ginit.c
-+++ b/src/third_party/unwind/dist/src/ppc32/Ginit.c
-@@ -91,9 +91,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -104,7 +101,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/ppc64/Ginit.c b/src/third_party/unwind/dist/src/ppc64/Ginit.c
-index 4c88cd6e77..7bfb395a79 100644
---- a/src/third_party/unwind/dist/src/ppc64/Ginit.c
-+++ b/src/third_party/unwind/dist/src/ppc64/Ginit.c
-@@ -95,9 +95,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -108,7 +105,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/ptrace/_UPT_get_dyn_info_list_addr.c b/src/third_party/unwind/dist/src/ptrace/_UPT_get_dyn_info_list_addr.c
-index cc5ed04418..16671d453e 100644
---- a/src/third_party/unwind/dist/src/ptrace/_UPT_get_dyn_info_list_addr.c
-+++ b/src/third_party/unwind/dist/src/ptrace/_UPT_get_dyn_info_list_addr.c
-@@ -71,6 +71,11 @@ get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
- 
- #else
- 
-+/* XXX fix me: there is currently no way to locate the dyn-info list
-+       by a remote unwinder.  On ia64, this is done via a special
-+       unwind-table entry.  Perhaps something similar can be done with
-+       DWARF2 unwind info.  */
-+
- static inline int
- get_list_addr (unw_addr_space_t as, unw_word_t *dil_addr, void *arg,
-                int *countp)
-diff --git a/src/third_party/unwind/dist/src/s390x/Ginit.c b/src/third_party/unwind/dist/src/s390x/Ginit.c
-index f0886ac933..db01743c06 100644
---- a/src/third_party/unwind/dist/src/s390x/Ginit.c
-+++ b/src/third_party/unwind/dist/src/s390x/Ginit.c
-@@ -50,8 +50,6 @@ static struct unw_addr_space local_addr_space;
- 
- unw_addr_space_t unw_local_addr_space = &local_addr_space;
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
- static inline void *
- uc_addr (ucontext_t *uc, int reg)
- {
-@@ -75,11 +73,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -90,7 +83,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/sh/Ginit.c b/src/third_party/unwind/dist/src/sh/Ginit.c
-index 52988a721e..9fe96d2bd4 100644
---- a/src/third_party/unwind/dist/src/sh/Ginit.c
-+++ b/src/third_party/unwind/dist/src/sh/Ginit.c
-@@ -58,13 +58,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -75,7 +68,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/tilegx/Ginit.c b/src/third_party/unwind/dist/src/tilegx/Ginit.c
-index 7564a558be..925e641324 100644
---- a/src/third_party/unwind/dist/src/tilegx/Ginit.c
-+++ b/src/third_party/unwind/dist/src/tilegx/Ginit.c
-@@ -64,13 +64,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -81,7 +74,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) (intptr_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/x86/Ginit.c b/src/third_party/unwind/dist/src/x86/Ginit.c
-index f6b8dc27d4..3cec74a216 100644
---- a/src/third_party/unwind/dist/src/x86/Ginit.c
-+++ b/src/third_party/unwind/dist/src/x86/Ginit.c
-@@ -54,13 +54,6 @@ tdep_uc_addr (ucontext_t *uc, int reg)
- 
- # endif /* UNW_LOCAL_ONLY */
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -71,7 +64,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
-diff --git a/src/third_party/unwind/dist/src/x86_64/Ginit.c b/src/third_party/unwind/dist/src/x86_64/Ginit.c
-index 6161da6401..5c4e4269a6 100644
---- a/src/third_party/unwind/dist/src/x86_64/Ginit.c
-+++ b/src/third_party/unwind/dist/src/x86_64/Ginit.c
-@@ -49,13 +49,6 @@ static struct unw_addr_space local_addr_space;
- 
- unw_addr_space_t unw_local_addr_space = &local_addr_space;
- 
--HIDDEN unw_dyn_info_list_t _U_dyn_info_list;
--
--/* XXX fix me: there is currently no way to locate the dyn-info list
--       by a remote unwinder.  On ia64, this is done via a special
--       unwind-table entry.  Perhaps something similar can be done with
--       DWARF2 unwind info.  */
--
- static void
- put_unwind_info (unw_addr_space_t as, unw_proc_info_t *proc_info, void *arg)
- {
-@@ -66,7 +59,13 @@ static int
- get_dyn_info_list_addr (unw_addr_space_t as, unw_word_t *dyn_info_list_addr,
-                         void *arg)
- {
--  *dyn_info_list_addr = (unw_word_t) &_U_dyn_info_list;
-+#ifndef UNW_LOCAL_ONLY
-+# pragma weak _U_dyn_info_list_addr
-+  if (!_U_dyn_info_list_addr)
-+    return -UNW_ENOINFO;
-+#endif
-+  // Access the `_U_dyn_info_list` from `LOCAL_ONLY` library, i.e. libunwind.so.
-+  *dyn_info_list_addr = _U_dyn_info_list_addr ();
-   return 0;
- }
- 
--- 
-2.28.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
deleted file mode 100644
index def17995dc..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 81eabea4e4da55cddfe8bcfcbc3759fa90948254 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Mar 2023 14:13:29 -0800
-Subject: [PATCH] Fix type mismatch on 32bit arches
-
-std::set::size returns an unsigned integral type.
-std::max call therefore gets (unsigned int, unsigned long) here.
-Type of both arguments is not same, so its ambigous
-and there is no matching std::max implementation for mismatching
-arguments. std::max expects both input variables to be of
-same type, max(int,int) etc..
-
-Fixes
-src/mongo/util/processinfo_linux.cpp:424:16: error: no matching function for call to 'max'
-        return std::max(socketIds.size(), 1ul);
-
-Upstream-Status: Submitted [https://jira.mongodb.org/browse/SERVER-74633]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/util/processinfo_linux.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/src/mongo/util/processinfo_linux.cpp
-+++ b/src/mongo/util/processinfo_linux.cpp
-@@ -421,7 +421,7 @@ public:
- 
-         // On ARM64, the "physical id" field is unpopulated, causing there to be 0 sockets found. In
-         // this case, we default to 1.
--        return std::max(socketIds.size(), 1ul);
-+        return std::max(static_cast<unsigned long>(socketIds.size()), 1ul);
-     }
- 
-     /**
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
deleted file mode 100644
index 500e76bc2f..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 97914aeab52b4d0ea0ab9e5ff985a1c5cddb0fa1 Mon Sep 17 00:00:00 2001
-From: Vincent Prince <vincent.prince.fr@gmail.com>
-Date: Mon, 16 Sep 2019 13:41:39 +0200
-Subject: [PATCH 06/10] IntelRDFPMathLib20U1: Check for __DEFINED_wchar_t
-
-This is defined by musl if wchar_t is already defined
-
-avoids errors like
-
-src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h:46:15: error: typedef redefinition with different types
-      ('int' vs 'unsigned int')
-typedef int   wchar_t;
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
-
-Upstream-Status: Pending
----
- src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h b/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
-index 56775bc..be96a85 100755
---- a/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
-+++ b/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
-@@ -43,7 +43,7 @@
- 
- #if 0 // MongoDB Modification -- just `#include <stddef.h>`
- // Fix system header issue on Sun solaris and define required type by ourselves
--#if !defined(_WCHAR_T) && !defined(_WCHAR_T_DEFINED) && !defined(__QNX__)
-+#if !defined(_WCHAR_T) && !defined(_WCHAR_T_DEFINED) && !defined(__QNX__) && !defined(__DEFINED_wchar_t)
- typedef int   wchar_t;
- #endif
- #else
--- 
-2.7.4
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
deleted file mode 100644
index 5337fcdbfd..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ca004968b8d2149f72d4edcfe029489a8c5e10ca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Sep 2019 12:31:31 -0700
-Subject: [PATCH] Mark one of strerror_r implementation glibc specific
-
-glibc has two incompatible strerror_r definitions, one of them is
-specific to glibc, mark this one so
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/util/errno_util.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mongo/util/errno_util.cpp b/src/mongo/util/errno_util.cpp
-index 564c0071ea..4f7e1d3a38 100644
---- a/src/mongo/util/errno_util.cpp
-+++ b/src/mongo/util/errno_util.cpp
-@@ -61,7 +61,7 @@ std::string errnoWithDescription(int errNumber) {
-     char buf[kBuflen];
-     char* msg{nullptr};
- 
--#if defined(__GNUC__) && defined(_GNU_SOURCE) && \
-+#if defined(__GNUC__) && defined(_GNU_SOURCE) && defined(__GLIBC__) && \
-     (!defined(__ANDROID_API__) || !(__ANDROID_API__ <= 22)) && !defined(EMSCRIPTEN)
-     msg = strerror_r(errNumber, buf, kBuflen);
- #elif defined(_WIN32)
--- 
-2.23.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SConstruct-Respect-the-CPU-selected-by-the-compiler-.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SConstruct-Respect-the-CPU-selected-by-the-compiler-.patch
new file mode 100644
index 0000000000..e1b4a4a9d1
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SConstruct-Respect-the-CPU-selected-by-the-compiler-.patch
@@ -0,0 +1,48 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 23 Nov 2026 07:52:52 -0800
+Subject: [PATCH] SConstruct: Respect the CPU selected by the compiler command
+
+SConstruct adds default -march=/-mcpu=/-mtune= flags for aarch64,
+ppc64le and s390x unless one of CCFLAGS, CFLAGS or CXXFLAGS already
+has the same flag. Cross toolchains pass the target CPU as part of CC
+and CXX, often as -mcpu= instead of -march=, so the defaults were
+added anyway. On aarch64 this builds for ARMv8.2-A, which does not run
+on ARMv8.0 cores such as Cortex-A53 and Cortex-A72.
+
+Look at CC and CXX as well, and treat -mcpu= as also selecting the
+architecture and the tuning.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ SConstruct | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 45e78a8d..b79e01a8 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -3272,11 +3272,17 @@ if not env.TargetOSIs('windows', 'macOS') and (env.ToolchainIs('GCC', 'clang')):
+ 
+     default_targeting_flags = default_targeting_flags_for_architecture.get(env['TARGET_ARCH'])
+     if default_targeting_flags:
+-        search_variables = ['CCFLAGS', 'CFLAGS', 'CXXFLAGS']
++        # Also look at the compiler command, where cross toolchains pass the
++        # target CPU, and treat -mcpu= as selecting the architecture and tuning.
++        user_flags = shlex.split(env.subst('$CC $CXX $CCFLAGS $CFLAGS $CXXFLAGS'))
++        equivalent_flags = {
++            '-march=': ('-march=', '-mcpu='),
++            '-mcpu=': ('-march=', '-mcpu='),
++            '-mtune=': ('-mtune=', '-mcpu='),
++        }
+         for targeting_flag, targeting_flag_value in default_targeting_flags.items():
+-            if not any(
+-                    flag_value.startswith(targeting_flag) for search_variable in search_variables
+-                    for flag_value in env[search_variable]):
++            prefixes = equivalent_flags.get(targeting_flag, (targeting_flag, ))
++            if not any(flag_value.startswith(prefixes) for flag_value in user_flags):
+                 env.Append(CCFLAGS=[f'{targeting_flag}{targeting_flag_value}'])
+ 
+ # Needed for auth tests since key files are stored in git with mode 644.
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-77007-MongoDB-fails-to-compile-with-Clang-15-.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-77007-MongoDB-fails-to-compile-with-Clang-15-.patch
new file mode 100644
index 0000000000..cf37438c13
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-77007-MongoDB-fails-to-compile-with-Clang-15-.patch
@@ -0,0 +1,133 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Colin Stolley <cstolley@gmail.com>
+Date: Thu, 27 Jul 2023 15:55:08 +0000
+Subject: [PATCH] SERVER-77007: MongoDB fails to compile with Clang 15 with
+ C++20
+
+Upstream-Status: Backport [https://github.com/mongodb/mongo/commit/688f62c2904a8630acf44298bb040fce787386cf]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mongo/db/exec/document_value/value.cpp        | 12 ++++++------
+ src/mongo/db/exec/document_value/value.h          |  2 +-
+ src/mongo/db/exec/document_value/value_internal.h | 13 +++++++------
+ 3 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/src/mongo/db/exec/document_value/value.cpp b/src/mongo/db/exec/document_value/value.cpp
+index bb78d59a..3c04fc14 100644
+--- a/src/mongo/db/exec/document_value/value.cpp
++++ b/src/mongo/db/exec/document_value/value.cpp
+@@ -136,7 +136,7 @@ void ValueStorage::putDocument(Document&& d) {
+     putRefCountable(std::move(d._storage));
+ }
+ 
+-void ValueStorage::putVector(boost::intrusive_ptr<RCVector>&& vec) {
++void ValueStorage::putVector(boost::intrusive_ptr<RCVector<Value>>&& vec) {
+     fassert(16485, bool(vec));
+     putRefCountable(std::move(vec));
+ }
+@@ -200,7 +200,7 @@ Value::Value(const BSONElement& elem) : _storage(elem.type()) {
+         }
+ 
+         case Array: {
+-            auto vec = make_intrusive<RCVector>();
++            auto vec = make_intrusive<RCVector<Value>>();
+             BSONForEach(sub, elem.embeddedObject()) {
+                 vec->vec.push_back(Value(sub));
+             }
+@@ -262,7 +262,7 @@ Value::Value(const BSONElement& elem) : _storage(elem.type()) {
+ }
+ 
+ Value::Value(const BSONArray& arr) : _storage(Array) {
+-    auto vec = make_intrusive<RCVector>();
++    auto vec = make_intrusive<RCVector<Value>>();
+     BSONForEach(sub, arr) {
+         vec->vec.push_back(Value(sub));
+     }
+@@ -270,7 +270,7 @@ Value::Value(const BSONArray& arr) : _storage(Array) {
+ }
+ 
+ Value::Value(const vector<BSONObj>& vec) : _storage(Array) {
+-    auto storageVec = make_intrusive<RCVector>();
++    auto storageVec = make_intrusive<RCVector<Value>>();
+     storageVec->vec.reserve(vec.size());
+     for (auto&& obj : vec) {
+         storageVec->vec.push_back(Value(obj));
+@@ -279,7 +279,7 @@ Value::Value(const vector<BSONObj>& vec) : _storage(Array) {
+ }
+ 
+ Value::Value(const vector<Document>& vec) : _storage(Array) {
+-    auto storageVec = make_intrusive<RCVector>();
++    auto storageVec = make_intrusive<RCVector<Value>>();
+     storageVec->vec.reserve(vec.size());
+     for (auto&& obj : vec) {
+         storageVec->vec.push_back(Value(obj));
+@@ -1171,7 +1171,7 @@ size_t Value::getApproximateSize() const {
+ 
+         case Array: {
+             size_t size = sizeof(Value);
+-            size += sizeof(RCVector);
++            size += sizeof(RCVector<Value>);
+             const size_t n = getArray().size();
+             for (size_t i = 0; i < n; ++i) {
+                 size += getArray()[i].getApproximateSize();
+diff --git a/src/mongo/db/exec/document_value/value.h b/src/mongo/db/exec/document_value/value.h
+index e5b92976..6168be9e 100644
+--- a/src/mongo/db/exec/document_value/value.h
++++ b/src/mongo/db/exec/document_value/value.h
+@@ -110,7 +110,7 @@ public:
+     explicit Value(const std::vector<BSONObj>& vec);
+     explicit Value(const std::vector<Document>& vec);
+     explicit Value(std::vector<Value> vec)
+-        : _storage(Array, make_intrusive<RCVector>(std::move(vec))) {}
++        : _storage(Array, make_intrusive<RCVector<Value>>(std::move(vec))) {}
+     explicit Value(const BSONBinData& bd) : _storage(BinData, bd) {}
+     explicit Value(const BSONRegEx& re) : _storage(RegEx, re) {}
+     explicit Value(const BSONCodeWScope& cws) : _storage(CodeWScope, cws) {}
+diff --git a/src/mongo/db/exec/document_value/value_internal.h b/src/mongo/db/exec/document_value/value_internal.h
+index b19af0e7..55477fb8 100644
+--- a/src/mongo/db/exec/document_value/value_internal.h
++++ b/src/mongo/db/exec/document_value/value_internal.h
+@@ -49,11 +49,12 @@ class Value;
+ 
+ // TODO: a MutableVector, similar to MutableDocument
+ /// A heap-allocated reference-counted std::vector
++template <typename T>
+ class RCVector : public RefCountable {
+ public:
+     RCVector() {}
+-    RCVector(std::vector<Value> v) : vec(std::move(v)) {}
+-    std::vector<Value> vec;
++    RCVector(std::vector<T> v) : vec(std::move(v)) {}
++    std::vector<T> vec;
+ };
+ 
+ class RCCodeWScope : public RefCountable {
+@@ -128,7 +129,7 @@ public:
+         type = t;
+         putDocument(std::move(d));
+     }
+-    ValueStorage(BSONType t, boost::intrusive_ptr<RCVector>&& a) {
++    ValueStorage(BSONType t, boost::intrusive_ptr<RCVector<Value>>&& a) {
+         zero();
+         type = t;
+         putVector(std::move(a));
+@@ -231,7 +232,7 @@ public:
+ 
+     /// These are only to be called during Value construction on an empty Value
+     void putString(StringData s);
+-    void putVector(boost::intrusive_ptr<RCVector>&& v);
++    void putVector(boost::intrusive_ptr<RCVector<Value>>&& v);
+     void putDocument(const Document& d);
+     void putDocument(Document&& d);
+     void putRegEx(const BSONRegEx& re);
+@@ -273,8 +274,8 @@ public:
+     }
+ 
+     const std::vector<Value>& getArray() const {
+-        dassert(typeid(*genericRCPtr) == typeid(const RCVector));
+-        const RCVector* arrayPtr = static_cast<const RCVector*>(genericRCPtr);
++        dassert(typeid(*genericRCPtr) == typeid(const RCVector<Value>));
++        const RCVector<Value>* arrayPtr = static_cast<const RCVector<Value>*>(genericRCPtr);
+         return arrayPtr->vec;
+     }
+ 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-79426-fix-build-issues-under-clang-15.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-79426-fix-build-issues-under-clang-15.patch
new file mode 100644
index 0000000000..d3d6e5b696
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-SERVER-79426-fix-build-issues-under-clang-15.patch
@@ -0,0 +1,275 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Colin Stolley <colin.stolley@mongodb.com>
+Date: Mon, 31 Jul 2023 16:27:55 +0000
+Subject: [PATCH] SERVER-79426: fix build issues under clang-15.
+
+Upstream-Status: Backport [https://github.com/mongodb/mongo/commit/eb02e5a121019b7dcdc28ebd4ec96e777075141e]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mongo/db/cst/c_node.h                     | 59 ++++++++++---------
+ src/mongo/db/exec/near.cpp                    | 30 +++++-----
+ .../optimizer/cascades/logical_rewriter.cpp   |  2 +-
+ src/mongo/db/query/stats/max_diff.cpp         |  2 +-
+ src/mongo/s/write_ops/write_op.h              | 52 ++++++++--------
+ src/mongo/util/net/ssl_types.h                |  6 +-
+ .../dist/absl/hash/internal/low_level_hash.cc |  2 +-
+ 7 files changed, 78 insertions(+), 75 deletions(-)
+
+diff --git a/src/mongo/db/cst/c_node.h b/src/mongo/db/cst/c_node.h
+index af77b493..0ac1f8b7 100644
+--- a/src/mongo/db/cst/c_node.h
++++ b/src/mongo/db/cst/c_node.h
+@@ -218,34 +218,37 @@ public:
+     using Fieldname = stdx::variant<KeyFieldname, UserFieldname, FieldnamePath>;
+     using ArrayChildren = std::vector<CNode>;
+     using ObjectChildren = std::vector<std::pair<Fieldname, CNode>>;
+-    stdx::variant<ArrayChildren,
+-                  ObjectChildren,
+-                  CompoundInclusionKey,
+-                  CompoundExclusionKey,
+-                  CompoundInconsistentKey,
+-                  KeyValue,
+-                  NonZeroKey,
+-                  ValuePath,
+-                  UserDouble,
+-                  UserString,
+-                  UserBinary,
+-                  UserUndefined,
+-                  UserObjectId,
+-                  UserBoolean,
+-                  UserDate,
+-                  UserNull,
+-                  UserRegex,
+-                  UserDBPointer,
+-                  UserJavascript,
+-                  UserSymbol,
+-                  UserJavascriptWithScope,
+-                  UserInt,
+-                  UserTimestamp,
+-                  UserLong,
+-                  UserDecimal,
+-                  UserMinKey,
+-                  UserMaxKey>
+-        payload;
++    using Payload = stdx::variant<ArrayChildren,
++                                  ObjectChildren,
++                                  CompoundInclusionKey,
++                                  CompoundExclusionKey,
++                                  CompoundInconsistentKey,
++                                  KeyValue,
++                                  NonZeroKey,
++                                  ValuePath,
++                                  UserDouble,
++                                  UserString,
++                                  UserBinary,
++                                  UserUndefined,
++                                  UserObjectId,
++                                  UserBoolean,
++                                  UserDate,
++                                  UserNull,
++                                  UserRegex,
++                                  UserDBPointer,
++                                  UserJavascript,
++                                  UserSymbol,
++                                  UserJavascriptWithScope,
++                                  UserInt,
++                                  UserTimestamp,
++                                  UserLong,
++                                  UserDecimal,
++                                  UserMinKey,
++                                  UserMaxKey>;
++    Payload payload;
++
++    CNode() = default;
++    CNode(Payload p) : payload(std::move(p)){};
+ 
+     /*
+      * Returns whether this fieldname is the key fieldname representing the _id syntax.
+diff --git a/src/mongo/db/exec/near.cpp b/src/mongo/db/exec/near.cpp
+index 05bc2735..4cb2e558 100644
+--- a/src/mongo/db/exec/near.cpp
++++ b/src/mongo/db/exec/near.cpp
+@@ -42,6 +42,21 @@ namespace mongo {
+ using std::unique_ptr;
+ using std::vector;
+ 
++/**
++ * Holds a generic search result with a distance computed in some fashion.
++ */
++struct NearStage::SearchResult {
++    SearchResult(WorkingSetID resultID, double distance) : resultID(resultID), distance(distance) {}
++
++    bool operator<(const SearchResult& other) const {
++        // We want increasing distance, not decreasing, so we reverse the <
++        return distance > other.distance;
++    }
++
++    WorkingSetID resultID;
++    double distance;
++};
++
+ NearStage::NearStage(ExpressionContext* expCtx,
+                      const char* typeName,
+                      StageType type,
+@@ -114,21 +129,6 @@ PlanStage::StageState NearStage::doWork(WorkingSetID* out) {
+     return nextState;
+ }
+ 
+-/**
+- * Holds a generic search result with a distance computed in some fashion.
+- */
+-struct NearStage::SearchResult {
+-    SearchResult(WorkingSetID resultID, double distance) : resultID(resultID), distance(distance) {}
+-
+-    bool operator<(const SearchResult& other) const {
+-        // We want increasing distance, not decreasing, so we reverse the <
+-        return distance > other.distance;
+-    }
+-
+-    WorkingSetID resultID;
+-    double distance;
+-};
+-
+ // Set "toReturn" when NEED_YIELD.
+ PlanStage::StageState NearStage::bufferNext(WorkingSetID* toReturn) {
+     //
+diff --git a/src/mongo/db/query/optimizer/cascades/logical_rewriter.cpp b/src/mongo/db/query/optimizer/cascades/logical_rewriter.cpp
+index 17052b69..ad68ce61 100644
+--- a/src/mongo/db/query/optimizer/cascades/logical_rewriter.cpp
++++ b/src/mongo/db/query/optimizer/cascades/logical_rewriter.cpp
+@@ -149,7 +149,7 @@ std::pair<GroupIdType, NodeIdSet> LogicalRewriter::addNode(const ABT& node,
+             continue;
+         }
+ 
+-        for (const auto [type, priority] : _activeRewriteSet) {
++        for (const auto& [type, priority] : _activeRewriteSet) {
+             auto& groupQueue = _memo.getLogicalRewriteQueue(nodeMemoId._groupId);
+             groupQueue.push(std::make_unique<LogicalRewriteEntry>(priority, type, nodeMemoId));
+ 
+diff --git a/src/mongo/db/query/stats/max_diff.cpp b/src/mongo/db/query/stats/max_diff.cpp
+index 93b33499..a27d5364 100644
+--- a/src/mongo/db/query/stats/max_diff.cpp
++++ b/src/mongo/db/query/stats/max_diff.cpp
+@@ -245,7 +245,7 @@ DataDistribution getDataDistribution(const std::vector<SBEValue>& sortedInput) {
+ 
+     // Compute normalized areas.
+     size_t i = 0;
+-    for (const auto [endIdx, area] : result.typeClassBounds) {
++    for (const auto& [endIdx, area] : result.typeClassBounds) {
+         // We ensure above that the area for the current type bracket is never 0.
+         tassert(7299703, str::stream() << "maximum area for type bracket is zero", area != 0.0);
+         // Iterate over all values in the current type bracket.
+diff --git a/src/mongo/s/write_ops/write_op.h b/src/mongo/s/write_ops/write_op.h
+index e6f268fc..5df27ddc 100644
+--- a/src/mongo/s/write_ops/write_op.h
++++ b/src/mongo/s/write_ops/write_op.h
+@@ -38,7 +38,7 @@
+ namespace mongo {
+ 
+ struct TargetedWrite;
+-struct ChildWriteOp;
++class WriteOp;
+ 
+ enum WriteOpState {
+     // Item is ready to be targeted
+@@ -62,6 +62,31 @@ enum WriteOpState {
+     WriteOpState_Unknown
+ };
+ 
++/**
++ * State of a write in-progress (to a single shard) which is one part of a larger write
++ * operation.
++ *
++ * As above, the write op may finish in either a successful (_Completed) or unsuccessful
++ * (_Error) state.
++ */
++struct ChildWriteOp {
++    ChildWriteOp(WriteOp* const parent) : parentOp(parent) {}
++
++    const WriteOp* const parentOp;
++
++    WriteOpState state{WriteOpState_Ready};
++
++    // non-zero when state == _Pending
++    // Not owned here but tracked for reporting
++    TargetedWrite* pendingWrite{nullptr};
++
++    // filled when state > _Pending
++    std::unique_ptr<ShardEndpoint> endpoint;
++
++    // filled when state == _Error or (optionally) when state == _Cancelled
++    boost::optional<write_ops::WriteError> error;
++};
++
+ /**
+  * State of a single write item in-progress from a client request.
+  *
+@@ -183,31 +208,6 @@ private:
+     // stores the shards where this write operation succeeded
+     absl::flat_hash_set<ShardId> _successfulShardSet;
+ };
+-/**
+- * State of a write in-progress (to a single shard) which is one part of a larger write
+- * operation.
+- *
+- * As above, the write op may finish in either a successful (_Completed) or unsuccessful
+- * (_Error) state.
+- */
+-struct ChildWriteOp {
+-    ChildWriteOp(WriteOp* const parent) : parentOp(parent) {}
+-
+-    const WriteOp* const parentOp;
+-
+-    WriteOpState state{WriteOpState_Ready};
+-
+-    // non-zero when state == _Pending
+-    // Not owned here but tracked for reporting
+-    TargetedWrite* pendingWrite{nullptr};
+-
+-    // filled when state > _Pending
+-    std::unique_ptr<ShardEndpoint> endpoint;
+-
+-    // filled when state == _Error or (optionally) when state == _Cancelled
+-    boost::optional<write_ops::WriteError> error;
+-};
+-
+ // First value is write item index in the batch, second value is child write op index
+ typedef std::pair<int, int> WriteOpRef;
+ 
+diff --git a/src/mongo/util/net/ssl_types.h b/src/mongo/util/net/ssl_types.h
+index bb65d271..284e07dd 100644
+--- a/src/mongo/util/net/ssl_types.h
++++ b/src/mongo/util/net/ssl_types.h
+@@ -61,6 +61,9 @@ public:
+         auto equalityLens() const {
+             return std::tie(oid, type, value);
+         }
++        bool operator==(const Entry& rhs) const {
++            return this->equalityLens() == rhs.equalityLens();
++        }
+     };
+ 
+     SSLX509Name() = default;
+@@ -110,9 +113,6 @@ private:
+ };
+ 
+ std::ostream& operator<<(std::ostream&, const SSLX509Name&);
+-inline bool operator==(const SSLX509Name::Entry& lhs, const SSLX509Name::Entry& rhs) {
+-    return lhs.equalityLens() == rhs.equalityLens();
+-}
+ inline bool operator<(const SSLX509Name::Entry& lhs, const SSLX509Name::Entry& rhs) {
+     return lhs.equalityLens() < rhs.equalityLens();
+ }
+diff --git a/src/third_party/abseil-cpp/dist/absl/hash/internal/low_level_hash.cc b/src/third_party/abseil-cpp/dist/absl/hash/internal/low_level_hash.cc
+index 6f9cb9c7..d288f3ec 100644
+--- a/src/third_party/abseil-cpp/dist/absl/hash/internal/low_level_hash.cc
++++ b/src/third_party/abseil-cpp/dist/absl/hash/internal/low_level_hash.cc
+@@ -40,7 +40,7 @@ static uint64_t Mix(uint64_t v0, uint64_t v1) {
+ }
+ 
+ uint64_t LowLevelHash(const void* data, size_t len, uint64_t seed,
+-                      const uint64_t salt[]) {
++                      const uint64_t salt[5]) {
+   const uint8_t* ptr = static_cast<const uint8_t*>(data);
+   uint64_t starting_length = static_cast<uint64_t>(len);
+   uint64_t current_state = seed ^ salt[0];
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
index 3d949c8730..31d4077f28 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Support-deprecated-resolver-functions.patch
@@ -1,7 +1,7 @@
-From 8d035e84c2edb44461ef4df9cdef0a6dfce0a1d7 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 24 Aug 2018 12:56:22 -0700
-Subject: [PATCH 07/10] Support deprecated resolver functions
+Subject: [PATCH] Support deprecated resolver functions
 
 Needed for  musl libc
 
@@ -12,12 +12,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/src/mongo/util/dns_query_posix-impl.h b/src/mongo/util/dns_query_posix-impl.h
-index a5e3629..fb29d2d 100644
+index e13879d3..451862e6 100644
 --- a/src/mongo/util/dns_query_posix-impl.h
 +++ b/src/mongo/util/dns_query_posix-impl.h
-@@ -54,6 +54,12 @@
- 
- #include <boost/noncopyable.hpp>
+@@ -57,6 +57,12 @@
+ #include "mongo/platform/mutex.h"
+ #include "mongo/util/duration.h"
  
 +#ifndef res_ninit
 +#define res_nclose(arg)
@@ -28,6 +28,3 @@ index a5e3629..fb29d2d 100644
  namespace mongo {
  namespace dns {
  // The anonymous namespace is safe, in this header, as it is not really a header.  It is only used
--- 
-2.7.4
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
deleted file mode 100644
index 4d84d3d15b..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 8295bb6a60896fed54d6450bca091aea4eea4fb2 Mon Sep 17 00:00:00 2001
-From: Vincent Prince <vincent.prince.fr@gmail.com>
-Date: Mon, 16 Sep 2019 13:21:44 +0200
-Subject: [PATCH 01/10] Tell scons to use build settings from environment
- variables
-
-Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
-Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
-
-Upstream-Status: Pending
----
- SConstruct | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 89c044ab78..2044c0ddb8 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -593,6 +593,7 @@ def variable_arch_converter(val):
-         'amd64':  'x86_64',
-         'emt64':   'x86_64',
-         'x86':    'i386',
-+        'aarch64': 'arm64',
-     }
-     val = val.lower()
- 
-@@ -723,7 +724,8 @@ env_vars.Add(
- )
- 
- env_vars.Add('CC',
--    help='Select the C compiler to use')
-+    help='Select the C compiler to use',
-+    default=os.getenv('CC'))
- 
- env_vars.Add('CCFLAGS',
-     help='Sets flags for the C and C++ compiler',
-@@ -743,7 +745,8 @@ env_vars.Add('CPPPATH',
-     converter=variable_shlex_converter)
- 
- env_vars.Add('CXX',
--    help='Select the C++ compiler to use')
-+    help='Select the C++ compiler to use',
-+    default=os.getenv('CXX'))
- 
- env_vars.Add('CXXFLAGS',
-     help='Sets flags for the C++ compiler',
-@@ -1127,6 +1130,7 @@ if get_option('build-tools') == 'next' or get_option('ninja') == 'next':
-     SCons.Tool.DefaultToolpath.insert(0, os.path.abspath('site_scons/site_tools/next'))
- 
- env = Environment(variables=env_vars, **envDict)
-+env.PrependENVPath('PATH', os.getenv('PATH'))
- 
- # Only print the spinner if stdout is a tty
- if sys.stdout.isatty():
--- 
-2.24.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
index 4594bec81a..a3999f5a76 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-The-std-lib-unary-binary_function-base-classes-are-d.patch
@@ -1,19 +1,23 @@
-From f9b55f5a1fab85bf73c95e6372779d6f50f75e84 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: jzmaddock <john@johnmaddock.co.uk>
 Date: Mon, 11 Jul 2022 18:26:07 +0100
 Subject: [PATCH] The std lib unary/binary_function base classes are
  deprecated/removed from libcpp15. Fixes
  https://github.com/boostorg/container_hash/issues/24.
 
+The bundled Boost 1.79 already has the container_hash part.
+
 Upstream-Status: Backport [https://github.com/boostorg/config/pull/440/commits/f0af4a9184457939b89110795ae2d293582c5f66]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/third_party/boost-1.70.0/boost/config/stdlib/libcpp.hpp | 9 +++++++++
+ src/third_party/boost/boost/config/stdlib/libcpp.hpp | 9 +++++++++
  1 file changed, 9 insertions(+)
 
---- a/src/third_party/boost-1.70.0/boost/config/stdlib/libcpp.hpp
-+++ b/src/third_party/boost-1.70.0/boost/config/stdlib/libcpp.hpp
-@@ -140,4 +140,13 @@
+diff --git a/src/third_party/boost/boost/config/stdlib/libcpp.hpp b/src/third_party/boost/boost/config/stdlib/libcpp.hpp
+index bc8536ea..0e9f2445 100644
+--- a/src/third_party/boost/boost/config/stdlib/libcpp.hpp
++++ b/src/third_party/boost/boost/config/stdlib/libcpp.hpp
+@@ -168,4 +168,13 @@
  #  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
  #endif
  
@@ -27,14 +31,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#endif
 +
  //  --- end ---
---- a/src/third_party/boost-1.70.0/boost/container_hash/hash.hpp
-+++ b/src/third_party/boost-1.70.0/boost/container_hash/hash.hpp
-@@ -118,7 +118,7 @@ namespace boost
- {
-     namespace hash_detail
-     {
--#if defined(_HAS_AUTO_PTR_ETC) && !_HAS_AUTO_PTR_ETC
-+#if defined(BOOST_NO_CXX98_FUNCTION_BASE)
-         template <typename T>
-         struct hash_base
-         {
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
index cfbcbd9aa2..d21bf2cc8e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
@@ -1,7 +1,7 @@
-From 6332823f9fdcb571305b716330e67d0b38810868 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Vincent Prince <vincent.prince.fr@gmail.com>
 Date: Mon, 16 Sep 2019 13:30:13 +0200
-Subject: [PATCH 03/10] Use __GLIBC__ to control use of gnu_get_libc_version
+Subject: [PATCH] Use __GLIBC__ to control use of gnu_get_libc_version
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
@@ -12,11 +12,11 @@ Upstream-Status: Pending
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/mongo/util/processinfo_linux.cpp b/src/mongo/util/processinfo_linux.cpp
-index a968c54727..0d8b8874e2 100644
+index a89b9570..7193cd47 100644
 --- a/src/mongo/util/processinfo_linux.cpp
 +++ b/src/mongo/util/processinfo_linux.cpp
-@@ -44,10 +44,10 @@
- #include <unistd.h>
+@@ -46,10 +46,10 @@
+ 
  #ifdef __BIONIC__
  #include <android/api-level.h>
 -#elif __UCLIBC__
@@ -29,7 +29,7 @@ index a968c54727..0d8b8874e2 100644
  #endif
  
  #include <boost/filesystem.hpp>
-@@ -617,7 +617,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() {
+@@ -810,7 +810,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() {
      std::stringstream ss;
      ss << "uClibc-" << __UCLIBC_MAJOR__ << "." << __UCLIBC_MINOR__ << "." << __UCLIBC_SUBLEVEL__;
      bExtra.append("libcVersion", ss.str());
@@ -38,6 +38,3 @@ index a968c54727..0d8b8874e2 100644
      bExtra.append("libcVersion", gnu_get_libc_version());
  #endif
      if (!verSig.empty())
--- 
-2.24.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
deleted file mode 100644
index 310301d57b..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 4e7f15346682482bc2071c7209dec97507d3bc4c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 2 Sep 2017 10:03:37 -0700
-Subject: [PATCH 02/10] Use long long instead of int64_t
-
-Fixes
-error: call to member function 'appendNumber' is ambiguous
-since this function expects long long as parameter and not int64_t
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
-
-Upstream-Status: Pending
----
- src/mongo/util/procparser.cpp | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/mongo/util/procparser.cpp b/src/mongo/util/procparser.cpp
-index 24b9d1e2c9..0f274cfff6 100644
---- a/src/mongo/util/procparser.cpp
-+++ b/src/mongo/util/procparser.cpp
-@@ -261,7 +261,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
- 
-                     StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
- 
--                    uint64_t value;
-+                    long long  value;
- 
-                     if (!NumberParser{}(stringValue, &value).isOK()) {
-                         value = 0;
-@@ -273,7 +273,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
-             } else {
-                 StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
- 
--                uint64_t value;
-+                long long value;
- 
-                 if (!NumberParser{}(stringValue, &value).isOK()) {
-                     value = 0;
-@@ -366,7 +366,7 @@ Status parseProcMemInfo(const std::vector<StringData>& keys,
- 
-             StringData stringValue((*partIt).begin(), (*partIt).end());
- 
--            uint64_t value;
-+            long long value;
- 
-             if (!NumberParser{}(stringValue, &value).isOK()) {
-                 value = 0;
-@@ -522,7 +522,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
-                           StringData data,
-                           BSONObjBuilder* builder) {
-     bool foundKeys = false;
--    std::vector<uint64_t> stats;
-+    std::vector<long long> stats;
-     stats.reserve(kDiskFieldCount);
- 
-     using string_split_iterator = boost::split_iterator<StringData::const_iterator>;
-@@ -597,7 +597,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
- 
-                 StringData stringValue((*partIt).begin(), (*partIt).end());
- 
--                uint64_t value;
-+                long long value;
- 
-                 if (!NumberParser{}(stringValue, &value).isOK()) {
-                     value = 0;
--- 
-2.24.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
index d45b9f8021..14a13aee81 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
@@ -10,25 +10,32 @@ load with:
 
 Use parse() from the packaging module instead.
 
-Upstream-Status: Inappropriate [v4.4 branch is EOL]
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
+ SConstruct                        | 2 +-
+ site_scons/site_tools/ccache.py   | 2 +-
+ site_scons/site_tools/icecream.py | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
 diff --git a/SConstruct b/SConstruct
+index 9750ca0b..e84797c6 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -16,7 +16,7 @@
- import uuid
+@@ -19,7 +19,7 @@ import uuid
+ from datetime import datetime
  from glob import glob
  
 -from pkg_resources import parse_version
 +from packaging.version import parse as parse_version
  
  import SCons
- 
+ import SCons.Script
 diff --git a/site_scons/site_tools/ccache.py b/site_scons/site_tools/ccache.py
+index dc7ca4cd..e0c20554 100644
 --- a/site_scons/site_tools/ccache.py
 +++ b/site_scons/site_tools/ccache.py
-@@ -26,7 +26,7 @@
+@@ -26,7 +26,7 @@ import re
  import subprocess
  
  import SCons
@@ -38,9 +45,10 @@ diff --git a/site_scons/site_tools/ccache.py b/site_scons/site_tools/ccache.py
  # This is the oldest version of ccache that offers support for -gsplit-dwarf
  _ccache_version_min = parse_version("3.2.3")
 diff --git a/site_scons/site_tools/icecream.py b/site_scons/site_tools/icecream.py
+index e7340b51..44b11062 100644
 --- a/site_scons/site_tools/icecream.py
 +++ b/site_scons/site_tools/icecream.py
-@@ -25,7 +25,7 @@
+@@ -25,7 +25,7 @@ import re
  import subprocess
  import urllib
  
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch
deleted file mode 100644
index de05624429..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ad37ee80b32a1f740a3197105174d74dff11e4e8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Apr 2022 13:56:32 -0700
-Subject: [PATCH] add explict static_cast<size_t> to maxMemoryUsageBytes
-
-Fixes
-src/mongo/db/pipeline/document_source_group.cpp:377:22: error: non-constant-expression cannot be narrowed from type 'long long' to 'size_t' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
-                     maxMemoryUsageBytes ? *maxMemoryUsageBytes
-                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-src/mongo/db/pipeline/document_source_group.cpp:377:22: note: insert an explicit cast to silence this issue
-                     maxMemoryUsageBytes ? *maxMemoryUsageBytes
-                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/db/pipeline/document_source_group.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/mongo/db/pipeline/document_source_group.cpp b/src/mongo/db/pipeline/document_source_group.cpp
-index 4a7b48d6cd2..9a6076c6041 100644
---- a/src/mongo/db/pipeline/document_source_group.cpp
-+++ b/src/mongo/db/pipeline/document_source_group.cpp
-@@ -374,8 +374,8 @@ DocumentSourceGroup::DocumentSourceGroup(const intrusive_ptr<ExpressionContext>&
-       _usedDisk(false),
-       _doingMerge(false),
-       _memoryTracker{pExpCtx->allowDiskUse && !pExpCtx->inMongos,
--                     maxMemoryUsageBytes ? *maxMemoryUsageBytes
--                                         : internalDocumentSourceGroupMaxMemoryBytes.load()},
-+                     static_cast<size_t>(maxMemoryUsageBytes ? *maxMemoryUsageBytes
-+                                         : internalDocumentSourceGroupMaxMemoryBytes.load())},
-       // We spill to disk in debug mode, regardless of allowDiskUse, to stress the system.
-       _file(!pExpCtx->inMongos && (pExpCtx->allowDiskUse || kDebugBuild)
-                 ? std::make_shared<Sorter<Value, Value>::File>(pExpCtx->tempDir + "/" +
--- 
-2.35.2
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch
index 096269308d..23f3a52bce 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-apply-msvc-workaround-for-clang-16.patch
@@ -1,4 +1,4 @@
-From 03047c81b2601362bcf79cae67e06d1fba0a6101 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 2 Mar 2023 20:17:57 -0800
 Subject: [PATCH] apply msvc workaround for clang >= 16
@@ -11,13 +11,13 @@ boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp:73:31: error: integer value -1
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- .../boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp            | 2 +-
+ src/third_party/boost/boost/mpl/aux_/integral_wrapper.hpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/third_party/boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp b/src/third_party/boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp
-index 6bc05f7e96e..6bb8d24c9ce 100644
---- a/src/third_party/boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp
-+++ b/src/third_party/boost-1.70.0/boost/mpl/aux_/integral_wrapper.hpp
+diff --git a/src/third_party/boost/boost/mpl/aux_/integral_wrapper.hpp b/src/third_party/boost/boost/mpl/aux_/integral_wrapper.hpp
+index 8748fbb9..e7c2461c 100644
+--- a/src/third_party/boost/boost/mpl/aux_/integral_wrapper.hpp
++++ b/src/third_party/boost/boost/mpl/aux_/integral_wrapper.hpp
 @@ -56,7 +56,7 @@ struct AUX_WRAPPER_NAME
  // have to #ifdef here: some compilers don't like the 'N + 1' form (MSVC),
  // while some other don't like 'value + 1' (Borland), and some don't like
@@ -27,6 +27,3 @@ index 6bc05f7e96e..6bb8d24c9ce 100644
   private:
      BOOST_STATIC_CONSTANT(AUX_WRAPPER_VALUE_TYPE, next_value = BOOST_MPL_AUX_STATIC_CAST(AUX_WRAPPER_VALUE_TYPE, (N + 1)));
      BOOST_STATIC_CONSTANT(AUX_WRAPPER_VALUE_TYPE, prior_value = BOOST_MPL_AUX_STATIC_CAST(AUX_WRAPPER_VALUE_TYPE, (N - 1)));
--- 
-2.39.2
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
deleted file mode 100644
index ad944e4666..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 097e8a66930cfa28ac8bfa35f62d0a9ee3b74488 Mon Sep 17 00:00:00 2001
-From: Vincent Prince <vincent.prince.fr@gmail.com>
-Date: Mon, 16 Sep 2019 13:46:52 +0200
-Subject: [PATCH 10/10] asio: Dont use experimental with clang
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
-
-Upstream-Status: Pending
----
- src/third_party/asio-master/asio/include/asio/detail/string_view.hpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
-index f09cebc..fa307b5 100644
---- a/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
-+++ b/src/third_party/asio-master/asio/include/asio/detail/string_view.hpp
-@@ -33,8 +33,8 @@ namespace asio {
- using std::basic_string_view;
- using std::string_view;
- #elif defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
--using std::experimental::basic_string_view;
--using std::experimental::string_view;
-+using std::basic_string_view;
-+using std::string_view;
- #endif // defined(ASIO_HAS_STD_EXPERIMENTAL_STRING_VIEW)
- 
- } // namespace asio
--- 
-2.7.4
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-distsrc-Use-shutil.which-instead-of-distutils.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-distsrc-Use-shutil.which-instead-of-distutils.patch
new file mode 100644
index 0000000000..e86ab0a448
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-distsrc-Use-shutil.which-instead-of-distutils.patch
@@ -0,0 +1,40 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 23 Nov 2026 07:52:25 -0800
+Subject: [PATCH] distsrc: Use shutil.which instead of distutils
+
+distutils was removed from the standard library in Python 3.12, and
+the copy that setuptools provides is deprecated. The distsrc tool is
+always loaded, so the build fails when distutils is not available.
+
+Use shutil.which(), which distsrc.py already imports shutil for.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ site_scons/site_tools/distsrc.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/site_scons/site_tools/distsrc.py b/site_scons/site_tools/distsrc.py
+index 83f47f2a..a6871d95 100644
+--- a/site_scons/site_tools/distsrc.py
++++ b/site_scons/site_tools/distsrc.py
+@@ -30,8 +30,6 @@ import time
+ import zipfile
+ import io
+ 
+-from distutils.spawn import find_executable
+-
+ __distsrc_callbacks = []
+ 
+ 
+@@ -176,7 +174,7 @@ def distsrc_action_generator(source, target, env, for_signature):
+     # using the env.
+     git_path = env.WhereIs("git")
+     if not git_path:
+-        git_path = find_executable("git")
++        git_path = shutil.which("git")
+ 
+     if not git_path:
+         return build_error_action("Could not find git - cannot create distsrc archive")
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
deleted file mode 100644
index 581c2390ec..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 383b1dda4800c2514cb31446cd7478692d7d26cf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 Mar 2021 12:43:16 -0800
-Subject: [PATCH] include needed c++ header
-
-Fixes
-plan_stats.h:214:10: error: 'optional' in namespace 'std' does not name a template type
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/db/exec/plan_stats.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/mongo/db/exec/plan_stats.h b/src/mongo/db/exec/plan_stats.h
-index ea75f673b8..0cc9b4636d 100644
---- a/src/mongo/db/exec/plan_stats.h
-+++ b/src/mongo/db/exec/plan_stats.h
-@@ -31,6 +31,7 @@
- 
- #include <cstdint>
- #include <cstdlib>
-+#include <optional>
- #include <string>
- #include <vector>
- 
--- 
-2.30.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
index 51926b9d2e..6407d19bd0 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
@@ -1,4 +1,4 @@
-From 37580777bc5294d606584f3731d9f5f5425bb587 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Awais B <awais.b@rufilla.com>
 Date: Tue, 4 Mar 2025 11:27:10 +0000
 Subject: [PATCH] moduleconfig.py: python 3.12 compatibility
@@ -14,7 +14,7 @@ Signed-off-by: Awais B <awais.b@rufilla.com>
  1 file changed, 14 insertions(+), 7 deletions(-)
 
 diff --git a/buildscripts/moduleconfig.py b/buildscripts/moduleconfig.py
-index b4d0bba0490..69dd91ab30d 100644
+index 3076e22b..22de3380 100644
 --- a/buildscripts/moduleconfig.py
 +++ b/buildscripts/moduleconfig.py
 @@ -27,7 +27,8 @@ MongoDB SConscript files do.
@@ -27,7 +27,7 @@ index b4d0bba0490..69dd91ab30d 100644
  import inspect
  import os
  
-@@ -71,12 +72,18 @@ def discover_modules(module_root, allowed_modules):
+@@ -70,12 +71,18 @@ def discover_modules(module_root, allowed_modules):
              print("adding module: %s" % (name))
              fp = open(build_py, "r")
              try:
@@ -52,6 +52,3 @@ index b4d0bba0490..69dd91ab30d 100644
              finally:
                  fp.close()
          except (FileNotFoundError, IOError):
--- 
-2.34.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
deleted file mode 100644
index 52c9df9b1b..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cache-alignment-assumptions.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5c9e0d0fc9188bab0ae09c9c33df01938b0c1b6c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 14 Apr 2022 09:25:33 -0700
-Subject: [PATCH] server: Adjust the cache alignment assumptions
-
-aarch64 has 256 for hardware_destructive_interference_size and gcc 12
-has added a warning to complain about mismatches which results in
-static_assert failures
-
-In file included from src/mongo/s/commands/cluster_find_cmd.cpp:39:
-src/mongo/db/stats/counters.h:185:47: error: static assertion failed: cache line spill
- 185 |     static_assert(sizeof(decltype(_together)) <= stdx::hardware_constructive_interference_size,
-     |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-The structure need to ensure true sharing for both the elements
-so align it to hardware_constructive_interference_size instead
-
-Upstream-Status: Inappropriate [https://jira.mongodb.org/browse/SERVER-65664]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/db/stats/counters.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/src/mongo/db/stats/counters.h
-+++ b/src/mongo/db/stats/counters.h
-@@ -182,8 +182,8 @@ private:
-         AtomicWord<long long> requests{0};
-     };
-     CacheAligned<Together> _together{};
--    static_assert(sizeof(decltype(_together)) <= stdx::hardware_constructive_interference_size,
--                  "cache line spill");
-+    static_assert(sizeof(Together) <= stdx::hardware_constructive_interference_size,
-+                   "cache line spill");
- 
-     CacheAligned<AtomicWord<long long>> _logicalBytesOut{0};
- 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
deleted file mode 100644
index a92883516c..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-stacktrace-Define-ARCH_BITS-for-x86.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From efd79bda1b85a5a4398a71e5ea2bc00ee4b0ea46 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Sep 2020 18:20:27 -0700
-Subject: [PATCH] stacktrace: Define ARCH_BITS for x86
-
-stacktrace_somap.cpp:92:33: error: 'ELFCLASSARCH_BITS' was not declared in this scope
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/util/stacktrace_somap.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mongo/util/stacktrace_somap.cpp b/src/mongo/util/stacktrace_somap.cpp
-index f7ba66a142..2231948ce8 100644
---- a/src/mongo/util/stacktrace_somap.cpp
-+++ b/src/mongo/util/stacktrace_somap.cpp
-@@ -83,7 +83,7 @@ void addUnameToSoMap(BSONObjBuilder* soMap) {
- #define ARCH_BITS __ELF_NATIVE_CLASS
- #elif defined(__x86_64__) || defined(__aarch64__)
- #define ARCH_BITS 64
--#elif defined(__arm__)
-+#elif defined(__i386__) || defined(__arm__)
- #define ARCH_BITS 32
- #else
- #error Unknown target architecture.
--- 
-2.28.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch
index abe6898554..91c1f521f3 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch
@@ -1,4 +1,4 @@
-From 0508c1518c2e7c586a231d344e9f93b08507885b Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 31 Dec 2022 14:23:40 -0800
 Subject: [PATCH] wiredtiger: Avoid using off64_t
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/third_party/wiredtiger/src/os_posix/os_fs.c b/src/third_party/wiredtiger/src/os_posix/os_fs.c
-index 3898eb74343..9ce2d5edb38 100644
+index bfc8f40e..a1de7596 100644
 --- a/src/third_party/wiredtiger/src/os_posix/os_fs.c
 +++ b/src/third_party/wiredtiger/src/os_posix/os_fs.c
-@@ -533,7 +533,7 @@ __posix_file_sync_nowait(WT_FILE_HANDLE *file_handle, WT_SESSION *wt_session)
+@@ -546,7 +546,7 @@ __posix_file_sync_nowait(WT_FILE_HANDLE *file_handle, WT_SESSION *wt_session)
      pfh = (WT_FILE_HANDLE_POSIX *)file_handle;
  
      /* See comment in __posix_sync(): sync cannot be retried or fail. */
@@ -25,6 +25,3 @@ index 3898eb74343..9ce2d5edb38 100644
      if (ret == 0)
          return (0);
  
--- 
-2.39.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
deleted file mode 100644
index d1e662f291..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 28f34191eef1e70c24d2f81b66e4dd40dbefcd35 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 2 Sep 2017 12:42:30 -0700
-Subject: [PATCH 04/10] Add a definition for the macro __ELF_NATIVE_CLASS
-
-It depends on the native arch's word size.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
-
-Upstream-Status: Pending
----
- src/mongo/util/stacktrace_posix.cpp | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/src/mongo/util/stacktrace_posix.cpp b/src/mongo/util/stacktrace_posix.cpp
-index 531e21bdc2..fa611499e4 100644
---- a/src/mongo/util/stacktrace_posix.cpp
-+++ b/src/mongo/util/stacktrace_posix.cpp
-@@ -42,6 +42,15 @@
- #include <iostream>
- #include <string>
- 
-+#if !defined(__GLIBC__)
-+#if defined __x86_64__ && !defined __ILP32__
-+# define __WORDSIZE    64
-+#else
-+# define __WORDSIZE    32
-+#endif
-+#define __ELF_NATIVE_CLASS __WORDSIZE
-+#endif
-+
- #include "mongo/base/init.h"
- #include "mongo/bson/json.h"
- #include "mongo/config.h"
--- 
-2.24.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
index 59066b2600..86c1a0eb5c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Fix-default-stack-size-to-256K.patch
@@ -1,7 +1,7 @@
-From ffe6045b190b735601cd209d3e7ac121604c5a4e Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 24 Aug 2018 13:07:01 -0700
-Subject: [PATCH 08/10] Fix default stack size to 256K
+Subject: [PATCH] Fix default stack size to 256K
 
 On musl default stack size is ~80K which is too low
 for mongodb
@@ -10,11 +10,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/mongo/platform/stack_locator_pthread_getattr_np.cpp | 10 ++++++++++
+ .../platform/stack_locator_pthread_getattr_np.cpp      | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
 diff --git a/src/mongo/platform/stack_locator_pthread_getattr_np.cpp b/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
-index 4f3044c..68e47e3 100644
+index 4f3044c5..68e47e3c 100644
 --- a/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
 +++ b/src/mongo/platform/stack_locator_pthread_getattr_np.cpp
 @@ -36,6 +36,16 @@
@@ -34,6 +34,3 @@ index 4f3044c..68e47e3 100644
  namespace mongo {
  
  StackLocator::StackLocator() {
--- 
-2.7.4
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
deleted file mode 100644
index d4b5586a97..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Mon, 9 Nov 2026 08:10:00 -0800
-Subject: [PATCH] SConstruct: Pass call to CheckLibWithHeader as a keyword
-
-Newer SCons added an extra_libs parameter to CheckLibWithHeader() ahead
-of call, so the call snippet passed positionally is treated as a list of
-extra libraries and each character becomes a -l option:
-
-  ... -lcrypto -lS -lS -lL -le -la -ly ... -l( -l0 -l) -l;
-  Couldn't find OpenSSL crypto.h header and library
-
-Pass it as a keyword argument, which works with old and new SCons.
-
-Upstream-Status: Inappropriate [v4.4 branch is EOL]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
-diff --git a/SConstruct b/SConstruct
---- a/SConstruct
-+++ b/SConstruct
-@@ -3499,7 +3499,7 @@
-                 cryptoLibName,
-                 ["openssl/crypto.h"],
-                 "C",
--                "SSLeay_version(0);",
-+                call="SSLeay_version(0);",
-                 autoadd=True):
-             maybeIssueDarwinSSLAdvice(conf.env)
-             conf.env.ConfError("Couldn't find OpenSSL crypto.h header and library")
-@@ -3656,7 +3656,7 @@
-         if conf.CheckLibWithHeader(
-             "curl",
-             ["curl/curl.h"], "C",
--            "curl_global_init(0);",
-+            call="curl_global_init(0);",
-             autoadd=False):
-             return True
- 
-@@ -3782,7 +3782,7 @@
-             "sasl2",
-             ["stddef.h","sasl/sasl.h"],
-             "C",
--            "sasl_version_info(0, 0, 0, 0, 0, 0);",
-+            call="sasl_version_info(0, 0, 0, 0, 0, 0);",
-             autoadd=False ):
-         myenv.ConfError("Couldn't find SASL header/libraries")
- 
-@@ -3947,7 +3947,7 @@
-                 ["mongoc-1.0"],
-                 ["mongoc/mongoc.h"],
-                 "C",
--                "mongoc_get_major_version();",
-+                call="mongoc_get_major_version();",
-                 autoadd=False ):
-             conf.env['MONGO_HAVE_LIBMONGOC'] = "library"
-         if not conf.env['MONGO_HAVE_LIBMONGOC'] and env.TargetOSIs('darwin') and conf.CheckMongoCFramework():
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
deleted file mode 100644
index d2ba6eb805..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/SConstruct
-===================================================================
---- git.orig/SConstruct
-+++ git/SConstruct
-@@ -977,6 +977,14 @@ env_vars.Add('WINDOWS_OPENSSL_BIN',
-     help='Sets the path to the openssl binaries for packaging',
-     default='c:/openssl/bin')
- 
-+env_vars.Add('PREFIX',
-+    help='installation prefix')
-+
-+env_vars.Add('prefix',
-+    help='installation prefix')
-+
-+
-+
- # -- Validate user provided options --
- 
- # A dummy environment that should *only* have the variables we have set. In practice it has
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
index 3a188033f6..4be0805a22 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
@@ -3,7 +3,7 @@ From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Mon, 9 Nov 2026 09:00:00 -0800
 Subject: [PATCH] boost: Fix build with clang 23
 
-Backport fixes from newer Boost to the bundled Boost 1.70:
+Backport fixes from newer Boost to the bundled Boost 1.79:
 
 - numeric_conversion and log: use boost::integral_constant instead of
   mpl::integral_c for enum constants. mpl::integral_c computes the
@@ -21,10 +21,17 @@ Backport fixes from newer Boost to the bundled Boost 1.70:
 Upstream-Status: Backport [https://github.com/boostorg/numeric_conversion/commit/50a1eae942effb0a9b90724323ef8f2a67e7984a https://github.com/boostorg/log/commit/77f1e20bd69c2e7a9e25e6a9818ae6105f7d070c https://github.com/boostorg/thread/commit/49ccf9c30a0ca556873dbf64b12b0d741d1b3e66]
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
-diff --git a/src/third_party/boost-1.70.0/boost/log/utility/strictest_lock.hpp b/src/third_party/boost-1.70.0/boost/log/utility/strictest_lock.hpp
-index 5dd48b4f..05c7a037 100644
---- a/src/third_party/boost-1.70.0/boost/log/utility/strictest_lock.hpp
-+++ b/src/third_party/boost-1.70.0/boost/log/utility/strictest_lock.hpp
+ .../boost/boost/log/utility/strictest_lock.hpp  | 17 +++++++++--------
+ .../conversion/detail/int_float_mixture.hpp     | 10 +++++-----
+ .../numeric/conversion/detail/sign_mixture.hpp  | 10 +++++-----
+ .../conversion/detail/udt_builtin_mixture.hpp   | 10 +++++-----
+ src/third_party/boost/boost/thread/future.hpp   |  2 +-
+ 5 files changed, 25 insertions(+), 24 deletions(-)
+
+diff --git a/src/third_party/boost/boost/log/utility/strictest_lock.hpp b/src/third_party/boost/boost/log/utility/strictest_lock.hpp
+index accc8b7a..80e71bde 100644
+--- a/src/third_party/boost/boost/log/utility/strictest_lock.hpp
++++ b/src/third_party/boost/boost/log/utility/strictest_lock.hpp
 @@ -17,6 +17,7 @@
  #define BOOST_LOG_UTILITY_STRICTEST_LOCK_HPP_INCLUDED_
  
@@ -86,10 +93,10 @@ index 5dd48b4f..05c7a037 100644
  {
  };
  
-diff --git a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/int_float_mixture.hpp b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/int_float_mixture.hpp
+diff --git a/src/third_party/boost/boost/numeric/conversion/detail/int_float_mixture.hpp b/src/third_party/boost/boost/numeric/conversion/detail/int_float_mixture.hpp
 index 464e5275..7690d07a 100644
---- a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/int_float_mixture.hpp
-+++ b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/int_float_mixture.hpp
+--- a/src/third_party/boost/boost/numeric/conversion/detail/int_float_mixture.hpp
++++ b/src/third_party/boost/boost/numeric/conversion/detail/int_float_mixture.hpp
 @@ -16,15 +16,15 @@
  #include "boost/numeric/conversion/int_float_mixture_enum.hpp"
  #include "boost/numeric/conversion/detail/meta.hpp"
@@ -111,10 +118,10 @@ index 464e5275..7690d07a 100644
  
    // Metafunction:
    //
-diff --git a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/sign_mixture.hpp b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/sign_mixture.hpp
+diff --git a/src/third_party/boost/boost/numeric/conversion/detail/sign_mixture.hpp b/src/third_party/boost/boost/numeric/conversion/detail/sign_mixture.hpp
 index c7f9e42a..fde15840 100644
---- a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/sign_mixture.hpp
-+++ b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/sign_mixture.hpp
+--- a/src/third_party/boost/boost/numeric/conversion/detail/sign_mixture.hpp
++++ b/src/third_party/boost/boost/numeric/conversion/detail/sign_mixture.hpp
 @@ -16,15 +16,15 @@
  #include "boost/numeric/conversion/sign_mixture_enum.hpp"
  #include "boost/numeric/conversion/detail/meta.hpp"
@@ -136,10 +143,10 @@ index c7f9e42a..fde15840 100644
  
    // Metafunction:
    //
-diff --git a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
+diff --git a/src/third_party/boost/boost/numeric/conversion/detail/udt_builtin_mixture.hpp b/src/third_party/boost/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
 index 36dbc491..a39d29fd 100644
---- a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
-+++ b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
+--- a/src/third_party/boost/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
++++ b/src/third_party/boost/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
 @@ -15,15 +15,15 @@
  #include "boost/numeric/conversion/udt_builtin_mixture_enum.hpp"
  #include "boost/numeric/conversion/detail/meta.hpp"
@@ -161,10 +168,10 @@ index 36dbc491..a39d29fd 100644
  
    // Metafunction:
    //
-diff --git a/src/third_party/boost-1.70.0/boost/thread/future.hpp b/src/third_party/boost-1.70.0/boost/thread/future.hpp
-index 3d1b29d4..2862fc0a 100644
---- a/src/third_party/boost-1.70.0/boost/thread/future.hpp
-+++ b/src/third_party/boost-1.70.0/boost/thread/future.hpp
+diff --git a/src/third_party/boost/boost/thread/future.hpp b/src/third_party/boost/boost/thread/future.hpp
+index bbf0ffc8..989babac 100644
+--- a/src/third_party/boost/boost/thread/future.hpp
++++ b/src/third_party/boost/boost/thread/future.hpp
 @@ -4669,7 +4669,7 @@ namespace detail
        }
        run_it& operator=(BOOST_THREAD_RV_REF(run_it) x) BOOST_NOEXCEPT {
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
index fdf6852119..9189780983 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
@@ -5,34 +5,49 @@ Subject: [PATCH] ssl: Fix build with OpenSSL 4
 
 OpenSSL 4 makes ASN1_STRING opaque, removes ASN1_STRING_data() and
 ERR_remove_state(), and returns const pointers from
-X509_EXTENSION_get_object() and X509_EXTENSION_get_data().
+X509_EXTENSION_get_object(), X509_EXTENSION_get_data(),
+X509_get_subject_name() and X509_get_issuer_name().
 
 Use the ASN1_STRING accessors, which are available since OpenSSL 1.1,
-make the extension pointers const, and only call ERR_remove_state() with
-OpenSSL older than 1.1, where it is not a no-op.
+make the extension and name pointers const, and only call
+ERR_remove_state() with OpenSSL older than 1.1, where it is not a
+no-op.
 
-Upstream-Status: Inappropriate [v4.4 branch is EOL]
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
+ src/mongo/util/net/openssl_init.cpp        |  2 ++
+ src/mongo/util/net/ssl_manager_openssl.cpp | 42 ++++++++++++----------
+ 2 files changed, 26 insertions(+), 18 deletions(-)
+
 diff --git a/src/mongo/util/net/openssl_init.cpp b/src/mongo/util/net/openssl_init.cpp
-index c4980bb0..93b6e4fc 100644
+index 794c2b99..dec88c8d 100644
 --- a/src/mongo/util/net/openssl_init.cpp
 +++ b/src/mongo/util/net/openssl_init.cpp
-@@ -77,7 +77,9 @@ public:
+@@ -87,7 +87,9 @@ public:
  
          // The `guard` callback will cause an invocation of `getID`, so it must be destroyed first.
          static thread_local ManagedId managedId;
 +#if OPENSSL_VERSION_NUMBER < 0x10100000L
-         static thread_local auto guard = makeGuard([] { ERR_remove_state(0); });
+         static thread_local ScopeGuard guard([] { ERR_remove_state(0); });
 +#endif
  
          return managedId.id;
      }
 diff --git a/src/mongo/util/net/ssl_manager_openssl.cpp b/src/mongo/util/net/ssl_manager_openssl.cpp
-index 60cde955..fa55bb7d 100644
+index 0a6d51bb..a64d4dec 100644
 --- a/src/mongo/util/net/ssl_manager_openssl.cpp
 +++ b/src/mongo/util/net/ssl_manager_openssl.cpp
-@@ -1433,7 +1433,10 @@ SSLX509Name getCertificateSubjectX509Name(X509* cert) {
+@@ -378,7 +378,7 @@ UniqueStackOfX509 SSLgetVerifiedChain(SSL* s) {
+     return UniqueStackOfX509(X509_STORE_CTX_get1_chain(ctx.get()));
+ }
+ 
+-SSLX509Name convertX509ToSSLX509Name(X509_NAME* x509Name) {
++SSLX509Name convertX509ToSSLX509Name(const X509_NAME* x509Name) {
+     std::vector<std::vector<SSLX509Name::Entry>> entries;
+ 
+     int count = X509_NAME_entry_count(x509Name);
+@@ -406,7 +406,10 @@ SSLX509Name convertX509ToSSLX509Name(X509_NAME* x509Name) {
  
          const auto* str = X509_NAME_ENTRY_get_data(entry);
          rdn.emplace_back(
@@ -44,7 +59,7 @@ index 60cde955..fa55bb7d 100644
      }
      if (!rdn.empty()) {
          entries.push_back(std::move(rdn));
-@@ -2904,7 +2907,7 @@ Future<SSLPeerInfo> SSLManagerOpenSSL::parseAndValidatePeerCertificate(
+@@ -3394,7 +3397,7 @@ Future<SSLPeerInfo> SSLManagerOpenSSL::parseAndValidatePeerCertificate(
              const GENERAL_NAME* currentName = sk_GENERAL_NAME_value(sanNames, i);
              if (currentName && currentName->type == GEN_DNS) {
                  std::string dnsName(
@@ -53,7 +68,7 @@ index 60cde955..fa55bb7d 100644
                  auto swCIDRDNSName = CIDR::parse(dnsName);
                  if (swCIDRDNSName.isOK()) {
                      LOGV2_WARNING(23237,
-@@ -2925,14 +2928,16 @@ Future<SSLPeerInfo> SSLManagerOpenSSL::parseAndValidatePeerCertificate(
+@@ -3415,14 +3418,16 @@ Future<SSLPeerInfo> SSLManagerOpenSSL::parseAndValidatePeerCertificate(
                  auto ipAddrStruct = currentName->d.iPAddress;
                  struct sockaddr_storage ss;
                  memset(&ss, 0, sizeof(ss));
@@ -74,28 +89,37 @@ index 60cde955..fa55bb7d 100644
                  }
                  auto ipAddress =
                      SockAddr(reinterpret_cast<struct sockaddr*>(&ss), sizeof(ss)).getAddr();
-@@ -3026,15 +3031,16 @@ StatusWith<stdx::unordered_set<RoleName>> SSLManagerOpenSSL::_parsePeerRoles(X50
-     stdx::unordered_set<RoleName> roles;
+@@ -3518,22 +3523,22 @@ StatusWith<SSLManagerOpenSSL::ParsedPeerExtensions> SSLManagerOpenSSL::_parsePee
+     ParsedPeerExtensions parsed;
      for (int i = 0; i < extCount; i++) {
          X509_EXTENSION* ex = sk_X509_EXTENSION_value(exts, i);
 -        ASN1_OBJECT* obj = X509_EXTENSION_get_object(ex);
 +        const ASN1_OBJECT* obj = X509_EXTENSION_get_object(ex);
  
          if (!OBJ_cmp(obj, rolesObj)) {
-             // We've found an extension which has our roles OID
+             // mongodbRoles extension.
 -            ASN1_OCTET_STRING* data = X509_EXTENSION_get_data(ex);
+-            auto ptr = reinterpret_cast<char*>(data->data);
+-            auto swRoles = parsePeerRoles(ConstDataRange(ptr, ptr + data->length));
 +            const ASN1_OCTET_STRING* data = X509_EXTENSION_get_data(ex);
- 
-             return parsePeerRoles(
--                ConstDataRange(reinterpret_cast<char*>(data->data),
--                               reinterpret_cast<char*>(data->data) + data->length));
-+                ConstDataRange(reinterpret_cast<const char*>(ASN1_STRING_get0_data(data)),
-+                               reinterpret_cast<const char*>(ASN1_STRING_get0_data(data)) +
-+                                   ASN1_STRING_length(data)));
-         }
-     }
- 
-@@ -3054,14 +3060,15 @@ StatusWith<boost::optional<std::vector<DERInteger>>> SSLManagerOpenSSL::_parseTL
++            auto ptr = reinterpret_cast<const char*>(ASN1_STRING_get0_data(data));
++            auto swRoles = parsePeerRoles(ConstDataRange(ptr, ptr + ASN1_STRING_length(data)));
+             if (!swRoles.isOK()) {
+                 return std::move(swRoles.getStatus());
+             }
+             parsed.roles = std::move(swRoles.getValue());
+         } else if (!OBJ_cmp(obj, clusterMembershipObj)) {
+             // mongodbClusterMembership extension.
+-            ASN1_OCTET_STRING* data = X509_EXTENSION_get_data(ex);
+-            auto ptr = reinterpret_cast<char*>(data->data);
+-            auto swMembership = parseDERString(ConstDataRange(ptr, ptr + data->length));
++            const ASN1_OCTET_STRING* data = X509_EXTENSION_get_data(ex);
++            auto ptr = reinterpret_cast<const char*>(ASN1_STRING_get0_data(data));
++            auto swMembership = parseDERString(ConstDataRange(ptr, ptr + ASN1_STRING_length(data)));
+             if (!swMembership.isOK()) {
+                 return std::move(swMembership.getStatus());
+             }
+@@ -3557,14 +3562,15 @@ StatusWith<boost::optional<std::vector<DERInteger>>> SSLManagerOpenSSL::_parseTL
      ASN1_OBJECT* featuresObj = OBJ_nid2obj(NID_tlsfeature);
      for (int i = 0; i < extCount; i++) {
          X509_EXTENSION* ex = sk_X509_EXTENSION_value(exts, i);
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
index 45051e103d..90df14fc7a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
@@ -1,7 +1,7 @@
-From cc95a8878fa581b164dee8fb1f07b05b9d919ef0 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 2 Sep 2017 13:13:15 -0700
-Subject: [PATCH 09/10] wiredtiger: Disable strtouq on musl
+Subject: [PATCH] wiredtiger: Disable strtouq on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -11,7 +11,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/third_party/wiredtiger/build_linux/wiredtiger_config.h b/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
-index 82e9994..0399a67 100644
+index 82e99943..0399a67c 100644
 --- a/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
 +++ b/src/third_party/wiredtiger/build_linux/wiredtiger_config.h
 @@ -104,7 +104,7 @@
@@ -23,6 +23,3 @@ index 82e9994..0399a67 100644
  
  /* Define to 1 if you have the `sync_file_range' function. */
  /* #undef HAVE_SYNC_FILE_RANGE */
--- 
-2.7.4
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
deleted file mode 100644
index b2d1d92f30..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Yuhong Zhang <danielzhangyh@gmail.com>
-Date: Thu, 9 Jul 2020 15:43:33 +0000
-Subject: [PATCH] SERVER-49099 Remove the Node::swap() function in Biggie
-
-The Node and Head swap() friends and the copy-and-swap assignment
-operators built on them are unused and do not compile: Node::swap()
-does not exist and Node has no trieKey, depth, data or children
-members (they are _-prefixed). This went unnoticed because they are
-in a class template that never instantiates them.
-
-Upstream-Status: Backport [https://github.com/mongodb/mongo/commit/77ffbcb4f5673b154fe64872cba9f34ce97bc55d]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- src/mongo/db/storage/biggie/store.h | 21 ---------------------
- 1 file changed, 21 deletions(-)
-
-diff --git a/src/mongo/db/storage/biggie/store.h b/src/mongo/db/storage/biggie/store.h
-index a09b5b4..aeaa337 100644
---- a/src/mongo/db/storage/biggie/store.h
-+++ b/src/mongo/db/storage/biggie/store.h
-@@ -809,18 +809,6 @@ private:
- 
-         virtual ~Node() = default;
- 
--        friend void swap(Node& first, Node& second) {
--            std::swap(first.trieKey, second.trieKey);
--            std::swap(first.depth, second.depth);
--            std::swap(first.data, second.data);
--            std::swap(first.children, second.children);
--        }
--
--        Node& operator=(const Node other) {
--            swap(*this, other);
--            return *this;
--        }
--
-         bool isLeaf() const {
-             for (auto child : _children) {
-                 if (child != nullptr)
-@@ -855,17 +843,8 @@ private:
-                 _nextVersion->_hasPreviousVersion = false;
-         }
- 
--        friend void swap(Head& first, Head& second) {
--            Node::swap(first, second);
--        }
--
-         Head(Head&& other) : Node(std::move(other)) {}
- 
--        Head& operator=(const Head other) {
--            swap(*this, other);
--            return *this;
--        }
--
-         bool hasPreviousVersion() const {
-             return _hasPreviousVersion;
-         }
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-sbe-Add-default-constructors-to-RowEq-and-RowHasher.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-sbe-Add-default-constructors-to-RowEq-and-RowHasher.patch
new file mode 100644
index 0000000000..ddffca968e
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-sbe-Add-default-constructors-to-RowEq-and-RowHasher.patch
@@ -0,0 +1,46 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 23 Nov 2026 13:00:00 -0800
+Subject: [PATCH] sbe: Add default constructors to RowEq and RowHasher
+
+libstdc++ 16 value-initializes the hash and equality functors of
+std::unordered_map with copy-list-initialization ("_M_hash{}"), which
+fails when the only default constructor is explicit:
+
+  hashtable_policy.h:1077:70: error: chosen constructor is explicit in copy-initialization
+  row.h:409:14: note: explicit constructor declared here
+
+Add non-explicit default constructors and keep the converting
+constructors explicit.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mongo/db/exec/sbe/values/row.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/mongo/db/exec/sbe/values/row.h b/src/mongo/db/exec/sbe/values/row.h
+index b0ae9212..09d16a59 100644
+--- a/src/mongo/db/exec/sbe/values/row.h
++++ b/src/mongo/db/exec/sbe/values/row.h
+@@ -347,7 +347,8 @@ template <typename RowType>
+ struct RowEq {
+     using ComparatorType = StringData::ComparatorInterface;
+ 
+-    explicit RowEq(const ComparatorType* comparator = nullptr) : _comparator(comparator) {}
++    RowEq() = default;
++    explicit RowEq(const ComparatorType* comparator) : _comparator(comparator) {}
+ 
+     bool operator()(const RowType& lhs, const RowType& rhs) const {
+         for (size_t idx = 0; idx < lhs.size(); ++idx) {
+@@ -406,7 +407,8 @@ template <typename RowType>
+ struct RowHasher {
+     using CollatorType = CollatorInterface*;
+ 
+-    explicit RowHasher(const CollatorType collator = nullptr) : _collator(collator) {}
++    RowHasher() = default;
++    explicit RowHasher(const CollatorType collator) : _collator(collator) {}
+ 
+     std::size_t operator()(const RowType& k) const {
+         size_t res = hashInit();
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0006-pcre-Fix-build-with-PCRE2-10.49.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0006-pcre-Fix-build-with-PCRE2-10.49.patch
new file mode 100644
index 0000000000..77e42155ad
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0006-pcre-Fix-build-with-PCRE2-10.49.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 23 Nov 2026 13:00:00 -0800
+Subject: [PATCH] pcre: Fix build with PCRE2 10.49
+
+PCRE2 10.49 no longer defines PCRE2_ERROR_CONDITION_ATOMIC_ASSERTION_EXPECTED
+and uses its old value 198 for PCRE2_ERROR_MISSING_OCTAL_DIGIT, so the
+build with --use-system-pcre2 fails:
+
+  src/mongo/util/pcre.cpp:75:62: error: use of undeclared identifier 'PCRE2_ERROR_CONDITION_ATOMIC_ASSERTION_EXPECTED'
+
+Map the error to a code PCRE2 does not use when the header lacks it.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mongo/util/pcre.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/mongo/util/pcre.cpp b/src/mongo/util/pcre.cpp
+index ef38a6ff..90a16b5b 100644
+--- a/src/mongo/util/pcre.cpp
++++ b/src/mongo/util/pcre.cpp
+@@ -71,6 +71,11 @@ std::string pcre2ErrorMessage(int e) {
+     return std::string(buf, len);
+ }
+ 
++// PCRE2 10.49 no longer defines this error; give it a code PCRE2 does not use
++#ifndef PCRE2_ERROR_CONDITION_ATOMIC_ASSERTION_EXPECTED
++#define PCRE2_ERROR_CONDITION_ATOMIC_ASSERTION_EXPECTED (-1000)
++#endif
++
+ #define X_(name) std::pair{Errc::name, PCRE2_##name},
+ constexpr std::array errTable{MONGO_PCRE_ERROR_EXPAND_TABLE_(X_)};
+ #undef X_
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0007-SConstruct-Honor-js-engine-none.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0007-SConstruct-Honor-js-engine-none.patch
new file mode 100644
index 0000000000..d94361b17e
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0007-SConstruct-Honor-js-engine-none.patch
@@ -0,0 +1,37 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 24 Nov 2026 10:00:00 -0800
+Subject: [PATCH] SConstruct: Honor --js-engine=none
+
+get_option("js-engine") returns the string "none", which is true in
+the "if jsEngine:" checks of the SConscripts, so mozjs and the mozjs
+scripting library are built anyway. With --server-js=off, mongod then
+links both scripting_none and the mozjs scripting library:
+
+  ld.lld: error: duplicate symbol: mongo::ScriptEngine::setup(mongo::ExecutionEnvironment, bool)
+  >>> defined at engine_none.cpp:35
+  >>> defined at engine.cpp:52
+
+Map "none" to None so --js-engine=none builds without mozjs.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ SConstruct | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/SConstruct b/SConstruct
+--- a/SConstruct
++++ b/SConstruct
+@@ -1645,7 +1645,10 @@
+ 
+ noshell = has_option("noshell")
+ 
++# "none" is a valid choice, but a non-empty string, so map it to None
+ jsEngine = get_option("js-engine")
++if jsEngine == "none":
++    jsEngine = None
+ 
+ serverJs = get_option("server-js") == "on"
+ 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0008-Do-not-include-linux-prctl.h-together-with-sys-prctl.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0008-Do-not-include-linux-prctl.h-together-with-sys-prctl.patch
new file mode 100644
index 0000000000..f178bade82
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0008-Do-not-include-linux-prctl.h-together-with-sys-prctl.patch
@@ -0,0 +1,33 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 25 Nov 2026 16:20:35 -0800
+Subject: [PATCH] Do not include linux/prctl.h together with sys/prctl.h
+
+musl's sys/prctl.h defines struct prctl_mm_map and the PR_* constants
+itself, so including linux/prctl.h as well redefines the struct:
+
+  sys/prctl.h:88:8: error: redefinition of 'prctl_mm_map'
+
+glibc's sys/prctl.h includes linux/prctl.h, and PR_GET_THP_DISABLE,
+the only definition used here, is available from sys/prctl.h on both,
+so drop the linux/prctl.h include.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mongo/db/startup_warnings_mongod.cpp | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/mongo/db/startup_warnings_mongod.cpp b/src/mongo/db/startup_warnings_mongod.cpp
+index d3c975e..18f9966 100644
+--- a/src/mongo/db/startup_warnings_mongod.cpp
++++ b/src/mongo/db/startup_warnings_mongod.cpp
+@@ -36,7 +36,6 @@
+ #include <fstream>
+ 
+ #ifdef __linux__
+-#include <linux/prctl.h>
+ #include <sys/prctl.h>
+ #endif  // __linux__
+ 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0009-DirectMmap-Use-off_t-instead-of-off64_t-for-the-offs.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0009-DirectMmap-Use-off_t-instead-of-off64_t-for-the-offs.patch
new file mode 100644
index 0000000000..8330818115
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0009-DirectMmap-Use-off_t-instead-of-off64_t-for-the-offs.patch
@@ -0,0 +1,51 @@
+From 4500c2fada4e952037c59bd65e8be1ba0b29f21e Mon Sep 17 00:00:00 2001
+From: Derek Mauro <dmauro@google.com>
+Date: Mon, 12 Jun 2023 08:11:36 -0700
+Subject: [PATCH] DirectMmap: Use off_t instead of off64_t for the offset
+ parameter
+
+off_t is best for portability. Its size varies with the platform.
+off64_t is non-standard, but is present in glibc and some BSDs.
+It also matches the signature specified in the manual.
+https://man7.org/linux/man-pages/man2/mmap.2.html
+
+This is a re-spin of #1349, but correctly casts the type to the type
+expected by the kernel for mmap2.
+https://man7.org/linux/man-pages/man2/mmap2.2.html
+
+Fixes #1473
+
+PiperOrigin-RevId: 539656313
+Change-Id: I7a30dd9d3eb6af03a99da0d93d721a86f6521b25
+
+musl removed the off64_t alias, so the bundled abseil fails to build.
+Adjusted the paths for the copy of abseil bundled in MongoDB.
+
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/4500c2fada4e952037c59bd65e8be1ba0b29f21e]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ .../abseil-cpp/dist/absl/base/internal/direct_mmap.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/third_party/abseil-cpp/dist/absl/base/internal/direct_mmap.h b/src/third_party/abseil-cpp/dist/absl/base/internal/direct_mmap.h
+index 815b8d23ba3..1beb2ee4e52 100644
+--- a/src/third_party/abseil-cpp/dist/absl/base/internal/direct_mmap.h
++++ b/src/third_party/abseil-cpp/dist/absl/base/internal/direct_mmap.h
+@@ -72,7 +72,7 @@ namespace base_internal {
+ // Platform specific logic extracted from
+ // https://chromium.googlesource.com/linux-syscall-support/+/master/linux_syscall_support.h
+ inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
+-                        off64_t offset) noexcept {
++                        off_t offset) noexcept {
+ #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
+     defined(__m68k__) || defined(__sh__) ||                                  \
+     (defined(__hppa__) && !defined(__LP64__)) ||                             \
+@@ -102,7 +102,7 @@ inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
+ #else
+   return reinterpret_cast<void*>(
+       syscall(SYS_mmap2, start, length, prot, flags, fd,
+-              static_cast<off_t>(offset / pagesize)));
++              static_cast<unsigned long>(offset / pagesize)));  // NOLINT
+ #endif
+ #elif defined(__s390x__)
+   // On s390x, mmap() arguments are passed in memory.
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
deleted file mode 100644
index 9259f96be8..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 362be06fc16a5ad0f9e9aa90cc763c5242e8e35c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Feb 2019 12:41:45 +0100
-Subject: [PATCH] ssl_manager.cpp: fix build with gcc 7 and -fpermissive
-
-Change prototype of DERToken::parse function from
-parse(ConstDataRange cdr, size_t* outLength);
-to parse(ConstDataRange cdr, uint64_t* outLength);
-
-Otherwise, we got the following error:
-
-src/mongo/util/net/ssl_manager.cpp: In static member function 'static mongo::StatusWith<mongo::{anonymous}::DERToken> mongo::{anonymous}::DERToken::parse(mongo::ConstDataRange, size_t*)':
-src/mongo/util/net/ssl_manager.cpp:575:79: error: invalid conversion from 'size_t* {aka unsigned int*}' to 'long unsigned int*' [-fpermissive]
-  if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, outLength) ||
-
-Upstream-Status: Submitted [https://github.com/mongodb/mongo/pull/1296]
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
----
- src/mongo/util/net/ssl_manager.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/mongo/util/net/ssl_manager.cpp b/src/mongo/util/net/ssl_manager.cpp
-index 455a1662a5..e8497bc0d1 100644
---- a/src/mongo/util/net/ssl_manager.cpp
-+++ b/src/mongo/util/net/ssl_manager.cpp
-@@ -810,7 +810,7 @@ public:
-      *
-      * Returns a DERToken which consists of the (tag, length, value) tuple.
-      */
--    static StatusWith<DERToken> parse(ConstDataRange cdr, size_t* outLength);
-+    static StatusWith<DERToken> parse(ConstDataRange cdr, uint64_t* outLength);
- 
- private:
-     DERType _type{DERType::EndOfContent};
-@@ -827,7 +827,7 @@ struct DataType::Handler<DERToken> {
-                        size_t length,
-                        size_t* advanced,
-                        std::ptrdiff_t debug_offset) {
--        size_t outLength;
-+        uint64_t outLength;
- 
-         auto swPair = DERToken::parse(ConstDataRange(ptr, length), &outLength);
- 
-@@ -889,7 +889,7 @@ StatusWith<DERInteger> readDERInt(ConstDataRangeCursor& cdc) {
- }
- 
- 
--StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, size_t* outLength) {
-+StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, uint64_t* outLength) {
-     const size_t kTagLength = 1;
-     const size_t kTagLengthAndInitialLengthByteLength = kTagLength + 1;
- 
--- 
-2.24.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
deleted file mode 100644
index 24b0ad58b6..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 298d958148f1fb2bb7725fed15c68c09677c14c9 Mon Sep 17 00:00:00 2001
-From: Vincent Prince <vincent.prince.fr@gmail.com>
-Date: Mon, 16 Sep 2019 13:37:10 +0200
-Subject: [PATCH 05/10] Add alises for arm64 which is same as aarch64
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
-
-Upstream-Status: Pending
----
- SConstruct                                      | 1 +
- src/third_party/IntelRDFPMathLib20U1/SConscript | 2 +-
- src/third_party/wiredtiger/SConscript           | 2 +-
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 448939bdd0..abfd816f3e 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -1228,6 +1228,7 @@ if endian == "auto":
- processor_macros = {
-     'arm'        : { 'endian': 'little', 'defines': ('__arm__',) },
-     'aarch64'    : { 'endian': 'little', 'defines': ('__arm64__', '__aarch64__')},
-+    'arm64'      : { 'endian': 'little', 'defines': ('__arm64__', '__aarch64__')},
-     'i386'       : { 'endian': 'little', 'defines': ('__i386', '_M_IX86')},
-     'ppc64le'    : { 'endian': 'little', 'defines': ('__powerpc64__',)},
-     's390x'      : { 'endian': 'big',    'defines': ('__s390x__',)},
-diff --git a/src/third_party/IntelRDFPMathLib20U1/SConscript b/src/third_party/IntelRDFPMathLib20U1/SConscript
-index 58e1b7ba65..bffe83b462 100644
---- a/src/third_party/IntelRDFPMathLib20U1/SConscript
-+++ b/src/third_party/IntelRDFPMathLib20U1/SConscript
-@@ -309,7 +309,7 @@ if processor == 'i386' or processor == 'emscripten':
- elif processor == 'arm':
-     cpp_defines['IA32'] = '1'
-     cpp_defines['ia32'] = '1'
--elif processor == "aarch64":
-+elif processor == "aarch64" or processor == 'arm64':
-     cpp_defines['efi2'] = '1'
-     cpp_defines['EFI2'] = '1'
- # Using 64 bit little endian
-diff --git a/src/third_party/wiredtiger/SConscript b/src/third_party/wiredtiger/SConscript
-index d6bd665e23..2f1e656a19 100644
---- a/src/third_party/wiredtiger/SConscript
-+++ b/src/third_party/wiredtiger/SConscript
-@@ -152,7 +152,7 @@ condition_map = {
-     'POSIX_HOST'   : not env.TargetOSIs('windows'),
-     'WINDOWS_HOST' : env.TargetOSIs('windows'),
- 
--    'ARM64_HOST'   : env['TARGET_ARCH'] == 'aarch64',
-+    'ARM64_HOST'   : env['TARGET_ARCH'] in ('aarch64', 'arm64'),
-     'POWERPC_HOST' : env['TARGET_ARCH'] == 'ppc64le',
-     'X86_HOST'     : env['TARGET_ARCH'] == 'x86_64',
-     'ZSERIES_HOST' : env['TARGET_ARCH'] == 's390x',
--- 
-2.24.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch
index 78ebba8fb7..285cd8abe7 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/disable_runtime_check.patch
@@ -1,17 +1,28 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Nov 2026 07:52:32 -0800
+Subject: [PATCH] SConstruct: Use a fixed vec_vbpermq output index
+
 Lets use cached result for this otherwise runtime test, on qemuppc64
 when this test is run using gcc11, it returns 1, since we dont worry
 about older compilers here, we can cache the result and use it here
 
 Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ SConstruct | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/SConstruct b/SConstruct
+index e84797c6..45e78a8d 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -3904,7 +3904,7 @@ def doConfigure(myenv):
+@@ -5464,7 +5464,7 @@ def doConfigure(myenv):
  
          conf.AddTest('CheckAltivecVbpermqOutput', CheckAltivecVbpermqOutput)
  
--        outputIndex = next((idx for idx in [0,1] if conf.CheckAltivecVbpermqOutput(idx)), None)
+-        outputIndex = next((idx for idx in [0, 1] if conf.CheckAltivecVbpermqOutput(idx)), None)
 +        outputIndex = 1
          if outputIndex is not None:
-             conf.env.SetConfigHeaderDefine("MONGO_CONFIG_ALTIVEC_VEC_VBPERMQ_OUTPUT_INDEX", outputIndex)
-         else:
+             conf.env.SetConfigHeaderDefine("MONGO_CONFIG_ALTIVEC_VEC_VBPERMQ_OUTPUT_INDEX",
+                                            outputIndex)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch
index 471d5629a1..b2887cdd0f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/ppc64_ARCH_BITS.patch
@@ -1,18 +1,32 @@
-Subject: [PATCH] stacktrace: Define ARCH_BITS for ppc64
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Nov 2026 07:53:32 -0800
+Subject: [PATCH] stacktrace: Define ARCH_BITS for ppc64 and s390x
+
+musl does not define __ELF_NATIVE_CLASS, so ARCH_BITS is only set for
+x86_64 and aarch64 and the build fails on the other 64-bit targets:
 
 src/mongo/util/stacktrace_somap.cpp:89:2: error: #error Unknown target architecture.
 stacktrace_somap.cpp:92:33: error: 'ELFCLASSARCH_BITS' was not declared in this scope
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mongo/util/stacktrace_somap.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mongo/util/stacktrace_somap.cpp b/src/mongo/util/stacktrace_somap.cpp
+index a9045da0..fe8ea889 100644
 --- a/src/mongo/util/stacktrace_somap.cpp
 +++ b/src/mongo/util/stacktrace_somap.cpp
-@@ -81,7 +81,7 @@ void addUnameToSoMap(BSONObjBuilder* soM
+@@ -83,7 +83,7 @@ void addUnameToSoMap(BSONObjBuilder* soMap) {
  
  #if defined(__ELF_NATIVE_CLASS)  // determine ARCH_BITS
  #define ARCH_BITS __ELF_NATIVE_CLASS
 -#elif defined(__x86_64__) || defined(__aarch64__)
-+#elif defined(__x86_64__) || defined(__aarch64__)  || defined(__powerpc64__)
++#elif defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__) || defined(__s390x__)
  #define ARCH_BITS 64
- #elif defined(__i386__) || defined(__arm__)
+ #elif defined(__arm__)
  #define ARCH_BITS 32
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_7.0.48.bb
similarity index 55%
rename from meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_7.0.48.bb
index a0dbf36b24..7769bb83b1 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_7.0.48.bb
@@ -1,122 +1,109 @@
 SUMMARY = "mongodb"
-LICENSE = "Apache-2.0 AND Zlib AND SSPL-1.0"
+LICENSE = "SSPL-1.0 AND Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND BSD-4-Clause AND BSL-1.0 AND MIT AND Unicode-3.0 AND Unicode-DFS-2016 AND Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE-Community.txt;md5=3a865f27f11f43ecbe542d9ea387dcf1 \
-                    file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+                    file://distsrc/THIRD-PARTY-NOTICES;md5=3c39e5c161df3327a0842fe6e8318b33"
 
-DEPENDS = "openssl libpcap zlib boost curl python3 \
-           python3-packaging-native python3-setuptools-native \
-           python3-pyyaml-native python3-cheetah-native \
-           python3-psutil-native python3-regex-native \
+DEPENDS = "openssl zlib curl \
+           python3-cheetah-native python3-packaging-native \
+           python3-psutil-native python3-pymongo-native \
+           python3-pyyaml-native \
            "
 
-inherit scons dos2unix siteinfo python3native systemd useradd
+inherit siteinfo python3native systemd useradd
 
-PV = "4.4.30"
-#v4.4.30
-SRCREV = "1ae4c9990dbc5711f3500748f0c3f8b5d375d8c0"
-SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
-           file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
-           file://0001-Use-long-long-instead-of-int64_t.patch \
+SRCREV = "1fd1fee93dc835b17751f55e5ddaf193d14496d9"
+SRC_URI = "git://github.com/mongodb/mongo.git;branch=v${PV};protocol=https;tag=r${PV} \
+           file://0001-moduleconfig.py-python-3.12-compatibility.patch \
+           file://0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch \
+           file://0001-distsrc-Use-shutil.which-instead-of-distutils.patch \
+           file://disable_runtime_check.patch \
+           file://0001-SConstruct-Respect-the-CPU-selected-by-the-compiler-.patch \
            file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
-           file://0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch \
-           file://arm64-support.patch \
-           file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
            file://0001-Support-deprecated-resolver-functions.patch \
-           file://0003-Fix-unknown-prefix-env.patch \
-           file://1296.patch \
-           file://0001-Fix-compilation-with-fno-common.patch \
-           file://0001-stacktrace-Define-ARCH_BITS-for-x86.patch \
-           file://0001-include-needed-c-header.patch \
-           file://disable_runtime_check.patch \
            file://ppc64_ARCH_BITS.patch \
-           file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
-           file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
-           file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
-           file://0001-Fix-type-mismatch-on-32bit-arches.patch \
-           file://0001-Fix-build-on-32bit.patch \
-           file://0001-moduleconfig.py-python-3.12-compatibility.patch \
-           file://0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch \
-           file://0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch \
            file://0003-boost-Fix-build-with-clang-23.patch \
+           file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
            file://0004-ssl-Fix-build-with-OpenSSL-4.patch \
-           file://0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch \
+           file://0001-SERVER-79426-fix-build-issues-under-clang-15.patch \
+           file://0001-SERVER-77007-MongoDB-fails-to-compile-with-Clang-15-.patch \
+           file://0005-sbe-Add-default-constructors-to-RowEq-and-RowHasher.patch \
+           file://0006-pcre-Fix-build-with-PCRE2-10.49.patch \
+           file://0007-SConstruct-Honor-js-engine-none.patch \
+           file://0008-Do-not-include-linux-prctl.h-together-with-sys-prctl.patch \
+           file://0009-DirectMmap-Use-off_t-instead-of-off64_t-for-the-offs.patch \
            file://oe-buildinfo.vars \
            "
 SRC_URI:append:libc-musl = "\
-           file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
            file://0002-Fix-default-stack-size-to-256K.patch \
            file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
            file://0001-wiredtiger-Avoid-using-off64_t.patch \
            "
 
-SRC_URI:append:toolchain-clang = "\
-           file://0001-asio-Dont-use-experimental-with-clang.patch \
-           "
-
+# 8.0 and newer build with Bazel only
+UPSTREAM_CHECK_GITTAGREGEX = "^r(?P<pver>7\.0\.\d+)$"
 
 CVE_STATUS[CVE-2014-8180] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
 CVE_STATUS[CVE-2017-2665] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
 CVE_STATUS[CVE-2025-14911] = "cpe-incorrect: The vulnerability is about mongo-c-driver application, not mongodb"
 
-COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
+COMPATIBLE_HOST ?= '(x86_64|aarch64|powerpc64le).*-linux'
 
-PACKAGECONFIG ??= "tcmalloc system-pcre"
-# gperftools compilation fails for arm below v7 because of missing support of
-# dmb operation. So we use system-allocator instead of tcmalloc
-PACKAGECONFIG:remove:armv6 = "tcmalloc"
+PACKAGECONFIG ??= "tcmalloc system-pcre2"
 PACKAGECONFIG:remove:libc-musl = "tcmalloc"
-PACKAGECONFIG:remove:riscv64 = "tcmalloc"
-PACKAGECONFIG:remove:riscv32 = "tcmalloc"
 
 PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
-PACKAGECONFIG[shell] = ",--js-engine=none,,"
-PACKAGECONFIG[system-pcre] = "--use-system-pcre,,libpcre,"
+PACKAGECONFIG[js] = "--server-js=on,--server-js=off --js-engine=none,,"
+PACKAGECONFIG[system-pcre2] = "--use-system-pcre2,,libpcre2,"
 
 MONGO_ARCH ?= "${HOST_ARCH}"
 MONGO_ARCH:powerpc64le = "ppc64le"
-WIREDTIGER ?= "off"
-WIREDTIGER:x86-64 = "on"
-WIREDTIGER:aarch64 = "on"
 
-EXTRA_OESCONS = "PREFIX=${prefix} \
-                 DESTDIR=${D} \
+MONGO_LINKER ?= "bfd"
+MONGO_LINKER:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', 'lld', 'bfd', d)}"
+
+MONGO_SCONS = "${PYTHON} ${S}/src/third_party/scons-4.9.1/scons.py"
+
+# std::atomic<Timestamp> (8 bytes, 4-byte aligned) calls the generic __atomic_compare_exchange
+LDFLAGS:append = " -Wl,--push-state,--no-as-needed -latomic -Wl,--pop-state"
+
+EXTRA_OESCONS = "--variables-files=etc/scons/propagate_shell_environment.vars \
+                 --variables-files=etc/scons/compilers_from_env.vars \
+                 --variables-files=${UNPACKDIR}/oe-buildinfo.vars \
+                 PREFIX=${prefix} \
+                 DESTDIR=${B}/oe-install \
                  MAXLINELENGTH='2097152' \
                  LIBPATH=${STAGING_LIBDIR} \
-                 LINKFLAGS='${LDFLAGS}' \
+                 AR='${AR}' \
+                 CFLAGS='${CFLAGS}' \
                  CXXFLAGS='${CXXFLAGS}' \
+                 LINKFLAGS='${LDFLAGS}' \
                  TARGET_ARCH=${MONGO_ARCH} \
                  MONGO_VERSION=${PV} \
-                 OBJCOPY=${OBJCOPY} \
-                 --variables-files=${UNPACKDIR}/oe-buildinfo.vars \
-                 --ssl \
+                 MONGO_GIT_HASH=${SRCREV} \
+                 SPLIT_DWARF=0 \
+                 GDB_INDEX=0 \
+                 --ssl=on \
                  --disable-warnings-as-errors \
                  --use-system-zlib \
-                 --nostrip \
+                 --linker=${MONGO_LINKER} \
                  --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
                  --use-hardware-crc32=${@bb.utils.contains('TUNE_FEATURES', 'crc', 'on', 'off', d)} \
-                 --wiredtiger='${WIREDTIGER}' \
-                 --separate-debug \
+                 --wiredtiger=on \
                  ${PACKAGECONFIG_CONFARGS}"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
 
-scons_do_compile() {
-    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS} install-core ||
+do_compile() {
+    ${MONGO_SCONS} ${PARALLEL_MAKE} ${EXTRA_OESCONS} install-core ||
         die "scons build execution failed."
 }
 
-scons_do_install() {
+do_install() {
     # install binaries
     install -d ${D}${bindir}
-    for i in mongod mongos mongo; do
-        if [ -f ${B}/build/*/mongo/$i ]; then
-            install -m 0755 ${B}/build/*/mongo/$i ${D}${bindir}
-        else
-            bbnote "$i does not exist"
-        fi
-    done
+    install -m 0755 ${B}/oe-install${bindir}/mongod ${B}/oe-install${bindir}/mongos ${D}${bindir}
 
     # install config
     install -d ${D}${sysconfdir}
