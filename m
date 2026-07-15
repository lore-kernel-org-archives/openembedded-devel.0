Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F22C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:19:11 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.324.1784135951096889923
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iAXgtBvB;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3309; q=dns/txt;
  s=iport01; t=1784135951; x=1785345551;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wb5MP3a8ILS+xlHHpKFwiAAlHjZV8igB/cyLxyxKBT8=;
  b=iAXgtBvB+qHUKP5FJd7YNdvYr8E2Yi0cF1iQHrh6pdQk5gXknk9S1LJF
   IS29CDXgvaFrRZefqVaFFAl3ltrkDW+xW4qO4V3f4l/As92+uy702rN06
   /WoDC6RzQQx7h1E2DhYHF7nXosonqBeElVlxlxMmuNsMALGcHfMAgjupC
   gewc3zUsVZ/M/usPb/X7HRvfCB6Mi3CTGi1hynp/uKK4ZPiXuSr1pX5xv
   NyamL6aoNV65/kpWGUrDXonBTQXRfI15BG76Pm2yQ1zowx98qSBkqAwqW
   jBcAX7Gq86Pu4NGQ3K+KTrWIGEjggDOviRMK4K4wAqS+zB1kRjUTDnAlQ
   A==;
X-CSE-ConnectionGUID: wxBzm2NCSmiKB3fnf9ROQA==
X-CSE-MsgGUID: eg/AWtY4RCS9G4xTkU3QrA==
X-IPAS-Result: =?us-ascii?q?A0BBAgADwFdq/43/Ja1aHgEBCxIMggULgld0X0JJA5Qmg?=
 =?us-ascii?q?iGBFp0IgX4PAQEBDzQdBAEBklgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2HEwEYAV1cPAiDAgGCdAMRvQGCLIEBgygBMQMLAkNQ2?=
 =?us-ascii?q?y4BCxQBgTiFP4ggdAGEfCcbG4FygRWCc3aBBYFcAYgmBIIigQyBeI94SIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BUIEChHYjHwM5f4Ewd?=
 =?us-ascii?q?Up3LWoSF4FRghSBGAMLGA1IESw3FBsEPm4HjTAZJYI/PRwRJAErIIIMkzWSP?=
 =?us-ascii?q?qESCiiDdYwhlToaM6psCyOYWo4KlWBwhGmBaDyBRwsHcBWDIglKGQ+OOIVqZ?=
 =?us-ascii?q?ctePDUCDC8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:jkTV8aKz5iewu9NBFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENSgjcBx
 zMZXj+CO6yCYWGkfop+PIvkpxgP6JfQm9Q3GQsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGcpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1xHGskONc+0d1yAEJkr
 vIeJmE3SSmq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeC0b4uNJ4fTLSlTtkuX4
 Uv541WlODohZfPD2QaGzymVnMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:o+rdNqozGEkZBK+Ba+pVGAgaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:VdpIO2DWXM3gIdn6EzZ33lwRQOYOSXjc712LLUm2WFxOcZTAHA==
X-Talos-MUID: 9a23:kjFqZQW+j95Llazq/DLjwxhdKPY02Y+VWW9RgakFhpK9LwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="501790531"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:19:10 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id CCEE7180004BF
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 17:19:09 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id E25DDCC037D; Wed, 15 Jul 2026 22:49:07 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][wrynose][PATCH] mbedtls: set CVE_STATUS for CVE-2025-66442
Date: Wed, 15 Jul 2026 22:48:58 +0530
Message-Id: <20260715171858.1142328-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 17:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128223

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
index 23d5c0878f..865c9c2b68 100644
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


