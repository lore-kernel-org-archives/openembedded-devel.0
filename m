Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6586C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 21:05:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.54.1637355934062159852
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=dQlgmr23;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D110C812BB;
	Fri, 19 Nov 2021 22:05:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1637355931;
	bh=1UpqZfzAUk8ZKxavCRIKbB3fKOxABRRGjrrPPXkTRMA=;
	h=From:To:Cc:Subject:Date:From;
	b=dQlgmr23MZ80mzmML+YVsxKWz22vfOYpcpj2NK80BhG9eQi7ORbJmlHU6JbrB20H7
	 IUR6pziVG3rN64GcLep6NxsjVD+kSjNGeCadjChI2Xbe7pYbRDDN7yvS+1pT4pNDsM
	 IVFay367l/brTqa2dsLtf+SAMYn4GwzXx9Wav/71vVSa6qa4f7qJnxnYUEXMhBrM6x
	 aIrRatw0jdggPT0eKWiRQhYsuRkvHOs22SO+RZaGk1ND2hIg8W4ZbJoJzc42fJ5lJx
	 rxl7z/Rfmqbc44xxBID3XcaOkhh1dzsd43/X9NAsjM8s+OGsX/gKFATa3GuJf0uxRN
	 /OGRYmsAl4OiQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: cazfi74@gmail.com,
	hs@denx.de,
	Marek Vasut <marex@denx.de>
Subject: [meta-games][PATCH] neverball: Add neverball
Date: Fri, 19 Nov 2021 22:05:15 +0100
Message-Id: <20211119210515.131769-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 21:05:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94067

This is an interactive game with a rolling ball, useful for
testing whether point sprites work correctly in GPU drivers.

The user should install both neverball neverball-data packages.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 recipes-games/neverball/neverball-data_git.bb | 16 ++++++++++++
 recipes-games/neverball/neverball.inc         | 26 +++++++++++++++++++
 recipes-games/neverball/neverball_git.bb      | 16 ++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 recipes-games/neverball/neverball-data_git.bb
 create mode 100644 recipes-games/neverball/neverball.inc
 create mode 100644 recipes-games/neverball/neverball_git.bb

diff --git a/recipes-games/neverball/neverball-data_git.bb b/recipes-game=
s/neverball/neverball-data_git.bb
new file mode 100644
index 0000000..c09a5ee
--- /dev/null
+++ b/recipes-games/neverball/neverball-data_git.bb
@@ -0,0 +1,16 @@
+require neverball.inc
+
+inherit allarch
+
+DEPENDS:append =3D " jpeg-native libpng-native libsdl2-native"
+
+do_compile() {
+	oe_runmake CC=3D"${BUILD_CC}" CFLAGS=3D"${BUILD_CFLAGS} -I${STAGING_INC=
DIR_NATIVE}/SDL2/" LDFLAGS=3D"${BUILD_LDFLAGS} -lpng" mapc sols
+}
+
+do_install() {
+	install -d -m 755 ${D}${datadir}/neverball
+	cp -r ${B}/data ${D}${datadir}/neverball/
+}
+
+FILES:${PN}:append =3D " ${datadir}/neverball"
diff --git a/recipes-games/neverball/neverball.inc b/recipes-games/neverb=
all/neverball.inc
new file mode 100644
index 0000000..1ef2ec4
--- /dev/null
+++ b/recipes-games/neverball/neverball.inc
@@ -0,0 +1,26 @@
+SUMMARY =3D "Tilt the floor to roll a ball through an obstacle course be=
fore time runs out. Neverball is part puzzle game, part action game, and =
entirely a test of skill."
+SECTION =3D "graphics"
+HOMEPAGE =3D "https://neverball.org/"
+
+LICENSE =3D "GPLv2+"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D200ddba3b50e856bfb681a2b13=
dfb523"
+
+SRC_URI =3D "git://github.com/Neverball/neverball.git;protocol=3Dhttps"
+SRCREV =3D "bb6a99b14b1f81d071efd54cc0effdc517704b95"
+PV =3D "1.6.0+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE:append =3D " \
+	ENABLE_FETCH=3D0 \
+	ENABLE_OPENGLES=3D1 \
+	DATADIR=3D/usr/share/neverball/data \
+	LOCALEDIR=3D/usr/share/neverball/locale \
+	"
+
+do_configure:append() {
+	sed -i "s@sdl2-config@pkg-config sdl2@" ${S}/Makefile
+	sed -i "s@libpng-config@pkg-config libpng@" ${S}/Makefile
+}
diff --git a/recipes-games/neverball/neverball_git.bb b/recipes-games/nev=
erball/neverball_git.bb
new file mode 100644
index 0000000..18e02bd
--- /dev/null
+++ b/recipes-games/neverball/neverball_git.bb
@@ -0,0 +1,16 @@
+require neverball.inc
+
+DEPENDS:append =3D " gettext-native virtual/libgles1 virtual/libintl lib=
vorbis jpeg libpng libsdl2 libsdl2-ttf"
+
+do_compile() {
+	oe_runmake neverball neverputt locales desktops
+}
+
+do_install() {
+	install -d -m 755 ${D}${bindir}
+	install -m 755 ${B}/neverball ${D}/${bindir}/
+	install -m 755 ${B}/neverputt ${D}/${bindir}/
+
+	install -d -m 755 ${D}${datadir}/neverball
+	cp -r ${B}/locale ${D}${datadir}/neverball/
+}
--=20
2.33.0


