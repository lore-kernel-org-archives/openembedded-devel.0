Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E5AC61DD2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:11 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7455.1787730844674875049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XOtTg4LR;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1032; q=dns/txt;
  s=iport01; t=1787730844; x=1788940444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Usv0j1MNJLn/ybXIEzFLbMm35meut29Skex3ALj+2gs=;
  b=XOtTg4LRPfVm0ZR8Yv3420IP7AiTuZt7Y+gA1+bmK5KTIpLaz8WYfocY
   l3hz/3mJo4W+ym7vENeIqOoK6ylDwAzBHs2WQ2e0cQOyTdydfWUvMCKUR
   JxaL+clrE1xyRgnN55bIKbEmk6fFtECdy9c/LsZPSy5KJDuZplaHtqvAp
   HzSi7JsEBnLLNwvw7aNPwciRvdprMrYjEVDaCZ47fuj/JHXgO0XP1Bs/C
   UOkCkbnanDiZc+lQHVABy+2Skn2OVLCM4B2pwrGF3Uy0SPS7cDiFb1iaj
   npViZbLT/AVPy9GWK8tCBpjp2Kh+za/IUMOCrzDlB2j1wvxoDARYVu9Lc
   Q==;
X-CSE-ConnectionGUID: BBKAWlzETUCIK2iSH91zdA==
X-CSE-MsgGUID: P27RsYqbS8u5hivH7jOP/Q==
X-IPAS-Result: =?us-ascii?q?A0BCAgBqmo5q/5MQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO/A4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CKFcicbG4FyhH6EF3mFeASCInoSk2JIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBSUMOB?=
 =?us-ascii?q?0c+CxgNSBEsNxQZBD5uB45rH4JJATxRGYIAFpQlkXqhDwoog3aMIpU6GjOqb?=
 =?us-ascii?q?C6YWqRahGmBaDxGgRNwFYMiCUoZD95cJzICPQcCBw8Ck3EBAQ?=
IronPort-Data: A9a23:8RwJWaiTx9zGC/q+35yrqUKCX161MxEKZh0ujC45NGQN5FlHY01je
 htvWmGBPPiLYWLxfogjaYvipkxV6JHTy9FjQVA4pX8xQiljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUy0MVePmVc2
 MAlAxEuNBG4p7Pv0r6SH7wEasQLdKEHPasWvnVmiDWcBvE8TNWaG+PB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTZT/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFI43SGp0Pxx3wS
 mTuxz6mOAorLdakmSfY8nOyprDNuhu8YddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBF2YHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289m7oUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:dEt6vaMaJW9RJsBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:GI8A+WA4I0XvEu/6EwNN12crHtIITkD27VSKInSYWD97RJTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AFgDMtQ+b4N8EDuGS/fluLXqQf/8yvJ61OVkHqsU?=
 =?us-ascii?q?b5smFKwwvORClyw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819070213"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 367901800054E;
	Wed, 26 Aug 2026 07:53:48 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id C97CBCC12A8; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][PATCH] mariadb: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63790-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129486

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
mariadb:mariadb is the active NVD dictionary CPE and configuration identity,
and is also used by CNA affected data for the packaged MariaDB source.
Deprecated mariadb_project records describe a separate Node.js connector.

This changes the generated product identity to an exact CPE, but the
frozen sbom-cve-check database leaves the 420-entry CVE report unchanged,
with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
index b1d1355e2b..71c91f0b2f 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb
@@ -1,5 +1,7 @@
 require mariadb.inc
 
+CVE_PRODUCT = "mariadb:mariadb"
+
 inherit ptest
 inherit useradd
 
-- 
2.35.6

