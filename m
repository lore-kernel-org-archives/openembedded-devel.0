Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B52C021AA
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.46623.1739178114780922744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZQveDYWM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178121; x=1770714121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pVL34xw4rqsUS6TFitNd++JD3wUAoNW49Rbxvlh9zK8=;
  b=ZQveDYWM5ioRMeUK5Nv1zPQUMMsErxGPFppGaakjza9MjC/xvEG5LysD
   Rfq6Va2AW5VevCLYmEleroWb9jFsCtP2eoF1B6CuRsm4GnjbwuyQIPnq0
   4DOf7C9lhrLyg5nBwe7HyrPhBINgVPw2Pi764lLUo6oxZAIL5MjU5oFcy
   Eh4BK8QyH4XW08BtZxn0CNJ04TUEIfvyK3ah1roDC81v52MwhVkLhikc1
   SRSCIkezHg1vWRCyU3en6ATfcS1yquzD/sk4Q8YLAYFrEJPK/XQLwZvCJ
   Cmm63CHzX98q6B4DYVKYF6CEkNQgDse2X8OTG4yHn6hxNes1iBL2YdHka
   w==;
X-CSE-ConnectionGUID: euF8HuMfSyGvg33iVoKqIw==
X-CSE-MsgGUID: lftDc3V0SxCLAC1wi9ydwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="192032042"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="192032042"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C297E8525
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E2ABDD5043
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 864401A006C;
	Mon, 10 Feb 2025 17:01:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/66] python3-dbus-fast: upgrade 2.30.2 -> 2.33.0
Date: Mon, 10 Feb 2025 17:01:00 +0800
Message-Id: <1739178095-26432-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115359

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/Bluetooth-Devices/dbus-fast/releases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.30.2.bb => python3-dbus-fast_2.33.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.30.2.bb => python3-dbus-fast_2.33.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.30.2.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.33.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.30.2.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.33.0.bb
index 8031023465..b180526d1c 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.30.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.33.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "87296315f4a2f2416d495f48cca019ba901d046989e94df2adda84c3170da7b3"
+SRC_URI[sha256sum] = "da2f3a2f2e10092c67a911578135c2244d04b52ec87dda80997bf65e78f79251"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


