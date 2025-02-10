Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F64CC021AF
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.46620.1739178111221225344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LZ1MMmsB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178117; x=1770714117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=c2y4ENsWRoJS2nIygYTEdwSc22qEvYLB5/DHK4iycYI=;
  b=LZ1MMmsB82h7oC0gxPGIteHpw/eRlJm4kGrH+DsYZ6M0ZJUr8XCedSDV
   zgxzt18ekr4GFdFRLL/SfRLBq1BHe15b81NM0viLcALrJpf03gsnrn93J
   xZEdZsUmEw52YGKEl/VihfbgxwiySs3QWzb1kcTo54bavH0mA/EvrDFIC
   jnKdskwaWBuc+4RDHPPIJs4HIK5xZyRl2IaQn+ZmuuBAnQSDomXegC+MY
   ht782yeZYu8Wn3PhTSqLndqU59iwTiQi5HPLuflLSvWlHNbik/v/IcXz1
   EYsWwL5Ka2D0N1CXQ0glgP9/A+oCNBiTPalRPAXwR8qVGnwd01pgBHMyX
   w==;
X-CSE-ConnectionGUID: N0W6XZ9VQjqhGJcBACXEqA==
X-CSE-MsgGUID: 3pjQp+w6RmaMfCoMzURBGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189426334"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189426334"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 550AAC2266
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15765D88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE9871A000B;
	Mon, 10 Feb 2025 17:01:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 19/66] mutter: upgrade 47.4 -> 47.5
Date: Mon, 10 Feb 2025 17:00:48 +0800
Message-Id: <1739178095-26432-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115345

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Synchronize device enabled state when adding device
* Do not use modifiers if surface should be sharable
* Fix notifying shell about modifier-only keyboard layout switches
* Fixed crashes
* Misc. bug fixes and cleanups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/mutter/{mutter_47.4.bb => mutter_47.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_47.4.bb => mutter_47.5.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb b/meta-gnome/recipes-gnome/mutter/mutter_47.5.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_47.5.bb
index 30301dac29..6a351ea279 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_47.5.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
-SRC_URI[archive.sha256sum] = "f531fc00e6ec6dbb570b3bf942b6490f7a93df91c4c267a918b4d2afe9211bda"
+SRC_URI[archive.sha256sum] = "6551a33ce887e68415b13952af6d6b430e95306f9297adc8c111953e995c515b"
 
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"
-- 
2.43.0


