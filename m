Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B926C19777
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:09:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15898.1740506966644760568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A0728C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:42 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D48463F6A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:25 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/7] tigervnc: small cleanups
Date: Tue, 25 Feb 2025 18:09:13 +0000
Message-ID: <20250225180917.3232793-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225180917.3232793-1-ross.burton@arm.com>
References: <20250225180917.3232793-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 18:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115594

Add some implicit dependencies which are explicitly checked for, a small
comment, and remove an obsolete FILES:PN-dbg.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb b/meta-=
oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
index ab9edd9ee0..ca737e48ba 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "TigerVNC remote display system"
 HOMEPAGE =3D "http://www.tigervnc.com/"
 LICENSE =3D "GPL-2.0-or-later"
 SECTION =3D "x11/utils"
-DEPENDS =3D "xserver-xorg gnutls jpeg libxtst gettext-native fltk libpam=
"
+DEPENDS =3D "gettext-native xserver-xorg gnutls nettle jpeg pixman libxt=
st fltk libpam libx11 libxdamage libxfixes libxrandr"
 RDEPENDS:${PN} =3D "coreutils hicolor-icon-theme perl bash xkbcomp"
=20
 LIC_FILES_CHKSUM =3D "file://LICENCE.TXT;md5=3D75b02c2872421380bbd47781d=
2bd75d3"
@@ -13,6 +13,8 @@ inherit autotools cmake features_check pkgconfig system=
d
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 pam"
=20
+# For ease we do in-tree builds right now. It should be possible to do
+# out-of-tree builds.
 B =3D "${S}"
=20
 SRCREV =3D "1b4af5c586eb7a30a38c82fd088c1fa47a83e72f"
@@ -83,6 +85,4 @@ FILES:${PN} +=3D " \
     ${datadir}/metainfo \
 "
=20
-FILES:${PN}-dbg +=3D "${libdir}/xorg/modules/extensions/.debug"
-
 SYSTEMD_SERVICE:${PN} =3D "vncserver@.service"
--=20
2.43.0


