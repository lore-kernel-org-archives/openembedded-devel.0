Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B86FC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 22:11:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.982.1660947083972540164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 15:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=CJXub8+b;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1C479845E1;
	Sat, 20 Aug 2022 00:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1660947081;
	bh=zr9yvf3sq7R8d1pGJ35/rwPI35qWWA5dhM3aB/oGB/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=CJXub8+b8BCs7Bt1I5b0lbIQ+ELwl4BWMmArnMLlU/0HPvX0Fd49Az0Y7kzAJiqHw
	 IiCO0AZ9o7b/ZWqHaIiKyNPAjiI1wBFRFRStb8qIaOiysTMcMMKqw/ycIgK9+1h86N
	 4TPNjqYKjyOVBpzeBQrMJM83B6xUu5xOx6BuvtlQofu4Fxe4HhHJUm2Y8Moyoi9Cza
	 eUZZTZlHRpVVkrB+3xGCoR6MyCL3kgZhAB5xde6tNMS3f+0Wb/DWsG33HF2LMndqd0
	 AVpPbVBsWoX4RN4vu7QI3CrrgKEqOvGUttiO6DCxZuoIj2iM/dYa6LVNNvdt/rgpCV
	 CF456yvHDHz3g==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: cazfi74@gmail.com,
	Marek Vasut <marex@denx.de>
Subject: [meta-games][PATCH] dynamic-layers: Move freeciv and gnome-games to
 dynamic layers
Date: Sat, 20 Aug 2022 00:11:04 +0200
Message-Id: <20220819221104.334600-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 22:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98337

Move freeciv and gnome-games to qt5 and gnome dynamic layers.
Use BBFILES_DYNAMIC to dynamically make recipes which depend
on meta-qt5 and meta-gnome available only in case those layers
are present in bblayers.conf, thus reducing the need of adding
possibly unneeded layers to build (e.g. to build neverball, no
need for meta-qt5).

Signed-off-by: Marek Vasut <marex@denx.de>
---
 conf/layer.conf                                          | 9 ++++++++-
 ...oss-environment-we-have-to-prepend-the-sysroot-.patch | 0
 .../0002-aisleriot-lib-Makefile.am-fix-configure.patch   | 0
 ...gure.in-fix-configure-with-quadrapassel-disable.patch | 0
 ...04-aisleriot-game.c-fix-build-with-latest-guile.patch | 0
 ...ss-gnuchess-common.h-fix-compile-for-Werror-mis.patch | 0
 .../recipes-games}/gnome-games/gnome-chess_3.24.1.bb     | 0
 .../recipes-games}/gnome-games/gnome-robots_3.22.1.bb    | 0
 .../recipes-games}/gnome-games/libgames-support_1.0.2.bb | 0
 .../gnome-games/libgnome-games-support_1.4.3.bb          | 0
 .../qt5-layer/recipes-games}/freeciv/freeciv-qt5.inc     | 0
 .../qt5-layer/recipes-games}/freeciv/freeciv.inc         | 0
 .../freeciv/freeciv/CacheVarForGettimeofday.patch        | 0
 .../recipes-games}/freeciv/freeciv/allow-root.patch      | 0
 .../freeciv/freeciv/dummy-qtver-S2_6.patch               | 0
 .../recipes-games}/freeciv/freeciv/dummy-qtver.patch     | 0
 .../qt5-layer/recipes-games}/freeciv/freeciv_2.6.6.bb    | 0
 .../qt5-layer/recipes-games}/freeciv/freeciv_3.0.2.bb    | 0
 18 files changed, 8 insertions(+), 1 deletion(-)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/files/0001-In-cross-environment-we-have-to-prepend-the-sysroot-.=
patch (100%)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/files/0002-aisleriot-lib-Makefile.am-fix-configure.patch (100%)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/files/0003-configure.in-fix-configure-with-quadrapassel-disable.=
patch (100%)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/files/0004-aisleriot-game.c-fix-build-with-latest-guile.patch (1=
00%)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/files/0005-glchess-gnuchess-common.h-fix-compile-for-Werror-mis.=
patch (100%)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/gnome-chess_3.24.1.bb (100%)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/gnome-robots_3.22.1.bb (100%)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/libgames-support_1.0.2.bb (100%)
 rename {recipes-games =3D> dynamic-layers/gnome-layer/recipes-games}/gno=
me-games/libgnome-games-support_1.4.3.bb (100%)
 rename {recipes-games =3D> dynamic-layers/qt5-layer/recipes-games}/freec=
