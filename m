Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323F6C369CC
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.14615.1744794157247454049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U6WV3edC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794157; x=1776330157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BC8HH8WbTP9oJnrsj0qBbsD/X4gyGXXHMyjHdmztYos=;
  b=U6WV3edClMoTYpbLUJRTPd5h/RLuilSbfcjzeoJEM9ap8BKctdAtZL6g
   xvUFKbWSscULvX/3BF9K4zB8uPVr/Sr8DY2Y03anQSBFrwYSLDhMCQj51
   mPjaWz2nfYSpmUNNMnoQOoG9NEhyMLtFL4Cefx0krhlr1cNTV/vTQfqda
   hSHImLRKSa5N1m6Pe7J7AndIfFTSEaYQ4mM07FeT26p4GuPDAr7D/PJcc
   APbE6IxPNVFNkcYNMQgL0LfZjjF2bhvQraO0iIXFctzG5Qd+GCwg1dtY3
   u/4lCjixYhtKO3eUNveFN1bdq5iL7XXjDIEIBUZrpEY8vge8X+QNOlC/V
   w==;
X-CSE-ConnectionGUID: +qeGxOedSqq+ZF+vDdc+LQ==
X-CSE-MsgGUID: 4vpsJI2PQ0KEziq+sJEBuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="184598418"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="184598418"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 186CA96745
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE0A3D50F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 647C61A00A0;
	Wed, 16 Apr 2025 17:02:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 30/31] tio: upgrade 3.8 -> 3.9
Date: Wed, 16 Apr 2025 17:02:15 +0800
Message-Id: <1744794136-908-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116893

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tio/{tio_3.8.bb => tio_3.9.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/tio/{tio_3.8.bb => tio_3.9.bb} (78%)

diff --git a/meta-oe/recipes-support/tio/tio_3.8.bb b/meta-oe/recipes-support/tio/tio_3.9.bb
similarity index 78%
rename from meta-oe/recipes-support/tio/tio_3.8.bb
rename to meta-oe/recipes-support/tio/tio_3.9.bb
index 93c116d984..ff9c552d02 100644
--- a/meta-oe/recipes-support/tio/tio_3.8.bb
+++ b/meta-oe/recipes-support/tio/tio_3.9.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "tio is a simple serial device tool which features a \
     straightforward command-line and configuration file interface to easily \
     connect to serial TTY devices for basic I/O operations."
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d25b0ab86d83b943da4d25251a2c21d7"
 DEPENDS += " glib-2.0 lua"
-SRCREV = "01e637cdf4d2d781a87a2fa68e49e7f8fccd0552"
+SRCREV = "bdfe87e1cbf6e3bfd48324a25ea026fcd3cc47e9"
 
-SRC_URI = "git://github.com/tio/tio;protocol=https;branch=master"
+SRC_URI = "git://github.com/tio/tio;protocol=https;branch=master;tag=v${PV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


