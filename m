Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6021C5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:37:46 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3577.1787218662782128305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ui8UPMRV;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1071; q=dns/txt;
  s=iport01; t=1787218662; x=1788428262;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X8dzvVeN6e1Ag/7RgPugQs6IhbiC4hFhC7n30fpjn3I=;
  b=Ui8UPMRV2l0wFAvCXnmY2KEum/eku/IkWe38MWJ9aVTCQNUEe6Vwzi+O
   EQkwZ1g5AyEjzpWHRVG6Cg73yCGkzrRX3doX/4m4+RhWv+myojMZUdRjO
   v5RDjQBGJp9KRAZ1QqsLEuLtzsSvbLCWaEtXp2rR8gbz2SFVPQjfRZDnL
   RcDYZhiWDubV/WTcP0XvvQvfJ+Ch40C0kQpEvl7w6W4D/w+DqOMeJi2Dv
   1/36UjU7RedlXN2cWxz5B2KMBJGRZvX3skP7W4AzdlBiY5HBSj3DgMTRJ
   L/qToKusyWpn8y6H7Lh244EZ5jKkfV0qugvi6r/vRiWdDnAnu4CCKoE4k
   A==;
X-CSE-ConnectionGUID: a8rQZGW/QweO2GITGmxY5Q==
X-CSE-MsgGUID: IFJ67lfsSHOONoDdXS00TQ==
X-IPAS-Result: =?us-ascii?q?A0AxAwCRyYZq/44QJK1RCYJZgld0XkNJk1kBgnCgHA8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDEcJKgiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6ECg15hXgEgiKBDIF4gmOOb0iBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGA?=
 =?us-ascii?q?gFJRQ4JFwsYDUgRLDcUGQQ+bgeOUSCCSwE8UZZUkXqhDwoog3aMIZU6GjOqb?=
 =?us-ascii?q?C6YWqRahGmBfiZGgRNwFYMiCUoZD95cJzICPQcCBw8CkXOBfgEB?=
IronPort-Data: A9a23:YQtPUq1exs9c0WItnfbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2YEz
 DdOWWjSb/2CYjHyeosgbISz/BsDuZKHydQyQQI93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24tYzpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGBREsBL83xaFOHmxpr
 9M5FB8IfiHevrfjqF67YrEEasULJc3vOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME6ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZgOG3YYGPJIfWLSlTtme2h
 DyZ+2riOTE9E/qY5Ta1ySr0utaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:yeMIF6opFPq3ojJAIwAmeT8aV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:JZQQzWw860yC98ne0zjoBgUdStocQFLii07PLmjiJkdVZ7iFeAKprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AloYWSA8TvCzUaFJMFRtAcGOQf+ZGwfrxDE4WqrU?=
 =?us-ascii?q?hnO+DGSBAAG/FsA3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812932634"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:37:41 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id BD5AE18000168;
	Thu, 20 Aug 2026 09:37:41 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 55993CC12A6; Thu, 20 Aug 2026 02:37:41 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-httplib2: correct CVE_PRODUCT mapping
Date: Thu, 20 Aug 2026 02:37:41 -0700
Message-Id: <20260820093741.42804-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 09:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129385

From: Devansh Patel <devanshp@cisco.com>

The current product-only "httplib2" mapping generates a wildcard-vendor
product identity instead of the vendor assigned to the packaged project.

Use "httplib2_project:httplib2" for its exact NVD dictionary CPE and NVD
configuration identity. This changes the generated CPE, but sbom-cve-check
1.3.3 with the pinned NVD database snapshot has no current CVE report delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
index 4c1d0539e4..a2b8f8634f 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
@@ -14,4 +14,4 @@ RDEPENDS:${PN} += "\
     python3-pyparsing \
 "
 
-CVE_PRODUCT = "httplib2"
+CVE_PRODUCT = "httplib2_project:httplib2"
-- 
2.35.6

