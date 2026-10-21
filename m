Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8053.1792577264796629643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WQ81+16x;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 3E70DE3FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEL-0cELaL0; Wed, 21 Oct 2026 12:07:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 18/26] gnome-flashback: upgrade 3.46.0 -> 3.58.0
Date: Wed, 21 Oct 2026 12:07:06 +0200
Message-ID: <20261021100717.11068-18-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577253-ABFFC903-6F40B4B0/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e2034c4-4f3b-4fe4-a3ef-6b9ac34115b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=uDxUXSGYGiK3mDfoMRnSJqJj/nWlM6uhSPvGmRgo1r8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WQ81+16xHRLE+zOLWgQZPBbZ8BvS81QdAFm5Xl6AZ/jVd+olIrKn3kJyfQ69lKJK4
	 8hWrQS4ncvSCM6sYS/VKkQBcFkUrTW7Ax2pLj3J3HgxJhEyiku0fqaBwXZCLYna6vM
	 1fdDUdkhZTwqQT4Qd0WwwEgF2cGzgDqD0DtvHdEmfqqqEFi4UsCL0Uj86XV06XDAb9
	 jCsis9LwQGazozzwcs+kK4c2twHhLGsUYWURLrcj/Z2gKp3eOKoW34BG4DXrHw5dRw
	 Tf9T0DGag1qJWKd6T3aZKZvlQAwAr/KVXugwyctvk54aXkjR6wKSFrg0+4lZ+tcq7d
	 YHDQOZhOa3SHg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131252
Content-Type: text/plain; charset="utf-8"

Drop ibus.patch, a backport that is part of the release.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-flashback/files/ibus.patch          | 27 -------------------
 ...ck_3.46.0.bb =3D> gnome-flashback_3.58.0.bb} |  4 +--
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-flashback/files/ibus.p=
atch
 rename meta-gnome/recipes-gnome/gnome-flashback/{gnome-flashback_3.46.0.=
bb =3D> gnome-flashback_3.58.0.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gnome-flashback/files/ibus.patch b/=
meta-gnome/recipes-gnome/gnome-flashback/files/ibus.patch
deleted file mode 100644
index cd7f052ea5..0000000000
--- a/meta-gnome/recipes-gnome/gnome-flashback/files/ibus.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1bb758374500e247ffab150205d05b72bf21b561 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Alberts=3D20Muktup=3DC4=3D81vels?=3D <alberts.muktupav=
els@gmail.com>
-Date: Thu, 23 Jan 2025 14:22:33 +0200
-Subject: [PATCH] input-sources: use correct function to get attribute ty=
pe
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- gnome-flashback/libinput-sources/gf-candidate-popup.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gnome-flashback/libinput-sources/gf-candidate-popup.c b/gno=
me-flashback/libinput-sources/gf-candidate-popup.c
-index a8bf5825..2c31e71a 100644
---- a/gnome-flashback/libinput-sources/gf-candidate-popup.c
-+++ b/gnome-flashback/libinput-sources/gf-candidate-popup.c
-@@ -121,7 +121,7 @@ update_preedit_text_cb (IBusPanelService *service,
-       guint start;
-       guint end;
-=20
--      if (ibus_attribute_get_type (attribute) !=3D IBUS_ATTR_TYPE_BACKG=
ROUND)
-+      if (ibus_attribute_get_attr_type (attribute) !=3D IBUS_ATTR_TYPE_=
BACKGROUND)
-         continue;
-=20
-       start =3D ibus_attribute_get_start_index (attribute);
---=20
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.4=
6.0.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.58.0.=
bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46=
.0.bb
rename to meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.58.0=
.bb
index f297394d00..eb1fb3bd23 100644
--- a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.58.0.bb
@@ -19,9 +19,7 @@ DEPENDS +=3D " \
     gnome-panel \
 "
=20
-SRC_URI +=3D "file://ibus.patch"
-
-SRC_URI[archive.sha256sum] =3D "7a8d5c03310e4dfadd18a65e00a37741032afeea=
5418dd6804a975c4b0980045"
+SRC_URI[archive.sha256sum] =3D "aaa23e7042477e741f24279b468b9d20af4ec195=
ee43b3d312cdaaf84d98c321"
=20
 do_install:append() {
     # no oe-layer has compiz -> remove dead session
--=20
2.56.0

