Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB79C19778
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:09:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15838.1740506965237794132
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 322601BCB
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9325E3F6A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 10:09:24 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/7] tigervnc: fix systemd unit packaging
Date: Tue, 25 Feb 2025 18:09:11 +0000
Message-ID: <20250225180917.3232793-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225180917.3232793-1-ross.burton@arm.com>
References: <20250225180917.3232793-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 18:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115592

Pass the correct path so the unit is installed where it should be, and
use the systemd class to ensure the unit is enabled correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb b/meta-=
oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
index 4d2bb1f063..6e4d4a7b0c 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.TXT;md5=3D75b02c2872=
421380bbd47781d2bd75d3"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools cmake features_check pkgconfig
+inherit autotools cmake features_check pkgconfig systemd
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 pam"
=20
@@ -79,7 +79,7 @@ EXTRA_OECONF =3D "--disable-xorg --disable-xnest --disa=
ble-xvfb --disable-dmx \
         --disable-xwayland \
 "
=20
-EXTRA_OECMAKE +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
-DCMAKE_INSTALL_UNITDIR=3D${systemd_unitdir}', '-DINSTALL_SYSTEMD_UNITS=3D=
OFF', d)}"
+EXTRA_OECMAKE +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
-DCMAKE_INSTALL_UNITDIR=3D${systemd_system_unitdir}', '-DINSTALL_SYSTEMD_=
UNITS=3DOFF', d)}"
=20
 do_configure:append () {
     olddir=3D`pwd`
@@ -124,7 +124,8 @@ FILES:${PN} +=3D " \
     ${libdir}/xorg/modules/extensions \
     ${datadir}/icons \
     ${datadir}/metainfo \
-    ${systemd_unitdir} \
 "
=20
 FILES:${PN}-dbg +=3D "${libdir}/xorg/modules/extensions/.debug"
+
+SYSTEMD_SERVICE:${PN} =3D "vncserver@.service"
--=20
2.43.0


