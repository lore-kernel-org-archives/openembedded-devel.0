Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B63C369AC
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.47778.1743412320619314618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KWZzwMLV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412322; x=1774948322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TImiF+Kgxw6gydLHlmpZdc4H8nMnHFnzGHwE89/YwJ0=;
  b=KWZzwMLVbkhHztLQyOFU9PLEo2g/JAXuRQW2Mx238w5vhf8IVTuXua6D
   rhmJhorkVFvcf9adTYQmgVtZlttjVV3uPrUkscm7m4/KfzMCvVGuhVsWF
   ypyCERYqQhFP7qpNJ40V1KuH2Oy7FoWs7R+HSYcmvEBPiLUxO3NLbFzr+
   6PvnMeWh8THDfKA7gr9nIogPMng2Nk077R+UnNwHyiRlQ0092zPOfGYnR
   3zpDNCdmWPxOYiaaFVypBn/DbQ3VAybcXACR00qBVDgupP2VWLfb2NG90
   ngpDByxjpJMRTNUS02gzosJOJcwQbJdw1JT+9P3hdABRIMS6qddL4g+Rg
   g==;
X-CSE-ConnectionGUID: KJl3wdVAQ7C0FMXkXSETkQ==
X-CSE-MsgGUID: +z8bicjqRhSOOQW1GIaF5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="195002710"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="195002710"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8592AD501A
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44229D508E
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0499D1A009A;
	Mon, 31 Mar 2025 17:11:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/26] python3-dbus-fast: upgrade 2.39.6 -> 2.43.0
Date: Mon, 31 Mar 2025 17:11:30 +0800
Message-Id: <1743412308-21887-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116404

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.39.6.bb => python3-dbus-fast_2.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.39.6.bb => python3-dbus-fast_2.43.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.39.6.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.43.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.39.6.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.43.0.bb
index 3ca220b72e..c6d4d6427a 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.39.6.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.43.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "fc3349ffea522d137d856f8967129dd4b87394c0bf8b8b1648295c5eb0a457fe"
+SRC_URI[sha256sum] = "c4968dd6e8c15c27a307a0b3c90347ab1eb7a0787d189e65896d404eb1c0728f"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


