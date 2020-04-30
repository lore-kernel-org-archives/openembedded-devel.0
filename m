Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5816.1588249666614338030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 05:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03UCRDUE020270
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2020 05:27:35 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 30 Apr 2020 05:27:09 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nss: enable uint128 support on mips64
Date: Thu, 30 Apr 2020 20:27:08 +0800
Message-ID: <1588249628-347980-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fix below build error:
| verified/kremlin/kremlib/dist/minimal/FStar_UInt128.h:22:1: error: 'FStar_UInt128___proj__Mkuint128__item__low' declared 'static' but never defined [-Werror=unused-function]
|   22 | FStar_UInt128___proj__Mkuint128__item__low(FStar_UInt128_uint128 projectee);

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../nss/nss/0001-Enable-uint128-on-mips64.patch    | 48 ++++++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb          |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Enable-uint128-on-mips64.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-Enable-uint128-on-mips64.patch b/meta-oe/recipes-support/nss/nss/0001-Enable-uint128-on-mips64.patch
new file mode 100644
index 0000000..90ec379
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-Enable-uint128-on-mips64.patch
@@ -0,0 +1,48 @@
+From 8cf7afb5417e23cd3ebf8141239bf020f5dd2ac8 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 30 Apr 2020 06:56:09 +0000
+Subject: [PATCH] Enable uint128 on mips64
+
+Fix below error:
+| verified/kremlin/kremlib/dist/minimal/FStar_UInt128.h:22:1: error: 'FStar_UInt128___proj__Mkuint128__item__low' declared 'static' but never defined [-Werror=unused-function]
+|   22 | FStar_UInt128___proj__Mkuint128__item__low(FStar_UInt128_uint128 projectee);
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ .../freebl/verified/kremlin/include/kremlin/internal/types.h   | 3 ++-
+ .../kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h         | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h b/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
+index 801e78f..cdac61e 100644
+--- a/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
++++ b/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
+@@ -57,7 +57,8 @@ typedef const char *Prims_string;
+ typedef __m128i FStar_UInt128_uint128;
+ #elif !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
+     (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
+-     (defined(__riscv) && __riscv_xlen == 64))
++     (defined(__riscv) && __riscv_xlen == 64) || \
++     defined(__mips64))
+ typedef unsigned __int128 FStar_UInt128_uint128;
+ #else
+ typedef struct FStar_UInt128_uint128_s {
+diff --git a/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h b/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
+index f38fda3..7ca67d2 100644
+--- a/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
++++ b/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
+@@ -26,7 +26,8 @@
+ #include <stdint.h>
+ #if !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
+     (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
+-     (defined(__riscv) && __riscv_xlen == 64))
++     (defined(__riscv) && __riscv_xlen == 64) || \
++     defined(__mips64))
+ 
+ /* GCC + using native unsigned __int128 support */
+ 
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index 0011240..fba80ce 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            file://riscv.patch \
+           file://0001-Enable-uint128-on-mips64.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.7.4

