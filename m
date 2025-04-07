Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9472C369B4
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.42480.1744017449875198587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uDzW+5RS;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017450; x=1775553450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XA8K/wsgNbUciABbbIMJ8cgMddrUOyYHDEpn9TkTakY=;
  b=uDzW+5RSUn4SK6GqWaWRfe/9KHiCvdpQU9eeGDpPbVmQtMl5eZvJb3aK
   TvfXtW//LwkpiWXtBpfjt6d/b/zvn3Kg2oso6ctS6Jjluv5zqDkbJLEzF
   Ajb0E0SZUnJJZVhpDn41EShgrRDwJM8nFv+S77luuHKstzQwACAIh5eAu
   lvDm7RQr5YVviE2YyHPaKltRbytvPicHkrd9YlXPiyXUxm+EGJtvxEFaB
   4Pj+ILuVkVGu+wpXnr2TnKszhd6xPgfEGup3vrb3ZoZEAodQXxdv0vhEJ
   xoEvGJOv4ne6mxiJFoDwzuumS4bQnc6tH03/slaPyopavb5E5CQWLzqND
   g==;
X-CSE-ConnectionGUID: a0yR16YLQsuXiG3iIcqFmA==
X-CSE-MsgGUID: SyqZ/VEjStuYXzCoIv81xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="174560476"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="174560476"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:27 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 736A9DB61A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E0A2D73AB
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B28F31A0071;
	Mon,  7 Apr 2025 17:17:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/30] python3-dbus-fast: upgrade 2.43.0 -> 2.44.1
Date: Mon,  7 Apr 2025 17:16:53 +0800
Message-Id: <1744017431-22217-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116639

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.43.0.bb => python3-dbus-fast_2.44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.43.0.bb => python3-dbus-fast_2.44.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.43.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.43.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb
index c6d4d6427a..95f1eafebd 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.43.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.44.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "c4968dd6e8c15c27a307a0b3c90347ab1eb7a0787d189e65896d404eb1c0728f"
+SRC_URI[sha256sum] = "b027e96c39ed5622bb54d811dcdbbe9d9d6edec3454808a85a1ceb1867d9e25c"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


