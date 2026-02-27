Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB8CFD531B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:23:19 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91515.1772184196438860133
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hAcWYncd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772184195; x=1803720195;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BL1fbPIpQd4XDa+bc2NXx7lOojGlu59+XXNySxOxiZg=;
  b=hAcWYncdGrdCU5PvYcFIGxUB3aPbAgUhp3plNObTm8F5vtni1MmBVxnQ
   1/CHW7XHVHckvb60DuEtHAFT2JQs9GPJMrkdaX8s+wQ25VjvOU9bv4w6G
   tLJP/Y/lXrJgmmbVN+Ht+Zwo6phQPvrGL1NUe7evPs6bxjzCUSzCYuZvX
   a8v6Wk+L1eZVhbvkWUBuv0vexJnW9G5uUX4VWVH+W+7DQa977svBVhjwS
   zGaGYG49paZlZhOmYogkCOoUoF71Cv8q2v+5k30+xqFLj/Sl5OxG9Vw7G
   gGkiXSc8TWDSlBuJzyca7v183yJR7FFV0KUA8egQHcKb68potQQaUmTZW
   Q==;
X-CSE-ConnectionGUID: W5zDEC44SGuLFTaTp5Sabg==
X-CSE-MsgGUID: 8TXNAUI3RvikWXWXF9vl8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231320435"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231320435"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id 8E185C00569
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:14 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 480F1C06BFD
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:14 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 1370A100719F
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:11 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-filesystems][PATCH] btrfsmaintenance: upgrade 0.5 -> 0.5.2
Date: Fri, 27 Feb 2026 17:23:06 +0800
Message-ID: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124695

1. Changelog:
    fix syntax error in run_task, preventing jobs to start
    start scrub jobs sequentially if RAID5 or RAID6 data profile is found
    fix btrfsmaintenance-refresh.service description

2. Update 0001-change-sysconfig-path-to-etc-default.patch for 0.5.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...nance_0.5.bb => btrfsmaintenance_0.5.2.bb} |  4 +-
 ...change-sysconfig-path-to-etc-default.patch | 39 ++++++++++---------
 2 files changed, 23 insertions(+), 20 deletions(-)
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
index d425206f0e..eeb64b29b0 100644
--- a/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
+++ b/meta-filesystems/recipes-utils/btrfsmaintenance/files/0001-change-sysconfig-path-to-etc-default.patch
@@ -1,7 +1,7 @@
-From b49dbe17e0d9ae463e5a34e6991aa2d3c70d2fb1 Mon Sep 17 00:00:00 2001
-From: Claudius Heine <ch@denx.de>
-Date: Wed, 11 May 2022 14:33:13 +0200
-Subject: [PATCH] change sysconfig path to /etc/default
+From 5354785858fb990e1ba863c41786be5534ef869f Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 26 Feb 2026 10:15:33 +0000
+Subject: [PATCH] [PATCH] change sysconfig path to /etc/default
 
 OE uses /etc/default for service configuration, not /etc/sysconfig which
 is used by SUSE and RedHat based distributions.
@@ -11,37 +11,40 @@ Change the files accordingly
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Claudius Heine <ch@denx.de>
+
+Update for 0.5.2
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
- btrfsmaintenance-refresh.path    | 4 ++--
- btrfsmaintenance-refresh.service | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ btrfsmaintenance-refresh.path    | 2 ++
+ btrfsmaintenance-refresh.service | 1 +
+ 2 files changed, 3 insertions(+)
 
 diff --git a/btrfsmaintenance-refresh.path b/btrfsmaintenance-refresh.path
-index d56ad11..f0b4132 100644
+index d56ad11..8e4fa18 100644
 --- a/btrfsmaintenance-refresh.path
 +++ b/btrfsmaintenance-refresh.path
-@@ -1,8 +1,8 @@
+@@ -1,8 +1,10 @@
  [Unit]
--Description=Watch /etc/sysconfig/btrfsmaintenance
+ Description=Watch /etc/sysconfig/btrfsmaintenance
 +Description=Watch /etc/default/btrfsmaintenance
  
  [Path]
--PathChanged=/etc/sysconfig/btrfsmaintenance
+ PathChanged=/etc/sysconfig/btrfsmaintenance
 +PathChanged=/etc/default/btrfsmaintenance
  
  [Install]
  WantedBy=multi-user.target
 diff --git a/btrfsmaintenance-refresh.service b/btrfsmaintenance-refresh.service
-index 4ed1eb4..d6225a6 100644
+index 19e51c0..e3984d7 100644
 --- a/btrfsmaintenance-refresh.service
 +++ b/btrfsmaintenance-refresh.service
-@@ -1,5 +1,5 @@
+@@ -1,5 +1,6 @@
  [Unit]
--Description=Update cron periods from /etc/sysconfig/btrfsmaintenance
-+Description=Update cron periods from /etc/default/btrfsmaintenance
+ Description=Configure systemd timer schedule according to /etc/sysconfig/btrfsmaintenance
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


