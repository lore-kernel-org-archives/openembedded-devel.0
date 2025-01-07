Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAC8C02183
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.16416.1736240519323788235
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I/GJnSR8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240519; x=1767776519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g2n2kbq3OPM5i3ohk+mujZUT1/YakPBLQ+qzUIMuczI=;
  b=I/GJnSR8kWKza++BqMLXVeNJX1FCzVuuhECBw1K4QoLeBeWirMFd82EY
   vvNuEgQ4/b9fKUOS4DOJUh5B+16xy6YW6GJP85S4UeGkYYgd38ONaq2H0
   SFVc7bFrtlaqqugwviDoHEU6MBIFrAIaRBHv5gGt0cVI9ajIlhWnFtLZT
   VZyXl7e9l0IiBO/+WqNdEAXsc4QMPTbduGiGEzvaMkGDzP0/c7UjnNYVW
   XbROx50tINM1N5FLPYTWxNDRxx2fVC+Eaz5/THyyF0e8A+cChv5zKHWMQ
   EZDsjD05ACZPXyCk5CvCrN/Tg3Pqjx2YWBkGtrYFRfGGJRi5n0ghef+GE
   w==;
X-CSE-ConnectionGUID: 3eEYfMyvR5CanOu7rVh+Bg==
X-CSE-MsgGUID: /4YE1LCSSQOYMg+nyWzABA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="164688787"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="164688787"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D07C4E8521
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7257D3F13
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 39D9B223FDE
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E9EC91A0074;
	Tue,  7 Jan 2025 17:01:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/18] python3-grpcio-channelz: upgrade 1.68.1 -> 1.69.0
Date: Tue,  7 Jan 2025 17:01:34 +0800
Message-Id: <1736240504-5315-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.832500-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFZH0YXYnbGozFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtB00
	/kkeBTwDhcQ7L/ibs2VXPsl9AX9UPUO3miAzxY0mtNrAF3r4t7ug1krJRAVFDNt7AgJbzTWpwcl
	WTTW9NQisRF4bdbvNxkaGfDlsE+CLyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114685

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.68.1.bb => python3-grpcio-channelz_1.69.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.68.1.bb => python3-grpcio-channelz_1.69.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.68.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.69.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.68.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.69.0.bb
index 414db61558..4c0172e2d6 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.68.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.69.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "ebe9b127745306db1707bcb8eb0dc56b947c3b616729b59d7b451e2639ecb6d2"
+SRC_URI[sha256sum] = "c7b5900a6d3c3e8229e65ae4b6313d64c1693dfaa767f5b0e1c6d1915324820f"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


