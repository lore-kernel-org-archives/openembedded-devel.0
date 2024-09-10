Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481C1EDE9A4
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.18591.1725959003836765641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WgSGOegv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959004; x=1757495004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=n4ULhBVx6BoJNJdf+5bW27O7ZV0lmXiNMlXr4uGjJdo=;
  b=WgSGOegvSwTik/+ge8wi8ZWBoQhHlSNhXd0xkSmjqONwv6nelnHHNVzQ
   PsIeIFFxl2gU1lmONKAQX/ooESpExzohNU5hX82ba/jb0UaQSKCB1+rEE
   Qq2LOKHQQ0XdVxkjYbiasPuG5tBCeDIJWu8ZjFfx87kP+9uEngkAOOhah
   m5A/pWmtRYReLNuoBsXcgYmdVHpzwxNgVJ2sCvfMbHrXf+wQE5kqgGUN3
   XSYhrNXPu324mzHtakwD8yoT5L5v2NnCvUlEcZWOd89HfYgBLnZPzwFDm
   5v3wuNvwDF04YJ020S9fUX1srRWiGR4z1/8VYdNLw4n6AzMjkoF9bPBwj
   A==;
X-CSE-ConnectionGUID: Kzexrjz1QAapfCDthiuqTw==
X-CSE-MsgGUID: amb+aapPThuksjneGB6tFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173293552"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173293552"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E4AB1D800D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FE20D4C32
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C92A26BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7BD0A1A000B;
	Tue, 10 Sep 2024 17:03:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/42] hwdata: upgrade 0.385 -> 0.387
Date: Tue, 10 Sep 2024 17:02:34 +0800
Message-Id: <1725958990-5719-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.501200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmIOYgThO+DmX+DLvvVL3eB4tw+xHnsmQjMQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFEgpktU3fvZDVBHsdPjUM0WQhI
	EMiswHE3iq4k0FPzyOwMRsMw1XcWmg4Fh1iunynIvZcXsaqMpqQWRCsE+DzDT/ajax4GtTJOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112191

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.385.bb => hwdata_0.387.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.385.bb => hwdata_0.387.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.385.bb b/meta-oe/recipes-support/hwdata/hwdata_0.387.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.385.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.387.bb
index bc0373d14..d73bb93aa 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.385.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.387.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "a038a430d5861df6f0429171746639d4fd21b624"
+SRCREV = "f0ba62c0b0401c215aed8abb42cf7dcdb7e6fecc"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


