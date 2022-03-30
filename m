Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D913C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 19:11:33 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web12.2364.1648667491761100140
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 12:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=V7S+OjqZ;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4KTGJ05Hvtz9sW6
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 21:11:28 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1648667486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKCoJvtJj1GJdvh9vLwKT9GzvAbBQhcXevez++aFa3A=;
	b=V7S+OjqZXiEgDwJGzMyrWBVZOcXvompjevIy1SGLERzYu61R08EzLBulCxhiq01eCgqKSE
	XaHDM/YYtsiK+3SoELW43d/3UpX2/Z1SRWCWVvcvKLB9Tdog3pvzEcYF2i6/lf6Txw7a3Z
	yzBFfX4eDF61n97r49XUfNwkBduq+br9dJSPdJD0XIaEJqiwbRSRt/LaSheX6RNxfHCyAU
	DXGjFNvdu5SD1d38eGCyuNPm2Yx5pKwn1HSl5QUAjRHOXN/Uyppa91n3D15yF8ceEh2gJi
	JMiVvrK/39ofeu1qt+BjFHEHLTdJSaVs+gyNtyJkFJoYwdntWTQCyjz+7gErqA==
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] wireplumber: Upgrade to version 0.4.9
Date: Wed, 30 Mar 2022 21:11:15 +0200
Message-Id: <20220330191115.112414-3-crg7475@mailbox.org>
In-Reply-To: <20220330191115.112414-1-crg7475@mailbox.org>
References: <20220330191115.112414-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 19:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96269

ChangeLog can be found here:

https://gitlab.freedesktop.org/pipewire/wireplumber/-/releases/0.4.9

Remove backported fix that is already included in this version.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...list-APIs-for-different-architecture.patch | 217 ------------------
 ...eplumber_0.4.8.bb =3D> wireplumber_0.4.9.bb} |   5 +-
 2 files changed, 2 insertions(+), 220 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/wireplumber/files/=
0001-spa-json-fix-va_list-APIs-for-different-architecture.patch
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.8=
.bb =3D> wireplumber_0.4.9.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/files/0001-sp=
a-json-fix-va_list-APIs-for-different-architecture.patch b/meta-multimedi=
a/recipes-multimedia/wireplumber/files/0001-spa-json-fix-va_list-APIs-for=
-different-architecture.patch
deleted file mode 100644
index 75c7b850f..000000000
--- a/meta-multimedia/recipes-multimedia/wireplumber/files/0001-spa-json-=
fix-va_list-APIs-for-different-architecture.patch
+++ /dev/null
@@ -1,217 +0,0 @@
-From e429db7e8c266045aee25e153fb2308bd61fe233 Mon Sep 17 00:00:00 2001
-From: Julian Bouzas <julian.bouzas@collabora.com>
-Date: Wed, 9 Feb 2022 07:59:59 -0500
-Subject: [PATCH] spa-json: fix va_list APIs for different architectures
-
-The va_list type might not always be a pointer in some architectures, so=
 we
-cannot guarantee it will be modified after using it for a second time in=
 another
-function. This fixes the issue by using macros so args does not get copi=
ed, and
-always gets modified when using it more than once.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/wirep=
lumber/-/commit/e429db7e8c266045aee25e153fb2308bd61fe233]
-
-Signed-off-by: Peter Bergin <peter@berginkonsult.se>
-
----
- lib/wp/spa-json.c | 156 ++++++++++++++++++++++++----------------------
- 1 file changed, 80 insertions(+), 76 deletions(-)
-
-diff --git a/lib/wp/spa-json.c b/lib/wp/spa-json.c
-index f14f395..c5e59a3 100644
---- a/lib/wp/spa-json.c
-+++ b/lib/wp/spa-json.c
-@@ -363,33 +363,33 @@ wp_spa_json_new_string (const gchar *value)
-       wp_spa_json_builder_new_formatted ("\"%s\"", value));
- }
-=20
--static void
--wp_spa_json_builder_add_value (WpSpaJsonBuilder *self, const gchar *fmt=
,
--    va_list args)
--{
--  switch (*fmt) {
--    case 'n':
--      wp_spa_json_builder_add_null (self);
--      break;
--    case 'b':
--      wp_spa_json_builder_add_boolean (self, va_arg(args, gboolean));
--      break;
--    case 'i':
--      wp_spa_json_builder_add_int (self, va_arg(args, gint));
--      break;
--    case 'f':
--      wp_spa_json_builder_add_float (self, (float)va_arg(args, double))=
;
--      break;
--    case 's':
--      wp_spa_json_builder_add_string (self, va_arg(args, const gchar *)=
);
--      break;
--    case 'J':
--      wp_spa_json_builder_add_json (self, va_arg(args, WpSpaJson *));
--      break;
--    default:
--      return;
--  }
--}
-+/* Args is not a pointer in some architectures, so this needs to be a m=
acro to
-+ * avoid args being copied */
-+#define wp_spa_json_builder_add_value(self,fmt,args)                   =
        \
