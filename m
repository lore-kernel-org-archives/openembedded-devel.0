Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7450.1794562164606287730
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=p0YLav2F;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id 8A8E9108F6
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZM-2DfB2N0; Fri, 13 Nov 2026 10:27:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 08/16] loupe: upgrade 51.0 -> 51.2
Date: Fri, 13 Nov 2026 10:27:23 +0100
Message-ID: <20261113092732.3895896-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-717F982B-2B4414A3/0/0 CLEAN NORMAL
X-TOI-MSGID: 529ee626-601e-4e0f-8c3a-3ecdc8ef4b94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=KcAHD/+ob6a/A15v7ZCkuhjfU7qhs9rtCsViPsc7Zd8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=p0YLav2FpmfnacYe/1+dxOYObooamUfwbK86IF4uYo6jv6HbjL6lZO4NPVIsCqZH5
	 743B8n/bXDQOD39Y6LwnH/ZInI+93Q5J4LIfvANuwHJzrz+Se4Rrhiymj3rSbIXUv8
	 n7VW3b4hgJXnBFe67gtAC9bpzKsd2JSFD2ecQYnt0Gmy7Id8ub1/qjqAfIcx/9I5Y1
	 CzN9BzroJ08hXOdAktW7FZ9XRU5Idhus0tcZtGvJgTFuYBY8lThmg7/d/AH1rBxMfQ
	 sI0wlXSl8pOB7usWMW3HZXK6N92vkCA7oMyzMy3uvOez3pkKu2APb9L0CWystu0M/B
	 6mr7wa6zBrPrw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132240
Content-Type: text/plain; charset="utf-8"

51.2 is on the gnome-51 branch. Regenerate loupe-crates.inc.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/loupe/loupe-crates.inc      | 24 +++++++++----------
 .../loupe/{loupe_51.0.bb =3D> loupe_51.2.bb}    |  4 ++--
 2 files changed, 14 insertions(+), 14 deletions(-)
 rename meta-gnome/recipes-gnome/loupe/{loupe_51.0.bb =3D> loupe_51.2.bb}=
 (96%)

diff --git a/meta-gnome/recipes-gnome/loupe/loupe-crates.inc b/meta-gnome=
/recipes-gnome/loupe/loupe-crates.inc
index 72a863efc2..59ebd5ea02 100644
--- a/meta-gnome/recipes-gnome/loupe/loupe-crates.inc
+++ b/meta-gnome/recipes-gnome/loupe/loupe-crates.inc
@@ -96,11 +96,11 @@ SRC_URI +=3D " \
     crate://crates.io/glib/0.22.8 \
     crate://crates.io/glib-macros/0.22.6 \
     crate://crates.io/glib-sys/0.22.8 \
-    crate://crates.io/glycin/4.0.0 \
-    crate://crates.io/glycin-builtin/4.0.0 \
+    crate://crates.io/glycin/4.0.5 \
+    crate://crates.io/glycin-builtin/4.0.5 \
     crate://crates.io/glycin-common/2.0.0 \
-    crate://crates.io/glycin-core/4.0.0 \
-    crate://crates.io/glycin-external/4.0.0 \
+    crate://crates.io/glycin-core/4.0.5 \
+    crate://crates.io/glycin-external/4.0.5 \
     crate://crates.io/glycin-image-rs/2.2.0 \
     crate://crates.io/glycin-utils/5.0.0 \
     crate://crates.io/gobject-sys/0.22.6 \
@@ -111,9 +111,9 @@ SRC_URI +=3D " \
     crate://crates.io/gtk4/0.11.4 \
     crate://crates.io/gtk4-macros/0.11.4 \
     crate://crates.io/gtk4-sys/0.11.4 \
-    crate://crates.io/gufo/0.5.0 \
+    crate://crates.io/gufo/0.5.4 \
     crate://crates.io/gufo-common/2.0.0 \
-    crate://crates.io/gufo-exif/0.5.0 \
+    crate://crates.io/gufo-exif/0.5.5 \
     crate://crates.io/gufo-jpeg/0.5.1 \
     crate://crates.io/gufo-png/0.5.0 \
     crate://crates.io/gufo-tiff/0.5.0 \
@@ -373,11 +373,11 @@ SRC_URI[gio-unix-sys-0.22.0.sha256sum] =3D "44bab97=
ce39112040216e268f074645f50b31c
 SRC_URI[glib-0.22.8.sha256sum] =3D "ddbcf514bd1881fc1b960e4e52b4e82873f4=
da3bceddbd58d42827b508888100"
 SRC_URI[glib-macros-0.22.6.sha256sum] =3D "506d23499707c7142898429757e8d=
9a3871d965239a2cb66dfa05052be6d6f19"
 SRC_URI[glib-sys-0.22.8.sha256sum] =3D "030967459f9f676851872c6304adea78=
25c6d462ec9b72554c733cf0c5952233"
-SRC_URI[glycin-4.0.0.sha256sum] =3D "dc9bb9cfa3d4db9eab0e2394f0e60fe4071=
fd31affd1704f2ecccc6bdd24c7b9"
-SRC_URI[glycin-builtin-4.0.0.sha256sum] =3D "b801b326426a0ccb61899174b0a=
08c2316defd323cfe78be9aa6232a2efdfeac"
+SRC_URI[glycin-4.0.5.sha256sum] =3D "7e5b54873fd0e4ea8fe447e4f2b8c670c48=
5862b5d9d0d624dcc886bb3a89ecd"
+SRC_URI[glycin-builtin-4.0.5.sha256sum] =3D "c47ae9011448c83bfa8841543c4=
1d3c3dd20759096a1b565e366fd39d54029f3"
 SRC_URI[glycin-common-2.0.0.sha256sum] =3D "f34692fa7314e5108eafaba76214=
