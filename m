Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7814FC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:20:11 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.333.1784136001195435467
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jvPxE81E;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3309; q=dns/txt;
  s=iport01; t=1784136001; x=1785345601;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A4y3ybM+cZmTKbygWcudAY7tQIwgX5AsqqeGJ4T7NJY=;
  b=jvPxE81E5Ov1C1XqO+VetVli3v++oOLxPGgF2aMmzP4bC9VM2xajw9QK
   0gLZLFSDAYuUXIrXNEbLQUs/2/QkgjZRdlg5qjWW3pNc97QqfegYuj8Kd
   vO/68AwIZBk1f4J/fCcFCLSmWapqbilJpTihTnBtN5fngaZXwLn2GX75L
   oCBSk+/xwVGiQ2xYc1DbNsAZTc6IkGy6uLYZotpepfqZrgOvwfsYEl2YE
   3JoLaCmsuO6uh4bDLnDRJKkePYCTOAEmNrhiJK0D1Ex1efzl3q1ciquFG
   xsqiQ5ENOAfPBn06wBvAhR3d1zN9X4nv6hZT+fZV0wYQu5hppjtWbjheL
   w==;
X-CSE-ConnectionGUID: 2PYBLD8dRLG+m98REpquVw==
X-CSE-MsgGUID: 04pVG4sJROqB47tuoNkZFg==
X-IPAS-Result: =?us-ascii?q?A0BBAgCFwFdq/5X/Ja1aHgEBCxIMggULgld0X0JJA5Qmg?=
 =?us-ascii?q?iGBFp0IgX4PAQEBDzQdBAEBklgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2HEwEYAV1cPAiDAgGCdAMRvR2CLIEBgygBMQMLAkNQ2?=
 =?us-ascii?q?y4BCxQBgTiFP4ggdAGEfCcbG4FygRWCc3aBBYFcAYgmBIIigQyBeI94SIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BUIEChHYjHwM5f4Ewd?=
 =?us-ascii?q?Up3LWoSF4FRghSBGAMLGA1IESw3FBsEPm4HjTAZJYI/PRwRJAErIIIMkzWSP?=
 =?us-ascii?q?qESCiiDdYwhlToaM6psCyOYWo4KlWBwhGmBaDyBRwsHcBWDIglKGQ+OOCeFQ?=
 =?us-ascii?q?2XLXjw1AgwvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:b2t08qMJJQTafdTvrR31lsFynXyQoLVcMsEvi/4bfWQNrUpw0jFTm
 mBLCzjXM6zcNDD9eI11ady+/UNT6pfTnNUyGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj669WPWsSEd0UwMJYQmQfp
 cY1MCkQUA/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiDS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPXwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsieC1b4eNI4TiqcN9xhqAm
 E2a5EbDJQgwaIOD1D2j8UCCibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:9VXg5638N7fJb72Ybv+CEQqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:tJ0NMGOOLbmLs+5DAhFW3mo4SswfVlKeySaAGWKgEHtXV+jA
X-Talos-MUID: 9a23:Y2lhmAQy4xFJd+ysRXS02ClcG5tzwZ6JEWpRzokbvO+HBwJ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510075010"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:20:00 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 1021F180001FE
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 17:20:00 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 30D0FCC037D; Wed, 15 Jul 2026 22:49:58 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][scarthgap][PATCH] mbedtls: set CVE_STATUS for CVE-2025-66442
Date: Wed, 15 Jul 2026 22:49:52 +0530
Message-Id: <20260715171952.1143899-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 17:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128224

From: Deepak Rathore <deeratho@cisco.com>

Analysis:
- The Mbed TLS advisory states the issue occurs when LLVM
  select-optimize is enabled. [1]
- The same advisory also states that Arm/x86 builds with
  MBEDTLS_HAVE_ASM enabled are not affected. The default mbedtls
  configuration in this branch enables MBEDTLS_HAVE_ASM.
- NVD also describes the issue as occurring only with LLVM's
  select-optimize feature. [2]
- The mbedtls recipes now evaluate the effective build flags across
  target, native, and nativesdk variants, handle the supported
  -mllvm spellings, and only mark the CVE unpatched when the
  vulnerable LLVM option combination is explicitly enabled and the
  Arm/x86 MBEDTLS_HAVE_ASM carve-out does not apply.
- When those conditions are not met, the current mbedtls build
  configuration is not affected.
- Hence ignoring/deferred the CVE for now.

Reference:
[1] https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-03-compiler-induced-constant-time-violations/
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-66442

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0eda0f3c556de7ab1c3b03b6f38eb9b4ac29a2d7)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../mbedtls/mbedtls_3.6.6.bb                    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
index cedbc90ccf..67f522f415 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
@@ -56,8 +56,25 @@ ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
 
 BBCLASSEXTEND = "native nativesdk"
 
+MBEDTLS_CVE_2025_66442_FLAGS = "${CFLAGS} ${CXXFLAGS} ${CPPFLAGS} ${TOOLCHAIN_OPTIONS}"
+MBEDTLS_CVE_2025_66442_FLAGS:append:class-native = " ${BUILD_CFLAGS} ${BUILD_CXXFLAGS} ${BUILD_CPPFLAGS}"
+MBEDTLS_CVE_2025_66442_FLAGS:append:class-nativesdk = " ${BUILDSDK_CFLAGS} ${BUILDSDK_CXXFLAGS} ${BUILDSDK_CPPFLAGS}"
+MBEDTLS_CVE_2025_66442_ARCH = "${TARGET_ARCH}"
+MBEDTLS_CVE_2025_66442_ARCH:class-native = "${BUILD_ARCH}"
+
 CVE_PRODUCT = "mbed_tls"
 
+CVE_STATUS[CVE-2025-66442] = "${@ \
+    'unpatched' if ( \
+        ((('-mllvm' in d.getVar('MBEDTLS_CVE_2025_66442_FLAGS').split() and \
+           ('--disable-select-optimize=false' in d.getVar('MBEDTLS_CVE_2025_66442_FLAGS').split() or \
+            '-disable-select-optimize=false' in d.getVar('MBEDTLS_CVE_2025_66442_FLAGS').split())) or \
+          '-mllvm=--disable-select-optimize=false' in d.getVar('MBEDTLS_CVE_2025_66442_FLAGS').split() or \
+          '-mllvm=-disable-select-optimize=false' in d.getVar('MBEDTLS_CVE_2025_66442_FLAGS').split()) and \
+         d.getVar('MBEDTLS_CVE_2025_66442_ARCH') not in ('aarch64', 'aarch64_be', 'arm', 'armeb', 'i586', 'i686', 'x86_64'))) \
+    else 'not-applicable-config: CVE applies only when LLVM select-optimize is enabled and the Arm/x86 MBEDTLS_HAVE_ASM carve-out does not apply; current mbedtls build configuration does not meet those conditions' \
+}"
+
 # Strip host paths from autogenerated test files
 do_compile:append() {
 	sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
-- 
2.35.6


