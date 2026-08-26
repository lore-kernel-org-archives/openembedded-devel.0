Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64936C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:10 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7505.1787730845778811373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JE6IHy8D;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1175; q=dns/txt;
  s=iport01; t=1787730845; x=1788940445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4+7u0PCwdSWlczxwrYrTuoER8IMT95vmJsZVgXOys2k=;
  b=JE6IHy8Dkp5WuMr5GVWD2P2vjHtiivwK13nkGVzzCBsTPcu7zs/gq85j
   SxU4JcqlR3U1OCXwuuWaEvpWGGTXXlYmz8H4wYvsEncxy/Rx5m9JGyCIQ
   BbTIHydfL2MuwsVHGvvv7dKKF/JdYDP/Y8O45MYGpnL0tJ6ZpxvYaGnmS
   O/Qr88D9fVGFYj0udQFVIf2bcGR7pG+TF2xW/NuJY5yVBAF/KBFGpGr/I
   tCAQB1IOtoy//x8BlHD4MdPsetPwZJXBcPDlXkYAzG0oMK0475Zw316nB
   WvslmQRaEQGS1azBY+a7G+OzgjuTvKC+zfipQ9sqmGeKJO9vaLfLk2eR8
   Q==;
X-CSE-ConnectionGUID: IVIU4XA4RVO4XPS+vmg2gQ==
X-CSE-MsgGUID: BXjUKuLVRBOaWpn08odcDQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgBqmo5q/5QQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ8xIAQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXTYBGAEtMFxEgwIBgnQDvwOCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gihXInGxuBcoR+gmECgTR5hXgEgiKBDIF4kWpIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCB?=
 =?us-ascii?q?QIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJATxRGROWKJF6oQ8KKIN2jCKVO?=
 =?us-ascii?q?hozhVulES6YWos3mSOEaYFoPEaBE3AVgyIJShkPkiPMOScyAj0HAgcPApNxA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:rF/Q/KssGJ6qcisG7su6AolvWOfnVAZfMUV32f8akzHdYApBsoF/q
 tZmKT+POfrYMzTzeNwgbYi+/E0H7ZPTx4dkG1Nurn0yQS0XgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw29hWPD1+3
 KAiFhdRXii4xPyzz+i0c7w57igjBJGD0II3s3Vky3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgd/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KobTHpoPwR7Dz
 o7A107JACw5Kfih8xCi+020gLefmi/wdLtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWnqUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:M9a+B63h4ZLNwuaM05mFrQqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:VNo2rmCEbH0FsZL6EwhZ1XNIKul5SEP6kEfoGAymDGkzR4TAHA==
X-Talos-MUID: 9a23:jHG2HQUCI9Aiydrq/BXchgxBKeNW2Y6JAX8Vl81WvMWPGRUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821372703"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id A853C180003A1;
	Wed, 26 Aug 2026 07:53:47 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 4B054CC12A8; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][PATCH] jq: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63409-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129490

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
Use jq_project:jq for the historical NVD dictionary CPE and configuration
identity carrying two jq 1.5 CVEs, and jqlang:jq for the active NVD
dictionary CPE and configuration identity plus CNA affected-data identity
used by the current upstream.

This changes the generated identities to two exact CPEs, but the frozen
sbom-cve-check database leaves the 26-entry CVE report unchanged, with no
current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-oe/recipes-devtools/jq/jq_1.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.2.bb b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
index c413391a7a..0bbe6e009f 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.2.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://run-ptest \
            "
 
+CVE_PRODUCT = "jq_project:jq jqlang:jq"
+
 inherit autotools ptest
 
 UPSTREAM_CHECK_GITTAGREGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
-- 
2.35.6

