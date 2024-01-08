Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D46DC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:25:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.6470.1704720348715710985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="145719201"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145719201"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:25:46 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E92C5D4F51
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:25:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D84D6CC19
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:25:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7946202CFE8F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:25:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 60F361A0072;
	Mon,  8 Jan 2024 21:25:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libraw: upgrade 0.21.1 -> 0.21.2
Date: Mon,  8 Jan 2024 21:25:18 +0800
Message-Id: <1704720318-30087-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-0.264800-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrKQNhMboqZloZbsAUeZcRz+K5
	fhRxt1aAbxfaEPweeMgO2BpaBXjBDv7Hq500c78wRbmVr90wE0hReWnUUdhI9Ql4w4lfxz2cLhd
	6ma7WE8uEm1sE8Ofsm8KZSP3piM6X7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AKYs
	Q1UtbN95t2RLdeomEwBhQWw3lZ+IWuyr/sGF0bIG9OepgphdNGVeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7H0aAsAc4EWInRE+fI6etkgjATN5xwTlO88Um9UtxFLrXq9fiSYQdV4+sl29pqwIO/aQC
	BPDT00ED8ry+FKIlSAjHFb0nLe6FBVfqpXBP60RWgLVo0ozw5Uu/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108138

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog
========
* New compile-defined limit LIBRAW_MAX_PROFILE_SIZE_MB:
  limits allocation/read size for embedded color profile (default: 256Mb)
* Embedded color profile allocation/read size: limited by input file size.
* Multiple fixes (mostly inspired by oss-fuzz) to improve library stability and/or input checks.
* raw-identify: use fallback if PATH_MAX not available
* Disabled color conversion for Canon 16-bit thumbnails
* docs/changelog: explained the case when no thumbnail is found in specific file
* swapXX renamed to libraw_swapXX to avoid name conflict
* better striped thumbnails handling

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libraw/{libraw_0.21.1.bb => libraw_0.21.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libraw/{libraw_0.21.1.bb => libraw_0.21.2.bb} (62%)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.1.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
similarity index 62%
rename from meta-oe/recipes-support/libraw/libraw_0.21.1.bb
rename to meta-oe/recipes-support/libraw/libraw_0.21.2.bb
index a3bbbe39e..4d089f3b7 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.1.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "raw image decoder"
 LICENSE = "LGPL-2.1-only | CDDL-1.0"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
 
-SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https"
-SRCREV = "cccb97647fcee56801fa68231fa8a38aa8b52ef7"
+SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https"
+SRCREV = "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.34.1


