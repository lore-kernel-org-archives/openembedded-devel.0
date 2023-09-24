Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608EBCE7A8C
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 20:47:15 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.48008.1695588429466418532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 13:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id E79901DFB
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 22:47:06 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.4]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qkW0Q-1abPJB0; Sun, 24 Sep 2023 22:47:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libblockdev: Upgrade 2.28 -> 3.03
Date: Sun, 24 Sep 2023 22:47:10 +0200
Message-ID: <20230924204711.3073-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695588426-437F176E-E9148BFC/0/0 CLEAN NORMAL
X-TOI-MSGID: e94bb7ad-1f6f-47db-82ad-a0c66044847a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 20:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105111

- delete removed configure options
- add dependency on libnvme

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libblockdev_2.28.bb =3D> libblockdev_3.03.bb}  | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.28.bb =3D> li=
bblockdev_3.03.bb} (73%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb b/m=
eta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb
similarity index 73%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb
index 2e7412e82..670bebd37 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.03.bb
@@ -10,33 +10,28 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc07cb499d2=
59452f324bb90c3067d85c"
=20
 inherit autotools gobject-introspection pkgconfig lib_package
=20
-DEPENDS =3D "autoconf-archive-native glib-2.0 kmod udev"
+DEPENDS =3D "autoconf-archive-native glib-2.0 kmod udev libnvme"
=20
-SRC_URI =3D "git://github.com/storaged-project/libblockdev;branch=3D2.x-=
branch;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/storaged-project/libblockdev;branch=3Dmast=
er;protocol=3Dhttps \
 "
-SRCREV =3D "1412dc51c8f76bf8d9a6008228737db4a9a26d69"
+SRCREV =3D "38378931d285b91333ff2e2a391b1fe91072f9bb"
 S =3D "${WORKDIR}/git"
=20
-FILES:${PN} +=3D "${libdir}/python2.7/dist-packages ${libdir}/python3.*/=
site-packages"
+FILES:${PN} +=3D "${libdir}/python3.*/site-packages"
=20
-PACKAGECONFIG ??=3D "python3 lvm dm kmod parted fs escrow btrfs crypto m=
draid kbd mpath nvdimm tools"
+PACKAGECONFIG ??=3D "python3 lvm lvm-dbus dm parted fs escrow btrfs cryp=
to mdraid mpath nvdimm tools"
 PACKAGECONFIG[python3] =3D "--with-python3, --without-python3,,python3"
-PACKAGECONFIG[python2] =3D "--with-python2, --without-python2,,python"
 PACKAGECONFIG[lvm] =3D "--with-lvm, --without-lvm, multipath-tools, lvm2=
"
 PACKAGECONFIG[lvm-dbus] =3D "--with-lvm_dbus, --without-lvm_dbus, multip=
ath-tools, lvm2"
 PACKAGECONFIG[dm] =3D "--with-dm, --without-dm, multipath-tools, lvm2"
-PACKAGECONFIG[dmraid] =3D "--with-dmraid, --without-dmraid"
-PACKAGECONFIG[kmod] =3D "--with-kbd, --without-kbd,libbytesize"
 PACKAGECONFIG[parted] =3D "--with-part, --without-part, parted"
 PACKAGECONFIG[fs] =3D "--with-fs, --without-fs, util-linux"
 PACKAGECONFIG[doc] =3D "--with-gtk-doc, --without-gtk-doc, gtk-doc-nativ=
e"
 PACKAGECONFIG[nvdimm] =3D "--with-nvdimm, --without-nvdimm, ndctl util-l=
inux"
-PACKAGECONFIG[vdo] =3D "--with-vdo, --without-vdo,libbytesize"
 PACKAGECONFIG[escrow] =3D "--with-escrow, --without-escrow, nss volume-k=
ey"
 PACKAGECONFIG[btrfs] =3D "--with-btrfs,--without-btrfs,libbytesize btrfs=
-tools"
 PACKAGECONFIG[crypto] =3D "--with-crypto,--without-crypto,cryptsetup nss=
 volume-key"
 PACKAGECONFIG[mdraid] =3D "--with-mdraid,--without-mdraid,libbytesize"
-PACKAGECONFIG[kbd] =3D "--with-kbd,--without-kbd,libbytesize"
 PACKAGECONFIG[mpath] =3D "--with-mpath,--without-mpath, multipath-tools,=
 lvm2"
 PACKAGECONFIG[tools] =3D "--with-tools,--without-tools,libbytesize libde=
vmapper"
=20
--=20
2.42.0


