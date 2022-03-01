Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F43C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:33:41 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web12.6357.1646127218682929102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=H8ixIXSG;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=yXOrcmb+f2MvZr7Jph9F1/M9HSFmypQj2gwTtGDhKBs=;
	b=H8ixIXSGSNySuEHlv5exq/8sOthr+ItJdlNIAM+knQxFdBEcrljFixxOOThh8ep/MCZ7agJ6eXEz6
	 Ki/FoNlOvXL14ByTb53EMq/ncdbTQ9WzIDV6mtzlOcfxmnA2pFYHRNiyM6dRiIHTj22tXXJWaiWt8s
	 bFYpAA2it3ef3BlSW5EDUbYtwHt8I9hMr08RuIga5XWvW9+p9iy+BOZuhmOGQFOlxlu04DOvw8CPY8
	 SHq7gGkQKBKBXCkHKTASkDcCIdUvlDOISwaU8Nm/kfJaIN+n8fhJtOsW6GwXrlKkFksIbj3T2eVo00
	 3kXktOmU4kgoCeB8d42yFzaphNoKHFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=yXOrcmb+f2MvZr7Jph9F1/M9HSFmypQj2gwTtGDhKBs=;
	b=o+K/e532sETYRtZqaWQDDFvwc0pohy56ntx0s7b3gG9at09t8H2KjWc/2FviDqApWisLYGzsfqlSG
	 JSKkjhkAw==
X-HalOne-Cookie: f19f51785410b1f5ebe258a01cc4d2eb1653ca6f
X-HalOne-ID: a87dd04a-9942-11ec-8821-d0431ea8a283
Received: from pbergin-7420.localdomain (unknown [83.218.73.98])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id a87dd04a-9942-11ec-8821-d0431ea8a283;
	Tue, 01 Mar 2022 09:33:35 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [meta-multimedia][PATCH] wireplumber: backport fix for default device
 setting
Date: Tue,  1 Mar 2022 10:33:16 +0100
Message-Id: <20220301093316.12582-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 09:33:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95620

