Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B94C10F04
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25685.1702074748045409891
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 955F9106F;
	Fri,  8 Dec 2023 14:33:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A24D43F6C4;
	Fri,  8 Dec 2023 14:32:26 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 01/10] Remove unused SRC_DISTRIBUTE_LICENSES
Date: Fri,  8 Dec 2023 22:32:15 +0000
Message-Id: <20231208223224.1348651-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107310

From: Ross Burton <ross.burton@arm.com>

This variable was removed in oe-core 8c9ef5, and didn't do what any of
these recipes seem to be using it for.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb           | 2 --
 meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb     | 2 +-
 meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb                     | 2 --
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta=
-gnome/recipes-support/keybinder/keybinder_3.0.bb
index 971ad90f9c..20d6b1b627 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -24,5 +24,3 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
 do_configure:prepend() {
 	touch ${S}/ChangeLog
 }
-
-SRC_DISTRIBUTE_LICENSES +=3D "X11"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216=
.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 3fc7f39e85..05ece8b748 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Unicode Mingti (printed) TrueType Font"
 HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/CJKUnifonts"
 LICENSE =3D "Arphic-Public-License"
 LIC_FILES_CHKSUM =3D "file://license/english/ARPHICPL.TXT;md5=3D4555ed88=
e9a72fc9562af379d07c3350"
-SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
+
 RPROVIDES:${PN} =3D "virtual-chinese-font"
 PR =3D "r6"
=20
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb =
b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 5a403f0775..c7229df1b1 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -6,7 +6,7 @@ SUMMARY:ttf-sazanami-mincho =3D "Sazanami Mincho Japanese=
 TrueType font"
 HOMEPAGE =3D "http://sourceforge.jp/projects/efont/"
 LICENSE =3D "PD"
 LIC_FILES_CHKSUM =3D "file://README;md5=3D97d739900be6e852830f55aa3c07d4=
a0"
-SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
+
 RPROVIDES:${PN} =3D "virtual-japanese-font"
 PR =3D "r9"
=20
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb b/meta-oe/recipe=
s-support/hdf5/hdf5_1.14.2.bb
index e716430673..b8a81bb0b7 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb
@@ -58,7 +58,5 @@ do_install:append() {
=20
 BBCLASSEXTEND =3D "native"
=20
-SRC_DISTRIBUTE_LICENSES +=3D "HDF5"
-
 # h5fuse.sh script needs bash
 RDEPENDS:${PN} +=3D "bash"
--=20
2.34.1


