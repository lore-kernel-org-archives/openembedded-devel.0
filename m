Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF40C282C1
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 15:54:00 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.13442.1740670538243125843
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 07:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=JkUvk7N/;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5ACF79C689B
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 10:35:37 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 9PZ04J-YrCgy; Thu, 27 Feb 2025 10:35:36 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DF24C9C68D6;
	Thu, 27 Feb 2025 10:35:36 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com DF24C9C68D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1740670536; bh=j7jJMHGEf/yxmZ9h2iVvh9/C9KnW3vk6giqi2pu1vvU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=JkUvk7N//D9r3f7VriXX40ahog6krViqQen5E9H4+nUwpi69hzBqug6c6WQSzhUoa
	 Su5YV3L2INOEOsEza0Tgm2FhGIb3UfkJmHm2GVMQdTOcxYCLRgmRA11vzemJuJ9kew
	 dhCYFWTTOB1zOg+BTj1bYYngb8tNVhss0sDxLWgxF91kOwCytUTFJW/WKqhhzmxmuh
	 ppUmxCCEIRcdLD5PMXoIoCy4tx1se9syW3XVg0ZouldhLsf1T1su6xWQhXltgbp2Im
	 jM4BKCGr4S34qBIRPTVlQ+hovU99hViBZRRnZtr4XXvnFLJ8hb5I/HzaQFwLl2UStP
	 JNO1RL0RIJ1cA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id EqjdBoXMafgu; Thu, 27 Feb 2025 10:35:36 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 76B899C689B;
	Thu, 27 Feb 2025 10:35:36 -0500 (EST)
From: "Paul Le Guen de Kerneizon" <paul.leguendekerneizon@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-oe][PATCH] gnuplot: add x11 PACKAGECONFIG
Date: Thu, 27 Feb 2025 16:35:29 +0100
Message-Id: <20250227153529.82380-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 15:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115692

Currently, gnuplot recipe requires the x11 distro feature to be built.
However, X11 is not needed for running gnuplot as long as we don't use
a gnuplot X11 terminal.
This commit adds the x11 package config used to make the need of x11
distro feature optional to build gnuplot.

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/=
recipes-extended/gnuplot/gnuplot_5.4.3.bb
index fe5e5c067d..ba79534cb9 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -5,11 +5,10 @@ HOMEPAGE =3D "http://www.gnuplot.info/"
 SECTION =3D "console/scientific"
 LICENSE =3D "gnuplot"
 LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D243a186fc2fd3b992125d60d5b1=
bab8f"
-DEPENDS =3D "${BPN}-native virtual/libx11 gd readline"
+DEPENDS =3D "${BPN}-native gd readline"

 inherit autotools features_check pkgconfig
 # depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES =3D "x11"

 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.gz;name=3Darchive \
            http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=3D=
qtplot \
@@ -37,11 +36,11 @@ do_install:class-native() {
 	install ${B}/docs/*doc* ${D}${bindir}
     rm ${D}${bindir}/*.o
 }
-
-PACKAGECONFIG ??=3D "cairo"
+PACKAGECONFIG ??=3D "cairo ${@bb.utils.filter('DISTRO_FEATURES', 'x11', =
d)}"
 PACKAGECONFIG[cairo] =3D "--with-cairo,--without-cairo,cairo pango"
 PACKAGECONFIG[lua] =3D "--with-lua,--without-lua,lua"
 PACKAGECONFIG[qt5] =3D "--with-qt --with-qt5nativesysroot=3D${STAGING_DI=
R_NATIVE},--without-qt,qtbase-native qtbase qtsvg qttools-native"
+PACKAGECONFIG[x11] =3D ",,virtual/libx11"

 EXTRA_OECONF =3D " \
     --with-readline=3D${STAGING_LIBDIR}/.. \
--
2.34.1

