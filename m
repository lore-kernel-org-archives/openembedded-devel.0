Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34C6C369A5
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.47782.1743412322116653525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NUUxN56M;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412322; x=1774948322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ssdQtKPMwGd5ib9LHz2ol3vsz+3XR1XkBNo1b53PkYw=;
  b=NUUxN56MuJmItNIoh7KU6y3eYtBuhxxSTondxGtSv3IeoudnlOzcoUth
   uYWlP8Guw1d9Yh2RdbrxHJ04F4Fav79kgDTS/MrcgRM/u/AS9Ex578Qcd
   maWbyUz/vAgCmzXR0k6aEM1Ey7ofT+3J1rfmbO4gVze1HwtAT1WFRRiwo
   WOyLvAGVO2T6eHwVeTvPNjtGCYDn/B0KXTgtXFB8mC008KSTFStk8zSn2
   qx4MYUV+0hDvl1Kq1A2jIkCTPJqPj7ff9AvEB3udrud+CSaJ7beUMMA7Q
   GBzZYGIcIGz2GB9Fh4wdlO4x8GO4/Iuua9wHN+unv4PcVwPADJtRCrm79
   Q==;
X-CSE-ConnectionGUID: Sv/lRF7LQlW4CqqH+cAs4w==
X-CSE-MsgGUID: wo9a6l5HRq+F9vkaEXNjdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="173852151"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="173852151"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E815BD6EA5
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB4AFD5093
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B4A61A009A;
	Mon, 31 Mar 2025 17:11:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/26] python3-expandvars: upgrade 0.12.0 -> 1.0.0
Date: Mon, 31 Mar 2025 17:11:32 +0800
Message-Id: <1743412308-21887-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116408

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-expandvars_0.12.0.bb => python3-expandvars_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-expandvars_0.12.0.bb => python3-expandvars_1.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-expandvars_0.12.0.bb b/meta-python/recipes-devtools/python/python3-expandvars_1.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-expandvars_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-expandvars_1.0.0.bb
index 6183c310ed..6741bc3826 100644
--- a/meta-python/recipes-devtools/python/python3-expandvars_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-expandvars_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sayanarijit/expandvars"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8b2e744064bd184728ac09dbfb52aaf4"
 
-SRC_URI[sha256sum] = "7d1adfa55728cf4b5d812ece3d087703faea953e0c0a1a78415de9df5024d844"
+SRC_URI[sha256sum] = "f04070b8260264185f81142cd85e5df9ceef7229e836c5844302c4ccfa00c30d"
 
 inherit pypi python_hatchling python_setuptools_build_meta
 
-- 
2.43.0


