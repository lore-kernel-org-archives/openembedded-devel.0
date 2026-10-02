Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF45CA5FE6
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 20:40:50 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3915.1790973645194838269
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 13:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=M/bguQpN;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 61BDEC2F
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Oct 2026 22:40:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.227.105]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xCk3b-2JxvX60; Fri, 2 Oct 2026 22:40:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/5] gnome-keyring: upgrade 51.0 -> 51.1
Date: Fri,  2 Oct 2026 22:40:17 +0200
Message-ID: <20261002204022.70439-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790973639-FFFFC9F1-43A83E43/0/0 CLEAN NORMAL
X-TOI-MSGID: 069f7683-5436-45ec-a831-3aecb20d2635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790973642; i=f_l_k@t-online.de;
	bh=24x1zQZgD6s+wKjRILke8S/zi7KB3M3OWzEtxwFzFZM=;
	h=From:To:Subject:Date;
	b=M/bguQpNWo8TTj1hu8JmcDERx1sHKBoQGRNANKEnQ+CdyM8VrQjgZs2cL9eAQGVkX
	 8EoYX1WHH7FVuf/m7FVg8tWDfbPyvFGksVtvPLqcTIt42g5PFooT78E9XhHS3mibXB
	 ovhqlgoh/AEu+pBlmmWkqsNo/xXRBTVvJKoDiz8j8ZkrkYxZso9QQVt2H6JkdgdZNn
	 xBDYjhpC+HOuLrJCaKOAel2T7K5v2VAMYD/2qo9qgilDkYf70u+6qcfsVSns3hqvY+
	 f9I0HWCAN5xCPLOVskj1/f/TWb2kJipkNadG7m1rDTbmdDvft3awG46qxxZ4+BgejI
	 8O4BpimcB87DA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 20:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130611

0004-gkd-secret-session-drop-the-duplicate-session-unref.patch is
removed, the fix is included upstream (!114).

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ion-drop-the-duplicate-session-unref.patch | 58 -------------------
 ...-keyring_51.0.bb =3D> gnome-keyring_51.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/=
0004-gkd-secret-session-drop-the-duplicate-session-unref.patch
 rename meta-gnome/recipes-gnome/gnome-keyring/{gnome-keyring_51.0.bb =3D=
> gnome-keyring_51.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0004-gk=
d-secret-session-drop-the-duplicate-session-unref.patch b/meta-gnome/reci=
pes-gnome/gnome-keyring/gnome-keyring/0004-gkd-secret-session-drop-the-du=
plicate-session-unref.patch
deleted file mode 100644
index 707a8b1a1c..0000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/0004-gkd-secre=
t-session-drop-the-duplicate-session-unref.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 011d89df54d0f441d17c449513ae0ef8aa21c4cd Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 15 Sep 2026 19:22:41 +0200
-Subject: [PATCH] gkd-secret-session: drop the duplicate session unref
-
-gkd_secret_session_get_item_secret() unrefs the session returned by
-gck_object_get_session() twice: once right after
-gck_session_wrap_key_full(), and once more below with a comment claiming
-the reference would otherwise leak. gck_object_get_session() hands out a
-single new reference, so the second unref drops one reference too many
-on every GetSecret call.
-
-The GckSession is freed while client->pkcs11_session and the GckObject
-of the session key still point at it. The daemon dies when the client
-leaves the bus and its dispatch table is torn down:
-
-    service_name_owner_changed         daemon/dbus/gkd-secret-service.c:=
944
-    free_client                        daemon/dbus/gkd-secret-service.c:=
264
-    dispose_and_unref                  daemon/dbus/gkd-secret-service.c:=
245
-    gkd_secret_session_dispose         daemon/dbus/gkd-secret-session.c:=
357
-    gck_object_finalize                gck/gck-object.c:135
-    g_object_unref                     -> SIGSEGV, rax =3D 0xaaaaaaaaaaa=
aaaaa
-
-Reproduced on a running system with a single "secret-tool lookup",
-symbolized against /usr/src/debug. The older crashes reported as
-"segfault at f00dface in libgck-1.so" are the same use after free caught
-at an earlier point.
-
-gkd-secret-lock.c:49 and gkd-secret-unlock.c:726 do it correctly, with
-exactly one unref per gck_object_get_session().
-
-Upstream-Status: Pending
-
-Still present in gnome-keyring main as of 2026-09-15.
-
-AI-Generated: Uses Claude Code (Claude Opus 5)
----
- daemon/dbus/gkd-secret-session.c | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/daemon/dbus/gkd-secret-session.c b/daemon/dbus/gkd-secret-s=
ession.c
-index 16bb368..6799b4c 100644
---- a/daemon/dbus/gkd-secret-session.c
-+++ b/daemon/dbus/gkd-secret-session.c
-@@ -609,13 +609,6 @@ gkd_secret_session_get_item_secret (GkdSecretSessio=
n *self, GckObject *item,
- 					   NULL, &error);
- 	g_object_unref (session);
-=20
--	/*
--	 * gck_object_get_session() returns a new reference, so drop it again.
--	 * Not doing so leaks a GckSession on every GetSecret call, which in t=
urn
--	 * keeps the client's PKCS#11 session alive after the client is gone.
--	 */
--	g_object_unref (session);
--
- 	if (error !=3D NULL) {
- 		if (g_error_matches (error, GCK_ERROR, CKR_USER_NOT_LOGGED_IN)) {
- 			g_set_error_literal (error_out, GKD_SECRET_ERROR,
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb=
 b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb
rename to meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.1.bb
index 12576f2eb4..c1349a2986 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_51.1.bb
@@ -20,11 +20,10 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gettext
=20
-SRC_URI[archive.sha256sum] =3D "2aebaa2d474cc31507c87a7bbbdb3e16dbe26b1c=
fef9f206457f3f9df43558b0"
+SRC_URI[archive.sha256sum] =3D "dfe7adc5876ef0670e7eba2907799bdbb8875ce5=
8bb4208e1a52169bd16a47ca"
 SRC_URI +=3D "file://0001-meson-allow-setting-the-paths-to-ssh-agent-and=
-ssh-add-by-option.patch \
             file://0002-gkd-secret-service-destroy-the-dispatch-table-be=
fore.patch \
             file://0003-gkd-secret-unlock-do-not-use-the-service-after-d=
ispo.patch \
-            file://0004-gkd-secret-session-drop-the-duplicate-session-un=
ref.patch \
             "
=20
 PACKAGECONFIG ??=3D " \
--=20
2.55.0


