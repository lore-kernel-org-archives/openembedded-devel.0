Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ED01067025
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:06:01 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22479.1773324357940833490
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=J/hUwm0r;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1334352-202603121405556074eb25e5000207c6-_pkbzi@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202603121405556074eb25e5000207c6
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Mar 2026 15:05:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wY7/jAV/qxhcYO+v34xjPM66hTgbOcvG6ClUphqEnIU=;
 b=J/hUwm0r4LegRKPAln5QtoIE9bS6YY2zM5JQbtjupPEXiPw2b6hZ6bl98OIrydWJIu+Rjp
 T+sYpl5+4/8RgGomHsoR/NHvXARsbzV4v2m+gNwQ27zp1qtQXFY9lgRJRg0iHslX9Fq08GQT
 ujEDiwWJsPEfBKpW9mqtzdGXk5mjygXKJzoHnfpdNjrc8NmBH+ySPIi8XnrsJ39dTOi9Cdd8
 2aN6b3N32iISMi0tmBEtzypu/ZfzBAxXW/8ChVplVioSHz/eFE7hmfXrAX46HEtC5EonJkhr
 hqnwqFpB70cjmjUZAV4myDAL/cdWnmMs4Hebd8tNeIuwBideFfN2fduQ==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 2/6] nss: upgrade 3.119 -> 3.121
Date: Thu, 12 Mar 2026 15:04:57 +0100
Message-ID: <20260312140501.29859-2-andrej.kozemcak@siemens.com>
In-Reply-To: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
References: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 14:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125167

Adapt patch 0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
to new version of the code. Remove code which not exist and adapt to
new code.

Changelog:

v3.121:
  https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_121.html

  Bugs:
    - update vendored zlib to v1.3.2.
    - Revert the unnecessary changes to intel-gcm-wrap.gyp.
    - Use C fallback for AES-GCM on MinGW builds.
    - fix ML-KEM PCT.
    - Extend NSS Fuzzing docs.
    - avoid integer overflow in platform-independent ghash.
    - Fix errant whitespace in OISTE Server Root RSA G1 nickname.
    - fix build with glibc-2.43 assignment discards ‘const’ qualifier from pointer.
    - add gcm.gyp dependency for Solaris SPARC builds.
    - Set nssckbi version to 2.84.
    - Add e-Szigno TLS Root CA 2023 to NSS.
    - allow manual selection of CPU_ARCH=x86_64 and ppc64 in coreconf/Darwin.mk.
    - Update cryptofuzz version.
    - Paranoia assert.
    - Darwin compatibility for intel-aes.S and intel-gcm.S.
    - rename intel-{aes,gcm}.s to .S.
    - rename C files for platform-specific ghash implementations.
    - simplify compilation of platform-specific GCM and GHASH.
    - FORWARD_NULL null deref of worker in p7decode.c (sec_pkcs7_decoder_abort_digests).
    - Out-of-Bounds Read in ML-DSA Private Key Parsing (zero-length privateKey).

v3.120:
  https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_120.html

  Bugs:
    - Fix docs generation bug.
    - CID 1678226: Dereferencing null pointer plaintext.data().
    - Run PKCS12 fuzz target with –fuzz=tls in CI.
    - Allowing RT be started several times.
    - move linux decision and build tasks to d2g worker pools.

v3.119.1:
  https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_119_1.html

  Bugs:
    - restore coreconf/Darwin.mk behavior for intel archs.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...figure-option-to-disable-ARM-HW-cryp.patch | 29 +++----------------
 .../nss/{nss_3.119.bb => nss_3.121.bb}        |  2 +-
 2 files changed, 5 insertions(+), 26 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.119.bb => nss_3.121.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 63f822be25..2a14dffbea 100644
--- a/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -11,14 +11,13 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  nss/lib/freebl/Makefile | 3 +++
- nss/lib/freebl/gcm.c    | 2 ++
- 2 files changed, 5 insertions(+)
+ 1 file changed, 3 insertions(+)
 
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
 index 0ebfc92..3ee7623 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
-@@ -142,6 +142,8 @@ endif
+@@ -136,6 +136,8 @@ endif
          endif
      endif
  endif
@@ -26,8 +25,8 @@ index 0ebfc92..3ee7623 100644
 +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
  ifeq ($(CPU_ARCH),aarch64)
      ifdef CC_IS_CLANG
-         DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-@@ -183,6 +185,7 @@ endif
+         DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2 -DHAVE_PLATFORM_GHASH
+@@ -178,6 +180,7 @@ endif
          endif
      endif
  endif
@@ -35,23 +34,3 @@ index 0ebfc92..3ee7623 100644
  
  ifeq (,$(filter-out WINNT,$(OS_TARGET)))
  ifndef USE_64
-diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index a2f63a6..743158e 100644
---- a/nss/lib/freebl/gcm.c
-+++ b/nss/lib/freebl/gcm.c
-@@ -18,6 +18,7 @@
- 
- #include <limits.h>
- 
-+#ifdef NSS_USE_ARM_HW_CRYPTO
- /* old gcc doesn't support some poly64x2_t intrinsic */
- #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
-     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
-@@ -27,6 +28,7 @@
- /* We don't test on big endian platform, so disable this on big endian. */
- #define USE_ARM_GCM
- #endif
-+#endif
- 
- #if defined(__ARM_NEON) || defined(__ARM_NEON__)
- #include <arm_neon.h>
diff --git a/meta-oe/recipes-support/nss/nss_3.119.bb b/meta-oe/recipes-support/nss/nss_3.121.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.119.bb
rename to meta-oe/recipes-support/nss/nss_3.121.bb
index a0345eb8aa..99f54c948a 100644
--- a/meta-oe/recipes-support/nss/nss_3.119.bb
+++ b/meta-oe/recipes-support/nss/nss_3.121.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "e8412db6c9d6f531e8adfe8a122ec33a8fae920681ff47231a1349bdd399f0e9"
+SRC_URI[sha256sum] = "cb3a8f8781bea78b7b8edd3afb7a2cb58e4881bb0160d189a39b98216ba7632e"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.47.3


