Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7437.1794562164823930796
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Rzm9Clj/;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id A1ECF10902
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZN-2DfB2Q0; Fri, 13 Nov 2026 10:27:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 11/16] grilo-plugins: upgrade 0.3.16 -> 0.3.18
Date: Fri, 13 Nov 2026 10:27:26 +0100
Message-ID: <20261113092732.3895896-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1794562061-32FFA82B-6884EF09/0/0 CLEAN NORMAL
X-TOI-MSGID: 6e3ee6b9-6969-4c87-9692-33010059845d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=C6Sa2Lwc0P0VdUaQC9EU/a9DZhKxNTAI5/PdkYec5q0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Rzm9Clj/V4H2qb7HtbquonlhmoUBvs3aNVFxzHZpGBPzwDPe8JBzVGnEwudWRSNX2
	 7fehLHcm/6zhZ+yCVmzy9OrRYD5aHxfB97sEuh3te0TjYjYc9ZO94F/pwo15ee3wkL
	 6+nBLDKTRw4r1mwTmnKitEdgCQMWPdJEbWMmv0J/EgzRMe59cFWANrOzsReHdOSF5V
	 WyZw2rgGZyDE0cSQe561nY/5j2UN5FVTuBRFizQAxMC3KAsDwggiqAlbxyewRzWx5W
	 0q5NS7T/Pg2Bk4iCjkA3ghe0AS5232CNRfzzRbI1ps3qeEEDM269fqiHKR52bD7G47
	 0n/tGnKqCEzVg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132242

Without tracker-testutils the tracker3 tests look for localsearch on
the build host now. Extend 0001-Avoid-running-trackertestutils.patch to
skip these tests too (Upstream-Status: Inappropriate [OE-Specific]).

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Avoid-running-trackertestutils.patch | 22 +++++++++++++++----
 ...gins_0.3.16.bb =3D> grilo-plugins_0.3.18.bb} |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/grilo/{grilo-plugins_0.3.16.bb =3D> gril=
o-plugins_0.3.18.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-runn=
ing-trackertestutils.patch b/meta-gnome/recipes-gnome/grilo/grilo-plugins=
/0001-Avoid-running-trackertestutils.patch
index 6e565e60d5..361d776217 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-tra=
ckertestutils.patch
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins/0001-Avoid-running-tra=
ckertestutils.patch
@@ -9,19 +9,22 @@ Content-Transfer-Encoding: 8bit
 It breaks configuration:
 | ../grilo-plugins-0.3.13/tests/tracker3/meson.build:5:0: ERROR: Program=
 '/usr/lib/tracker-3.0/trackertestutils/tracker-sandbox' not found
=20
+Without the testutils the tracker3 tests look for localsearch on the
+build host instead, so skip them altogether.
+
 Upstream-Status: Inappropriate [OE-Specific]
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
=20
 ---
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ meson.build       | 2 +-
+ tests/meson.build | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index fca5f98..3c1aa06 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -98,7 +98,7 @@ totem_plparser_dep =3D dependency('totem-plparser', ve=
rsion: '>=3D 3.4.1', required:
+@@ -99,7 +99,7 @@
  totem_plparser_mini_dep =3D dependency('totem-plparser-mini', version: =
'>=3D 3.4.1', required: false)
  tracker_sparql_dep =3D dependency('tracker-sparql-2.0', version: '>=3D =
2.3.0', required: false)
  tracker3_dep =3D dependency('tracker-sparql-3.0', required: false)
@@ -30,3 +33,14 @@ index fca5f98..3c1aa06 100644
 =20
  lua_pkg =3D [
    'lua',
+diff --git a/tests/meson.build b/tests/meson.build
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -39,6 +39,6 @@
+     subdir('local-metadata')
+ endif
+=20
+-if get_option('enable-tracker3') !=3D 'no' and tracker3_dep.found()
++if get_option('enable-tracker3') !=3D 'no' and tracker3_dep.found() and=
 tracker3_testutils_dep.found()
+     subdir('tracker3')
+ endif
diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb b/met=
a-gnome/recipes-gnome/grilo/grilo-plugins_0.3.18.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
rename to meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.18.bb
index a1d2262cae..cf25198d07 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.18.bb
@@ -13,7 +13,7 @@ DEPENDS =3D " \
 inherit gnomebase gnome-help vala
=20
 SRC_URI +=3D "file://0001-Avoid-running-trackertestutils.patch"
-SRC_URI[archive.sha256sum] =3D "fe6f4dbe586c6b8ba2406394e202f22d009d642a=
96eb3a54f32f6a21d084cdcb"
+SRC_URI[archive.sha256sum] =3D "8e3ce74ee717c3c322d0cb0f8df26bb0914028a5=
d016e28055ffb49cc9a46c5e"
=20
 # gnome-online-accounts requires opengl by default, so lua-factory PACKA=
GECONFIG relies on opengl by default.
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-in=
trospection-data', 'tracker', '', d)} \
--=20
2.56.0

