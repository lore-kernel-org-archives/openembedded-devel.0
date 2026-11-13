Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7430.1794562074070280176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Q5X1B9bE;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout05.t-online.de (Postfix) with SMTP id 783191201
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZM-2DfB2I0; Fri, 13 Nov 2026 10:27:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/16] libgedit-gtksourceview: upgrade 299.6.0 -> 299.8.0
Date: Fri, 13 Nov 2026 10:27:18 +0100
Message-ID: <20261113092732.3895896-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-52FFA82B-168642A1/0/0 CLEAN NORMAL
X-TOI-MSGID: 781bd141-4cf5-4602-93c2-f7a6e7c56a1f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=Li+2pTDap/BIlTtL+tOGHHgKQtjnGmzrhzj5xWsAJBw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Q5X1B9bEOizKFf8C8Hvs8MqDHf3lEK926wLW8ewHpQDpC4XE5KOFE+8xFOdbrpgI7
	 esGqejE2FmLFgj9EW9aDDq2Y2UW39Xcs9Bzz5t/Qzpx8DMz5c5WxcQWnH7aipDL2As
	 L82F8Waw/kQvpGEYupkkJkNeN/ciCpv6YOL6bIpEnWhdbAylGSvivGpG9mef4f3JS8
	 9cQ44uC98acXfugUFr0OcLFQwOKBHGwOSMxtydD9O8bztLV/5rqw3U5tJn/AZd4YM6
	 J49XgkOsyp1o/bdfNBDBGYeJZfwgSsyHbFS5IBw7eC89Gtc1u+7PALAJjoIlMmfYIT
	 ykJ5DfvcWNHjA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132232
Content-Type: text/plain; charset="utf-8"

It depends on libgedit-gfls and libgedit-amtk now.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ourceview_299.6.0.bb =3D> libgedit-gtksourceview_299.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gtksourceview_299.6.0.bb=
 =3D> libgedit-gtksourceview_299.8.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.=
0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.8.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0=
.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.8.0.b=
b
index 4939f673bb..a609d588fc 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.8.0.bb
@@ -3,12 +3,12 @@ SECTION =3D "gnome"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-2.1-or-later.txt;md5=3D310c7c=
93cf5181c6b0cc8229a1f3c6f6"
=20
-DEPENDS =3D "glib-2.0 gtk+3 libxml2"
+DEPENDS =3D "glib-2.0 gtk+3 libgedit-amtk libgedit-gfls libxml2"
=20
 inherit gobject-introspection features_check gtk-doc gnomebase
=20
 SRC_URI =3D "git://gitlab.gnome.org/World/gedit/libgedit-gtksourceview.g=
it;protocol=3Dhttps;branch=3Dmain;tag=3D${PV}"
-SRCREV =3D "a7bdc39f9fbc10c49ea7468ac1e5bf77385da0c0"
+SRCREV =3D "80d2f107f915576f43a019abe26f13a9db21703c"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.56.0

