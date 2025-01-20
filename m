Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5F1C0218A
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.32743.1737360859530611679
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DAsGwnGp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360859; x=1768896859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kDc80Vnqi5dhccBqFp5xJza7EFvNf7BBq5qeSbxBDk4=;
  b=DAsGwnGpOSA9d4So67VHsCpQUctv/izYgs/k14TT8CIl42IVtdXST6GX
   647UoRMAgZ7Ia2iEfVrzT98UnErM038QysKsFqC6auANU6UI2OjAQx+8i
   jbU9dUFC0gsXDPvWeQv4moYv+41Ba4iY/T/l2htZm0jb5ryGBSgjAF4HD
   9Youx276/8Z002X171MXbqU08BHVStd1xJid4J4hQEywqIZXHDpg5cdvD
   KLgX0mUDBm+RKUGekW9JSh5GaXKVa2L73zDaJebJkbI16PVVTr5PAuewY
   4WWMDGXD41hjP4uUhjXRxwW8gYVpIneafWtmFy3HTosijWX/G2dQWGG/y
   A==;
X-CSE-ConnectionGUID: WfZvFyR3TWyMJ24sLjAFlA==
X-CSE-MsgGUID: SWlBoG3YSPi9mg4i+IMM4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187149534"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187149534"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:17 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7004FDBB80
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 49E5BD4C11
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DDA016BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8DA371A0074;
	Mon, 20 Jan 2025 16:14:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 11/32] mutter: upgrade 47.3 -> 47.4
Date: Mon, 20 Jan 2025 16:13:45 +0800
Message-Id: <1737360846-4824-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-0.425000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr9v33UW8WNYCYb2HRMAdbi1YM
	JR3dIrh2vnCllUJsUctUUUB6BpF8mMiLtyO0mH+okYD8wAZKsSA/xRB6OGnb2kEd8fQeT+PEaUX
	s6FguVy2iJGJGoluOFgXURz+hQhGV0DLYtdMjuDcReM8i8p3vgPwpYsC3/0Ch33Nl3elSfsqh9i
	UbZL0B/9JI2TrltgzKgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyM7PbcK5FV3nnARecAUP/rNBgL
	3QaU4no3AkGZtWXvxqGQxMjA5LMgf+pvaxqHLdHgTGIBC9oF3e+NBuffw7ki+7chzsVp0uK/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114973

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Use BT709 coefficients and limited range for YUV conversion by defaults
* Also request high priority secondary EGL context
* Fix Xwayland DND coordinates when using fractional scaling
* Fix applying initial _NET_WM_WINDOW_OPACITY on Xwaylan
* Implement wp_viewport support for cursor surfaces
* Improve input ->output latency of cursor movements
* Improve frame rate on monitors attached to secondary GPUs in copy mode
* Send preferred scales to all surface roles
* Misc. bug fixes and cleanups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/mutter/{mutter_47.3.bb => mutter_47.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_47.3.bb => mutter_47.4.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.3.bb b/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_47.3.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
index 75129342ab..30301dac29 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_47.3.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
-SRC_URI[archive.sha256sum] = "76421af6f90509cfdf1ab851d5ee58271e27e94aa8f7db521d5aa06daea6c560"
+SRC_URI[archive.sha256sum] = "f531fc00e6ec6dbb570b3bf942b6490f7a93df91c4c267a918b4d2afe9211bda"
 
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"
-- 
2.43.0


