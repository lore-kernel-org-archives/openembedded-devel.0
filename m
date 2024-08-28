Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA81C54E62
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8731.1724833555654347102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CYDGkSSZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833556; x=1756369556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FQY0w9hLmaZiOLDctS41xzEJARqO2RVgR7NvTsJ/SbY=;
  b=CYDGkSSZpQ0bT0xFsLvwpMQ6XXFiP4tcIVoELNLJxMpGJ8RBm5z0cNJD
   UmChtdFGM7mdhnCIWGY8Wt86yPdqBWMKTzvMpGRtuVbNJgBfSPX/LgBlN
   DOwmrBhICA1wz5QLF1mOc6RrArJcmGquQPm5p372SquxqO94YzayaZ788
   QK5/8VUwTZ8XIlbBvD84RtSF/tXV1yMEMP/Y0Qds56C/pXecvCORWthg9
   FLZzJYn/jG76+yQM6FbfuAOZPlYsXUYs9aW5YbaDtVA57U6MP6flxPoaW
   T5DY0sYEsBVawdBJydAFioSc9fxziMEbbQMVLqjx8XF8NT5/IjO5zVoaY
   w==;
X-CSE-ConnectionGUID: JwKOYBQQSbqOiQVKZh3aXw==
X-CSE-MsgGUID: KEqs2CspQM2FeMcylNCOHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171131407"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171131407"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 69875C68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ACF92F30C
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F052E6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9A57C1A0002;
	Wed, 28 Aug 2024 16:25:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/46] python3-pycodestyle: upgrade 2.12.0 -> 2.12.1
Date: Wed, 28 Aug 2024 16:25:10 +0800
Message-Id: <1724833525-2162-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJon585nKQczq7uce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SEyj7JIIljTIAZ63gMWcC6MihQe8I/ty9WMLeThGVgH3/4O
	7WP6F2aYEaagvbuAH4KHF0qbUIt27eEAWfL4TtB9qch4BzAfB1S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112010

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Properly preserve escaped '{' and '}' in fstrings in logical lines in 3.12+.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pycodestyle_2.12.0.bb => python3-pycodestyle_2.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.12.0.bb => python3-pycodestyle_2.12.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.12.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.12.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.12.1.bb
index 506af8e3d..9572d21f3 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.12.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "442f950141b4f43df752dd303511ffded3a04c2b6fb7f65980574f0c31e6e79c"
+SRC_URI[sha256sum] = "6838eae08bbce4f6accd5d5572075c63626a15ee3e6f842df996bf62f6d73521"
 
 inherit pypi setuptools3
 
-- 
2.34.1


