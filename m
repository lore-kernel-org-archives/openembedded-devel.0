Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BC5C61CE3
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:51:02 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13935.1787568659021763412
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DVKnXK0G;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1298; q=dns/txt;
  s=iport01; t=1787568659; x=1788778259;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JCzzF4wCXRLNX6jq5qhY8SnCzg27UbeDJwcydbYHmXY=;
  b=DVKnXK0G/uHNrcGIBx5hmCJrLIFfn196Jdn60X8mU8U5UnpVwfjgb4fU
   C2oVLjEKfbIqkjCuBgFmgUZDPgU6S7psHiRhORi8gacMt468Ug21Q/g/t
   R5addaihEfR2t6MxxOL/JHHPfSZfQ44/rVWO7YFF0NqFr8ucjhImLHdZc
   ef3/7v7CzhUkFce7fsZvSdF8BL0kstLSpsJzss2FWDTnGbIwUXObJ9Ft6
   8eXN++CphgPGtrgYXbkHe/GhEx6PtMHGCwFzLBDAKWd9a/yN4/DCXqXOD
   2z1kpgb4+LO2skzL5L/9kK38GLOVFvb46KX5RvVnT6EFJyj/vwsZpLgQC
   Q==;
X-CSE-ConnectionGUID: eSwQtqtQSbiAtE/m5KWE/g==
X-CSE-MsgGUID: S6o4E/SOSz2sWcYVzB4EQA==
X-IPAS-Result: =?us-ascii?q?A0D4AgAvIYxq/48QJK1RCYJZgld0XkNJk1kBggRsnh6Bf?=
 =?us-ascii?q?g8BAQEPNxoEAQGFBY1uAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGXTYBGAEtMFxEgwIBgnQDwxiCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gidoR8JxsbgXKEfoQKDXmFeASCInoSk1pIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspZAESF4EJggcCglqCBQIBS?=
 =?us-ascii?q?UMOB0ciCxgNSBEsNxQZBD5uB45eH4JHATxRllSReqEPCiiDdowilToaM6psL?=
 =?us-ascii?q?phapFqEaYFuATWBWXAVgyIJShkPji4V0BknMgI9BwIHDwKRc4F+AQE?=
IronPort-Data: A9a23:g8xnC6jBsP9y0q5ZaooMr6a4X161MREKZh0ujC45NGQN5FlHY01je
 htvCjqGPKmKYjH2KIwjOdiw8RwF78DVzNYwSFFvpCBgQy1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jf8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUVwflOHXhSz
 McSKRkRQ1eG2sGJ7fW0H7wEasQLdKEHPasWvnVmiDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYT/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFI4zaGJgKxhbwS
 mTuxDr+XjxdD/uk22CezXmduP3lwQ7CcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmAHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:v+JoyqnokfRDtbF+gCFuVvim1G3pDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3AbRl8iWkPX3YQbfH14z+AWazbDozXOXDm007MOlO?=
 =?us-ascii?q?BMmxoYaG4DlrN25xJ1MU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AJrdr3AxA5hEWLWOtPcQElT629l+aqJ/wDxwg1q4?=
 =?us-ascii?q?hgNveLhN7CgmPpmiae6Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="818855708"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 10:50:58 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id EDF3E18000116;
	Mon, 24 Aug 2026 10:50:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 88CDECC12A9; Mon, 24 Aug 2026 03:50:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-werkzeug: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 03:50:57 -0700
Message-Id: <20260824105057.64743-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 10:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129461

From: Devansh Patel <devanshp@cisco.com>

The current product-only "werkzeug" mapping emits a wildcard-vendor identity instead of the exact identities assigned to the packaged Pallets source.

Use "pallets:werkzeug" for the CNA affected-data identity and "palletsprojects:werkzeug" for the NVD dictionary CPE and configuration identity. This changes the generated product identity, but sbom-cve-check 1.3.3 with the pinned databases leaves the current CVE report unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
index 4e1be5cb2f..fae4de2a3f 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
 SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
 
-CVE_PRODUCT = "werkzeug"
+CVE_PRODUCT = "pallets:werkzeug palletsprojects:werkzeug"
 
 inherit pypi python_flit_core
 
-- 
2.35.6

