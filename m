Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B6CCD4F35
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:52:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4717.1778669537542043269
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 03:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Qd2Hco8N;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2DEA1655
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9895F3F7B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778669537; bh=ejn70m1chFxAjQHjq1Zqxgt8htVHxP1oYHLI5O7++fM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qd2Hco8NdL0WZVVXh7vYa7xoPuRkh/IJMWOg+EK/HomxWQQnGPsSIq3Xngvh3fR5I
	 0FVWMGwfkZlTsa5BD6RdHpM+cWroJp8cfvmUCkdZbxMQuyH0SkGD+kTLaD2EYKelVU
	 pbFLF406Us7rFEC2XIj68t/Edr9/GtcKVbKMTj6I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 4/7] gnome-calendar: remove obsolete dependencies, clean up recipe
Date: Wed, 13 May 2026 11:52:07 +0100
Message-ID: <20260513105210.2109216-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513105210.2109216-1-ross.burton@arm.com>
References: <20260513105210.2109216-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 10:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126968

Remove obsolete libdazzle and geocode-glib dependencies, these have been
removed upstream.

Change the DISTRO_FEATURES check so that opengl is required and any of
the GTK3DISTROFEATURES (x11 wayland) are present, as GTK 4 needs opengl
and supports either x11 or wayland.

Drop the sed on the generated enums, the generated files have relative
paths in now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gnome-calendar/gnome-calendar_48.0.bb             | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.bb
index 44bde3774d..3c282ab1f9 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.bb
@@ -10,28 +10,21 @@ DEPENDS =3D " \
     gsettings-desktop-schemas \
     evolution-data-server \
     libsoup \
-    libdazzle \
     libadwaita \
     libgweather4 \
     geoclue \
-    geocode-glib \
 "
=20
 GTKIC_VERSION =3D '4'
 inherit gnomebase gsettings gtk-icon-cache gettext features_check upstre=
am-version-is-even mime-xdg
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI[archive.sha256sum] =3D "e69a5a66be820105a4d823d4dba9b4e6ef9f6e75=
23978aaf33361ebbb993e604"
=20
-do_install:prepend() {
-    sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum=
-types.h
-    sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum=
-types.c
-}
-
 FILES:${PN} +=3D " \
     ${datadir}/gnome-shell \
     ${datadir}/metainfo \
     ${datadir}/dbus-1 \
 "
-
--=20
2.43.0