60d958caba839a6d5040f1caba98d7b4a692"
-SRC_URI[glycin-core-4.0.0.sha256sum] =3D "9466e4f18a53312faee414ea85813d=
6674d4cb5badad059365c4882984b40201"
-SRC_URI[glycin-external-4.0.0.sha256sum] =3D "a7d335778b14437e1339d703af=
d1ce69e61df8ab5420882b4b7821b9a2ca9d4a"
+SRC_URI[glycin-core-4.0.5.sha256sum] =3D "fdade20eb67ac75b5c306a99c59415=
5e1096ea7aa536741f64158afa1ffdeb36"
+SRC_URI[glycin-external-4.0.5.sha256sum] =3D "2c9b985c8fe1d1c2cdc91566fa=
a52f5d3226506201a4121580ae8cfcb71992e5"
 SRC_URI[glycin-image-rs-2.2.0.sha256sum] =3D "3df0cbc11fe5d5523575b04f72=
4c82d8d50e2c03830622b655e7d4015eba6472"
 SRC_URI[glycin-utils-5.0.0.sha256sum] =3D "68b112ddb84bd9c1453b119292e38=
788aa18015d5c12158c1d6fab1b9e353ee7"
 SRC_URI[gobject-sys-0.22.6.sha256sum] =3D "22a861859b887a79cf461359c192c=
97a57d8fb0229dd291232e57aa11f6fa72c"
@@ -388,9 +388,9 @@ SRC_URI[gsk4-sys-0.11.4.sha256sum] =3D "5b7c7eb2e681e=
e896646cfb8872b431f24d09f53ba
 SRC_URI[gtk4-0.11.4.sha256sum] =3D "98a0a0466484f64b07b5b8184d43fa46be78=
eb0b8e04ae4e179af31d770b76d9"
 SRC_URI[gtk4-macros-0.11.4.sha256sum] =3D "5ac7179400a36a04de039c24206bb=
841c5596992b907b43b23ee8d5bdc40d00e"
 SRC_URI[gtk4-sys-0.11.4.sha256sum] =3D "82b8f954786af0b1984425c4446b77f5=
ff6594346181316be3f850caab1c6f01"
-SRC_URI[gufo-0.5.0.sha256sum] =3D "6a16d7faeeb03e2925ac6b0f40630b15b1992=
d08c50add402f35fde495e44f64"
+SRC_URI[gufo-0.5.4.sha256sum] =3D "ce5dedcdb354f15280779ccfe04957c81bb15=
a0026b3d394dac9488689dad010"
 SRC_URI[gufo-common-2.0.0.sha256sum] =3D "d583cdde9eb6985dbb6e596d27677e=
5d353d5eee44763cbf7c7ead3147d337bf"
-SRC_URI[gufo-exif-0.5.0.sha256sum] =3D "e99100988e312c22c6f209663b289e72=
7db3918d06fbcbbc2315149457b42b75"
+SRC_URI[gufo-exif-0.5.5.sha256sum] =3D "b7a91a52ac6ea8d25e0752b1f3552d7a=
8252dcdf0b0b8154d1118d5e2582129c"
 SRC_URI[gufo-jpeg-0.5.1.sha256sum] =3D "383907a5c532bff484b2914d649e368e=
98ce6426829458353fe40070225b07a5"
 SRC_URI[gufo-png-0.5.0.sha256sum] =3D "e5c3065acab6cf458afbe53f73462a0db=
f17348a2af3c889183f8714b3bff6fc"
 SRC_URI[gufo-tiff-0.5.0.sha256sum] =3D "e9c77c38e7815b76e08b1943dc67517e=
02543504c14a29e071a4ddf9bee111ec"
diff --git a/meta-gnome/recipes-gnome/loupe/loupe_51.0.bb b/meta-gnome/re=
cipes-gnome/loupe/loupe_51.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/loupe/loupe_51.0.bb
rename to meta-gnome/recipes-gnome/loupe/loupe_51.2.bb
index 7a7b913573..bd13915a54 100644
--- a/meta-gnome/recipes-gnome/loupe/loupe_51.0.bb
+++ b/meta-gnome/recipes-gnome/loupe/loupe_51.2.bb
@@ -14,10 +14,10 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 GTKIC_VERSION =3D "4"
=20
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/loupe.git;protocol=3Dhttps;bra=
nch=3Dmain;tag=3D${PV} \
+SRC_URI =3D "git://gitlab.gnome.org/GNOME/loupe.git;protocol=3Dhttps;bra=
nch=3Dgnome-51;tag=3D${PV} \
            file://0001-meson-Support-cross-compilation-via-a-rust_target=
-cr.patch \
            "
-SRCREV =3D "0ae0d797d11e18a045b2d383e47a097181b4062b"
+SRCREV =3D "ffce31a2d89fae1c0cd9bc68ff04c53ccd51a5cf"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/loupe/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.56.0

