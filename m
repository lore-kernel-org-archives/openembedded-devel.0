Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FD4C5479F
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.9266.1708419299393074774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J540kxQv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419300; x=1739955300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KowrNddQ+F/qkboSU4Y1bwL+lWt9rLTz599SDqa5iuU=;
  b=J540kxQvcQMGMdp6WlqU9muJ2tDWieqh5JndqJVxibaS8QeNQxW6QcFv
   +/iz4mgdjjya4N/VQdGLEuRru2ut4qExx1RMulrKyd1xdGE/ROOHGg7sE
   noM+0SMGdjg3t8zlsoMsj6Lou9hu95Y195vZQBi6BzRLsuCTSypHKt1FF
   XP4K98JmeUYKsirYwuZkNEQetYVLCT5syKUuZzMzzwM9haxP8z0uiNvJY
   YEZ+oiNgqfvYbaw5cg1okyyWxWBIK9z1+hxl4EQofJixlNBAXCPu2z2je
   2BLzpg91TgOOuksOqGqwmqq1pgn/+blwjbHPEldu8CCR9oTOVW/jX+CyB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149742991"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149742991"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D5802FBEB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8557DD52EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21925200A7683
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C53F71A00A0;
	Tue, 20 Feb 2024 16:54:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/26] python3-jsbeautifier: upgrade 1.14.11 -> 1.15.1
Date: Tue, 20 Feb 2024 16:54:26 +0800
Message-Id: <1708419281-26047-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-2.463800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy6avPqv3X7/XOwpfLMeBwRtV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62S8z1NEioEATgoyX1KxJdF80kzWA5l0WsiRp/3BDnktGBpXZ
	cKcXQ5ZnURwNMRHsLXAjsNrKn+Zbh9RtXtJHDINt33yEV3NFvCS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108931

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-jsbeautifier_1.14.11.bb => python3-jsbeautifier_1.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsbeautifier_1.14.11.bb => python3-jsbeautifier_1.15.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb
rename to meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb
index 7b438778e..189b43ede 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.14.11.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6b632581ea60dd1c133cd25a48ad187b4b91f526623c4b0fb5443ef805250505"
+SRC_URI[sha256sum] = "ebd733b560704c602d744eafc839db60a1ee9326e30a2a80c4adb8718adc1b24"
 
 PYPI_PACKAGE="jsbeautifier"
 
-- 
2.34.1


