Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C5BC369CB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.35434.1745311787628479901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jpugE1kn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311789; x=1776847789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dCwBAuZ3SDV39fBbkKBsJ9Us8w9NtieBHVBQi3urGa0=;
  b=jpugE1kn/VDWgK7NuMS9oKx8MhgnaXBUObOVoSkkfRK7DXa24iri6tOg
   IByOAwpARmslX5v3AmRw02Odz9FHiCqGMSpC5pLC4I34T6O1urnoZ5rTP
   gmeHB4Jb+vPWX50ImdaKkLK6uTEtHVRyWa20lrhnqL+FNqmFBfcGgfg/N
   aYGlVupvs9MzorGinuFKN+k2eo5IHku0geCdoULQjHL7U6Op+sBnatYOK
   DA4NG/bUB7Rgis9Kx5TrUgZUYqp2BxEpBxBk2gmW6D/8NA88g5RE4MY5n
   n4kfvPdjgWtTvbswaGVJzdaczKCOuqqn2xG3Sw/hhKOS9YaJ8jQZs5xbD
   g==;
X-CSE-ConnectionGUID: Qom2ksHCSamklgGxW5T5ng==
X-CSE-MsgGUID: T67u65FNROyobAqY1BDr7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197297368"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197297368"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:35 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9552ED6EA7
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 55A83CF7E0
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E369D1A0078;
	Tue, 22 Apr 2025 16:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/30] python3-inline-snapshot: upgrade 0.22.1 -> 0.22.3
Date: Tue, 22 Apr 2025 16:49:09 +0800
Message-Id: <1745311761-1912-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117051

From: Wang Mingyu <wangmy@fujitsu.com>

Fixed
- A pycharm environment is no longer incorrectly recognized as a CI environment.
- show correct diff when pytest --inline-snapshot=report -vv is used

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.22.1.bb => python3-inline-snapshot_0.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.22.1.bb => python3-inline-snapshot_0.22.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.3.bb
index 0d913729e4..ff814ea1a4 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "5acbc23b9a179969b449063e2a2f3c86e2a5f6f480934e24e58d82c7cd55938c"
+SRC_URI[sha256sum] = "34c02a8567dafc88bb720872edde792ff5e665c8726f6af3bfc5fa85dd0016be"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


