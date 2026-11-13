Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7439.1794562109976097312
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=fCiWHRGt;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id 6C5704BFA
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZL-2DfB2H0; Fri, 13 Nov 2026 10:27:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/16] libgedit-gfls: upgrade 0.4.2 -> 0.5.0
Date: Fri, 13 Nov 2026 10:27:17 +0100
Message-ID: <20261113092732.3895896-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-F2FFA82B-6E3D4813/0/0 CLEAN NORMAL
X-TOI-MSGID: 8733fe83-0fd8-4893-ba75-12e410d56d52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=7qz26TuP0p3g8wd+vQbsxi1Lmh8+X1MKMWLWfyORXvk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fCiWHRGtae43F27KueYMxvHL7dh6XynxbcVZcYSkOX7BhV8D61QFt+aqf7CWJxoci
	 wm9GRgVTaSh7mcfSLrZIiKfeSd4CA7kuHaxeHQ0wDt31i3kABXnFuAY7hBVzr/xYMw
	 x5COsMMlkDZ2Dwn71nKf4HlKY58bRo08meFTy3fpPogjKmYWCc+kb8JQ9o0GvfPgs1
	 PhPS4PP7kUyx6uUUFY4engWPdZAHHf3famR24cJMIaJZtQZdIJ1xpOjbRzj9UH6Gfu
	 LpmVNs4yA1muEwWznVHbUK7oVdxGoh8k2GWa/2frcWLNH/HPAeBP75VNL2/iy/E/k3
	 ew7OGx0emYaZQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132233
Content-Type: text/plain; charset="utf-8"

The default branch is main now.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gedit/{libgedit-gfls_0.4.2.bb =3D> libgedit-gfls_0.5.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gfls_0.4.2.bb =3D> libge=
dit-gfls_0.5.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.2.bb b/meta=
-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.2.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.0.bb
index 2e06b9e796..2b00f595cd 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.5.0.bb
@@ -7,8 +7,8 @@ DEPENDS =3D "glib-2.0 gtk+3"
=20
 inherit gobject-introspection features_check gtk-doc gnomebase
=20
-SRC_URI =3D "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=
=3Dlibgedit-gfls-0-4;protocol=3Dhttps;tag=3D${PV}"
-SRCREV =3D "3e83903b8211b7b392758e548e2d33ab162a32c5"
+SRC_URI =3D "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=
=3Dmain;protocol=3Dhttps;tag=3D${PV}"
+SRCREV =3D "8ff9380b1796aa141c07f335ac10a405f39f988f"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.56.0

