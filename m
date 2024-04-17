Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D826C41513
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2752.1713318084653750276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DZERA/WT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318085; x=1744854085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=z1T7n4XcM8gGBsbKlBPWnRadlX01JvE70BJeX/HUHvA=;
  b=DZERA/WTBNulqQq/AUDyXCULoozV66HEpH3EdYNpL1nvQhr2Qrdo+fXT
   4PZMLtvag9klCACfhdNbIj8vGEHGedk4hE00z66wp1Uxnw/fLyYfdEFNF
   Uuk0b/b5G+FHDxMo/o+ECDxoC7oDF3YtumE7SelniV901q7NZpmt7HisW
   tI8KqtWUNWUs/CFl2x7wpsPF3roWWFLlkyAXK+0+E+veWMqoJxdlPWvUS
   PORhui0tc6hngcOtaM2v6rS587m0SWLSJybD46Q1B/SAR3y6Z8WXoBYuY
   969mLEuJVWvOZzRgduug+q48/hN1d9DpJ3QmHRLobVlE/Xpe88Nmk5r/z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155837342"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155837342"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F0E6FE4EBB
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 285C0D4189
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A04AB224617
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C6FA1A0002;
	Wed, 17 Apr 2024 09:41:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/49] gnome-text-editor: upgrade 46.0 -> 46.1
Date: Wed, 17 Apr 2024 09:40:19 +0800
Message-Id: <1713318061-17128-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-6.459300-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrMVx/3ZYby794YeSlHZYFoufD
	otHL7Yhs3SWgUWruCGiT8jPQpoV7EUp5xwC1nmwmsDpn40N9M3lUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiNKWEqlNfZtW0CVXYvqmAUQRryDXHx6oXF0dfZ5kV9l87eK
	BFNfX9iq73ETS8mlfneTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8jHUU+U0ACZwCUUJ
	LgtzE4qXUJlEcbSmedrilol1/LyI9Fquy9RxYgY8DFxaO2uZXNVFyuvkkq7hEH5FnTZts4ihBkx
	VtgQxriHGcLKDTGFew==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109993

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
*Remove DBusActicatable=true from the .desktop file to fix an issue
*where you could spawn Text Editor via D-Bus and not have the session
 restored at startup.
*AppData fixes
*Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-text-editor_46.0.bb => gnome-text-editor_46.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_46.0.bb => gnome-text-editor_46.1.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.0.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb
index 967182aea..f37eb7195 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "c018d0b3792c044c1558d1d0dd92b09fb0a96c9e2d25e1ae1f4cf91f7eab4614"
+SRC_URI[archive.sha256sum] = "8ebfa0bea12e75f5efeacc721be3b8ae65027b024aa81db9ecab8c312257a2eb"
 
 FILES:${PN} += " \
     ${datadir}/metainfo \
-- 
2.34.1


