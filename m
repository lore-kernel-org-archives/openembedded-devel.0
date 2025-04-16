Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C98C369C9
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:32 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.14422.1744794150323600937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FEbTE9Qw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794151; x=1776330151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=b8EvxKXx1jsj3uLJzYtfSI/P9gDL7rPtTDnngBfp3oI=;
  b=FEbTE9QwYZnKQMkzSiF9R0rnFUMi+6uGejCLs0S6Y3Cc8FYqPNfuNOzY
   LuCy8YLqUqhw7rI02zoSYY2TNnXnpOYKj9CCGMxtSx+JW1dEiq7WuLM9D
   g+8QPz+MnEhuk9UIz97VBZsXxA73DKTIksWZMWVuemul4ey2p/oEt7KSz
   SwwDygS4/TXWDnTdn2CW5xbMpq4Q5Okka6dG4irXsKgLwqUvqdOgrMOir
   FlyXmB9V210VrIcq50YZ2pxRi693dio1R80kXGH8w6unOzlegwlHn/S5G
   GABcQpEyjofQ3v+ICgarVKA0fyn3KQsvGQFFAFF/nDMJ/qAn0vC+wpOVN
   g==;
X-CSE-ConnectionGUID: 0GmyIiJHQHKotYqQ4Ji0sQ==
X-CSE-MsgGUID: IEYyTKlcQnWJovqp2snmag==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175509503"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175509503"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BA45DD6EA5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 772DBD50F6
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33DB71A009B;
	Wed, 16 Apr 2025 17:02:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/31] gnome-system-monitor: upgrade 48.0 -> 48.1
Date: Wed, 16 Apr 2025 17:01:51 +0800
Message-Id: <1744794136-908-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116873

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nome-system-monitor_48.0.bb => gnome-system-monitor_48.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_48.0.bb => gnome-system-monitor_48.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb
index 35d1adf700..db07eaa27a 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check get
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI[archive.sha256sum] = "e4e5b345fbd4d7dc2f40ad6c62305ae5c7cc2b465ce95988692a54af347532a3"
+SRC_URI[archive.sha256sum] = "133c3a6e286366e659fd2d80582409a7bd5edae456e63c4f69ccf66ed6fc6638"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.43.0


