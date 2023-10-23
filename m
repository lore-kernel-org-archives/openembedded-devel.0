Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A3DC00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:49:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.136640.1698104981513553368
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137372628"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137372628"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:49:38 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D62A1D29E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:49:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2152BBF3C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:49:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FC032005A580;
	Tue, 24 Oct 2023 08:49:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tesseract: upgrade 5.3.2 -> 5.3.3
Date: Tue, 24 Oct 2023 07:49:22 +0800
Message-Id: <1698104962-32314-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-1.039400-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrG24YVeuZGmN4YeSlHZYFohWW
	aZILA2NwWfWXBpIgkLYi3m2l69juFD4xxB4AxzmF4wdobZiVzDi4/PcnTPlZaZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/25MoGKfGX+6YA3qL69rXq5gkD
	4cHBIWJ+eT48+FcKZsYWn2p9yKOL2tYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOCYHxrgbubTgFOZ4Kp/vYDybQuNjJ2qQGjxl4qO4PhvpaKsj5XbV4i8MmtZy8ihbKhgWl
	NP4hGXEZC02stDFquWGKRlq5SlE3gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105710

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Small code fixes and improvements to fix Coverity Scan issues.
* Disable -mfpu=neon for aarch64.
* Fix build without git clone in cloned directory (required for FreeBSD).
* Other build fixes for autotools, cmake and sw.
* Fix regression in layout detection which was introduced in release 5.0.0.
* Fix regression which prevented loading of submodels, introduced in release 5.0.0-rc2.
* Other small improvements for code and documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_5.3.2.bb => tesseract_5.3.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.3.2.bb => tesseract_5.3.3.bb} (91%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.3.bb
similarity index 91%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.3.2.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.3.3.bb
index db66e890fa..e5310ae25a 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.3.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.3.3.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "489f101c7e2276c00490f3ab70e9e7926fc6b481"
+SRCREV = "e082522c248d3121e466959a8ba4fd4f7ad1a525"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


