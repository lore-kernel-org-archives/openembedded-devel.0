Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA3DC3ABD7
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 12:52:22 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.75189.1747140740467011372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 05:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 7B7EFE77
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 14:52:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uEp7J-3FhvG50; Tue, 13 May 2025 14:52:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] gdm: fix gcc 15 issue
Date: Tue, 13 May 2025 14:52:07 +0200
Message-ID: <20250513125209.1088462-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747140737-89ADE5CE-4E13EDBD/0/0 CLEAN NORMAL
X-TOI-MSGID: 0ab24d63-2724-426f-b147-d2b87b2154ca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 12:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117397

add a backport patch to fix:
| In file included from ../gdm-48.0/common/gdm-settings-direct.c:38:
| ../gdm-48.0/common/gdm-settings-utils.h:47:77: error: expected ';', ','=
 or ')' before 'bool'
|    47 |                                                                =
 gboolean   *bool);
|       |                                                                =
             ^~~~

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...aca75e16aeafc171751028406b54f5ed8397.patch | 56 +++++++++++++++++++
 meta-gnome/recipes-gnome/gdm/gdm_48.0.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171=
751028406b54f5ed8397.patch

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc1717510284=
06b54f5ed8397.patch b/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc1=
71751028406b54f5ed8397.patch
new file mode 100644
index 0000000000..8363a7f41d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171751028406b54f5=
ed8397.patch
@@ -0,0 +1,56 @@
+From 2fbc2ac50b9f143eb594e5f77a8051222ffbd2c9 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Mon, 27 Jan 2025 14:01:23 +0100
+Subject: [PATCH] gdm-settings-utils: rename variable to fix build with g=
cc 15
+
+In GNU23 C, bool is a keyword. Rename the variable to avoid syntax error=
.
+---
+ common/gdm-settings-utils.c | 8 ++++----
+ common/gdm-settings-utils.h | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+=20
+ Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdm/-/commit/a=
3e0aca75e16aeafc171751028406b54f5ed8397.patch]
+
+diff --git a/common/gdm-settings-utils.c b/common/gdm-settings-utils.c
+index 636be3a9e..da4c7aefb 100644
+--- a/common/gdm-settings-utils.c
++++ b/common/gdm-settings-utils.c
+@@ -287,16 +287,16 @@ gdm_settings_parse_boolean_as_value  (gboolean boo=
lval)
+ /* adapted from GKeyFile */
+ gboolean
+ gdm_settings_parse_value_as_boolean (const char *value,
+-                                     gboolean   *bool)
++                                     gboolean   *boolval)
+ {
+         g_return_val_if_fail (value !=3D NULL, FALSE);
+-        g_return_val_if_fail (bool !=3D NULL, FALSE);
++        g_return_val_if_fail (boolval !=3D NULL, FALSE);
+=20
+         if (g_ascii_strcasecmp (value, "true") =3D=3D 0 || strcmp (valu=
e, "1") =3D=3D 0) {
+-                *bool =3D TRUE;
++                *boolval =3D TRUE;
+                 return TRUE;
+         } else if (g_ascii_strcasecmp (value, "false") =3D=3D 0 || strc=
mp (value, "0") =3D=3D 0) {
+-                *bool =3D FALSE;
++                *boolval =3D FALSE;
+                 return TRUE;
+         } else {
+                 return FALSE;
+diff --git a/common/gdm-settings-utils.h b/common/gdm-settings-utils.h
+index 4f2362ce7..734d625c7 100644
+--- a/common/gdm-settings-utils.h
++++ b/common/gdm-settings-utils.h
+@@ -44,7 +44,7 @@ gboolean                  gdm_settings_parse_schemas  =
         (const char  *fil
+                                                                 GSList =
    **list);
+=20
+ gboolean                  gdm_settings_parse_value_as_boolean  (const c=
har *value,
+-                                                                gboolea=
n   *bool);
++                                                                gboolea=
n   *boolval);
+ gboolean                  gdm_settings_parse_value_as_integer  (const c=
har *value,
+                                                                 int    =
    *intval);
+ gboolean                  gdm_settings_parse_value_as_double   (const c=
har *value,
+--=20
+GitLab
+
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_48.0.bb
index 1c8076e6c7..92ddc143f6 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
@@ -21,6 +21,7 @@ GIR_MESON_OPTION =3D ""
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
+SRC_URI +=3D "file://a3e0aca75e16aeafc171751028406b54f5ed8397.patch"
 SRC_URI[archive.sha256sum] =3D "1bc06daff093ec7b5e37ecb4f92e5da3474a1b1b=
a076edb9151ee967d1c30adf"
=20
 PACKAGECONFIG ??=3D ""
--=20
2.49.0


