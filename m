Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5BBC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 07:29:47 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.169350.1783409383613280971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 00:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MEOsJ1/h;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3134; q=dns/txt;
  s=iport01; t=1783409383; x=1784618983;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nQ2L2nIMDxD7lKtjIAOmxdAJHzLnnOPIVxd4pJvhM6g=;
  b=MEOsJ1/h/Eq7uyTqY8XpS5SeCuAyR/wiaOlDF9WnL6MgC6QWkjknzKtG
   sew3gXlr95mmbc0Pp/8PzU0cOOcY6me/YiniSa1l7mt3GCK9loFM0sNIM
   ew3W6R+/nz+54YBhq8UIEBBs99oF3Bc82R0TD4OuSgPzbpeBzWQ/kLaRw
   UIXn/sRWJ4BRvoPKdGQlRXt8onvkc3TvArrUqSMRm2Tg34f/XtxJ9CavV
   SEZRe+dtgD8X/JCnnnU6oXOAaPqeSWUilbCWStx0m9uaLA77ovklEeNoM
   QOJX9uXmlCMj5nDllzqvRJV4Sj92Ahql41H91po5/77jJvaLMxZS/qEb+
   g==;
X-CSE-ConnectionGUID: 0Qi5pWCcTSW7NHuZ7fKhIw==
X-CSE-MsgGUID: elJr1um/Rlijj4h9cwFzww==
X-IPAS-Result: =?us-ascii?q?A0BBAgCaqUxq/5D/Ja1aHgEBCxIMggULgld0X0JJA5Qng?=
 =?us-ascii?q?iGBFp0IgX4PAQEBDzQdBAEBklUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2HEwEYAV1cPAiDAgGCcwMRuGKCLIEBgygBMQMLAkNQ2?=
 =?us-ascii?q?ywBCxQBgTiFP4gfcwGEfCcbG4FygRWCc3aBBYFcAYgmBIIigQyBeI88SIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2Ba4EChHkjHwM5f4Ewd?=
 =?us-ascii?q?Up5LYEDEh4KgVKBUQMLGA1IESw3FBsEPm4HjHQZFw+CPT0cESQBKyCCDJM1k?=
 =?us-ascii?q?j6hEgoog3WMIZU6GjOqbAsjmFqOCpVgcIRogWg8gUcLB3AVgyIJShkPjjiFa?=
 =?us-ascii?q?mXLVjw1AgwvAQEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:UobAMKP6P4fA7zfvrR31lsFynXyQoLVcMsEvi/4bfWQNrUoi0DYOn
 zccWmGPMq3YN2GjKdx+aY/j8kJT78DdxodhGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6g2Esawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj661XDRwuAqYTxt1IXkdu6
 M5HJhMNTw/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsiOWybYWLK4ziqcN9k0K6v
 Dvb+iPDBhAYNoCfmDGa3GCzmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:BqgcQK9I26ZkaUEauOFuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AhMzNSGsD/ehAuZwqaP6ElgNh6It9S3yA1Ej7KHO?=
 =?us-ascii?q?DNjlPaKCnFlGz+IJ7xp8=3D?=
X-Talos-MUID: 9a23:OvT+5wiCrDX/U2zZPMcffMMpOcNK+f2zDQc3lZQEuZWEZCdvFSWCk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208";a="505757698"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 07:29:42 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 807FA1800021E
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jul 2026 07:29:42 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 97B0FCC037D; Tue,  7 Jul 2026 12:59:40 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][master][PATCH] mbedtls: set CVE_STATUS for CVE-2025-66442
Date: Tue,  7 Jul 2026 12:59:31 +0530
Message-Id: <20260707072931.2861108-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 07:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128057

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


