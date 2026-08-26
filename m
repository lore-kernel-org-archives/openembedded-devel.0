Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF58C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:09 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7454.1787730844575562933
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gphT8b+N;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1029; q=dns/txt;
  s=iport01; t=1787730844; x=1788940444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j3jlZ6brycTjfnnpqxia4dMQ470l84/C1VLloT0VCww=;
  b=gphT8b+NWf9VyVnKm/ZYnTLdI/cj2SeZnQ8UrW/nvYqwguIVxGQu/PDc
   l33Hx/YE1Enmfc/TmzKoeIofSUL7ON/05A8n8UrKsGMUQ2X/c2NWpldvI
   yhH2lGE1Je+nOpq7nMIUF+y6sL7ogfKO8zeu5aIQs2fv+Hu2oCfz7lF5d
   JXq3pY9haK19Pi+MAU4w94pxoTG4gblC70D1D5/EfwdsZjKiag028RTfZ
   VxsHZLbAb+Z96tO3aJSdD4hkoc8331wXN1+hdzUqC5rm3ay2aRH0Vdbfz
   QvQv41kErvCAxgq606b/GMoWM3XJiNfou4IGozQRLVUrW1ntZt7Y5HZM3
   A==;
X-CSE-ConnectionGUID: +GSP7ZLqQs6Z2f3CMNNYfg==
X-CSE-MsgGUID: 42H6hNhZTmaJhizXI63GeA==
X-IPAS-Result: =?us-ascii?q?A0BCAgDnmo5q/4wQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO+eYIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CKFcicbG4FyhH6EF3mFeASCInoSk2JIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBSUMOB?=
 =?us-ascii?q?0c+CxgNSBEsNxQZBD5uB45rH4JJATxRGYJQk2uReqEPCiiDdowilToaM6psL?=
 =?us-ascii?q?phapFqEaYFoPEaBE3AVgyIJShkP3lwnMgI9BwIHDwKTcQEB?=
IronPort-Data: A9a23:YosT26nGERuejH289Hg+0yDo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLWD+HPP+DNjP8ftx1bdyw90IAvMDcyt41TFduqSE2FltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsfzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fc43wd4oM0VXz
 OdGGmoDNTumocSHzr3uH4GAhux7RCXqFIobvnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEXUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGIqMK4bbFJQKxy50o
 EqapUSnAjcaBuCawBiF82Ccp7GUsi7SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/N/Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:CwbOWaOcirt29MBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:TtFxr2+a4Ga6kGIX01qVvw07Ifh6QFnE9WyOERW2Uk1MbpukR1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ADTrjDQ0lzdtoTRpWow1GVWowETUjv/6OVkArkac?=
 =?us-ascii?q?6vsCmNS1iCxbD1xu6a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819299971"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id DE258180001F7;
	Wed, 26 Aug 2026 07:53:47 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 7F163CC124A; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][PATCH] libssh: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63557-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129485

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
libssh:libssh is the active NVD dictionary CPE and configuration identity
for the packaged libssh source.

This changes the generated product identity to an exact CPE, but the
frozen sbom-cve-check database leaves the 48-entry CVE report unchanged,
with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.4.bb b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
index 292b8f797e..a8e74dc59a 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.4.bb
@@ -15,6 +15,7 @@ SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused
 
 SRCREV = "ca9c055d7c78ce357346ac7c2b14047568d47aa1"
 
+CVE_PRODUCT = "libssh:libssh"
 
 inherit cmake ptest
 
-- 
2.35.6

