Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD1CC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 12:27:16 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.13451.1746793627155844152
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 May 2025 05:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 20EAA570
	for <openembedded-devel@lists.openembedded.org>; Fri,  9 May 2025 14:27:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.44]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uDMoh-4UJ8wD0; Fri, 9 May 2025 14:27:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gimp: fix build with gcc-15
Date: Fri,  9 May 2025 14:26:54 +0200
Message-ID: <20250509122654.1304949-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1746793623-8D92855F-B513CBF4/0/0 CLEAN NORMAL
X-TOI-MSGID: f363b57b-f0ce-49bc-b196-3331f2f25b3b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 12:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117376

Add a backport patch to fix:
| ../gimp-3.0.2/libgimpconfig/gimpconfig-serialize.c: In function 'gimp_c=
onfig_serialize_value':
| ../gimp-3.0.2/libgimpconfig/gimpconfig-serialize.c:526:29: error: expec=
ted expression before 'bool'
|   526 |       g_string_append (str, bool ? "yes" : "no");
|       |                             ^~~~
| ../recipe-sysroot/usr/include/glib-2.0/glib/gstring.h:269:26: note: in =
definition of macro 'g_string_append'
|   269 |   (__builtin_constant_p (val) ?                     \
|       |                          ^~~
| ../gimp-3.0.2/libgimpconfig/gimpconfig-serialize.c:526:34: error: expec=
ted ')' before '?' token
|   526 |       g_string_append (str, bool ? "yes" : "no");
|       |                                  ^
| ../recipe-sysroot/usr/include/glib-2.0/glib/gstring.h:271:35: note: in =
definition of macro 'g_string_append'
|   271 |       const char * const __val =3D (val);             \
|       |                                   ^~~
| ../recipe-sysroot/usr/include/glib-2.0/glib/gstring.h:271:34: note: to =
match this '('
|   271 |       const char * const __val =3D (val);             \
|       |                                  ^
| ../gimp-3.0.2/libgimpconfig/gimpconfig-serialize.c:526:7: note: in expa=
nsion of macro 'g_string_append'
|   526 |       g_string_append (str, bool ? "yes" : "no");
|       |       ^~~~~~~~~~~~~~~
| ../recipe-sysroot/usr/include/glib-2.0/glib/gstring.h:271:39: error: ex=
pected expression before ';' token
|   271 |       const char * const __val =3D (val);             \
|       |                                       ^
| ../gimp-3.0.2/libgimpconfig/gimpconfig-serialize.c:526:7: note: in expa=
nsion of macro 'g_string_append'
|   526 |       g_string_append (str, bool ? "yes" : "no");
|       |       ^~~~~~~~~~~~~~~
| ../gimp-3.0.2/libgimpconfig/gimpconfig-serialize.c:526:29: error: expec=
ted expression before 'bool'
|   526 |       g_string_append (str, bool ? "yes" : "no");
|       |                             ^~~~
| ../recipe-sysroot/usr/include/glib-2.0/glib/gstring.h:251:37: note: in =
definition of macro 'g_string_append_len'
|   251 |   g_string_append_len_inline (gstr, val, len)
|       |                                     ^~~
| ../gimp-3.0.2/libgimpconfig/gimpconfig-serialize.c:526:7: note: in expa=
nsion of macro 'g_string_append'
|   526 |       g_string_append (str, bool ? "yes" : "no");
|       |       ^~~~~~~~~~~~~~~
| ../recipe-sysroot/usr/include/glib-2.0/glib/gstring.h:251:3: error: too=
 few arguments to function 'g_string_append_len_inline'; expected 3, have=
 2
|   251 |   g_string_append_len_inline (gstr, val, len)
|       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~
| ../recipe-sysroot/usr/include/glib-2.0/glib/gstring.h:278:5: note: in e=
xpansion of macro 'g_string_append_len'
|   278 |     g_string_append_len (gstr, val, (gssize) -1))
|       |     ^~~~~~~~~~~~~~~~~~~
| ../gimp-3.0.2/libgimpconfig/gimpconfig-serialize.c:526:7: note: in expa=
nsion of macro 'g_string_append'
|   526 |       g_string_append (str, bool ? "yes" : "no");
|       |       ^~~~~~~~~~~~~~~
| ../recipe-sysroot/usr/include/glib-2.0/glib/gstring.h:218:1: note: decl=
ared here
|   218 | g_string_append_len_inline (GString    *gstring,
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ad2b2ca7ba36a01bef945b1c4b193a2fa9d0.patch | 62 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/85bdad2b2ca7ba36a01=
bef945b1c4b193a2fa9d0.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/85bdad2b2ca7ba36a01bef945b=
1c4b193a2fa9d0.patch b/meta-gnome/recipes-gimp/gimp/gimp/85bdad2b2ca7ba36=
a01bef945b1c4b193a2fa9d0.patch
new file mode 100644
index 0000000000..3a2bf27616
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/85bdad2b2ca7ba36a01bef945b1c4b193=
a2fa9d0.patch
@@ -0,0 +1,62 @@
+From 85bdad2b2ca7ba36a01bef945b1c4b193a2fa9d0 Mon Sep 17 00:00:00 2001
+From: Nils Philippsen <nils@tiptoe.de>
+Date: Wed, 29 Jan 2025 12:51:53 +0100
+Subject: [PATCH] Avoid type names and keywords
+
+This fixes various errors when compiling with current toolchains and/or
+-std=3Dc23.
+
+Signed-off-by: Nils Philippsen <nils@tiptoe.de>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
85bdad2b2ca7ba36a01bef945b1c4b193a2fa9d0.patch]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ libgimpconfig/gimpconfig-serialize.c |  6 +++---
+ plug-ins/selection-to-path/types.h   | 13 ++++---------
+ 2 files changed, 7 insertions(+), 12 deletions(-)
+
+diff --git a/libgimpconfig/gimpconfig-serialize.c b/libgimpconfig/gimpco=
nfig-serialize.c
+index 377b2371630..b3abca229d1 100644
+--- a/libgimpconfig/gimpconfig-serialize.c
++++ b/libgimpconfig/gimpconfig-serialize.c
+@@ -522,10 +522,10 @@ gimp_config_serialize_value (const GValue *value,
+=20
+   if (G_VALUE_HOLDS_BOOLEAN (value))
+     {
+-      gboolean bool;
++      gboolean boolean;
+=20
+-      bool =3D g_value_get_boolean (value);
+-      g_string_append (str, bool ? "yes" : "no");
++      boolean =3D g_value_get_boolean (value);
++      g_string_append (str, boolean ? "yes" : "no");
+       return TRUE;
+     }
+=20
+diff --git a/plug-ins/selection-to-path/types.h b/plug-ins/selection-to-=
path/types.h
+index 9b040fa3a19..1521937b15e 100644
+--- a/plug-ins/selection-to-path/types.h
++++ b/plug-ins/selection-to-path/types.h
+@@ -19,15 +19,10 @@
+ #ifndef TYPES_H
+ #define TYPES_H
+=20
+-/* Booleans.  */
+-typedef enum { false =3D 0, true =3D 1 } boolean;
+-
+-/* The X11 library defines `FALSE' and `TRUE', and so we only want to
+-   define them if necessary.  */
+-#ifndef FALSE
+-#define FALSE false
+-#define TRUE true
+-#endif /* FALSE */
++/* Cope with C23 */
++typedef int boolean;
++#define false FALSE
++#define true TRUE
+=20
+ /* The usual null-terminated string.  */
+ typedef char *string;
+--=20
+GitLab
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.2.bb
index b1e61bf4ec..25a91ed1a5 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -61,6 +61,7 @@ SRC_URI +=3D "file://0001-gimp-cross-compile-fix-for-bz=
2.patch"
 SRC_URI +=3D "file://0002-meson.build-reproducibility-fix.patch"
 SRC_URI +=3D "file://0001-meson.build-dont-check-for-lgi.patch"
 SRC_URI +=3D "file://0001-meson.build-require-iso-codes-native.patch"
+SRC_URI +=3D "file://85bdad2b2ca7ba36a01bef945b1c4b193a2fa9d0.patch"
 SRC_URI[sha256sum] =3D "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0=
ad8cbcbf6ea571a2"
=20
 PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
--=20
2.49.0


