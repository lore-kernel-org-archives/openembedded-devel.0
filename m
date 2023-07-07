Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188EFC3DA40
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:07 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4894.1688699638020234539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="102453284"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="102453284"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:13:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 783ABCD7E0
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:13:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B1676BF3D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:13:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A9B287E03;
	Fri,  7 Jul 2023 12:13:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gegl: upgrade 0.4.44 -> 0.4.46
Date: Fri,  7 Jul 2023 11:13:26 +0800
Message-Id: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--5.808500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrKQNhMboqZloCRZok3tr/KzK2
	ieu8M5yxCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BUENBIMyKD0RHfiujuTbedJhN
	Zatxc0jTpsFJUKYZZJ3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIfiAqrjYtFiQ3Zc
	8r9UHV51jiUJnQQbRznDBjYcknODnl8GZOwrFEPX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103687

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
New simpler API for connecting pads, gegl_node_connect which can be used instead
of either gegl_node_connect_from or gegl_node_connect_to by autosensing the
neccesary direction of the connection.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.44.bb => gegl_0.4.46.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.44.bb => gegl_0.4.46.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.44.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.44.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
index 3c1a0243e8..3a9478785d 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.44.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
@@ -26,7 +26,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0a4cdb41635e406a0849cd0d3f03caf7d97cab8aa13d28707d532d0089d56126"
+SRC_URI[sha256sum] = "d0b3b2481bc8774c5f3d0a487611910166d18eef823a859fb91e781ab7b1e892"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "libpng librsvg"
-- 
2.34.1


