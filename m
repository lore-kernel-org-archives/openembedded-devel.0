Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED65CF64A2
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.48965.1727682246012878576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LjRTUZAI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682246; x=1759218246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IMs3AXrThKap2GSW1LqEqQl1ui8Pnza4ZjdXyQMwdjE=;
  b=LjRTUZAIWEkMQSXDoEdawH8ObRwmh/6XkpLQ8flTnuOFQk9AA7CmsfSL
   i5QleBRuP6dmPhmvrl7fwJiPL5XbTZHxws8wLGoG6pkO0PKiiPgexy06R
   fah0d3lP7WxQhKq0zYXV/MXKswxBRc4WL9MwdCh/yvrtpOWFBiuH57uRu
   Qr5E1GOlywuUBtBeFtLDQL3OcmJZB6Ofxn2Q6kaReenrJvL4ew+cT/eT3
   YWeynINyOkAI6FF//6zYEqlKAfvg/haC/76uiyo3J6cfa1WtBz2PtnhWG
   XRolF9sphM+1vpkKwgiig6TnNCCt02YQpaPaVuv2XXnfAzXNG1/NZnYSp
   w==;
X-CSE-ConnectionGUID: hXW81KBQQv2Y9mZdVWiBkw==
X-CSE-MsgGUID: SgbVqT4xRWis/XrY06MePw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="162602099"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="162602099"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DE885C68EA
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C7F0D5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C14CD2007B716
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 72CE51A000A;
	Mon, 30 Sep 2024 15:44:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/40] python3-watchdog: upgrade 5.0.2 -> 5.0.3
Date: Mon, 30 Sep 2024 15:42:59 +0800
Message-Id: <1727682185-12664-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--5.761600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwC10TsipyQq9nf
	JrUSEbFDOGy0C8YG8wYF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2emHqf6ZGvCR1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu25FeHtsUoHujmK/7YgAZaxlw9
	AaecfrarQ8cZZQ9uc1CbcMiEEMwziwFMlIPaIBbQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112594

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- [inotify] Improve cleaning up Inotify threads, and add eventlet test cases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_5.0.2.bb => python3-watchdog_5.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_5.0.2.bb => python3-watchdog_5.0.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_5.0.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_5.0.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-watchdog_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_5.0.3.bb
index ad66523de..0467f55ac 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_5.0.3.bb
@@ -4,7 +4,7 @@ DEPENDS = "python3-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "dcebf7e475001d2cdeb020be630dc5b687e9acdd60d16fea6bb4508e7b94cf76"
+SRC_URI[sha256sum] = "108f42a7f0345042a854d4d0ad0834b741d421330d5f575b81cb27b883500176"
 
 inherit pypi setuptools3
 
-- 
2.34.1


