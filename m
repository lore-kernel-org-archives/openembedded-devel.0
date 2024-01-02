Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABD0C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:01:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.24311.1704178891099930729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="124376210"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="124376210"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:01:28 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36FEED4F51
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:01:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BE37D1B9C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:01:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1D5220081325
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:01:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7795C1A0070;
	Tue,  2 Jan 2024 15:01:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] exiftool: upgrade 12.71 -> 12.72
Date: Tue,  2 Jan 2024 14:28:02 +0800
Message-Id: <1704176882-7543-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--1.332000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrWQ3R4k5PTnCY5nVpihxiwzlq
	WSxu1gNPKLa1Z0d/Lq4fMrPgF6OYQ9DCM5b2Q+i0ewZ0VuGL+Bas4IQYg+G3CKuc6JWqg9I+vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgHM3nHyJFlyWtE8mz+ry/JQhjp
	75eLVqH+0B0MT8S0EkgDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLPMNv7HwREO2AUqU
	9xkycGLD2+xS719ltdMUFMwgkOpKxwyY7HAKwnCtSSXLhDTWLsyX7g0mvzyE+pgEmiQsx9/XGyO
	+u6sj6qIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107991

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added read support for AAC audio files
- Added a new QuickTime Keys Android tag
- Added a number of new values for some Ricoh GR III tags
- Decode timed metadata from Intsa360 Ace Pro MP4 videos
- Decode GPSDateTime milliseconds in timed Insta360 metadata
- Decode timed metadata from INNOV K5 TS videos
- Decode a number of new GoPro timed-metadata tags
- Decode a few new Xiaomi EXIF tags
- Fixed writing of JPG/ARW images from some newer Sony models to preserve
  HiddenData

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_12.71.bb => exiftool_12.72.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_12.71.bb => exiftool_12.72.bb} (92%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.71.bb b/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
similarity index 92%
rename from meta-oe/recipes-devtools/perl/exiftool_12.71.bb
rename to meta-oe/recipes-devtools/perl/exiftool_12.72.bb
index 7d8d6b69f..ba3e3fdf7 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.71.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.72.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "7cefbaaa9057231b6e9b5765934f06e75994420d"
+SRCREV = "fc4f6614ff0c19bb5f332a9c464dcef7267931df"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


