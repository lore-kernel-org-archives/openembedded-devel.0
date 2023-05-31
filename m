Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4FEC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:41:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8611.1685518856559659588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="120100838"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="120100838"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FAD8C68E5
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ABA5ED3F38
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2005868957;
	Wed, 31 May 2023 16:40:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.62.0 -> 0.63.0
Date: Wed, 31 May 2023 15:40:19 +0800
Message-Id: <1685518820-20028-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-4.665700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrWDH2sIy8+j+U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8Jlr1xKkE5uYMNZlevXKUzBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6hPa
	Up3uiQZ2YsCqEwVJz24Yf/UykxfL8OFDlhLT4qPYI2tk7c3QvO5Lpq0zhCH3je+AzHRTQxlBaU6
	sQ9J9IglFvcDemfLbGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102924

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Small speed up to fetch dns addresses from ServiceInfo (#1176) (4deaa6e)
    Speed up the service registry (#1174) (360ceb2)
    Improve dns cache performance (#1172) (bb496a1)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.62.0.bb => python3-zeroconf_0.63.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.62.0.bb => python3-zeroconf_0.63.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.62.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.63.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.62.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.63.0.bb
index 6e82c6831..6f3dbd522 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.62.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.63.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "c51340a8a7f13d7265dcc582c4a97907c11e4f3d23d5234d3c2c0e44fb446717"
+SRC_URI[sha256sum] = "2643b1c9c6ffdfaa1313cf3d12ea0099482fcb3da77929a08be87fc8354d0b3d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


