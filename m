Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD90C0218E
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.40068.1736843353793597239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pG8g0zZJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843353; x=1768379353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wEFO6//ZPRxG/0v4u0ReyoxgLF2l/MbZigvMW1fiay4=;
  b=pG8g0zZJZJMJp0V9Y0889XtswIs8t7/Gf0wN4xyYnMV623//SbP8XJWK
   qxlmP7JSa8DN3C8qXijurhRHT+eudk/2JxnuN0vCYBMvIXyyuAYYId/od
   A6dwWcuUoi3tmH2UdfyUOPkR3euHH26Qz8Sx4kf5tBKUKjHJDYqqlQmQL
   lujYzuF89lPXK83CDekuA3FGID8xhn6p7yw+Qxu+PuoWysU5ZZk5kY3Hi
   T6P21wgatJwTzpdOWGqqjvPjaH7QK9GgSaH9bDssVrbJmYBtw/M82C90R
   4mUT2zqF31X1yy4F4uISRP4uCf8atWm7XnFJixdH1Fw0gdghyR6V7Nakx
   w==;
X-CSE-ConnectionGUID: oNqbOhSCSWyB6MB0GhWjVw==
X-CSE-MsgGUID: jq1ktZ+YRnOweaVaIDpVLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="188950511"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="188950511"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:28:58 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 624E4DC799
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 39F48D73B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C07326B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:28:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F1BF1A000B;
	Tue, 14 Jan 2025 16:28:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/30] ctags: upgrade 6.1.20250105.0 -> 6.1.20250112.0
Date: Tue, 14 Jan 2025 16:28:21 +0800
Message-Id: <1736843329-4131-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQrU6u0ns/XCeCXn0FOd6Dixfy3SHnE9tx03HU0BLxOaiT00FH2W6WREXm
	Ej8qqo4dXRJbCni04ovYYrjXxC9CIHUx2UNST/KB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114864

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250105.0.bb => ctags_6.1.20250112.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250105.0.bb => ctags_6.1.20250112.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250105.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250112.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250105.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250112.0.bb
index 15b374e52b..21af7dc6fa 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250105.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250112.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "e31feb0d9ccc9e2643465d43a785c1f53f43b305"
+SRCREV = "35c5c9776fdda655524da16b604037436a7ce37e"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


