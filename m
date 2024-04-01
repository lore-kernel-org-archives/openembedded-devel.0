Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F07CD1292
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:35:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.39028.1711982122259708514
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AnwMKCsV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711982122; x=1743518122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yDKEBMFaCz27qwZobjgLmr48lOM6tWZM1u03X1NPBzI=;
  b=AnwMKCsVOPRxA306fOP9HB+Y9++XSFtNYAhr7dUb7A7jdhVUeqvcNnJ0
   a+QxzKdZw9zdFgscnS6JumjZ8BcMSIlMrOl0GrEzazQLBF38sYiYGafrx
   QdI0IHtGtOW+Gg3F2OmUncqwYsiHk/c4A1+a210QdZeTQCfYvTF1KtTPY
   bE3bPRB2JGQy3LpYWpxe/SkSFKlEl05/jWDhtuWIl3YV02BtDHpftgB5K
   D4xbVOO1tde+1GK4ZuvI0gozToh+CMnB11LMVPDc8PA2IAzgAaw6ZVssZ
   16fVjCYKJ2FOdo6PFG82+gTt/OAJbCrJnuD89krrmlv8J3qtUBPcHW6q9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154135328"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154135328"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:35:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB5D3D4800
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DEDC1D4C1A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E52C1EBBEB
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 357C41A000A;
	Mon,  1 Apr 2024 22:35:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 10/47] metacity: upgrade 3.50.0 -> 3.52.0
Date: Mon,  1 Apr 2024 22:34:27 +0800
Message-Id: <1711982104-16711-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
References: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--3.571700-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yeMHaG2Ylcw4kdS3kPlaZyXfUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AZskwWqoib3Ez5vzLEGq8DujV
	RkDgmq7N8vkZstn0D7lSt1vnJz5gRo6c3gxiqYKt85pjA/x1xfgRryDXHx6oXUZA0M/8CmKhP8l
	JJ7G0bsbF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyv90Jk+vIkls7FRwnaMXw2rego
	/QSmnUeEz6aA1Pz/Olib2EwCR8plhZiLoPzjnXB9PnBC1U/Mctn4s32rDm822ukhTnBqYQk/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109710

From: Wang Mingyu <wangmy@fujitsu.com>

0001-drop-zenity-detection.patch
refreshed for 3.53.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../metacity/metacity/0001-drop-zenity-detection.patch   | 9 +++------
 .../metacity/{metacity_3.50.0.bb => metacity_3.52.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.50.0.bb => metacity_3.52.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
index 6bebaaba8..cd46824c3 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
@@ -1,4 +1,4 @@
-From ec0e52b49c9b6869413c9544c2ed44710ab91141 Mon Sep 17 00:00:00 2001
+From d36e65f3e31c882f62d5cfeb7b0e1441d5fdc821 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sat, 14 Apr 2018 16:15:59 +0800
 Subject: [PATCH] drop zenity detection
@@ -13,10 +13,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 528b7d2..8932ae6 100644
+index bbb4db8..2010d78 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -337,11 +337,6 @@ fi
+@@ -336,11 +336,6 @@ fi
  
  AM_CONDITIONAL(HAVE_SM, test "$found_sm" = "yes") 
  
@@ -28,6 +28,3 @@ index 528b7d2..8932ae6 100644
  AC_SEARCH_LIBS([dlsym], [dl], [], [
    AC_MSG_ERROR([unable to find the dlsym() function])
  ])
--- 
-2.31.1
-
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
index e6921e6de..32f080170 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.50.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.sha256sum] = "18e9b106438d46394e4148bcb83acc6367312be54559cdb564e270c1ccaeb60f"
+SRC_URI[archive.sha256sum] = "a72438ace6d5903ae79338c6098b1b35ab91c8a97c4323701d3bef1f3eeb191c"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-- 
2.34.1