In wireplumber 0.4.8 there is an issue with default device setting.
https://gitlab.freedesktop.org/pipewire/wireplumber/-/issues/194
Backport a fix that solves this issue.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 ...list-APIs-for-different-architecture.patch | 217 ++++++++++++++++++
 .../wireplumber/wireplumber_0.4.8.bb          |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/wireplumber/files/0001-spa-json-fix-va_list-APIs-for-different-architecture.patch

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/files/0001-spa-json-fix-va_list-APIs-for-different-architecture.patch b/meta-multimedia/recipes-multimedia/wireplumber/files/0001-spa-json-fix-va_list-APIs-for-different-architecture.patch
new file mode 100644
index 000000000..75c7b850f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/wireplumber/files/0001-spa-json-fix-va_list-APIs-for-different-architecture.patch
@@ -0,0 +1,217 @@
+From e429db7e8c266045aee25e153fb2308bd61fe233 Mon Sep 17 00:00:00 2001
+From: Julian Bouzas <julian.bouzas@collabora.com>
+Date: Wed, 9 Feb 2022 07:59:59 -0500
+Subject: [PATCH] spa-json: fix va_list APIs for different architectures
+
+The va_list type might not always be a pointer in some architectures, so we
+cannot guarantee it will be modified after using it for a second time in another
+function. This fixes the issue by using macros so args does not get copied, and
+always gets modified when using it more than once.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/wireplumber/-/commit/e429db7e8c266045aee25e153fb2308bd61fe233]
+
+Signed-off-by: Peter Bergin <peter@berginkonsult.se>
+
+---
+ lib/wp/spa-json.c | 156 ++++++++++++++++++++++++----------------------
+ 1 file changed, 80 insertions(+), 76 deletions(-)
+
+diff --git a/lib/wp/spa-json.c b/lib/wp/spa-json.c
+index f14f395..c5e59a3 100644
+--- a/lib/wp/spa-json.c
++++ b/lib/wp/spa-json.c
+@@ -363,33 +363,33 @@ wp_spa_json_new_string (const gchar *value)
+       wp_spa_json_builder_new_formatted ("\"%s\"", value));
+ }
+ 
+-static void
+-wp_spa_json_builder_add_value (WpSpaJsonBuilder *self, const gchar *fmt,
+-    va_list args)
+-{
+-  switch (*fmt) {
+-    case 'n':
+-      wp_spa_json_builder_add_null (self);
+-      break;
+-    case 'b':
+-      wp_spa_json_builder_add_boolean (self, va_arg(args, gboolean));
+-      break;
+-    case 'i':
+-      wp_spa_json_builder_add_int (self, va_arg(args, gint));
+-      break;
+-    case 'f':
+-      wp_spa_json_builder_add_float (self, (float)va_arg(args, double));
+-      break;
+-    case 's':
+-      wp_spa_json_builder_add_string (self, va_arg(args, const gchar *));
+-      break;
+-    case 'J':
+-      wp_spa_json_builder_add_json (self, va_arg(args, WpSpaJson *));
+-      break;
+-    default:
+-      return;
+-  }
+-}
++/* Args is not a pointer in some architectures, so this needs to be a macro to
++ * avoid args being copied */
++#define wp_spa_json_builder_add_value(self,fmt,args)                           \
++do {                                                                           \
++  switch (*fmt) {                                                              \
++    case 'n':                                                                  \
++      wp_spa_json_builder_add_null (self);                                     \
++      break;                                                                   \
++    case 'b':                                                                  \
++      wp_spa_json_builder_add_boolean (self, va_arg(args, gboolean));          \
++      break;                                                                   \
++    case 'i':                                                                  \
++      wp_spa_json_builder_add_int (self, va_arg(args, gint));                  \
++      break;                                                                   \
++    case 'f':                                                                  \
++      wp_spa_json_builder_add_float (self, (float)va_arg(args, double));       \
++      break;                                                                   \
++    case 's':                                                                  \
++      wp_spa_json_builder_add_string (self, va_arg(args, const gchar *));      \
++      break;                                                                   \
++    case 'J':                                                                  \
++      wp_spa_json_builder_add_json (self, va_arg(args, WpSpaJson *));          \
++      break;                                                                   \
++    default:                                                                   \
++      break;                                                                   \
++  }								               \
++} while(false)
+ 
+ /*!
+  * \brief Creates a spa json of type array
+@@ -724,48 +724,46 @@ wp_spa_json_parse_object_valist (WpSpaJson *self, va_list args)
+   return res;
+ }
+ 
+-static gboolean
+-wp_spa_json_parse_value (const gchar *data, int len, const gchar *fmt,
+-    va_list args)
+-{
+-  switch (*fmt) {
+-    case 'n':
+-      if (!spa_json_is_null (data, len))
+-        return FALSE;
+-      break;
+-    case 'b':
+-      if (!wp_spa_json_parse_boolean_internal (data, len,
+-          va_arg(args, gboolean *)))
+-        return FALSE;
+-      break;
+-    case 'i':
+-      if (spa_json_parse_int (data, len, va_arg(args, gint *)) < 0)
+-        return FALSE;
+-      break;
+-    case 'f':
+-      if (spa_json_parse_float (data, len,
+-          (float *)va_arg(args, double *)) < 0)
+-        return FALSE;
+-      break;
+-    case 's': {
+-      gchar *str = wp_spa_json_parse_string_internal (data, len);
+-      if (!str)
+-        return FALSE;
+-      *va_arg(args, gchar **) = str;
+-      break;
+-    }
+-    case 'J': {
+-      WpSpaJson *j = wp_spa_json_new (data, len);
+-      if (!j)
+-        return FALSE;
+-      *va_arg(args, WpSpaJson **) = j;
+-      break;
+-    }
+-    default:
+-      return FALSE;
+-  }
+-  return TRUE;
+-}
++/* Args is not a pointer in some architectures, so this needs to be a macro to
++ * avoid args being copied */
++#define wp_spa_json_parse_value(data,len,fmt,args)                             \
++do {                                                                           \
++  switch (*fmt) {                                                              \
++    case 'n':                                                                  \
++      if (!spa_json_is_null (data, len))                                       \
++        return FALSE;                                                          \
++      break;                                                                   \
++    case 'b':                                                                  \
++      if (!wp_spa_json_parse_boolean_internal (data, len,                      \
++          va_arg(args, gboolean *)))                                           \
++        return FALSE;                                                          \
++      break;                                                                   \
++    case 'i':                                                                  \
++      if (spa_json_parse_int (data, len, va_arg(args, gint *)) < 0)            \
++        return FALSE;                                                          \
++      break;                                                                   \
++    case 'f':                                                                  \
++      if (spa_json_parse_float (data, len, va_arg(args, float *)) < 0)         \
++        return FALSE;                                                          \
++      break;                                                                   \
++    case 's': {                                                                \
++      gchar *str = wp_spa_json_parse_string_internal (data, len);              \
++      if (!str)                                                                \
++        return FALSE;                                                          \
++      *va_arg(args, gchar **) = str;                                           \
++      break;                                                                   \
++    }                                                                          \
++    case 'J': {                                                                \
++      WpSpaJson *j = wp_spa_json_new (data, len);                              \
++      if (!j)                                                                  \
++        return FALSE;                                                          \
++      *va_arg(args, WpSpaJson **) = j;                                         \
++      break;                                                                   \
++    }                                                                          \
++    default:                                                                   \
++      return FALSE;                                                            \
++  }                                                                            \
++} while(false)
+ 
+ /*!
+  * \brief Parses the object property values of a spa json object
+@@ -827,8 +825,7 @@ wp_spa_json_object_get_valist (WpSpaJson *self, va_list args)
+     value = g_value_get_boxed (&item);
+ 
+     if (g_strcmp0 (key_str, lookup_key) == 0) {
+-      if (!wp_spa_json_parse_value (value->data, value->size, lookup_fmt, args))
+-        return FALSE;
++      wp_spa_json_parse_value (value->data, value->size, lookup_fmt, args);
+       lookup_key = va_arg(args, const gchar *);
+       if (!lookup_key)
+         return TRUE;
+@@ -1366,9 +1363,12 @@ gboolean
+ wp_spa_json_parser_get_value (WpSpaJsonParser *self, const gchar *fmt,
+     va_list args)
+ {
+-  return wp_spa_json_parser_advance (self) &&
+-      wp_spa_json_parse_value (self->curr.cur,
+-          self->curr.end - self->curr.cur, fmt, args);
++  if (wp_spa_json_parser_advance (self)) {
++    wp_spa_json_parse_value (self->curr.cur, self->curr.end - self->curr.cur,
++        fmt, args);
++    return TRUE;
++  }
++  return FALSE;
+ }
+ 
+ /*!
+@@ -1419,9 +1419,13 @@ wp_spa_json_parser_get_valist (WpSpaJsonParser *self, va_list args)
+     if (!format)
+       return TRUE;
+ 
+-    /* parse value */
+-    if (!wp_spa_json_parser_get_value (self, format, args))
++    /* advance */
++    if (!wp_spa_json_parser_advance (self))
+       return FALSE;
++
++    /* parse value */
++    wp_spa_json_parse_value (self->curr.cur, self->curr.end - self->curr.cur,
++        format, args);
+   } while (TRUE);
+ 
+   return FALSE;
+-- 
+2.32.0
+
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.8.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.8.bb
index 2310c3a78..ed7417c28 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.8.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.8.bb
@@ -14,6 +14,7 @@ DEPENDS = "glib-2.0 glib-2.0-native lua pipewire \
 SRCREV = "e14bb72dcc85e2130d0ea96768e5ae3b375a041e"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https \
            file://90-OE-disable-session-dbus-dependent-features.lua \
+           file://0001-spa-json-fix-va_list-APIs-for-different-architecture.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.32.0


