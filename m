Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4029EA3C3C
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129129.1775730840735271080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mLcPcNLN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730840; x=1807266840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+IDWStsdHbHS8aEYEb36LcvVqijGdd9bQeanocq+pTo=;
  b=mLcPcNLNK7qyAhvhNivD5bJITfu+RuMAGMYPANOjhhhr51JA90i5a1SC
   LsmqA3nK9ejZBAtL319Kp8Ya9xaOJDb7MbC8oZUvxMR3FJH30OT39wkdL
   hH1rbVPoPk3jpcGowrNQckFADz+wqkqL0s79wVS9JGERJxIDDgepaRh/A
   EMlt4MTtEuustzpM+/XF0o2pfC7At8vl87sVdPD+4nFhClUOfNG+OKDsU
   YpY6MNaW6zwFPsKkLh8HmoUpho5GoMIR1bMNhZhQdOOJQoQ9t+5DAsCc+
   1NkVlnNnP2Jq96PyZLq5M0W+Fwii8T+e+Bij/m0iFW8BPbB/IcpOxYGeO
   A==;
X-CSE-ConnectionGUID: Abaa8BeJQWm1c/ABRgjW3Q==
X-CSE-MsgGUID: u9mL+fUnTA6fz26px00KhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236386518"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236386518"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:59 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 437E61C0054E
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:59 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id EE8A01001345
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 55C444046AC;
	Thu,  9 Apr 2026 10:33:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/37] python3-fastapi: upgrade 0.135.2 -> 0.135.3
Date: Thu,  9 Apr 2026 18:32:06 +0800
Message-ID: <20260409103223.1574-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126169

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.135.2.bb => python3-fastapi_0.135.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.135.2.bb => python3-fastapi_0.135.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.135.2.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.135.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.135.2.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.135.3.bb
index a8ace95347..a4bdb19bbf 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.135.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.135.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "88a832095359755527b7f63bb4c6bc9edb8329a026189eed83d6c1afcf419d56"
+SRC_URI[sha256sum] = "bd6d7caf1a2bdd8d676843cdcd2287729572a1ef524fc4d65c17ae002a1be654"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


