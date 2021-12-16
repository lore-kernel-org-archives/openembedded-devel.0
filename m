Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EC2C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 21:12:32 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.348.1639689151592166587
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 13:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BGLCUj1011519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 13:12:30 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Dec 2021 13:12:29 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 16 Dec 2021 13:12:29 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nss: upgrade 3.64 -> 3.73.1
Date: Thu, 16 Dec 2021 16:12:29 -0500
Message-ID: <20211216211229.21858-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 21:12:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94408

Upgrade to 3.73.1 fixes CVE-2021-43527.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...a-configure-option-to-disable-ARM-HW-cryp.patch | 14 +++++++-------
 .../nss/0001-nss-fix-support-cross-compiling.patch |  6 +++---
 .../nss/nss/disable-Wvarargs-with-clang.patch      |  2 +-
 .../nss/nss-fix-incorrect-shebang-of-perl.patch    |  2 +-
 .../nss/nss/nss-fix-nsinstall-build.patch          |  2 +-
 .../nss/nss/nss-no-rpath-for-cross-compiling.patch |  2 +-
 .../recipes-support/nss/nss/pqg.c-ULL_addend.patch |  4 ++--
 .../nss/{nss_3.64.bb => nss_3.73.1.bb}             |  2 +-
 8 files changed, 17 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.64.bb => nss_3.73.1.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 65e1500ae..72ee1ee00 100644
--- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -1,4 +1,4 @@
-From 8b67c22b057e158f61c9fdd5b01f37195c6f5ca4 Mon Sep 17 00:00:00 2001
+From 9937e89c22eb2f2db9a936e7bc4442857b4192f5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 18 Dec 2019 12:29:50 +0100
 Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
@@ -15,19 +15,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index fe8c526..922f67c 100644
+index b38889f..4616aac 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
-@@ -125,6 +125,8 @@ else
-         DEFINES += -DNSS_X86
- endif
+@@ -139,6 +139,8 @@ endif
+         endif
+     endif
  endif
 +ifdef NSS_USE_ARM_HW_CRYPTO
 +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
  ifeq ($(CPU_ARCH),aarch64)
      ifdef CC_IS_CLANG
          DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-@@ -166,6 +168,7 @@ endif
+@@ -180,6 +182,7 @@ endif
          endif
      endif
  endif
@@ -36,7 +36,7 @@ index fe8c526..922f67c 100644
  ifeq ($(OS_TARGET),OSF1)
      DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
 diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index c2cc18d..b77f573 100644
+index ac461b4..04cb180 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
 @@ -18,6 +18,7 @@
diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index 3d90e2d95..eb6174a7b 100644
--- a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 8cea16e7550ae14494fbb3a8fe9f5452e6bd1407 Mon Sep 17 00:00:00 2001
+From 919fc5d674fae99fe21ba1351d98b75e466f425f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 22 Feb 2017 11:36:11 +0200
 Subject: [PATCH] nss: fix support cross compiling
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
-index 790372d..2563134 100644
+index 2012d18..78fca62 100644
 --- a/nss/coreconf/arch.mk
 +++ b/nss/coreconf/arch.mk
 @@ -30,7 +30,7 @@ OS_TEST := $(shell uname -m)
@@ -28,7 +28,7 @@ index 790372d..2563134 100644
  
  #
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 52d827c..f99f769 100644
+index 0b8c6f4..b38889f 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -36,6 +36,12 @@ ifdef USE_64
diff --git a/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch b/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
index e87dc9f76..4c9bea30c 100644
--- a/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
+++ b/meta-oe/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
@@ -1,4 +1,4 @@
-From c5b2c6327f3692ed07bf8d212123e0bf08485722 Mon Sep 17 00:00:00 2001
+From f613c9a9107435a40d91329f33f12cfb16927f07 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] nss,nspr: Add recipes
diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch b/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
index 6f02dbcb4..735b06b5c 100644
--- a/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
+++ b/meta-oe/recipes-support/nss/nss/nss-fix-incorrect-shebang-of-perl.patch
@@ -1,4 +1,4 @@
-From 028ec9c7e9f7a6f083eec987f3ad7e7623398d9d Mon Sep 17 00:00:00 2001
+From 2ce67b1f4b1f582d556ae058da10698bbaa0edc1 Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Mon, 13 Jul 2020 12:12:31 +0300
 Subject: [PATCH] nss: fix incorrect shebang of perl
diff --git a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
index 224a5d236..a1897f88d 100644
--- a/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
+++ b/meta-oe/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
@@ -1,4 +1,4 @@
-From 2701905e689cf7c1ee7ca2d116f20b5bbc146431 Mon Sep 17 00:00:00 2001
+From f9b2b1c738576a17460aebd005f511f427aa1974 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] Fix nss multilib build on openSUSE 11.x 32bit
diff --git a/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
index 7dbc1a372..8c715cc44 100644
--- a/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/nss-no-rpath-for-cross-compiling.patch
@@ -1,4 +1,4 @@
-From dc51214895bcd63fc8eb8d1fe7941cd3e5500620 Mon Sep 17 00:00:00 2001
+From 73edfbdf33fe4e41724e7e947033d8caeec8f3d0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] nss:no rpath for cross compiling
diff --git a/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
index 5505ae36a..589b4d5e7 100644
--- a/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
+++ b/meta-oe/recipes-support/nss/nss/pqg.c-ULL_addend.patch
@@ -1,4 +1,4 @@
-From a550bdf458f11dff46ebddbac94cf48c27d3471e Mon Sep 17 00:00:00 2001
+From cbd367160338847b28fc801a12c74f1c8b5b03ee Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 Mar 2020 08:34:02 -0800
 Subject: [PATCH] nss does not build on mips with clang because wrong types are
@@ -16,7 +16,7 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/nss/lib/freebl/pqg.c b/nss/lib/freebl/pqg.c
-index 626b2fb..052ad36 100644
+index 1b03278..ad895b7 100644
 --- a/nss/lib/freebl/pqg.c
 +++ b/nss/lib/freebl/pqg.c
 @@ -326,8 +326,8 @@ generate_h_candidate(SECItem *hit, mp_int *H)
diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-support/nss/nss_3.73.1.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.64.bb
rename to meta-oe/recipes-support/nss/nss_3.73.1.bb
index c935c6a2a..274e85d1f 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.73.1.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126"
+SRC_URI[sha256sum] = "c768f9fe3129e8bcc2e9679456d7edd9453a225784a8fc7dc4501806f1fe9abe"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.33.0


