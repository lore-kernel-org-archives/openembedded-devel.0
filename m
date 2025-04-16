Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F12EC369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.14612.1744794151930365580
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k3zhqDcH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794152; x=1776330152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HC7p4sfo6beJglH4xl/ewVKUcl65IPW93h/uHvxyABs=;
  b=k3zhqDcHSfhhVxdpl1cYMdxGY11HQrRqYb58hE6ta1gng+mjZd3Vy7e6
   BFm0tLSzIl5hCrs5bxcwx8L6yO+5/VzdUU3huuMe+TH/pdvyuO4/CFIzj
   cxNCMdljLnTHVxVD9kU7W81CtFK6L3s2tEl8ixEprlUyWm4fkXNo5dbx4
   1kiLy7BCopTFB4iJ4dlHEbUFMIUyKC6O5KBvD4UbcfL665sBeSkU0wDrc
   xfiz4QxxjFkgNd+Me7TXiVJIjKh72DFzqAmk+rbcjIi58rJtintBIfsAB
   jZ8n+cHC7CHoYp6ePZdgSqP0ZsK+xAvLv1KD2uRimKdp15BuGZrDTPytl
   w==;
X-CSE-ConnectionGUID: kNWsHwtLS7y6FaWx26SjTw==
X-CSE-MsgGUID: uPaKC7o6RVO0kJGliK5wYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196657211"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196657211"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6FA796742
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7651FD50F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33DBB1A00A0;
	Wed, 16 Apr 2025 17:02:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/31] monit: upgrade 5.34.4 -> 5.35.0
Date: Wed, 16 Apr 2025 17:01:55 +0800
Message-Id: <1744794136-908-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116878

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: http changed to https

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../monit/{monit_5.34.4.bb => monit_5.35.0.bb}             | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/monit/{monit_5.34.4.bb => monit_5.35.0.bb} (85%)

diff --git a/meta-oe/recipes-support/monit/monit_5.34.4.bb b/meta-oe/recipes-support/monit/monit_5.35.0.bb
similarity index 85%
rename from meta-oe/recipes-support/monit/monit_5.34.4.bb
rename to meta-oe/recipes-support/monit/monit_5.35.0.bb
index c0f1d1fd7c..a2be004c4f 100644
--- a/meta-oe/recipes-support/monit/monit_5.34.4.bb
+++ b/meta-oe/recipes-support/monit/monit_5.35.0.bb
@@ -6,8 +6,9 @@ causal actions in error situations."
 HOMEPAGE = "http://mmonit.com/monit/"
 
 LICENSE = "AGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea116a7defaf0e93b3bb73b2a34a3f51 \
-                    file://libmonit/COPYING;md5=2405f1c59ed1bf3714cebdb40162ce92"
+LIC_FILES_CHKSUM = "file://COPYING;md5=79ca9f26f1ecb1e377e90383109ede64 \
+                    file://libmonit/COPYING;md5=44aaa0a664332e9568add09f1ddb01cb \
+                    "
 
 SRC_URI = " \
 	https://mmonit.com/monit/dist/monit-${PV}.tar.gz \
@@ -15,7 +16,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "ef607cfaabfd3767d40b9b9e32032f748beebc4d686831f6111e0e68fbd1b469"
+SRC_URI[sha256sum] = "e9522a78b954eaee933c4810db7b99a36f941e022ca2b01570185d4ce41d8f12"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.43.0


