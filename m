Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62080D64080
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 06:56:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9027.1765954599247787378
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 22:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mYQZxZBJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765954599; x=1797490599;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vWb01uNd6bV5dSwnKwaqJdHHsu3kpSSCFXszYHjh3cU=;
  b=mYQZxZBJLNMMWf/vby//j7f5twanF7EfCbxesFwSHjKTprnIpWTQD24W
   nx+CFrpvbXlFhg3Hw163R7RazQ+h99AwzdNVYvVDDN5cmALIIfgfiAGVD
   g3Z+10HVJC55H/FGmw8p0Vz54f07EfRS6jn1HrNXJkgZDvHJIwl1+8TVY
   4Zze9RZIuhBs80+U8VCrHfZyXKC5jMmvQJJyblMGbrehaxH7ssx3KESt8
   ZXVwHZ06+BlU3/QO33xLh9K1tlj2iJSVsIpJyfG84+dJ0HGZSoQGLv4yb
   SgtyXoNnpFZuB3jTIfTlz8gDidFnYQGqEUYW+pHwy774MNnxDfvIHpiij
   g==;
X-CSE-ConnectionGUID: Bjvbxb9SSPqfSogtr4r1IA==
X-CSE-MsgGUID: BJoFs6mKQZKXXJUJBmee+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="222313427"
X-IronPort-AV: E=Sophos;i="6.21,155,1763391600"; 
   d="scan'208";a="222313427"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:56:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B045B42A333
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:37 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5D2C1180323F
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:37 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 1F5991003156
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:34 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH 4/5] gegl: upgrade 0.4.64 -> 0.4.66
Date: Wed, 17 Dec 2025 14:56:31 +0800
Message-ID: <20251217065631.33471-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122716

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-gnome/recipes-gimp/gegl/{gegl_0.4.64.bb => gegl_0.4.66.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.64.bb => gegl_0.4.66.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
index 1a31f60f94..1b4ce8a50d 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
@@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0de1c9dd22c160d5e4bdfc388d292f03447cca6258541b9a12fed783d0cf7c60"
+SRC_URI[sha256sum] = "92b05855e2190868949d70cea6e9a50b163a6a441242e740a6263975379f993b"
 
 PACKAGECONFIG ??= "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "librsvg"
-- 
2.43.0


