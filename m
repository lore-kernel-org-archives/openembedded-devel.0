Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A510CC433EF
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 04:50:10 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.15585.1643518209547520204
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 20:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182,
 mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2CB7520B6C61;
	Sat, 29 Jan 2022 20:50:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2CB7520B6C61
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] remmina: Upgrade to 1.4.23
Date: Sat, 29 Jan 2022 21:49:58 -0700
Message-Id: <20220130044958.3710884-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jan 2022 04:50:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95175

- Disable support for ayatana-appindicator

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../remmina/{remmina_1.4.18.bb =3D> remmina_1.4.23.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.18.bb =3D> remmina_1=
.4.23.bb} (92%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.18.bb b/meta-oe/=
recipes-support/remmina/remmina_1.4.23.bb
similarity index 92%
rename from meta-oe/recipes-support/remmina/remmina_1.4.18.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.23.bb
index 996d8540f..9346da5b2 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.18.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.23.bb
@@ -25,14 +25,14 @@ DEPENDS =3D " \
 DEPENDS:append:libc-musl =3D " libexecinfo"
 LDFLAGS:append:libc-musl =3D " -lexecinfo"
=20
-SRCREV =3D "045862cc7d7dd986b349c68131df2f86b9b1cd9c"
+SRCREV =3D "b518b9d1f192375b08bbcdb0e77f3d98925de2f9"
 SRC_URI =3D "git://gitlab.com/Remmina/Remmina;protocol=3Dhttps;branch=3D=
master"
 S =3D "${WORKDIR}/git"
=20
 inherit cmake features_check mime mime-xdg gtk-icon-cache pkgconfig
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
-EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWIT=
H_TRANSLATIONS=3DOFF"
+EXTRA_OECMAKE +=3D "-DWITH_APPINDICATOR=3DOFF -DWITH_GETTEXT=3DOFF -DWIT=
H_TRANSLATIONS=3DOFF -DHAVE_LIBAPPINDICATOR=3DOFF"
=20
 PACKAGECONFIG[spice] =3D "-DWITH_SPICE=3DON, -DWITH_SPICE=3DOFF, spice s=
pice-protocol"
 # Switch on gtk support in avahi recipe if you want to enable avahi supp=
ort
--=20
2.25.1


