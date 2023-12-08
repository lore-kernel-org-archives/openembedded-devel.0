Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A165DC10F14
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25288.1702074750827988782
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 027F7106F;
	Fri,  8 Dec 2023 14:33:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0865E3F6C4;
	Fri,  8 Dec 2023 14:32:29 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 06/10] keybinder: use autotools-brokensep instead of setting B
Date: Fri,  8 Dec 2023 22:32:20 +0000
Message-Id: <20231208223224.1348651-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107315

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta=
-gnome/recipes-support/keybinder/keybinder_3.0.bb
index 20d6b1b627..444a545d41 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -9,7 +9,6 @@ DEPENDS =3D "gtk+3 gobject-introspection-native \
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1f18f9c6d8b4cfcc7d7804a243a4c=
0b4"
=20
 S =3D "${WORKDIR}/git"
-B =3D "${S}"
=20
 SRCREV =3D "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
 PV =3D "3.0+git${SRCPV}"
@@ -18,7 +17,7 @@ SRC_URI =3D "git://github.com/engla/keybinder.git;branc=
h=3Dkeybinder-3.0;protocol=3Dht
=20
 RDEPENDS:${PN} =3D "gtk+"
=20
-inherit features_check autotools gtk-doc gobject-introspection
+inherit features_check autotools-brokensep gtk-doc gobject-introspection
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
 do_configure:prepend() {
--=20
2.34.1


