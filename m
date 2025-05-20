Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0498DC54E65
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.16223.1747731320177562264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PHUUJ8U3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731322; x=1779267322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gX6gkQk+cdFqq0RwqcLINpCR7vci8E9ZlQ7xSiEKbsg=;
  b=PHUUJ8U3hv+SJohVY2P+OwA5l/PxWYOhcUTJn4eei3IslJKckpd0+MgF
   yAEBKOYn6kzZ+U7P+2V/k4EXiOI2Ga8/T4lz0neZimOf5U4vYndibHVEd
   qwHjhRiTfx05zNalQMQApS2bgL0wkkJEgGW3VgoI6datzgBq/Sdz+MUP5
   kkLCA/UOm+yRewi60WHOp7GsxlVSokR+2zqEr8a8T4f6zDnF9mAc5S1b6
   rNePBpT7cblDUlMqrfn38GjPdylngWMJFARm3LnmneAp/x/XkuoHnjK+1
   KfLVb0bW8J5Imq1FxnIGBHC/Uo/p2EVB9IgcKAmSVy3gPs3epsTHqZ8xJ
   w==;
X-CSE-ConnectionGUID: heoGljPsTTWmbyVKtEflTQ==
X-CSE-MsgGUID: zy68oFlNS++V5cB3XhOfCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="178940654"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="178940654"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:21 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E176C68A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C4B6FF336
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A7A21A0078;
	Tue, 20 May 2025 16:55:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/27] sexpect: upgrade 2.3.14 -> 2.3.15
Date: Tue, 20 May 2025 16:54:55 +0800
Message-Id: <1747731299-20448-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117504

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sexpect/{sexpect_2.3.14.bb => sexpect_2.3.15.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/sexpect/{sexpect_2.3.14.bb => sexpect_2.3.15.bb} (82%)

diff --git a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
similarity index 82%
rename from meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb
rename to meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
index 1b064faf16..b97700e53d 100644
--- a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb
+++ b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.15.bb
@@ -4,8 +4,8 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
 BRANCH = "master"
-SRC_URI = "git://github.com/clarkwang/sexpect;branch=${BRANCH};protocol=https"
-SRCREV = "532a52d36aae442b7fe1ce20a59effd1dbc6e6fe"
+SRC_URI = "git://github.com/clarkwang/sexpect;branch=${BRANCH};protocol=https;tag=v${PV}"
+SRCREV = "d3645392424d47532be90fcbc0abf3148324785b"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


