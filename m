Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCDBC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.35434.1745311787628479901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OwhuUYKA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311789; x=1776847789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uv82r4o5HRp/Cl5faXUTD1PKoMOxemfoiMlLlv8Mzo0=;
  b=OwhuUYKA1Ekpa1HYjdgRNr3bwlJY344uPMO+3Zo+BkhuFZlEMcqaaZlM
   7bMwe5lTys8M85737DsQrM6tO2Hw84c9j3ZM0ZpHP7Fd3d4sdGf5LZdMI
   Od6zRr51h3W9PdgqvwYZGMf2e2cgjJbjcS6LNmV43+HbbGua86N4adBBx
   i3VTu01bKuqsD9I1hVHbqSjNpIxO69U8rom3BRGt1s5zu889DmnJAreg/
   UHMRKvRz70fmd8JQsGm4OhFFnUUMxjo6uuJzR6NjLlTut9j1cjz+SwcJZ
   s9fQrSroT56/mzI96keZ2Hj2S6FAurAkmGi0sdjxowWwiZK69Itg3oJ1N
   A==;
X-CSE-ConnectionGUID: cGogxYgJTEaG7Er8VLn8QA==
X-CSE-MsgGUID: 1epDt4KWTyGuZIFf830e8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197297358"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197297358"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EF906D6EA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AE73FD3F2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6E0521A009B;
	Tue, 22 Apr 2025 16:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/30] nbdkit: upgrade 1.40.5 -> 1.42.1
Date: Tue, 22 Apr 2025 16:48:59 +0800
Message-Id: <1745311761-1912-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117050

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.40.5.bb => nbdkit_1.42.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.40.5.bb => nbdkit_1.42.1.bb} (93%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.40.5.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.42.1.bb
similarity index 93%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.40.5.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.42.1.bb
index 5d80d1e091..e1292db6e4 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.40.5.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.42.1.bb
@@ -9,9 +9,9 @@ HOMEPAGE = "https://gitlab.com/nbdkit/nbdkit"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 
-SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=stable-1.40;tag=v${PV} \
+SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=stable-1.42;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch"
-SRCREV = "900a0d2bea4b027d71cf213f385711a2bab33eef"
+SRCREV = "14de71af1bd13e5c781d83959bdeb7ebbe759d6f"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


