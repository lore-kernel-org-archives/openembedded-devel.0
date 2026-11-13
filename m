Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7440.1794562110246004670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=gLFvaMNm;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id 87B434BFC
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZM-2DfB2M0; Fri, 13 Nov 2026 10:27:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 07/16] glycin: upgrade 2.2.3 -> 2.2.6
Date: Fri, 13 Nov 2026 10:27:22 +0100
Message-ID: <20261113092732.3895896-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-127FB82B-97868123/0/0 CLEAN NORMAL
X-TOI-MSGID: 6470865e-dd59-40c9-871b-247cc32079e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=dp/8sseNoXKwbKuEZANdnKdZ/Q+7mWEJWREyCRsIk60=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gLFvaMNmRm4pciYTMyrtFmN+VNIZRskQF47+DbOedyoqilI7H0GmulZqrvmIfQJK+
	 mkNSw0pJ7V2dQbUWFj7v6Ku9pdE18g9+qTUe/8UAPrtt5axflLR3u1iQv89FygZFG7
	 RyKBZCAmvUA1NQfFVCcc2CeMNBtGM1GcWCjb24I5IHwZDHPAxFx/0FkOKGNAvmU7Cc
	 2PDOfg3RoWaJ3GZs5vXqjFxjNn11/UPGqmZPN0VDs+bNQHjmngl51bMaeK4iXBWfeI
	 wR46mXaBYu/dxYeNM+SpVURD3Lm2J80EYLXNc9jDegiP/v+itdLYKAWxvURyC97Jdu
	 vC0kPpucrb+KA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132237
Content-Type: text/plain; charset="utf-8"

Regenerate glycin-crates.inc.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/glycin/glycin-crates.inc             | 4 ++--
 .../recipes-gnome/glycin/{glycin_2.2.3.bb =3D> glycin_2.2.6.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/glycin/{glycin_2.2.3.bb =3D> glycin_2.2.=
6.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/glycin/glycin-crates.inc b/meta-gno=
me/recipes-gnome/glycin/glycin-crates.inc
index 69395a7c78..5e74268252 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
+++ b/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
@@ -117,7 +117,7 @@ SRC_URI +=3D " \
     crate://crates.io/gobject-sys/0.22.6 \
     crate://crates.io/gufo/0.5.0 \
     crate://crates.io/gufo-common/2.0.0 \
-    crate://crates.io/gufo-exif/0.5.3 \
+    crate://crates.io/gufo-exif/0.5.5 \
     crate://crates.io/gufo-jpeg/0.5.1 \
     crate://crates.io/gufo-png/0.5.0 \
     crate://crates.io/gufo-svg/0.5.0 \
@@ -437,7 +437,7 @@ SRC_URI[glib-sys-0.22.8.sha256sum] =3D "030967459f9f6=
76851872c6304adea7825c6d462ec
 SRC_URI[gobject-sys-0.22.6.sha256sum] =3D "22a861859b887a79cf461359c192c=
97a57d8fb0229dd291232e57aa11f6fa72c"
 SRC_URI[gufo-0.5.0.sha256sum] =3D "6a16d7faeeb03e2925ac6b0f40630b15b1992=
d08c50add402f35fde495e44f64"
 SRC_URI[gufo-common-2.0.0.sha256sum] =3D "d583cdde9eb6985dbb6e596d27677e=
5d353d5eee44763cbf7c7ead3147d337bf"
-SRC_URI[gufo-exif-0.5.3.sha256sum] =3D "4183c4b2bf6cfd58823cf02b2e8a4d95=
5da3605f8e1b98adbd3456a97e35ae16"
+SRC_URI[gufo-exif-0.5.5.sha256sum] =3D "b7a91a52ac6ea8d25e0752b1f3552d7a=
8252dcdf0b0b8154d1118d5e2582129c"
 SRC_URI[gufo-jpeg-0.5.1.sha256sum] =3D "383907a5c532bff484b2914d649e368e=
98ce6426829458353fe40070225b07a5"
 SRC_URI[gufo-png-0.5.0.sha256sum] =3D "e5c3065acab6cf458afbe53f73462a0db=
f17348a2af3c889183f8714b3bff6fc"
 SRC_URI[gufo-svg-0.5.0.sha256sum] =3D "c536908b63d5952fa5e8ebdfaff406b92=
bb8096d3cbbd402afd112340383ad93"
diff --git a/meta-gnome/recipes-gnome/glycin/glycin_2.2.3.bb b/meta-gnome=
/recipes-gnome/glycin/glycin_2.2.6.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/glycin/glycin_2.2.3.bb
rename to meta-gnome/recipes-gnome/glycin/glycin_2.2.6.bb
index c3a9601a51..e59ed829c4 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin_2.2.3.bb
+++ b/meta-gnome/recipes-gnome/glycin/glycin_2.2.6.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-MPL-2.0;md5=3Df75d=
2927d3c1ed2414ef72048f5ad640
 inherit cargo_common cargo-update-recipe-crates meson pkgconfig gettext =
gobject-introspection
=20
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;br=
anch=3D2.2;tag=3D${PV}"
-SRCREV =3D "90a013cf3cc89d419b9be88a5e57ee5ef275bfa1"
+SRCREV =3D "99d38215dc3034360f66efb14f1bba881bd7b6f1"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/glycin/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.56.0