-+do {                                                                   =
        \
-+  switch (*fmt) {                                                      =
        \
-+    case 'n':                                                          =
        \
-+      wp_spa_json_builder_add_null (self);                             =
        \
-+      break;                                                           =
        \
-+    case 'b':                                                          =
        \
-+      wp_spa_json_builder_add_boolean (self, va_arg(args, gboolean));  =
        \
-+      break;                                                           =
        \
-+    case 'i':                                                          =
        \
-+      wp_spa_json_builder_add_int (self, va_arg(args, gint));          =
        \
-+      break;                                                           =
        \
-+    case 'f':                                                          =
        \
-+      wp_spa_json_builder_add_float (self, (float)va_arg(args, double))=
;       \
-+      break;                                                           =
        \
-+    case 's':                                                          =
        \
-+      wp_spa_json_builder_add_string (self, va_arg(args, const gchar *)=
);      \
-+      break;                                                           =
        \
-+    case 'J':                                                          =
        \
-+      wp_spa_json_builder_add_json (self, va_arg(args, WpSpaJson *));  =
        \
-+      break;                                                           =
        \
-+    default:                                                           =
        \
-+      break;                                                           =
        \
-+  }								               \
-+} while(false)
-=20
- /*!
-  * \brief Creates a spa json of type array
-@@ -724,48 +724,46 @@ wp_spa_json_parse_object_valist (WpSpaJson *self, =
va_list args)
-   return res;
- }
-=20
--static gboolean
--wp_spa_json_parse_value (const gchar *data, int len, const gchar *fmt,
--    va_list args)
--{
--  switch (*fmt) {
--    case 'n':
--      if (!spa_json_is_null (data, len))
--        return FALSE;
--      break;
--    case 'b':
--      if (!wp_spa_json_parse_boolean_internal (data, len,
--          va_arg(args, gboolean *)))
--        return FALSE;
--      break;
--    case 'i':
--      if (spa_json_parse_int (data, len, va_arg(args, gint *)) < 0)
--        return FALSE;
--      break;
--    case 'f':
--      if (spa_json_parse_float (data, len,
--          (float *)va_arg(args, double *)) < 0)
--        return FALSE;
--      break;
--    case 's': {
--      gchar *str =3D wp_spa_json_parse_string_internal (data, len);
--      if (!str)
--        return FALSE;
--      *va_arg(args, gchar **) =3D str;
--      break;
--    }
--    case 'J': {
--      WpSpaJson *j =3D wp_spa_json_new (data, len);
--      if (!j)
--        return FALSE;
--      *va_arg(args, WpSpaJson **) =3D j;
--      break;
--    }
--    default:
--      return FALSE;
--  }
--  return TRUE;
--}
-+/* Args is not a pointer in some architectures, so this needs to be a m=
acro to
-+ * avoid args being copied */
-+#define wp_spa_json_parse_value(data,len,fmt,args)                     =
        \
