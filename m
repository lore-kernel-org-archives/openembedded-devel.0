Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDB9C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:16:19 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7145.1787728573572630320
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fChPD0gB;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1497; q=dns/txt;
  s=iport01; t=1787728573; x=1788938173;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uL871A7AiTtNd5vOp/8NF3Y65QbUg1AZDdJGnbMD6Xs=;
  b=fChPD0gBptk6KxP9+8b6HAV7Y2bBmRlWJAMormoCDxb6O8vbo2NmfUfw
   NpZXe1XBfA/DVer3ybEMu8yt6Ou2BU+/YImPNQfjGKGzmLeuW/VFSEgII
   tpXiIWdkL/HOaEFdWOfhcKBO5r5cme2oiaeVOj1ChXgxRp46IV5pgFfNj
   iNETJVm+KDZE05TKnxNBGfWIvD86p7I2t6vavXL6/aWzK9K9/Jgu135pO
   lj9EzH/gezClO0Ev0fjs+KV9TPZABwUi0lgbIv3uyQf1R+uJBqA9p0LQA
   T8mDOuXGNFGpU0lqtxKmvH0noqfr2OZ7uHHEuRuw1Dqdiqv0R30taR1IR
   g==;
X-CSE-ConnectionGUID: 1YN1hFWSSbi8bRtGdzBXNA==
X-CSE-MsgGUID: bdpXPcdKQNiddd57AqiZxw==
X-IPAS-Result: =?us-ascii?q?A0BDAgCIkY5q/48QJK1aglmCV3ReQ0kDlkeeHoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/Ro1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8Nhl02ARgBLTBcHQEmgwIBgnQDEaddgiyBAYMoAT8CQ1DbMAELFAGBO?=
 =?us-ascii?q?IU/iCJ1AYR8JxsbgXKBFYNpgQWBXAEBgi2FeASCInoSk2JIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJg?=
 =?us-ascii?q?gcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJgQ4sBByBTT8FpXGhD?=
 =?us-ascii?q?woog3aMIpU6GjOqbAuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD444g2uBf8o6J?=
 =?us-ascii?q?zICCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:r978G6h5wpn8QrpHFfJe9k4uX161MREKZh0ujC45NGQN5FlHY01je
 htvWzqBOquOZDT2f9x2Pdzl/UoB7ceEm9djSwVqrypnQyJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVBy8AuAU9xz
 scSKWAHVAysi/Cc8JSSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYT/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKFIIXSH5UMxhzwS
 mTu9WjhMikROP+m7zuJ/n7x2cbWnBHrR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmAHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:oI8cr674wGGUsC/yAgPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:RggsbW+0Re26Hnozo+mVvxclPJklXELm933Rc0WCFUllWpelb3bFrQ==
X-Talos-MUID: 9a23:XHD2gwiiHNrj2ngEzZODpsMpPstw05ylBGM0t5QKt8XZagVpOgWNk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821028102"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:16:12 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 69F62180006D8;
	Wed, 26 Aug 2026 07:16:12 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 45CB4CCA79B; Wed, 26 Aug 2026 00:16:11 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH] python3-aiohttp: ignore CVE-2026-34515
Date: Wed, 26 Aug 2026 00:16:09 -0700
Message-Id: <20260826071609.849718-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129484

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- The upstream advisory limits the issue to aiohttp applications running
  on Windows and identifies the affected and fixed versions [1].
- The advisory-selected upstream fix rejects absolute static resource
  paths, explicitly including UNC and Windows drive paths [2].
- NVD independently describes the issue as Windows-specific and records
  the same upstream commit as the patch [3].
- Hence ignoring the CVE for now.

Reference:
[1] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-p998-jp59-783m
[2] https://github.com/aio-libs/aiohttp/commit/0ae2aa076c84573df83fc1fdc39eec0f5862fe3d
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34515

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 84a9f2e668..6f89a18b13 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -13,6 +13,8 @@ SRC_URI += "file://CVE-2024-52304.patch \
            file://CVE-2025-69228.patch \
            "
 
+CVE_STATUS[CVE-2026-34515] = "not-applicable-platform: Vulnerability only affects applications running on Windows"
+
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
 
-- 
2.35.6


