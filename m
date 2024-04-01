Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F15ECD1297
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.39353.1711983090546859826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X0RGZo31;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983091; x=1743519091;
  h=from:to:cc:subject:date:message-id;
  bh=+7Q8Xkx2t9gTx6DeYuGUe41MWECY2ze6YRgoyPRVbG0=;
  b=X0RGZo31Vu3gXOahja90YCjDArnbkqaZn+QegyzJfG10AReN4w/WwlSW
   7LEF+w0cK1Sx8wm5gks6QUPa+vYwkHo6l2umBiT335BemigrIKo3am5nk
   R66cjs5l70/7zBovyn4PSBs31FA5Ef4zSvwEycFi+Ryf3NvhzQSPVB0uo
   ATYeBwI0BGGaQ2kHei8edOQrzDz/rZADtpFoX6dj5y7gDDm3k/aWw2rm+
   P3VQTn9lXyyW1E/VIN2weK/yvXyA1YwgfF71m3eFH6KN9C5eEdlcxuC+9
   pZGhWyJNQIBb9Q4/Og92acTXS6Et6Q6yikaJEVfmxb/ZhphEbkb6SQxMu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="156148770"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="156148770"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:28 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6FEDD3EAF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CE1020825
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 989A021EEEF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 202401A000A;
	Mon,  1 Apr 2024 22:51:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 01/47 v2] gjs: upgrade 1.80.0 -> 1.80.2
Date: Mon,  1 Apr 2024 22:50:33 +0800
Message-Id: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--4.617900-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrG1cxYvrc7y94YeSlHZYFonOw
	/jufb+urTptYrOcS6MXGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat05499RlPzeVuQQSex
	PoTd4iBbxgwYhHpmqNXQmGQD0noq1q4N42xndcTc6N/cDgNNi4ReK/B+WKxKse695NaA0UscHZg
	aK9LR/zbF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLMD6HSJgWcNNCZb2
	N19WeBNXSjvkPK6KFSIRElupea+LLC3txdT+sSmtc7BKbDOQLASoDYxBGNdkwI9kqg54ZtuB6Gz
	1kY/HMGIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109719

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Quick follow-up release to fix crash on ppc64.
- 1.79.90 failing tests on ppc64
- Quick follow-up release to fix build failure on MacPorts and Homebrew.
- 1.79.90: gi/arg-inl.h: expression is not assignable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.80.0.bb => gjs_1.80.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.80.0.bb => gjs_1.80.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.80.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.80.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.80.0.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.80.2.bb
index 602149fad..1d781d078 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.80.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.80.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "mozjs-115 cairo"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "0f78cd3f0e8eb446517d665e4fde1d66302b0c283bbe87b78e9cbfd4d86ed576"
+SRC_URI[archive.sha256sum] = "135e39c5ac591096233e557cfe577d64093f5054411d47cb2e214bad7d4199bd"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.34.1


