Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824BFC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46621.1739178111389260159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OX8oaNa6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178116; x=1770714116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SDts2cMosXSVUmK448gmVhE+b/bJH/oSuyrAkUFq1gE=;
  b=OX8oaNa6D0zgOq40Iq/wplNDBAXQLoi3420Hb1oEUe8NTnnJPjjpB928
   UlKYcYx8zIkJJYX7PvlHdsbrq+MVBZlPeUFXrp4QR2h4+EVrWBvUYXbLh
   /76CtQrEQvBR4faUlmJK8B7PrQujgvNmitYUS6vd4ALV8AiogaKjer5Kv
   ADUIu5zGNmiHfDUcXCbrt4nF5dlZZ5AkUC9Rew3VHkk4emZu/2S/Qq/M5
   hRzJoxXrBeA4ObP2cJbnfpDLc3Zk/ujCg6aiQYphpSHjs3l7k63IyOnAm
   jhFSpoA78ZpHLxo/gxWoUX3sU+ohxP1Y2IYe/a6oPIoXG7kmduCUzB94c
   g==;
X-CSE-ConnectionGUID: hIg1UnBFRmasFT1PLKSiIA==
X-CSE-MsgGUID: dSYHBL/BTG2KgChNK0juhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168935926"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168935926"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E42BD6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C8327D5081
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B91E1A006C;
	Mon, 10 Feb 2025 17:01:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/66] mpich: upgrade 4.2.3 -> 4.3.0
Date: Mon, 10 Feb 2025 17:00:45 +0800
Message-Id: <1739178095-26432-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115343

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updted to 2024

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.2.3.bb => mpich_4.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.2.3.bb => mpich_4.3.0.bb} (92%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.2.3.bb b/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
similarity index 92%
rename from meta-oe/recipes-devtools/mpich/mpich_4.2.3.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
index 941dbf68af..6babba3de7 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.2.3.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://www.mpich.org/"
 SECTION = "devel"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7a88f0d96d0d7396a7c66bf353235b62"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a296dfb961b957b0e8adf67d8478d3d"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7a019180c51d1738ad9c5d8d452314de65e828ee240bcb2d1f80de9a65be88a8"
+SRC_URI[sha256sum] = "5e04132984ad83cab9cc53f76072d2b5ef5a6d24b0a9ff9047a8ff96121bcc63"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.43.0


