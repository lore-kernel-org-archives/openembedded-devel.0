Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F667FCC9D6
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 08:22:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35481.1773130951107673060
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 01:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qTljHUpJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773130951; x=1804666951;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+bPdkI0HZZbCG5/kDSjyrxykGbsPWIRNz88MdWRt/Vo=;
  b=qTljHUpJg0sFHcBPqB8sJfmq8ydhUpdcrEc4o7GncUowFzGF3ApMEfNZ
   6KzJiahVnHlHPZH+Of54NMtx+7CdS4/J5UIJSWUDuaU10tK45d2/wrpyk
   pf3SuBfis0xYWskvOA7jLXk0RNaboDBRZcnYAMReWz9U0MFpzqvcsIvSG
   MuITIVt176P/1UZNHLpcqA09qNPrHggWHyBNRaFKEyWSbiN3UqsHPF8VR
   31iS9JETw6gPurmCosL7RFlG49GFPt7G9yGKlqN1Mk37Cg3KyCcLczQBv
   8kMx6ZXkpQmhlekj71lWICEoooUD5f/XBHEHavlSI/s/LWDPkOtFGPpSD
   g==;
X-CSE-ConnectionGUID: XhSw6F4US5mfdT4bbC790A==
X-CSE-MsgGUID: 2ZInf+jiQ1WL6LBI3Mwzag==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="211479483"
X-IronPort-AV: E=Sophos;i="6.23,111,1770562800"; 
   d="scan'208";a="211479483"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 17:22:29 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 33AD36768
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:29 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E79121003BE6
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:28 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9A677100058B
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:26 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] wireshark: upgrade 4.6.3 -> 4.6.4
Date: Tue, 10 Mar 2026 16:22:20 +0800
Message-ID: <20260310082221.871-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310082221.871-1-liuyd.fnst@fujitsu.com>
References: <20260310082221.871-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125021

Changelog:
  https://www.wireshark.org/docs/relnotes/wireshark-4.6.4.html

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../wireshark/{wireshark_4.6.3.bb => wireshark_4.6.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.3.bb => wireshark_4.6.4.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
index baf3af925d..369adbe8bc 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "9fa6a745df8540899dc9d433e4634d6755371ff87bd722ce04c7d7b0132d9af3"
+SRC_URI[sha256sum] = "fbeab3d85c6c8a5763c8d9b7fe20b5c69ca9f9e7f2b824bedc73135bdca332e2"
 
 PE = "1"
 
-- 
2.43.0