-+do {                                                                   =
        \
-+  switch (*fmt) {                                                      =
        \
-+    case 'n':                                                          =
        \
-+      if (!spa_json_is_null (data, len))                               =
        \
-+        return FALSE;                                                  =
        \
-+      break;                                                           =
        \
-+    case 'b':                                                          =
        \
-+      if (!wp_spa_json_parse_boolean_internal (data, len,              =
        \
-+          va_arg(args, gboolean *)))                                   =
        \
-+        return FALSE;                                                  =
        \
-+      break;                                                           =
        \
-+    case 'i':                                                          =
        \
-+      if (spa_json_parse_int (data, len, va_arg(args, gint *)) < 0)    =
        \
-+        return FALSE;                                                  =
        \
-+      break;                                                           =
        \
-+    case 'f':                                                          =
        \
-+      if (spa_json_parse_float (data, len, va_arg(args, float *)) < 0) =
        \
-+        return FALSE;                                                  =
        \
-+      break;                                                           =
        \
-+    case 's': {                                                        =
        \
-+      gchar *str =3D wp_spa_json_parse_string_internal (data, len);    =
          \
-+      if (!str)                                                        =
        \
-+        return FALSE;                                                  =
        \
-+      *va_arg(args, gchar **) =3D str;                                 =
          \
-+      break;                                                           =
        \
-+    }                                                                  =
        \
-+    case 'J': {                                                        =
        \
-+      WpSpaJson *j =3D wp_spa_json_new (data, len);                    =
          \
-+      if (!j)                                                          =
        \
-+        return FALSE;                                                  =
        \
-+      *va_arg(args, WpSpaJson **) =3D j;                               =
          \
-+      break;                                                           =
        \
-+    }                                                                  =
        \
-+    default:                                                           =
        \
-+      return FALSE;                                                    =
        \
-+  }                                                                    =
        \
-+} while(false)
-=20
- /*!
-  * \brief Parses the object property values of a spa json object
-@@ -827,8 +825,7 @@ wp_spa_json_object_get_valist (WpSpaJson *self, va_l=
ist args)
-     value =3D g_value_get_boxed (&item);
-=20
-     if (g_strcmp0 (key_str, lookup_key) =3D=3D 0) {
--      if (!wp_spa_json_parse_value (value->data, value->size, lookup_fm=
t, args))
--        return FALSE;
-+      wp_spa_json_parse_value (value->data, value->size, lookup_fmt, ar=
gs);
-       lookup_key =3D va_arg(args, const gchar *);
-       if (!lookup_key)
-         return TRUE;
-@@ -1366,9 +1363,12 @@ gboolean
- wp_spa_json_parser_get_value (WpSpaJsonParser *self, const gchar *fmt,
-     va_list args)
- {
--  return wp_spa_json_parser_advance (self) &&
--      wp_spa_json_parse_value (self->curr.cur,
--          self->curr.end - self->curr.cur, fmt, args);
-+  if (wp_spa_json_parser_advance (self)) {
-+    wp_spa_json_parse_value (self->curr.cur, self->curr.end - self->cur=
r.cur,
-+        fmt, args);
-+    return TRUE;
-+  }
-+  return FALSE;
- }
-=20
- /*!
-@@ -1419,9 +1419,13 @@ wp_spa_json_parser_get_valist (WpSpaJsonParser *s=
elf, va_list args)
-     if (!format)
-       return TRUE;
-=20
--    /* parse value */
--    if (!wp_spa_json_parser_get_value (self, format, args))
-+    /* advance */
-+    if (!wp_spa_json_parser_advance (self))
-       return FALSE;
-+
-+    /* parse value */
-+    wp_spa_json_parse_value (self->curr.cur, self->curr.end - self->cur=
r.cur,
-+        format, args);
-   } while (TRUE);
-=20
-   return FALSE;
---=20
-2.32.0
-
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.8.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
9.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
4.8.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
9.bb
index ed7417c28..0a2ca3b6f 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.8.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
@@ -11,11 +11,10 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "e14bb72dcc85e2130d0ea96768e5ae3b375a041e"
+SRCREV =3D "8b97b40c4467951fbd4181afb47e4175361365a6"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/wireplumber.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://90-OE-disable-session-dbus-dependent-features.lua \
-           file://0001-spa-json-fix-va_list-APIs-for-different-architect=
ure.patch \
-          "
+           "
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.32.0


