Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27958.1793856643346845791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iY5ckokU;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3046; q=dns/txt;
  s=iport01; t=1793856643; x=1795066243;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pxea2BHyelrDsEsobI9A3+smYSq7Li85JwAiIKIN3VA=;
  b=iY5ckokUeS0kOW2xL4uLClmkVmWp2+9W7JFFU5mc3szJmvl4Y5lIFLJx
   S0TK9NNK+Vid4n5FuBDfh4FHa1nPmqWOxscxMq3U6jZlZOHwJ3UlTh8Qo
   jJDmVs+6CXxTbYVzM8Dnrocusp7TNB8G3G9JrpRulR79RTz0Ojk9R/TXC
   2IvDnicxePJv8A3pPKkPc/IDNZ433ExGoOwQGpbdcC8sXshIEa2E3MgY9
   m0T572wuc97meyc8vBXV0InKz592tpEzBkNv/BSpMAWgS/TE4inG64aQq
   9X2Gk+nVCT8ePvqfVBGdvtB58gCRg1ZbcmzV8pqmyHQdCULzPBGTXLNo3
   w==;
X-CSE-ConnectionGUID: J+k5uN7DRFGyMLiVDnRNSw==
X-CSE-MsgGUID: DY70EH2RSA+5kSb4eHTvTA==
X-IPAS-Result: =?us-ascii?q?A0BDAgCDE+xq/5P/Ja1aglmCV3VhQkm0b4F+DwEBAQ9ED?=
 =?us-ascii?q?QQBAYUFjh8CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NkBIBAgE1AUYsAwECWiMhgwIBgnQCARG8P4IsgQGEftszAQsUAQWBM4VAi?=
 =?us-ascii?q?CNdGAGEfScbG4FygRWDaYEFgVwCgi2FeQSCInoSgVoejHoCgVKGcEiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF0BIYEIg?=
 =?us-ascii?q?XYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIA?=
 =?us-ascii?q?g0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRgQ4BKgGCLKV2oREKK?=
 =?us-ascii?q?IN4jCSVOhozhVulFguYfY4KllGEaYFoPIFZcBWDIgkWNBkPjjmDa4UTyUgjN?=
 =?us-ascii?q?QsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:lU1Aoa5YJnJt+5dt2cSHHgxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mcdUGyGP6zfYzP8etx2bITn8EoF7ZOGnIU3GQVk/y89Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMt/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eH84bp/tRXk102
 9MJDRQMUDyFvcSN3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEQUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGIeJJoPUGJ8Pzy50o
 ErqzjuhLzFADue2imeGyXjwi8/zgx/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:n7ygCK7DNTYHVrDyuQPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3As04LeWoHBKAAXjqzIWejFfrmUeJmcSDA6ij8GWG?=
 =?us-ascii?q?XGENNSYO5T2W2w7wxxg=3D=3D?=
X-Talos-MUID: 9a23:c05MsQTig/zL66YMRXTAtW46Gecy2Z+HSx0Oqp9atum4KxBZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544765229"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:30:42 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 265A718000247;
	Thu,  5 Nov 2026 05:30:42 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id C0B40CC1634; Wed,  4 Nov 2026 21:30:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-oe][wrynose][PATCH] nmap: Fix CVE-2026-72712
Date: Wed,  4 Nov 2026 21:30:34 -0800
Message-Id: <20261105053034.2201317-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 06:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131860
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream nmap master backport for
CVE-2026-72712 to the Wrynose nmap 7.95 recipe. The upstream
fix commit is referenced in [1], and the public CVE advisory
is referenced in [2].

[1] https://github.com/nmap/nmap/commit/7ef4ee030a0023fe22616387a000032e1a678b6a
[2] https://github.com/advisories/GHSA-7j7x-fg87-hwwg

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../nmap/files/CVE-2026-72712.patch           | 50 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.95.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch

diff --git a/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch b/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
new file mode 100644
index 0000000000..8e47810e0d
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
@@ -0,0 +1,50 @@
+From 1c14f984d3b5574099db3a0cf415e74b70330128 Mon Sep 17 00:00:00 2001
+From: dmiller <dmiller@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Thu, 11 Jun 2026 18:31:31 +0000
+Subject: [PATCH] Stop parsing on a zero-length packet option
+
+Fixes #3368. Closes #3373.
+
+CVE: CVE-2026-72712
+Upstream-Status: Backport [https://github.com/nmap/nmap/commit/7ef4ee030a0023fe22616387a000032e1a678b6a]
+
+Backport Changes:
+- Omitted the upstream CHANGELOG hunk because its master-branch context
+  is absent from the Wrynose nmap 7.95 changelog. The
+  nselib/packet.lua security fix is retained verbatim.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ nselib/packet.lua | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/nselib/packet.lua b/nselib/packet.lua
+index b09dcc967..19400c8bb 100644
+--- a/nselib/packet.lua
++++ b/nselib/packet.lua
+@@ -692,10 +692,7 @@ function Packet:parse_options(offset, length)
+   local opt_ptr = 0
+   while opt_ptr < length do
+     local t, l, d
+-    options[op] = {}
+-
+     t = self:u8(offset + opt_ptr)
+-    options[op].type = t
+     if t==0 or t==1 then
+       l = 1
+       d = nil
+@@ -705,6 +702,11 @@ function Packet:parse_options(offset, length)
+         d = self:raw(offset + opt_ptr + 2, l-2)
+       end
+     end
++    if l==0 then
++      break
++    end
++    options[op] = {}
++    options[op].type = t
+     options[op].len  = l
+     options[op].data = d
+     opt_ptr = opt_ptr + l
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.95.bb
index e2bd57b114..0b8c7009d3 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            file://CVE-2026-58058.patch \
+           file://CVE-2026-72712.patch \
            "
 SRC_URI[sha256sum] = "e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778" 
 
-- 
2.35.6

