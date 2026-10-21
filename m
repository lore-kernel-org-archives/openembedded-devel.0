Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8022.1792577262425116862
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=LbI/reSf;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 2DE4137E26
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEL-0cELaH0; Wed, 21 Oct 2026 12:07:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 14/26] glycin: upgrade 2.2.1 -> 2.2.3
Date: Wed, 21 Oct 2026 12:07:02 +0200
Message-ID: <20261021100717.11068-14-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577253-86FFA903-2E3443BE/0/0 CLEAN NORMAL
X-TOI-MSGID: d6383a5c-3df9-4bde-9e8b-07317088d68a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=rXznsvR0sGbvkcntwbXf+X39nSYGQ10J4cGPL+vA6cA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LbI/reSfwYH/k+dLsvagg+60BFE6D6BjORo64pBC9qowZ2tAhXylsNlb4uN2uPx3v
	 86OxAlkWtHN5E/JDpDyplTHX/933Z5+FnnOmmUCqdF1taaZJ0FxTdrOS08VajKk3i3
	 MKhm19ZLFdnkZxcMNdH64uqg9Pbz/x1SDENUxgfACDPeLbjyq7NUPbUPoMFG8kFa6k
	 oPrlBtGAGRXLU/+0L6XHBFNf0TO4aaBQO7Nd+kLGeOgvSI8iSTgAl14OM4WotOoAGg
	 n6UY/nR7nBUOF86MlvPVd5+bItfTOMdoe/DXCMNG+/IFYuodN0r/FsjKM06i56fdZl
	 dGCDDKl0roYlg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131248
Content-Type: text/plain; charset="utf-8"

The 2.2.x releases are tagged on the 2.2 branch, main has moved on to
the next series; fetch from the stable branch. The crates are
regenerated.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/glycin/glycin-crates.inc             | 4 ++--
 .../recipes-gnome/glycin/{glycin_2.2.1.bb =3D> glycin_2.2.3.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/glycin/{glycin_2.2.1.bb =3D> glycin_2.2.=
3.bb} (98%)

diff --git a/meta-gnome/recipes-gnome/glycin/glycin-crates.inc b/meta-gno=
me/recipes-gnome/glycin/glycin-crates.inc
index 4760801a3a..69395a7c78 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
+++ b/meta-gnome/recipes-gnome/glycin/glycin-crates.inc
@@ -117,7 +117,7 @@ SRC_URI +=3D " \
     crate://crates.io/gobject-sys/0.22.6 \
     crate://crates.io/gufo/0.5.0 \
     crate://crates.io/gufo-common/2.0.0 \
-    crate://crates.io/gufo-exif/0.5.0 \
+    crate://crates.io/gufo-exif/0.5.3 \
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
-SRC_URI[gufo-exif-0.5.0.sha256sum] =3D "e99100988e312c22c6f209663b289e72=
7db3918d06fbcbbc2315149457b42b75"
+SRC_URI[gufo-exif-0.5.3.sha256sum] =3D "4183c4b2bf6cfd58823cf02b2e8a4d95=
5da3605f8e1b98adbd3456a97e35ae16"
 SRC_URI[gufo-jpeg-0.5.1.sha256sum] =3D "383907a5c532bff484b2914d649e368e=
98ce6426829458353fe40070225b07a5"
 SRC_URI[gufo-png-0.5.0.sha256sum] =3D "e5c3065acab6cf458afbe53f73462a0db=
f17348a2af3c889183f8714b3bff6fc"
 SRC_URI[gufo-svg-0.5.0.sha256sum] =3D "c536908b63d5952fa5e8ebdfaff406b92=
bb8096d3cbbd402afd112340383ad93"
diff --git a/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb b/meta-gnome=
/recipes-gnome/glycin/glycin_2.2.3.bb
similarity index 98%
rename from meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
rename to meta-gnome/recipes-gnome/glycin/glycin_2.2.3.bb
index 50824468f3..c3a9601a51 100644
--- a/meta-gnome/recipes-gnome/glycin/glycin_2.2.1.bb
+++ b/meta-gnome/recipes-gnome/glycin/glycin_2.2.3.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE-MPL-2.0;md5=3Df75d=
2927d3c1ed2414ef72048f5ad640
=20
 inherit cargo_common cargo-update-recipe-crates meson pkgconfig gettext =
gobject-introspection
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3D${PV}"
-SRCREV =3D "6b7226d495755772bcd4bcfb5c8051a446e625ef"
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/glycin.git;protocol=3Dhttps;br=
anch=3D2.2;tag=3D${PV}"
+SRCREV =3D "90a013cf3cc89d419b9be88a5e57ee5ef275bfa1"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/glycin/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.56.0

