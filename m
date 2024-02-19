Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF12FC54791
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.37317.1708333361165012638
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ma0M1tWn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333362; x=1739869362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OCEaFFP6iwzRTbefVp+JOgtqdMR8alh5w7+PFK3o2x0=;
  b=Ma0M1tWnm7jlEeD6wBSDa3ZEtvMbMkcFzDJfb+6AjKDaYf1IlvFIricG
   RYlJ2KNbeuUsnqQf9iF1LlvOLyZUtYwmjJlRN7H+ne9aV7k9vCI9LaR9y
   4YgqqMDMA036wfDawKJX7/0Z0D21jv4TNZXqbj9s6Fv/g/i/w0ZJBPX97
   RVD4GcD0EyYyj5XQ/ruqjgOAsNzOSB9tJfkhGRmEpLBusX/aUiKsZb54k
   vD/yN3yS0nGMSGV6gQ+UY7Mwy1Rx3Ko7sdzYSqNVEE0Aggva/hROkbyIF
   bh5U7UzC7y2kTaQzf9XWvywCXCPmQOmpJXVHJKSYl2UsF76gDkyLLeIBC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="151522198"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="151522198"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BE99DD4800
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F16D8D4BDA
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 88C3120099594
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 380C81A006B;
	Mon, 19 Feb 2024 17:02:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/23] gegl: upgrade 0.4.46 -> 0.4.48
Date: Mon, 19 Feb 2024 17:02:06 +0800
Message-Id: <1708333346-17704-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--3.367500-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrBXngI6jFvpcUoJOBFYW8Ju79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gH4qCLIu0mtIEYfVjZroiq3DXk
	WtYCR28+xfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzgO7nWH93gN55PG
	T9aYJ9tuID87JmzgrgfwNQtRBrskuK2Dz2vJ0RKUwiuZRoo1y4qShPeCaBaqA59CWtUoGAn/n+Z
	l5owZZ2iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108848

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-GeglColor extended with GBytes API, and space aware accesors for RGB
 and CMYK. Better runtime handling of mismatched GEGL ops in graphs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.46.bb => gegl_0.4.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.46.bb => gegl_0.4.48.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.48.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.48.bb
index 8c3f89fa9..34e001a5f 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.48.bb
@@ -26,7 +26,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d0b3b2481bc8774c5f3d0a487611910166d18eef823a859fb91e781ab7b1e892"
+SRC_URI[sha256sum] = "418c26d94be8805d7d98f6de0c6825ca26bd74fcacb6c188da47533d9ee28247"
 
 PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "libpng librsvg"
-- 
2.34.1


