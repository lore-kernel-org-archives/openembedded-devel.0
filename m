Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCFD1048927
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 01:44:56 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.111815.1772243088577434136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 17:44:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ikQ/3XE9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772243088; x=1803779088;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/gA3ZFZa2TTAlV59AdKsVVH2r0ylU/hRp8odrdR90MA=;
  b=ikQ/3XE9nQBIb7N66dtasC/62t2ALg/Y72269l0NdF+TyEA1HVUDivAD
   yVqTjhzKRDfDlgMYCq/ZR0gGk3Z/NjetN//gVBumyaRLPBLsI/YH/8PEa
   tWBNjR477SDDorL8VaDcj5EmRemeXG+lXDeCNRcSqjv/OskQkC/XBQrZd
   VXYc8r7/D1xLJD/IAVNG/ASClc3PsDQIrSy/LDBrF5TjPoiC2TQ9JDKgC
   a9EaVsv29kow1glBHCozocctNQvoeVcXYqRbh2KaQGSyGi9hxgZQGDbww
   6b4rTus9OgHklJLiWNkhSwAYEb7QkrmBwPeU8A0BJ2BbkFFz0HITX0C8j
   Q==;
X-CSE-ConnectionGUID: Fk4mlWZORAGRgaye8mxYGw==
X-CSE-MsgGUID: pwtNIWSnRrSMVSu/xRClXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="231309820"
X-IronPort-AV: E=Sophos;i="6.21,315,1763391600"; 
   d="scan'208";a="231309820"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id B1F191C1C706
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:44:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6A9B8180A33A
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:44:46 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 36760180A5D1
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:44:43 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-filesystems][PATCH v2] btrfsmaintenance: upgrade 0.5 -> 0.5.2
Date: Sat, 28 Feb 2026 09:44:39 +0800
Message-ID: <20260228014439.2853-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124768

1.Changelog:
  fix syntax error in run_task, preventing jobs to start
  start scrub jobs sequentially if RAID5 or RAID6 data profile is found
  fix btrfsmaintenance-refresh.service description

2.Update 0001-change-sysconfig-path-to-etc-default.patch for 0.5.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...enance_0.5.bb => btrfsmaintenance_0.5.2.bb} |  4 ++--
 ...-change-sysconfig-path-to-etc-default.patch | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-filesystems/recipes-utils/btrfsmaintenance/{btrfsmaintenance_0.5.bb => btrfsmaintenance_0.5.2.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
rename to meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
index 645e38ca49..6722b63c10 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.bb
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/btrfsmaintenance_0.5.2.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 SECTION = "base"
 
-SRC_URI = "git://github.com/kdave/${BPN};branch=master;protocol=https \
+SRC_URI = "git://github.com/kdave/${BPN};branch=master;protocol=https;tag=v${PV} \
     file://0001-change-sysconfig-path-to-etc-default.patch \
     file://0002-add-WantedBy-directive-to-btrfsmaintenance-refresh.s.patch \
 "
-SRCREV = "be42cb6267055d125994abd6927cf3a26deab74c"
+SRCREV = "beb9e2d166cbd856297fe8d28e89e8b36961a723"
 
 UPSTREAM_CHECK_URI = "https://github.com/kdave/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
diff --git a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
index d425206f0e..b064adcc86 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
@@ -1,6 +1,3 @@
-From b49dbe17e0d9ae463e5a34e6991aa2d3c70d2fb1 Mon Sep 17 00:00:00 2001
-From: Claudius Heine <ch@denx.de>
-Date: Wed, 11 May 2022 14:33:13 +0200
 Subject: [PATCH] change sysconfig path to /etc/default
 
 OE uses /etc/default for service configuration, not /etc/sysconfig which
@@ -11,6 +8,9 @@ Change the files accordingly
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Claudius Heine <ch@denx.de>
+
+Update for 0.5.2
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  btrfsmaintenance-refresh.path    | 4 ++--
  btrfsmaintenance-refresh.service | 2 +-
@@ -32,16 +32,16 @@ index d56ad11..f0b4132 100644
  [Install]
  WantedBy=multi-user.target
 diff --git a/btrfsmaintenance-refresh.service b/btrfsmaintenance-refresh.service
-index 4ed1eb4..d6225a6 100644
+index 19e51c0..223fca9 100644
 --- a/btrfsmaintenance-refresh.service
 +++ b/btrfsmaintenance-refresh.service
 @@ -1,5 +1,5 @@
  [Unit]
--Description=Update cron periods from /etc/sysconfig/btrfsmaintenance
-+Description=Update cron periods from /etc/default/btrfsmaintenance
+-Description=Configure systemd timer schedule according to /etc/sysconfig/btrfsmaintenance
++Description=Configure systemd timer schedule according to /etc/default/btrfsmaintenance
+ Documentation="file:/usr/share/doc/btrfsmaintenance/README.man"
+ Documentation="file:/usr/share/doc/packages/btrfsmaintenance/README.man"
  
- [Service]
- ExecStart=/usr/share/btrfsmaintenance/btrfsmaintenance-refresh-cron.sh systemd-timer
 -- 
-2.33.3
+2.43.0
 
-- 
2.43.0


