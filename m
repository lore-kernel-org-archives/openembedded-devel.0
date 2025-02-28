Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE731C282C5
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 02:25:04 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.14900.1740747900663091596
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Feb 2025 05:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=vcA8GWMF;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A5CDA9C175F
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 08:04:59 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id KhmItoX7w40S; Fri, 28 Feb 2025 08:04:59 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1B8E19C8853;
	Fri, 28 Feb 2025 08:04:59 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 1B8E19C8853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1740747899; bh=tXN9iuFR51wMEgqExAQPlHBMNlU+l6hTC7URTxVByCA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=vcA8GWMF24D73Z4FFBz+W3reuATVNASKOKkuB4XhfkIKrU4ndobz9KWcsf/UY+EV9
	 VejUDGTwqk34h6uL1bGikxr9qzil5x+1KIqRRG8s8dI5q+Ng7PRss1HGNnB8nLWErR
	 z25ss1VeUJYeMod6oCz4Gcm8ckCWOkLlVxeZb51jT4HTSxBF3K/3Z7K5+/vF/4Dsi5
	 gCTcO4et/jGTWaij2NRChyWNdUBX4q38dxJo4BhZ4/+hIWsxHEUECxf/4F2EiR+v3R
	 dEbYXCdnpCIOLIaA14pmKVCyEa2UfWaGhKoiF1yaEAas+JEgz059nvlKrjl59y7734
	 VJbJR27bk75uw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 5xooOq1LR0wA; Fri, 28 Feb 2025 08:04:59 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 9AE769C175F;
	Fri, 28 Feb 2025 08:04:58 -0500 (EST)
From: "Paul Le Guen de Kerneizon" <paul.leguendekerneizon@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-oe][PATCH v2] gnuplot: add x11 PACKAGECONFIG
Date: Fri, 28 Feb 2025 14:04:51 +0100
Message-Id: <20250228130451.52524-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Mar 2025 02:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115713

Currently, gnuplot recipe requires the x11 distro feature to be built.
However, X11 is not needed for running gnuplot as long as we don't use
a gnuplot X11 terminal.
This commit adds the x11 package config used to make the need of x11
distro feature optional to build gnuplot. `features_check` inherit is rem=
oved as
any of the functionalities of this class is now used.

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/=
recipes-extended/gnuplot/gnuplot_5.4.3.bb
index fe5e5c067d..7508d37fed 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -5,11 +5,10 @@ HOMEPAGE =3D "http://www.gnuplot.info/"
 SECTION =3D "console/scientific"
 LICENSE =3D "gnuplot"
 LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D243a186fc2fd3b992125d60d5b1=
bab8f"
-DEPENDS =3D "${BPN}-native virtual/libx11 gd readline"
+DEPENDS =3D "${BPN}-native gd readline"

-inherit autotools features_check pkgconfig
+inherit autotools pkgconfig
 # depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES =3D "x11"

 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.gz;name=3Darchive \
            http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=3D=
qtplot \
@@ -38,10 +37,11 @@ do_install:class-native() {
     rm ${D}${bindir}/*.o
 }

-PACKAGECONFIG ??=3D "cairo"
+PACKAGECONFIG ??=3D "cairo ${@bb.utils.filter('DISTRO_FEATURES', 'x11', =
d)}"
 PACKAGECONFIG[cairo] =3D "--with-cairo,--without-cairo,cairo pango"
 PACKAGECONFIG[lua] =3D "--with-lua,--without-lua,lua"
 PACKAGECONFIG[qt5] =3D "--with-qt --with-qt5nativesysroot=3D${STAGING_DI=
R_NATIVE},--without-qt,qtbase-native qtbase qtsvg qttools-native"
+PACKAGECONFIG[x11] =3D "--with-x,--without-x,virtual/libx11"

 EXTRA_OECONF =3D " \
     --with-readline=3D${STAGING_LIBDIR}/.. \
--
2.34.1

