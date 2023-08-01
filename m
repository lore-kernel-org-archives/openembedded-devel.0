Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D7FEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.7646.1690875751122537345
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114651557"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114651557"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:30 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FB01CD7E2
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5421BD8B78
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D627310211;
	Tue,  1 Aug 2023 16:42:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sip: upgrade 6.7.9 -> 6.7.10
Date: Tue,  1 Aug 2023 15:41:57 +0800
Message-Id: <1690875717-21608-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--0.277600-10.000000
X-TMASE-MatchedRID: FTsis3k8rau7qz8f6326on1zro62qhdCpxAd6mi1Ga2AI7Mvq/sL5wZN
	LEcrBa0wq1oOmzWDll7m08Df+RptelpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVU2d8
	mtRIRsUOBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNU8XOMKR+RhSJ4A//ivf0ZOFtlApYJsgVBfkKJnRllAYTffFAGzgPlMdTGwLZUVHw2/e4
	xO0ONFdi7EvSMJ0OTtiu87cJXczyY4g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104196

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  - Added the --minimum-glibc-version command line option to sip-wheel.
  - The latest version of ABI v13 is v13.5.2.
  - The latest version of ABI v12 is v12.12.2.
  - Bug fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.7.9.bb => sip_6.7.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.9.bb => sip_6.7.10.bb} (83%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.9.bb b/meta-oe/recipes-devtools/sip/sip_6.7.10.bb
similarity index 83%
rename from meta-oe/recipes-devtools/sip/sip_6.7.9.bb
rename to meta-oe/recipes-devtools/sip/sip_6.7.10.bb
index f6c2457bc5..c141d8f58e 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.9.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.10.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "35d51fc10f599d3696abb50f29d068ad04763df7b77808c76b74597660f99b17"
+SRC_URI[sha256sum] = "398aeb84ee03f3a953947cac70e60d3b02dceba3c4f4dd46c5383e9dbe3936bb"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


