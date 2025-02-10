Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A808C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46624.1739178116317966661
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BB9uvxag;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178117; x=1770714117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZJME3/LXH6i5z4XpNGKLDRyoIiyVupCVulo6j00VrKk=;
  b=BB9uvxag93Wb/qxjzvSf9iu6T3N2LkKGBtA1/zXR16Yc658W8X004DTE
   0+9AWvOQDR2WUT/Y5W7yZ88HZwwLkOwvPUFMTgLdnjcK0ImsS35b5Njap
   Orn/iouDKrSumjbd8d+x/BL2ma8mZdvRmRfPUiG6vCxRHx8SgKa7w/cGF
   WYkTRXeUQuVyB7+99ucSTmYyQEXxaYmU0XI1CriY2b8dGeePrVd2l09S2
   IY41piqxVILzaP6QTN1pw5/K4/y8h4Wi6+CUDrVBA1eGNSAxB4hjEanch
   N5+v9NzPwfV7x8ikPrAVSqcPMv8o8/ju5RjYz/KIAGG+yMps+1nGnQchQ
   w==;
X-CSE-ConnectionGUID: 4ClcuS2QSDq+AJTJswn7RA==
X-CSE-MsgGUID: 1Q+UDji8QDK++NoyzYr4wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189490509"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189490509"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:55 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E61DAD4C70
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AB86FD748F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 50BA51A006C;
	Mon, 10 Feb 2025 17:01:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/66] multipath-tools: upgrade 0.10.0 -> 0.11.0
Date: Mon, 10 Feb 2025 17:00:47 +0800
Message-Id: <1739178095-26432-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115346

From: Wang Mingyu <wangmy@fujitsu.com>

0003-RH-don-t-start-without-a-config-file.patch
refreshed for 0.11.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0003-RH-don-t-start-without-a-config-file.patch | 13 +++++--------
 .../files/0005-RH-add-mpathconf.patch               |  9 +++------
 ...th-tools_0.10.0.bb => multipath-tools_0.11.0.bb} |  4 ++--
 3 files changed, 10 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.10.0.bb => multipath-tools_0.11.0.bb} (97%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch b/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
index b11fb2c726..649f1fa778 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0003-RH-don-t-start-without-a-config-file.patch
@@ -1,4 +1,4 @@
-From 06a411b15e131eb4ebc2df95dc10fcff944bead6 Mon Sep 17 00:00:00 2001
+From 2fe1037b8198bd00961d8df48e684296758127d1 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 23 Nov 2018 17:25:15 +0800
 Subject: [PATCH] RH: don't start without a config file
@@ -28,7 +28,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  5 files changed, 23 insertions(+)
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index 0e3a5cc1..3fbfcc85 100644
+index 8b424d18..d8fafa1f 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
 @@ -26,6 +26,7 @@
@@ -39,7 +39,7 @@ index 0e3a5cc1..3fbfcc85 100644
  
  /*
   * We don't support re-initialization after
-@@ -959,6 +960,23 @@ int init_config__ (const char *file, struct config *conf)
+@@ -937,6 +938,23 @@ int init_config__ (const char *file, struct config *conf)
  		}
  		factorize_hwtable(conf->hwtable, builtin_hwtable_size, file);
  		validate_pctable(conf->overrides, 0, file);
@@ -64,7 +64,7 @@ index 0e3a5cc1..3fbfcc85 100644
  
  	conf->processed_main_config = 1;
 diff --git a/libmultipath/config.h b/libmultipath/config.h
-index 94cdf252..534b6142 100644
+index 5b4ebf8c..2302eacc 100644
 --- a/libmultipath/config.h
 +++ b/libmultipath/config.h
 @@ -10,6 +10,7 @@
@@ -101,7 +101,7 @@ index 7bc8806e..315884eb 100644
  .
  .\" ----------------------------------------------------------------------------
 diff --git a/multipathd/multipathd.service.in b/multipathd/multipathd.service.in
-index 646001e6..979e6f12 100644
+index b6a25b31..f78bb91b 100644
 --- a/multipathd/multipathd.service.in
 +++ b/multipathd/multipathd.service.in
 @@ -5,6 +5,7 @@ Before=local-fs-pre.target blk-availability.service shutdown.target
@@ -112,6 +112,3 @@ index 646001e6..979e6f12 100644
  Before=initrd-cleanup.service
  DefaultDependencies=no
  Conflicts=shutdown.target
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
index 36a7d4774b..e7ea374cd1 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0005-RH-add-mpathconf.patch
@@ -1,4 +1,4 @@
-From 30b85a61d665137ed1bca0d3e3d011c72758a192 Mon Sep 17 00:00:00 2001
+From 4035b48b512b5010b1c33aeba8c58cf2705bca83 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 26 Nov 2018 09:55:12 +0800
 Subject: [PATCH] RH: add mpathconf
@@ -29,10 +29,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  create mode 100644 multipath/mpathconf.8
 
 diff --git a/libmultipath/config.c b/libmultipath/config.c
-index 3fbfcc85..fbaaca8c 100644
+index d8fafa1f..cba7994b 100644
 --- a/libmultipath/config.c
 +++ b/libmultipath/config.c
-@@ -962,6 +962,7 @@ int init_config__ (const char *file, struct config *conf)
+@@ -940,6 +940,7 @@ int init_config__ (const char *file, struct config *conf)
  		validate_pctable(conf->overrides, 0, file);
  	} else {
  		condlog(0, "/etc/multipath.conf does not exist, blacklisting all devices.");
@@ -648,6 +648,3 @@ index 00000000..4cd32672
 +.BR service (8),
 +.SH AUTHOR
 +Benjamin Marzinski <bmarzins@redhat.com>
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb
similarity index 97%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb
index 18874e909e..9f95361063 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.10.0.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb
@@ -46,9 +46,9 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=ma
            file://0012-add-explicit-dependency-on-libraries.patch \
            "
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
 
-SRCREV = "ee3a70175a8a9045e5c309d5392300922e2a0625"
+SRCREV = "de16cf82c5263fc148118be56ebf44c8f0ee60b8"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