iv/freeciv-qt5.inc (100%)
 rename {recipes-games =3D> dynamic-layers/qt5-layer/recipes-games}/freec=
iv/freeciv.inc (100%)
 rename {recipes-games =3D> dynamic-layers/qt5-layer/recipes-games}/freec=
iv/freeciv/CacheVarForGettimeofday.patch (100%)
 rename {recipes-games =3D> dynamic-layers/qt5-layer/recipes-games}/freec=
iv/freeciv/allow-root.patch (100%)
 rename {recipes-games =3D> dynamic-layers/qt5-layer/recipes-games}/freec=
iv/freeciv/dummy-qtver-S2_6.patch (100%)
 rename {recipes-games =3D> dynamic-layers/qt5-layer/recipes-games}/freec=
iv/freeciv/dummy-qtver.patch (100%)
 rename {recipes-games =3D> dynamic-layers/qt5-layer/recipes-games}/freec=
iv/freeciv_2.6.6.bb (100%)
 rename {recipes-games =3D> dynamic-layers/qt5-layer/recipes-games}/freec=
iv/freeciv_3.0.2.bb (100%)

diff --git a/conf/layer.conf b/conf/layer.conf
index aa4c39e..3b001f1 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,5 +8,12 @@ BBFILE_COLLECTIONS +=3D "games-layer"
 BBFILE_PATTERN_games-layer :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_games-layer =3D "15"
=20
-LAYERDEPENDS_games-layer =3D "core openembedded-layer filesystems-layer =
gnome-layer networking-layer multimedia-layer meta-python"
+LAYERDEPENDS_games-layer =3D "core openembedded-layer filesystems-layer =
networking-layer multimedia-layer meta-python"
 LAYERSERIES_COMPAT_games-layer =3D "kirkstone"
