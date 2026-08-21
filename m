Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A32C5DF8E
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:59:51 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6756.1787317186586960118
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F3BSydsb;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1334; q=dns/txt;
  s=iport01; t=1787317186; x=1788526786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aR7sDgZFi8w7PltiNTgm9wMVJzWkVVeK7n7PVTmv54E=;
  b=F3BSydsbIiRv8egZ29rFdKmkIAeNadYQbHAnRyF13Xht3aR2MsBiYMrM
   Te/LEwcKLMaW1L7A+Eu2EACCcI5QEYEuPHQIbpuA7sySngWXSUyTciFOk
   YScFHthDwJ7JIVqIJOnvSjHSkDNqux/LDe9GvSIbgeFDMRVgDjqJ+zoyd
   axMvEFcF0bDI8+t7VFFLOWxEG7UHhbIxbE7MHmbuZeAL2JijyotizB/id
   sNcI9nmi/Xi25qlBVwJwI4Il+HavoEn9UIChIjOo3Zq/vtgmLzLFa+Ddx
   PROCgLkPmAR5SWU1crw2l+s0yM/K/gWLOVx3gDvPgAq5vZkCmGVRdYZHu
   A==;
X-CSE-ConnectionGUID: 3YtSGbzRSaWRkFXuh8cjIg==
X-CSE-MsgGUID: vvOjpZSlSsiFi7kJjMtLHg==
X-IPAS-Result: =?us-ascii?q?A0COAwDbSohq/4sQJK1RCYUwdF5DSZNZAYIEbKAcDwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjW4CJjgTAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4Zchl02ARgBLTBcRIMCAYJ0A8EwgiyBAYMoAYFU2zABCxQBBYEzhT+IInaEf?=
 =?us-ascii?q?CcbG4FyhH6ECg15hXgEgiKBDJNWSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJfggUCAUlDDgc6C?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB45aIIJGATxRllSReqEPCiiDdowhlToaM6psLphapFqEa?=
 =?us-ascii?q?YF/JUaBE3AVgyIJShkPji4V0BknMgI9BwIHDwKRcyp0YAEB?=
IronPort-Data: A9a23:6HmQxK0J+O0sJwkK6/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzUDn
 DBKDziOOfqCYGryedt1aNnlphsEvMXRnIcyHFY43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24uazpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGV3AqBqIS6NxMCF509
 tIoNTBdZRKiiLfjqF67YrEEasULJc3vOsYb/3pn1zycVaxgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2N0Wojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOGwboaMIo3RLSlTtliGg
 WDezV/9OQobGt3AyhiH126IpuCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:PxL3IaFXVUl9GMdMpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:wpwfYm8MQmTOTi3ktX2VvxUlBvsKeG/n937vGUyWOXtpGLaXaFDFrQ==
X-Talos-MUID: 9a23:njXS0wiSA4nfFy/dcsNRd8MpKtlP4bycM0Q2ipQoupaHFy5VJxO9g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,235,1779148800"; 
   d="scan'208";a="815641093"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Aug 2026 12:59:45 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 9C7BF180001B8;
	Fri, 21 Aug 2026 12:59:45 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 3FB78CC12A8; Fri, 21 Aug 2026 05:59:45 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-py: correct CVE_PRODUCT mapping
Date: Fri, 21 Aug 2026 05:59:45 -0700
Message-Id: <20260821125945.59799-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 12:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129420

From: Devansh Patel <devanshp@cisco.com>

The product-only "py" mapping generates a wildcard-vendor identity
instead of the exact NVD identity for the packaged pytest-dev py
source. Use "pytest:py" for its NVD dictionary CPE and configuration
matches.

This changes the generated product identity. With sbom-cve-check 1.3.3,
the current CVE report is unchanged using the pinned database snapshots;
both mappings report CVE-2020-29651 and CVE-2022-42969.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
index 61f3873b4c..76cb4ce745 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
-CVE_PRODUCT = "py"
+CVE_PRODUCT = "pytest:py"
 CVE_STATUS[CVE-2022-42969] = "disputed: upstream could not reproduce it, github also revoked the advisory"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.35.6

