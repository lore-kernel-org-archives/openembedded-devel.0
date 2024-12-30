Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFF1E7719F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.58743.1735543849348245334
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=irXC4zI1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543849; x=1767079849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ukhvBYBxlRlQRU1lgnCAT+ieascefgFAdWHcyDlNS50=;
  b=irXC4zI1QHpv5YKo4LkPut+QeYi5+E4uo96dXk6C5Cr48WnRNGIaTtKt
   4WI7Kplf9AuCfScvnKGbCSzSDDKggBbD+QRV7zP5oUcZqalrHdNaUHiBg
   Z/A3Wib0wr3iy43aZHCy+PAx7E3xTvIdTf+zCCjpxN3GUROUQCnh3oo0k
   t9pHj1ifVgBjz/F2dWmmSS8Ri3z24V51DABSWfSfu+vgL7hLSRAdpM1Vv
   IQez5tGx+EmR3lubpXYw6AqW1s3WBrbMlPsvATuBYjLNGRPOc+9qUYTGE
   wljM4RRU+SeBIMOxQRIZg+kZ9DYir7YoRL5IJvTxlUhCypvDJXF+fk9Wp
   Q==;
X-CSE-ConnectionGUID: SfRlsBBPRRa4o9nbsHW2mg==
X-CSE-MsgGUID: B8kxJSQtRniGuLUIDtObUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185508726"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185508726"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:47 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDCF5C3F81
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1EDAD5007
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DCE56CB1B
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:44 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ECDC81A0003;
	Mon, 30 Dec 2024 15:30:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/18] python3-libusb1: upgrade 3.1.0 -> 3.2.0
Date: Mon, 30 Dec 2024 15:30:30 +0800
Message-Id: <1735543836-2512-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDVidMQHbxM1+hOO6g/+t+vDWBsfxxxaJ3L9EbozbIlI6d+iVSrLcEU1tWuuN8kMQ/5tya
	YeSXKnCGJcEWVEIHgYD7WrvVhhiJzyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114592

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-libusb1_3.1.0.bb => python3-libusb1_3.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-libusb1_3.1.0.bb => python3-libusb1_3.2.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-libusb1_3.1.0.bb b/meta-python/recipes-devtools/python/python3-libusb1_3.2.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-libusb1_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-libusb1_3.2.0.bb
index f3a0147a32..8bbb8d2eb2 100644
--- a/meta-python/recipes-devtools/python/python3-libusb1_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-libusb1_3.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI[sha256sum] = "4ee9b0a55f8bd0b3ea7017ae919a6c1f439af742c4a4b04543c5fd7af89b828c"
+SRC_URI[sha256sum] = "a11a6095e718cd49418a96329314da271cca6be7b4317a142724523371ac8961"
 
 RDEPENDS:${PN} = "libusb1"
 
-- 
2.43.0