+
+BBFILES_DYNAMIC +=3D " \
+	gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/*/*/*.bb \
+	gnome-layer:${LAYERDIR}/dynamic-layers/gnome-layer/*/*/*.bbappend \
+	qt5-layer:${LAYERDIR}/dynamic-layers/qt5-layer/*/*/*.bb \
+	qt5-layer:${LAYERDIR}/dynamic-layers/qt5-layer/*/*/*.bbappend \
+	"
diff --git a/recipes-games/gnome-games/files/0001-In-cross-environment-we=
-have-to-prepend-the-sysroot-.patch b/dynamic-layers/gnome-layer/recipes-=
games/gnome-games/files/0001-In-cross-environment-we-have-to-prepend-the-=
sysroot-.patch
similarity index 100%
rename from recipes-games/gnome-games/files/0001-In-cross-environment-we-=
have-to-prepend-the-sysroot-.patch
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/files/0001=
-In-cross-environment-we-have-to-prepend-the-sysroot-.patch
diff --git a/recipes-games/gnome-games/files/0002-aisleriot-lib-Makefile.=
am-fix-configure.patch b/dynamic-layers/gnome-layer/recipes-games/gnome-g=
ames/files/0002-aisleriot-lib-Makefile.am-fix-configure.patch
similarity index 100%
rename from recipes-games/gnome-games/files/0002-aisleriot-lib-Makefile.a=
m-fix-configure.patch
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/files/0002=
-aisleriot-lib-Makefile.am-fix-configure.patch
diff --git a/recipes-games/gnome-games/files/0003-configure.in-fix-config=
ure-with-quadrapassel-disable.patch b/dynamic-layers/gnome-layer/recipes-=
games/gnome-games/files/0003-configure.in-fix-configure-with-quadrapassel=
-disable.patch
similarity index 100%
rename from recipes-games/gnome-games/files/0003-configure.in-fix-configu=
re-with-quadrapassel-disable.patch
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/files/0003=
-configure.in-fix-configure-with-quadrapassel-disable.patch
diff --git a/recipes-games/gnome-games/files/0004-aisleriot-game.c-fix-bu=
ild-with-latest-guile.patch b/dynamic-layers/gnome-layer/recipes-games/gn=
ome-games/files/0004-aisleriot-game.c-fix-build-with-latest-guile.patch
similarity index 100%
rename from recipes-games/gnome-games/files/0004-aisleriot-game.c-fix-bui=
ld-with-latest-guile.patch
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/files/0004=
-aisleriot-game.c-fix-build-with-latest-guile.patch
diff --git a/recipes-games/gnome-games/files/0005-glchess-gnuchess-common=
.h-fix-compile-for-Werror-mis.patch b/dynamic-layers/gnome-layer/recipes-=
games/gnome-games/files/0005-glchess-gnuchess-common.h-fix-compile-for-We=
rror-mis.patch
similarity index 100%
rename from recipes-games/gnome-games/files/0005-glchess-gnuchess-common.=
h-fix-compile-for-Werror-mis.patch
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/files/0005=
-glchess-gnuchess-common.h-fix-compile-for-Werror-mis.patch
diff --git a/recipes-games/gnome-games/gnome-chess_3.24.1.bb b/dynamic-la=
yers/gnome-layer/recipes-games/gnome-games/gnome-chess_3.24.1.bb
similarity index 100%
rename from recipes-games/gnome-games/gnome-chess_3.24.1.bb
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/gnome-ches=
s_3.24.1.bb
diff --git a/recipes-games/gnome-games/gnome-robots_3.22.1.bb b/dynamic-l=
ayers/gnome-layer/recipes-games/gnome-games/gnome-robots_3.22.1.bb
similarity index 100%
rename from recipes-games/gnome-games/gnome-robots_3.22.1.bb
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/gnome-robo=
ts_3.22.1.bb
diff --git a/recipes-games/gnome-games/libgames-support_1.0.2.bb b/dynami=
c-layers/gnome-layer/recipes-games/gnome-games/libgames-support_1.0.2.bb
similarity index 100%
rename from recipes-games/gnome-games/libgames-support_1.0.2.bb
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/libgames-s=
upport_1.0.2.bb
diff --git a/recipes-games/gnome-games/libgnome-games-support_1.4.3.bb b/=
dynamic-layers/gnome-layer/recipes-games/gnome-games/libgnome-games-suppo=
rt_1.4.3.bb
similarity index 100%
rename from recipes-games/gnome-games/libgnome-games-support_1.4.3.bb
rename to dynamic-layers/gnome-layer/recipes-games/gnome-games/libgnome-g=
ames-support_1.4.3.bb
diff --git a/recipes-games/freeciv/freeciv-qt5.inc b/dynamic-layers/qt5-l=
ayer/recipes-games/freeciv/freeciv-qt5.inc
similarity index 100%
rename from recipes-games/freeciv/freeciv-qt5.inc
rename to dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv-qt5.inc
diff --git a/recipes-games/freeciv/freeciv.inc b/dynamic-layers/qt5-layer=
/recipes-games/freeciv/freeciv.inc
similarity index 100%
rename from recipes-games/freeciv/freeciv.inc
rename to dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv.inc
diff --git a/recipes-games/freeciv/freeciv/CacheVarForGettimeofday.patch =
b/dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv/CacheVarForGetti=
meofday.patch
similarity index 100%
rename from recipes-games/freeciv/freeciv/CacheVarForGettimeofday.patch
rename to dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv/CacheVar=
ForGettimeofday.patch
diff --git a/recipes-games/freeciv/freeciv/allow-root.patch b/dynamic-lay=
ers/qt5-layer/recipes-games/freeciv/freeciv/allow-root.patch
similarity index 100%
rename from recipes-games/freeciv/freeciv/allow-root.patch
rename to dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv/allow-ro=
ot.patch
diff --git a/recipes-games/freeciv/freeciv/dummy-qtver-S2_6.patch b/dynam=
ic-layers/qt5-layer/recipes-games/freeciv/freeciv/dummy-qtver-S2_6.patch
similarity index 100%
rename from recipes-games/freeciv/freeciv/dummy-qtver-S2_6.patch
rename to dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv/dummy-qt=
ver-S2_6.patch
diff --git a/recipes-games/freeciv/freeciv/dummy-qtver.patch b/dynamic-la=
yers/qt5-layer/recipes-games/freeciv/freeciv/dummy-qtver.patch
similarity index 100%
rename from recipes-games/freeciv/freeciv/dummy-qtver.patch
rename to dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv/dummy-qt=
ver.patch
diff --git a/recipes-games/freeciv/freeciv_2.6.6.bb b/dynamic-layers/qt5-=
layer/recipes-games/freeciv/freeciv_2.6.6.bb
similarity index 100%
rename from recipes-games/freeciv/freeciv_2.6.6.bb
rename to dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv_2.6.6.bb
diff --git a/recipes-games/freeciv/freeciv_3.0.2.bb b/dynamic-layers/qt5-=
layer/recipes-games/freeciv/freeciv_3.0.2.bb
similarity index 100%
rename from recipes-games/freeciv/freeciv_3.0.2.bb
rename to dynamic-layers/qt5-layer/recipes-games/freeciv/freeciv_3.0.2.bb
--=20
2.35.1


