Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530A9C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 21:28:03 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.1058.1747430876362552109
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 14:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ng5WPalC;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30e9e81d517so293878a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747430875; x=1748035675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SrPC4mYXBsPLUD+YtCMVF5IHGyRNk4Qh+S7sce+zGo=;
        b=Ng5WPalC0d7g2eAl1mDj1OxSoP2u11u/0vN+gsUaUhL+k5swjFmwG13/Zq33ZRIQ81
         5v+cgy93SEUNmABfsl4M0Hxf4ZTwcdZ/KRLLirciuVNfeXF0vYaU3MMfuHVNRuiDPJAK
         e7Lxo0glcGA/7h4h+HQOiey0GS+hrpcNWhbRmIK9kKMitbdlf1So1D5PRI8Aq7g9Skx9
         4NlgtDMmlk9f2QO/G7CawoYoogT7g9Au/dXlHFtq7hUi44MP+eX3Y8nLtq7pT0BiNR7M
         9MXRTpgwJb4VGBXlc1Sl3/ljs93glXtVJClUYSz4YKPjAeQqK3qublr7OD19Gr748eYU
         Q2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747430875; x=1748035675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SrPC4mYXBsPLUD+YtCMVF5IHGyRNk4Qh+S7sce+zGo=;
        b=kCAosPE/8pffdKBVq4WpCVzS4hQ0f+SLoQxA8SK+iSqozS3A6sxX+wwDU5lGs6jQNm
         NgY7Yft+3y9RYVP5ee8+vex/B+rJmjSYKVxJSAfZL37lNaGzPjq8TxR7YgHDS9OjgRXc
         FC5E3JXSRA/tzMKwCLUkbU4j9kWPzZCKY1d1iyPhNTgQOSU3R4O7kYl3iVArUVdX//Y3
         kJoEtnwNpdAgg90zufXupG7x2kS4mslSj9m1pCS6xCCORMOgtqUmMyA6xsYlJHWKHieG
         qhLHA5wO33ZSYLGn4gHpCCn2O/uX81E0xRMTJFVTyUCDZ667WItwc3/24JZSl7TxBNJ7
         0Gew==
X-Gm-Message-State: AOJu0YxADXMA5uQe5XOudEbXdKMz4kvwov8FJS6iYDISp926cDbwqex9
	8yAuwWAqtIg8Mli+Y1ytHld1yOYyWi2n9EEaMXIiS8zoVT/7kkQRootnoqWkOlIq
X-Gm-Gg: ASbGncvRqf74j3KCTnWtSTkiwspVGzIQK90TvGmNLL44suWjfzWGRN98RNpXhxZM3SA
	WExngotBeY9vuPPkJ3CfZaXM4v/R5dkyauOJxk+ExrgE1GoG13WnK8KkrOvv0WVnP0+8nYUqY9L
	9iabmhxk/azD62muulSq5GxQC+mKEX+UNrPkPkzKrw/+2wXe+CcpcbMILN94v8O3nRD1jV0jJfv
	lTCAPpLj879ltCBSDGE1cC+Nt3wHoOWkvYrCzj3BFcrzD8r9Ds22a5pturShZo/DKV448mrXP/h
	ZoGcEIDlMzSMRnUrTKLyE2q71BeZ8e5Cs35ea3dCL40=
X-Google-Smtp-Source: AGHT+IFYhFSrnmSMlrQ3iAJuoE3z/wKRYv3yYjx44joYonWWirAAAArYQ20+B1J0AgveRAXxrBRxhw==
X-Received: by 2002:a17:90b:51cb:b0:2fe:84d6:cdf9 with SMTP id 98e67ed59e1d1-30e7d5ac8abmr6239324a91.26.1747430874962;
        Fri, 16 May 2025 14:27:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb084650sm2008793a12.61.2025.05.16.14.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:27:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-weather-plugin: Upgrade to 0.11.3
Date: Fri, 16 May 2025 14:27:52 -0700
Message-ID: <20250516212752.3914198-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 21:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117438

Backport patches to support libsoup3
Replace libsoup-2.4 dependency with libsoup3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ibxfce4ui-Avoid-deprecated-functions.patch |  79 +++
 ...s-Generalise-input-to-array-of-gchar.patch | 289 ++++++++
 .../0003-libsoup-Port-to-libsoup-3.0.patch    | 563 ++++++++++++++++
 .../0004-Report-UPower-Glib-support.patch     |  20 +
 ...005-Make-libsoup-v3-support-optional.patch | 626 ++++++++++++++++++
 .../weather/xfce4-weather-plugin_0.11.1.bb    |  12 -
 .../weather/xfce4-weather-plugin_0.11.3.bb    |  18 +
 7 files changed, 1595 insertions(+), 12 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0001-libxfce4ui-Avoid-deprecated-functions.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0002-parsers-Generalise-input-to-array-of-gchar.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0003-libsoup-Port-to-libsoup-3.0.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0004-Report-UPower-Glib-support.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0005-Make-libsoup-v3-support-optional.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.3.bb

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0001-libxfce4ui-Avoid-deprecated-functions.patch b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0001-libxfce4ui-Avoid-deprecated-functions.patch
new file mode 100644
index 0000000000..981ba560d4
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0001-libxfce4ui-Avoid-deprecated-functions.patch
@@ -0,0 +1,79 @@
+From 9a3fc89f924f7a322c3b537256621640561daf95 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C4=90o=C3=A0n=20Tr=E1=BA=A7n=20C=C3=B4ng=20Danh?=
+ <congdanhqx@gmail.com>
+Date: Fri, 1 Mar 2024 21:56:34 +0700
+Subject: [PATCH 1/5] libxfce4ui: Avoid deprecated functions
+
+- xfce_titled_dialog_new_with_buttons is deprecated from 4.16.
+- xfce_spawn_command_line_on_screen is deprecated from 4.16
+
+- xfce_titled_dialog_new_with_mixed_buttons is available from 4.14
+- xfce_spawn_command_line is available from 4.16
+
+Upstream-Status: Backport [https://github.com/xfce-mirror/xfce4-weather-plugin/commit/9115037ed7cfe722d3739ca800d5247f4bb3bc53]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                  |  2 +-
+ panel-plugin/weather-config.c |  4 ++--
+ panel-plugin/weather-search.c | 20 +++++++++++---------
+ 3 files changed, 14 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e0516e6..cf82b7e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,7 +66,7 @@ XDT_CHECK_PACKAGE([GTK], [gtk+-3.0], [3.22.0])
+ XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.64.0])
+ XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.64.0])
+ XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.12.0])
+-XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-2], [4.12.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-2], [4.16.0])
+ XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-2.0], [4.14.0])
+ XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.12.0])
+ XDT_CHECK_PACKAGE([LIBXML], [libxml-2.0], [2.4.0])
+diff --git a/panel-plugin/weather-config.c b/panel-plugin/weather-config.c
+index 9f77340..2645408 100644
+--- a/panel-plugin/weather-config.c
++++ b/panel-plugin/weather-config.c
+@@ -958,8 +958,8 @@ button_icons_dir_clicked(GtkWidget *button,
+     g_mkdir_with_parents(dir, 0755);
+     command = g_strdup_printf("exo-open %s", dir);
+     g_free(dir);
+-    xfce_spawn_command_line_on_screen(gdk_screen_get_default(),
+-                                      command, FALSE, TRUE, NULL);
++    xfce_spawn_command_line(gdk_screen_get_default(), command, FALSE,
++                            TRUE, TRUE, NULL);
+     g_free(command);
+ }
+ 
+diff --git a/panel-plugin/weather-search.c b/panel-plugin/weather-search.c
+index 83f1d71..7e87ae8 100644
+--- a/panel-plugin/weather-search.c
++++ b/panel-plugin/weather-search.c
+@@ -205,15 +205,17 @@ create_search_dialog(GtkWindow *parent,
+     dialog->session = session;
+ 
+     dialog->dialog =
+-        xfce_titled_dialog_new_with_buttons(_("Search location"),
+-                                            parent,
+-                                            GTK_DIALOG_MODAL |
+-                                            GTK_DIALOG_DESTROY_WITH_PARENT,
+-                                            _("Cancel"),
+-                                            GTK_RESPONSE_REJECT,
+-                                            _("OK"),
+-                                            GTK_RESPONSE_ACCEPT,
+-                                            NULL);
++        xfce_titled_dialog_new_with_mixed_buttons(_("Search location"),
++                                                  parent,
++                                                  GTK_DIALOG_MODAL |
++                                                  GTK_DIALOG_DESTROY_WITH_PARENT,
++                                                  "",
++                                                  _("Cancel"),
++                                                  GTK_RESPONSE_REJECT,
++                                                  "",
++                                                  _("OK"),
++                                                  GTK_RESPONSE_ACCEPT,
++                                                  NULL);
+     gtk_dialog_set_response_sensitive(GTK_DIALOG(dialog->dialog),
+                                       GTK_RESPONSE_ACCEPT, FALSE);
+     gtk_window_set_icon_name(GTK_WINDOW(dialog->dialog), "edit-find");
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0002-parsers-Generalise-input-to-array-of-gchar.patch b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0002-parsers-Generalise-input-to-array-of-gchar.patch
new file mode 100644
index 0000000000..a76a7741bf
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0002-parsers-Generalise-input-to-array-of-gchar.patch
@@ -0,0 +1,289 @@
+From 3c095487e3a6c14f2900762c18c6e2170d22a283 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C4=90o=C3=A0n=20Tr=E1=BA=A7n=20C=C3=B4ng=20Danh?=
+ <congdanhqx@gmail.com>
+Date: Fri, 1 Mar 2024 21:56:34 +0700
+Subject: [PATCH 2/5] parsers: Generalise input to array of gchar
+
+In a later change, we will move to libsoup-3.0, which doesn't expose
+`response_body' in SoupMessage.
+
+Prepare for that move.
+
+Upstream-Status: Backport [https://github.com/xfce-mirror/xfce4-weather-plugin/commit/3c095487e3a6c14f2900762c18c6e2170d22a283]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ panel-plugin/weather-config.c  | 18 +++++++++++++++--
+ panel-plugin/weather-parsers.c | 36 ++++++++++++++++++----------------
+ panel-plugin/weather-parsers.h |  7 +++----
+ panel-plugin/weather-search.c  | 18 +++++++++++++++--
+ panel-plugin/weather.c         | 26 ++++++++++++++++++++----
+ 5 files changed, 76 insertions(+), 29 deletions(-)
+
+diff --git a/panel-plugin/weather-config.c b/panel-plugin/weather-config.c
+index 2645408..19fa1d8 100644
+--- a/panel-plugin/weather-config.c
++++ b/panel-plugin/weather-config.c
+@@ -245,6 +245,13 @@ cb_lookup_altitude(SoupSession *session,
+     xfceweather_dialog *dialog = (xfceweather_dialog *) user_data;
+     xml_altitude *altitude;
+     gdouble alt = 0;
++    const gchar *body = NULL;
++    gsize len = 0;
++
++    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++        body = msg->response_body->data;
++        len = msg->response_body->length;
++    }
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -252,7 +259,7 @@ cb_lookup_altitude(SoupSession *session,
+     }
+ 
+     altitude = (xml_altitude *)
+-        parse_xml_document(msg, (XmlParseFunc) parse_altitude);
++        parse_xml_document(body, len, (XmlParseFunc) parse_altitude);
+ 
+     if (altitude) {
+         alt = string_to_double(altitude->altitude, -9999);
+@@ -274,6 +281,13 @@ cb_lookup_timezone(SoupSession *session,
+ {
+     xfceweather_dialog *dialog = (xfceweather_dialog *) user_data;
+     xml_timezone *xml_tz;
++    const gchar *body = NULL;
++    gsize len = 0;
++
++    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++        body = msg->response_body->data;
++        len = msg->response_body->length;
++    }
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -281,7 +295,7 @@ cb_lookup_timezone(SoupSession *session,
+     }
+ 
+     xml_tz = (xml_timezone *)
+-        parse_xml_document(msg, (XmlParseFunc) parse_timezone);
++        parse_xml_document(body, len, (XmlParseFunc) parse_timezone);
+     weather_dump(weather_dump_timezone, xml_tz);
+ 
+     if (xml_tz) {
+diff --git a/panel-plugin/weather-parsers.c b/panel-plugin/weather-parsers.c
+index d53a2bc..28934c4 100644
+--- a/panel-plugin/weather-parsers.c
++++ b/panel-plugin/weather-parsers.c
+@@ -791,49 +791,51 @@ parse_timezone(xmlNode *cur_node)
+ 
+ 
+ xmlDoc *
+-get_xml_document(SoupMessage *msg)
++get_xml_document(const gchar *data, gsize len)
+ {
+-    if (G_LIKELY(msg && msg->response_body && msg->response_body->data)) {
+-        if (g_utf8_validate(msg->response_body->data, -1, NULL)) {
++    if (G_LIKELY(data && len)) {
++        if (g_utf8_validate(data, len, NULL)) {
+             /* force parsing as UTF-8, the XML encoding header may lie */
+-            return xmlReadMemory(msg->response_body->data,
+-                                 strlen(msg->response_body->data),
++            return xmlReadMemory(data, len,
+                                  NULL, "UTF-8", 0);
+         } else {
+-            return xmlParseMemory(msg->response_body->data,
+-                                  strlen(msg->response_body->data));
++            return xmlParseMemory(data, len);
+         }
+     }
+     return NULL;
+ }
+ 
+ json_object *
+-get_json_tree(SoupMessage *msg)
++get_json_tree(const gchar *data, gsize len)
+ {
+     json_object *res=NULL;
+-    enum json_tokener_error err;
++    struct json_tokener *tok = json_tokener_new();
+ 
+-    if (G_LIKELY(msg && msg->response_body && msg->response_body->data)) {
+-        res =  json_tokener_parse_verbose(msg->response_body->data, &err);
+-        if (err != json_tokener_success)
+-            g_warning("get_json_tree: error =%d",err);
++    if (G_UNLIKELY(tok == NULL)) {
++        return NULL;
++    } else if (G_LIKELY(data && len)) {
++        res =  json_tokener_parse_ex(tok, data, len);
++        if (res == NULL)
++            g_warning("get_json_tree: error =%d",
++                      json_tokener_get_error(tok));
+     }
++    json_tokener_free(tok);
+     return res;
+ }
+ 
+ gpointer
+-parse_xml_document(SoupMessage *msg,
++parse_xml_document(const gchar *data, gsize len,
+                    XmlParseFunc parse_func)
+ {
+     xmlDoc *doc;
+     xmlNode *root_node;
+     gpointer user_data = NULL;
+ 
+-    g_assert(msg != NULL);
+-    if (G_UNLIKELY(msg == NULL))
++    g_assert(data != NULL);
++    if (G_UNLIKELY(data == NULL || len == 0))
+         return NULL;
+ 
+-    doc = get_xml_document(msg);
++    doc = get_xml_document(data, len);
+     if (G_LIKELY(doc)) {
+         root_node = xmlDocGetRootElement(doc);
+         if (G_LIKELY(root_node))
+diff --git a/panel-plugin/weather-parsers.h b/panel-plugin/weather-parsers.h
+index a9d019d..09b9c02 100644
+--- a/panel-plugin/weather-parsers.h
++++ b/panel-plugin/weather-parsers.h
+@@ -22,7 +22,6 @@
+ #include <glib.h>
+ #include <gtk/gtk.h>
+ #include <libxml/parser.h>
+-#include <libsoup/soup.h>
+ #include <json-c/json_tokener.h>
+ 
+ #define DATA_EXPIRY_TIME (24 * 3600)
+@@ -157,11 +156,11 @@ xml_astro *get_astro(const GArray *astrodata,
+                      const time_t day_t,
+                      guint *index);
+ 
+-xmlDoc *get_xml_document(SoupMessage *msg);
++xmlDoc *get_xml_document(const gchar *data, gsize len);
+ 
+-json_object *get_json_tree(SoupMessage *msg);
++json_object *get_json_tree(const gchar *data, gsize len);
+ 
+-gpointer parse_xml_document(SoupMessage *msg,
++gpointer parse_xml_document(const gchar *data, gsize len,
+                             XmlParseFunc parse_func);
+ 
+ xml_astro *xml_astro_copy(const xml_astro *src);
+diff --git a/panel-plugin/weather-search.c b/panel-plugin/weather-search.c
+index 7e87ae8..6a2ba1f 100644
+--- a/panel-plugin/weather-search.c
++++ b/panel-plugin/weather-search.c
+@@ -89,6 +89,13 @@ cb_searchdone(SoupSession *session,
+     gint found = 0;
+     GtkTreeIter iter;
+     GtkTreeSelection *selection;
++    const gchar *body = NULL;
++    gsize len = 0;
++
++    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++        body = msg->response_body->data;
++        len = msg->response_body->length;
++    }
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -97,7 +104,7 @@ cb_searchdone(SoupSession *session,
+ 
+     gtk_widget_set_sensitive(dialog->find_button, TRUE);
+ 
+-    doc = get_xml_document(msg);
++    doc = get_xml_document(body, len);
+     if (!doc)
+         return;
+ 
+@@ -385,6 +392,13 @@ cb_geolocation(SoupSession *session,
+     xml_geolocation *geo;
+     gchar *full_loc;
+     units_config *units;
++    const gchar *body = NULL;
++    gsize len = 0;
++
++    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++        body = msg->response_body->data;
++        len = msg->response_body->length;
++    }
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -392,7 +406,7 @@ cb_geolocation(SoupSession *session,
+     }
+ 
+     geo = (xml_geolocation *)
+-        parse_xml_document(msg, (XmlParseFunc) parse_geolocation);
++        parse_xml_document(body, len, (XmlParseFunc) parse_geolocation);
+     weather_dump(weather_dump_geolocation, geo);
+ 
+     if (!geo) {
+diff --git a/panel-plugin/weather.c b/panel-plugin/weather.c
+index 0a92b4e..b75c633 100644
+--- a/panel-plugin/weather.c
++++ b/panel-plugin/weather.c
+@@ -489,11 +489,17 @@ cb_astro_update_sun(SoupSession *session,
+     json_object *json_tree;
+     time_t now_t;
+     guint astro_forecast_days;
++    const gchar *body = NULL;
++    gsize len = 0;
+ 
+     data->msg_parse->sun_msg_processed++;
+     data->astro_update->http_status_code = msg->status_code;
+     if ((msg->status_code == 200 || msg->status_code == 203)) {
+-        json_tree = get_json_tree(msg);
++        if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++            body = msg->response_body->data;
++            len = msg->response_body->length;
++        }
++        json_tree = get_json_tree(body, len);
+         if (G_LIKELY(json_tree)) {
+             if (!parse_astrodata_sun(json_tree, data->astrodata))  {
+                 data->msg_parse->sun_msg_parse_error++;
+@@ -545,11 +551,17 @@ cb_astro_update_moon(SoupSession *session,
+     json_object *json_tree;
+     time_t now_t;
+     guint astro_forecast_days;
++    const gchar *body = NULL;
++    gsize len = 0;
+ 
+     data->msg_parse->moon_msg_processed++;
+     data->astro_update->http_status_code = msg->status_code;
+     if ((msg->status_code == 200 || msg->status_code == 203)) {
+-        json_tree = get_json_tree(msg);
++        if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++            body = msg->response_body->data;
++            len = msg->response_body->length;
++        }
++        json_tree = get_json_tree(body, len);
+         if (G_LIKELY(json_tree)) {
+             if (!parse_astrodata_moon(json_tree, data->astrodata))  {
+                 data->msg_parse->moon_msg_parse_error++;
+@@ -606,17 +618,23 @@ cb_weather_update(SoupSession *session,
+                   gpointer user_data)
+ {
+     plugin_data *data = user_data;
+-    xmlDoc *doc;
++    xmlDoc *doc = NULL;
+     xmlNode *root_node;
+     time_t now_t;
+     gboolean parsing_error = TRUE;
++    const gchar *body = NULL;
++    gsize len = 0;
+ 
+     weather_debug("Processing downloaded weather data.");
+     time(&now_t);
+     data->weather_update->attempt++;
+     data->weather_update->http_status_code = msg->status_code;
+     if (msg->status_code == 200 || msg->status_code == 203) {
+-        doc = get_xml_document(msg);
++        if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++            body = msg->response_body->data;
++            len = msg->response_body->length;
++        }
++        doc = get_xml_document(body, len);
+         if (G_LIKELY(doc)) {
+             root_node = xmlDocGetRootElement(doc);
+             if (G_LIKELY(root_node))
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0003-libsoup-Port-to-libsoup-3.0.patch b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0003-libsoup-Port-to-libsoup-3.0.patch
new file mode 100644
index 0000000000..3970df672b
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0003-libsoup-Port-to-libsoup-3.0.patch
@@ -0,0 +1,563 @@
+From 05b3ab7c755d7a6667852576ed11944304acdd4a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C4=90o=C3=A0n=20Tr=E1=BA=A7n=20C=C3=B4ng=20Danh?=
+ <congdanhqx@gmail.com>
+Date: Fri, 1 Mar 2024 21:56:34 +0700
+Subject: [PATCH 3/5] libsoup: Port to libsoup-3.0
+
+Upstream-Status: Backport [https://github.com/xfce-mirror/xfce4-weather-plugin/commit/05b3ab7c755d7a6667852576ed11944304acdd4a]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ README                         |   4 +-
+ configure.ac                   |   2 +-
+ panel-plugin/weather-config.c  |  32 ++++---
+ panel-plugin/weather-search.c  |  37 ++++++---
+ panel-plugin/weather-summary.c |  23 ++++--
+ panel-plugin/weather.c         | 147 +++++++++++++++------------------
+ panel-plugin/weather.h         |   2 +-
+ 7 files changed, 132 insertions(+), 115 deletions(-)
+
+diff --git a/README b/README
+index 6587581..3530b1f 100644
+--- a/README
++++ b/README
+@@ -152,10 +152,10 @@ using gdb or any other debugger should the plugin crash:
+ BUILD REQUIREMENTS AND DEPENDENCIES
+ ==========================================================================
+ To be able to build the plugin, the following requirements have to be
+-met in addition to those of XFCE-4.14:
++met in addition to those of XFCE-4.16:
+ 
+ * >=libxml-2.4.0
+-* >=libsoup-2.42.0
++* >=libsoup-3.0.0
+ * >=upower-0.9.0 (optional)
+ 
+ You might also need developer libraries necessary for building other
+diff --git a/configure.ac b/configure.ac
+index cf82b7e..15e8b46 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,7 +70,7 @@ XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-2], [4.16.0])
+ XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-2.0], [4.14.0])
+ XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.12.0])
+ XDT_CHECK_PACKAGE([LIBXML], [libxml-2.0], [2.4.0])
+-XDT_CHECK_PACKAGE([SOUP], [libsoup-2.4], [2.42.0])
++XDT_CHECK_PACKAGE([SOUP], [libsoup-3.0], [3.0.0])
+ XDT_CHECK_PACKAGE([JSON], [json-c], [0.13.1])
+ XDT_CHECK_OPTIONAL_PACKAGE([UPOWER_GLIB], [upower-glib], [0.9.0], [upower],
+                            [upower for adapting update interval to power state])
+diff --git a/panel-plugin/weather-config.c b/panel-plugin/weather-config.c
+index 19fa1d8..d27c825 100644
+--- a/panel-plugin/weather-config.c
++++ b/panel-plugin/weather-config.c
+@@ -238,8 +238,8 @@ sanitize_location_name(const gchar *location_name)
+ 
+ 
+ static void
+-cb_lookup_altitude(SoupSession *session,
+-                   SoupMessage *msg,
++cb_lookup_altitude(GObject *source,
++                   GAsyncResult *result,
+                    gpointer user_data)
+ {
+     xfceweather_dialog *dialog = (xfceweather_dialog *) user_data;
+@@ -247,11 +247,14 @@ cb_lookup_altitude(SoupSession *session,
+     gdouble alt = 0;
+     const gchar *body = NULL;
+     gsize len = 0;
++    GError *error = NULL;
++    GBytes *response =
++        soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+ 
+-    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
+-        body = msg->response_body->data;
+-        len = msg->response_body->length;
+-    }
++    if (G_UNLIKELY(error))
++        g_error_free(error);
++    else
++        body = g_bytes_get_data(response, &len);
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -271,23 +274,27 @@ cb_lookup_altitude(SoupSession *session,
+     else if (dialog->pd->units->altitude == FEET)
+         alt /= 0.3048;
+     gtk_spin_button_set_value(GTK_SPIN_BUTTON(dialog->spin_alt), alt);
++    g_bytes_unref(response);
+ }
+ 
+ 
+ static void
+-cb_lookup_timezone(SoupSession *session,
+-                   SoupMessage *msg,
++cb_lookup_timezone(GObject *source,
++                   GAsyncResult *result,
+                    gpointer user_data)
+ {
+     xfceweather_dialog *dialog = (xfceweather_dialog *) user_data;
+     xml_timezone *xml_tz;
+     const gchar *body = NULL;
+     gsize len = 0;
++    GError *error = NULL;
++    GBytes *response =
++        soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+ 
+-    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
+-        body = msg->response_body->data;
+-        len = msg->response_body->length;
+-    }
++    if (G_UNLIKELY(error))
++        g_error_free(error);
++    else
++        body = g_bytes_get_data(response, &len);
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -304,6 +311,7 @@ cb_lookup_timezone(SoupSession *session,
+         xml_timezone_free(xml_tz);
+     } else
+         gtk_entry_set_text(GTK_ENTRY(dialog->text_timezone), "");
++    g_bytes_unref(response);
+ }
+ 
+ 
+diff --git a/panel-plugin/weather-search.c b/panel-plugin/weather-search.c
+index 6a2ba1f..e030ff8 100644
+--- a/panel-plugin/weather-search.c
++++ b/panel-plugin/weather-search.c
+@@ -78,8 +78,8 @@ sanitize_str(const gchar *str)
+ 
+ 
+ static void
+-cb_searchdone(SoupSession *session,
+-              SoupMessage *msg,
++cb_searchdone(GObject *source,
++              GAsyncResult *result,
+               gpointer user_data)
+ {
+     search_dialog *dialog = (search_dialog *) user_data;
+@@ -91,11 +91,14 @@ cb_searchdone(SoupSession *session,
+     GtkTreeSelection *selection;
+     const gchar *body = NULL;
+     gsize len = 0;
++    GError *error = NULL;
++    GBytes *response =
++        soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+ 
+-    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
+-        body = msg->response_body->data;
+-        len = msg->response_body->length;
+-    }
++    if (G_UNLIKELY(error))
++        g_error_free(error);
++    else
++        body = g_bytes_get_data(response, &len);
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -105,8 +108,10 @@ cb_searchdone(SoupSession *session,
+     gtk_widget_set_sensitive(dialog->find_button, TRUE);
+ 
+     doc = get_xml_document(body, len);
+-    if (!doc)
++    if (!doc) {
++        g_bytes_unref(response);
+         return;
++    }
+ 
+     cur_node = xmlDocGetRootElement(doc);
+     if (cur_node) {
+@@ -140,6 +145,7 @@ cb_searchdone(SoupSession *session,
+         }
+ 
+     gtk_tree_view_column_set_title(dialog->column, _("Results"));
++    g_bytes_unref(response);
+ }
+ 
+ 
+@@ -384,8 +390,8 @@ get_preferred_units(const gchar *country_code)
+ 
+ 
+ static void
+-cb_geolocation(SoupSession *session,
+-               SoupMessage *msg,
++cb_geolocation(GObject *source,
++               GAsyncResult *result,
+                gpointer user_data)
+ {
+     geolocation_data *data = (geolocation_data *) user_data;
+@@ -394,11 +400,14 @@ cb_geolocation(SoupSession *session,
+     units_config *units;
+     const gchar *body = NULL;
+     gsize len = 0;
++    GError *error = NULL;
++    GBytes *response =
++        soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+ 
+-    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
+-        body = msg->response_body->data;
+-        len = msg->response_body->length;
+-    }
++    if (G_UNLIKELY(error))
++        g_error_free(error);
++    else
++        body = g_bytes_get_data(response, &len);
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -411,6 +420,7 @@ cb_geolocation(SoupSession *session,
+ 
+     if (!geo) {
+         data->cb(NULL, NULL, NULL, NULL, data->user_data);
++        g_bytes_unref(response);
+         g_free(data);
+         return;
+     }
+@@ -441,6 +451,7 @@ cb_geolocation(SoupSession *session,
+     g_slice_free(units_config, units);
+     xml_geolocation_free(geo);
+     g_free(full_loc);
++    g_bytes_unref(response);
+     g_free(data);
+ }
+ 
+diff --git a/panel-plugin/weather-summary.c b/panel-plugin/weather-summary.c
+index a6a2f56..224bb34 100644
+--- a/panel-plugin/weather-summary.c
++++ b/panel-plugin/weather-summary.c
+@@ -234,22 +234,29 @@ get_logo_path(void)
+ 
+ 
+ static void
+-logo_fetched(SoupSession *session,
+-             SoupMessage *msg,
++logo_fetched(GObject *source,
++             GAsyncResult *result,
+              gpointer user_data)
+ {
+-    if (msg && msg->response_body && msg->response_body->length > 0) {
++    GError *error = NULL;
++    GBytes *response =
++        soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
++
++    if (G_LIKELY(error == NULL)) {
++        gsize len = 0;
++        const gchar *body = g_bytes_get_data(response, &len);
+         gchar *path = get_logo_path();
+-        GError *error = NULL;
+         GdkPixbuf *pixbuf = NULL;
+         gint scale_factor;
+-        if (!g_file_set_contents(path, msg->response_body->data,
+-                                 msg->response_body->length, &error)) {
++        g_file_set_contents(path, body, len, &error);
++        g_bytes_unref(response);
++        if (error) {
+             g_warning("Error downloading met.no logo image to %s, "
+                       "reason: %s\n", path,
+                       error ? error->message : "unknown");
+             g_error_free(error);
+             g_free(path);
++            g_bytes_unref(response);
+             return;
+         }
+         scale_factor = gtk_widget_get_scale_factor(user_data);
+@@ -261,7 +268,9 @@ logo_fetched(SoupSession *session,
+             cairo_surface_destroy(surface);
+             g_object_unref(pixbuf);
+         }
+-    }
++        g_bytes_unref(response);
++    } else
++        g_error_free(error);
+ }
+ 
+ 
+diff --git a/panel-plugin/weather.c b/panel-plugin/weather.c
+index b75c633..1a84537 100644
+--- a/panel-plugin/weather.c
++++ b/panel-plugin/weather.c
+@@ -23,6 +23,8 @@
+ #include <string.h>
+ #include <sys/stat.h>
+ 
++#include <glib.h>
++
+ #include <libxfce4util/libxfce4util.h>
+ #include <libxfce4ui/libxfce4ui.h>
+ #include <xfconf/xfconf.h>
+@@ -106,13 +108,14 @@ static void schedule_next_wakeup(plugin_data *data);
+ void
+ weather_http_queue_request(SoupSession *session,
+                            const gchar *uri,
+-                           SoupSessionCallback callback_func,
++                           GAsyncReadyCallback callback_func,
+                            gpointer user_data)
+ {
+     SoupMessage *msg;
+ 
+     msg = soup_message_new("GET", uri);
+-    soup_session_queue_message(session, msg, callback_func, user_data);
++    soup_session_send_and_read_async(session, msg, G_PRIORITY_DEFAULT, NULL,
++                                     callback_func, user_data);
+ }
+ 
+ 
+@@ -481,8 +484,8 @@ calc_next_download_time(const update_info *upi,
+  * Process downloaded sun astro data and schedule next astro update.
+  */
+ static void
+-cb_astro_update_sun(SoupSession *session,
+-                    SoupMessage *msg,
++cb_astro_update_sun(GObject *source,
++                    GAsyncResult *result,
+                     gpointer user_data)
+ {
+     plugin_data *data = user_data;
+@@ -491,14 +494,17 @@ cb_astro_update_sun(SoupSession *session,
+     guint astro_forecast_days;
+     const gchar *body = NULL;
+     gsize len = 0;
++    SoupMessage *msg;
++    GError *error = NULL;
++    GBytes *response;
+ 
++    msg = soup_session_get_async_result_message(SOUP_SESSION(source), result);
+     data->msg_parse->sun_msg_processed++;
+-    data->astro_update->http_status_code = msg->status_code;
+-    if ((msg->status_code == 200 || msg->status_code == 203)) {
+-        if (G_LIKELY(msg->response_body && msg->response_body->data)) {
+-            body = msg->response_body->data;
+-            len = msg->response_body->length;
+-        }
++    data->astro_update->http_status_code = soup_message_get_status(msg);
++    response = soup_session_send_and_read_finish(SOUP_SESSION(source),
++                                                 result, &error);
++    if (G_LIKELY(error == NULL)) {
++        body = g_bytes_get_data(response, &len);
+         json_tree = get_json_tree(body, len);
+         if (G_LIKELY(json_tree)) {
+             if (!parse_astrodata_sun(json_tree, data->astrodata))  {
+@@ -514,10 +520,12 @@ cb_astro_update_sun(SoupSession *session,
+             g_warning("Error parsing sun astronomical data!");
+             weather_debug("No json_tree");
+         }
++        g_bytes_unref(response);
+     } else {
+         data->msg_parse->http_msg_fail = TRUE;
+-        g_warning_once("Download of sun astronomical data failed with HTTP Status Code %d, Reason phrase: %s",
+-                       msg->status_code, msg->reason_phrase);
++        g_warning_once("Download of sun astronomical data failed: %s",
++                       error->message);
++        g_error_free(error);
+     }
+ 
+     astro_forecast_days = data->forecast_days + 1;
+@@ -543,8 +551,8 @@ cb_astro_update_sun(SoupSession *session,
+  * Process downloaded moon astro data and schedule next astro update.
+  */
+ static void
+-cb_astro_update_moon(SoupSession *session,
+-                     SoupMessage *msg,
++cb_astro_update_moon(GObject *source,
++                     GAsyncResult *result,
+                      gpointer user_data)
+ {
+     plugin_data *data = user_data;
+@@ -553,14 +561,17 @@ cb_astro_update_moon(SoupSession *session,
+     guint astro_forecast_days;
+     const gchar *body = NULL;
+     gsize len = 0;
++    SoupMessage *msg;
++    GError *error = NULL;
++    GBytes *response;
+ 
++    response = soup_session_send_and_read_finish(SOUP_SESSION(source),
++                                                 result, &error);
++    msg = soup_session_get_async_result_message(SOUP_SESSION(source), result);
+     data->msg_parse->moon_msg_processed++;
+-    data->astro_update->http_status_code = msg->status_code;
+-    if ((msg->status_code == 200 || msg->status_code == 203)) {
+-        if (G_LIKELY(msg->response_body && msg->response_body->data)) {
+-            body = msg->response_body->data;
+-            len = msg->response_body->length;
+-        }
++    data->astro_update->http_status_code = soup_message_get_status(msg);
++    if (G_LIKELY(error == NULL)) {
++        body = g_bytes_get_data(response, &len);
+         json_tree = get_json_tree(body, len);
+         if (G_LIKELY(json_tree)) {
+             if (!parse_astrodata_moon(json_tree, data->astrodata))  {
+@@ -576,10 +587,12 @@ cb_astro_update_moon(SoupSession *session,
+             g_warning("Error parsing moon astronomical data");
+             weather_debug("No json_tree");
+         }
++        g_bytes_unref(response);
+     } else {
+         data->msg_parse->http_msg_fail = TRUE;
+-        g_warning_once("Download of moon astronomical data failed with HTTP Status Code %d, Reason phrase: %s",
+-                       msg->status_code, msg->reason_phrase);
++        g_warning_once("Download of moon astronomical data failed: %s",
++                       error->message);
++        g_error_free(error);
+     }
+ 
+     astro_forecast_days = data->forecast_days + 1;
+@@ -613,8 +626,8 @@ cb_astro_update_moon(SoupSession *session,
+  * Process downloaded weather data and schedule next weather update.
+  */
+ static void
+-cb_weather_update(SoupSession *session,
+-                  SoupMessage *msg,
++cb_weather_update(GObject *source,
++                  GAsyncResult *result,
+                   gpointer user_data)
+ {
+     plugin_data *data = user_data;
+@@ -624,16 +637,19 @@ cb_weather_update(SoupSession *session,
+     gboolean parsing_error = TRUE;
+     const gchar *body = NULL;
+     gsize len = 0;
++    SoupMessage *msg;
++    GError *error = NULL;
++    GBytes *response = NULL;
+ 
+     weather_debug("Processing downloaded weather data.");
++    response = soup_session_send_and_read_finish(SOUP_SESSION(source),
++                                                 result, &error);
++    msg = soup_session_get_async_result_message(SOUP_SESSION(source), result);
+     time(&now_t);
+     data->weather_update->attempt++;
+-    data->weather_update->http_status_code = msg->status_code;
+-    if (msg->status_code == 200 || msg->status_code == 203) {
+-        if (G_LIKELY(msg->response_body && msg->response_body->data)) {
+-            body = msg->response_body->data;
+-            len = msg->response_body->length;
+-        }
++    data->weather_update->http_status_code = soup_message_get_status(msg);
++    if (G_LIKELY(error == NULL)) {
++        body = g_bytes_get_data(response, &len);
+         doc = get_xml_document(body, len);
+         if (G_LIKELY(doc)) {
+             root_node = xmlDocGetRootElement(doc);
+@@ -645,12 +661,13 @@ cb_weather_update(SoupSession *session,
+                 }
+             xmlFreeDoc(doc);
+         }
++        g_bytes_unref(response);
+         if (parsing_error)
+             g_warning("Error parsing weather data!");
+-    } else
+-        weather_debug
+-            ("Download of weather data failed with HTTP Status Code %d, "
+-             "Reason phrase: %s", msg->status_code, msg->reason_phrase);
++    } else {
++        weather_debug("Download of weather data failed: %s", error->message);
++        g_error_free(error);
++    }
+     data->weather_update->next = calc_next_download_time(data->weather_update,
+                                                          now_t);
+ 
+@@ -1708,32 +1725,6 @@ mi_click(GtkWidget *widget,
+     update_weatherdata_with_reset(data);
+ }
+ 
+-static void
+-proxy_auth(SoupSession *session,
+-           SoupMessage *msg,
+-           SoupAuth *auth,
+-           gboolean retrying,
+-           gpointer user_data)
+-{
+-    SoupURI *soup_proxy_uri;
+-    const gchar *proxy_uri;
+-
+-    if (!retrying) {
+-        if (msg->status_code == SOUP_STATUS_PROXY_AUTHENTICATION_REQUIRED) {
+-            proxy_uri = g_getenv("HTTP_PROXY");
+-            if (!proxy_uri)
+-                proxy_uri = g_getenv("http_proxy");
+-            if (proxy_uri) {
+-                soup_proxy_uri = soup_uri_new(proxy_uri);
+-                soup_auth_authenticate(auth,
+-                                       soup_uri_get_user(soup_proxy_uri),
+-                                       soup_uri_get_password(soup_proxy_uri));
+-                soup_uri_free(soup_proxy_uri);
+-            }
+-        }
+-    }
+-}
+-
+ 
+ #ifdef HAVE_UPOWER_GLIB
+ static void
+@@ -2037,9 +2028,10 @@ static plugin_data *
+ xfceweather_create_control(XfcePanelPlugin *plugin)
+ {
+     plugin_data *data = g_slice_new0(plugin_data);
+-    SoupURI *soup_proxy_uri;
++    GProxyResolver *proxy_resolver;
+     const gchar *proxy_uri;
+-    const gchar *proxy_user;
++    const gchar *no_proxy;
++    gchar **no_proxy_lst = NULL;
+     GtkWidget *refresh;
+     cairo_surface_t *icon = NULL;
+     data_types lbl;
+@@ -2077,29 +2069,26 @@ xfceweather_create_control(XfcePanelPlugin *plugin)
+ 
+     /* Setup session for HTTP connections */
+     data->session = soup_session_new();
+-    g_object_set(data->session, SOUP_SESSION_USER_AGENT,
+-                 PACKAGE_NAME "-" PACKAGE_VERSION, NULL);
+-    g_object_set(data->session, SOUP_SESSION_TIMEOUT,
+-                 CONN_TIMEOUT, NULL);
++    soup_session_set_user_agent(data->session,
++                                PACKAGE_NAME "-" PACKAGE_VERSION);
++    soup_session_set_timeout(data->session, CONN_TIMEOUT);
+ 
+     /* Set the proxy URI from environment */
+     proxy_uri = g_getenv("HTTP_PROXY");
+     if (!proxy_uri)
+         proxy_uri = g_getenv("http_proxy");
+     if (proxy_uri) {
+-        soup_proxy_uri = soup_uri_new(proxy_uri);
+-        g_object_set(data->session, SOUP_SESSION_PROXY_URI,
+-                     soup_proxy_uri, NULL);
+-
+-        /* check if uri contains authentication info */
+-        proxy_user = soup_uri_get_user(soup_proxy_uri);
+-        if (proxy_user && strlen(proxy_user) > 0) {
+-            g_signal_connect(G_OBJECT(data->session), "authenticate",
+-                             G_CALLBACK(proxy_auth), NULL);
+-        }
+-
+-        soup_uri_free(soup_proxy_uri);
+-    }
++        no_proxy = g_getenv("no_proxy");
++        if (!no_proxy)
++            no_proxy = g_getenv("NO_PROXY");
++        if (no_proxy)
++            no_proxy_lst = g_strsplit(no_proxy, ",", -1);
++        proxy_resolver = g_simple_proxy_resolver_new(proxy_uri, no_proxy_lst);
++        g_strfreev(no_proxy_lst);
++        soup_session_set_proxy_resolver(data->session, proxy_resolver);
++        g_object_unref(proxy_resolver);
++    }
++    /* Otherwise, g_proxy_resolver_get_default() will be used */
+ 
+     data->scrollbox = gtk_scrollbox_new();
+ 
+diff --git a/panel-plugin/weather.h b/panel-plugin/weather.h
+index 208de09..01974ce 100644
+--- a/panel-plugin/weather.h
++++ b/panel-plugin/weather.h
+@@ -183,7 +183,7 @@ extern gboolean debug_mode;
+ 
+ void weather_http_queue_request(SoupSession *session,
+                                 const gchar *uri,
+-                                SoupSessionCallback callback_func,
++                                GAsyncReadyCallback callback_func,
+                                 gpointer user_data);
+ 
+ void scrollbox_set_visible(plugin_data *data);
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0004-Report-UPower-Glib-support.patch b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0004-Report-UPower-Glib-support.patch
new file mode 100644
index 0000000000..d7ee7b8135
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0004-Report-UPower-Glib-support.patch
@@ -0,0 +1,20 @@
+From 34ac536970d2e9f3c3f8ffd691d6a8ef6f434b1a Mon Sep 17 00:00:00 2001
+From: Andrzej Radecki <andrzejr@xfce.org>
+Date: Sun, 10 Nov 2024 16:24:28 +0000
+Subject: [PATCH 4/5] Report UPower Glib support
+
+Upstream-Status: Submitted [Upstream-Status: Backport [https://github.com/xfce-mirror/xfce4-weather-plugin/commit/34ac536970d2e9f3c3f8ffd691d6a8ef6f434b1a]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 15e8b46..da98a5e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -120,3 +120,4 @@ echo
+ echo "Build Configuration:"
+ echo
+ echo "* Debug Support:             $enable_debug"
++echo "* UPower Glib Support:       ${UPOWER_GLIB_FOUND:-no}"
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0005-Make-libsoup-v3-support-optional.patch b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0005-Make-libsoup-v3-support-optional.patch
new file mode 100644
index 0000000000..46042154f9
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin/0005-Make-libsoup-v3-support-optional.patch
@@ -0,0 +1,626 @@
+From 663c416c59ea8e063d4b5a181104f26e4bd1658c Mon Sep 17 00:00:00 2001
+From: Andrzej Radecki <andrzejr@xfce.org>
+Date: Sun, 10 Nov 2024 16:29:21 +0000
+Subject: [PATCH 5/5] Make libsoup v3 support optional
+
+The plugin still targets Xfce4.16 and its contemporary is libsoup-2.4.
+This commit is to be reverted when support for libsoup-2.4 is
+no longer needed as all the #if's make the libsoup code less maintainable.
+
+Upstream-Status: Submitted [Upstream-Status: Backport [https://github.com/xfce-mirror/xfce4-weather-plugin/commit/663c416c59ea8e063d4b5a181104f26e4bd1658c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                   |   5 +-
+ panel-plugin/weather-config.c  |  28 +++++++
+ panel-plugin/weather-search.c  |  32 ++++++++
+ panel-plugin/weather-summary.c |  21 +++++
+ panel-plugin/weather.c         | 140 ++++++++++++++++++++++++++++++++-
+ panel-plugin/weather.h         |   4 +
+ 6 files changed, 225 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index da98a5e..f60ad64 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,7 +70,9 @@ XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-2], [4.16.0])
+ XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-2.0], [4.14.0])
+ XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.12.0])
+ XDT_CHECK_PACKAGE([LIBXML], [libxml-2.0], [2.4.0])
+-XDT_CHECK_PACKAGE([SOUP], [libsoup-3.0], [3.0.0])
++dnl XDT_CHECK_PACKAGE([SOUP], [libsoup-3.0], [3.0.0])
++XDT_CHECK_PACKAGE([SOUP], [libsoup-3.0], [3.0.0], [],
++                          [XDT_CHECK_PACKAGE([SOUP], [libsoup-2.4], [2.42.0])])
+ XDT_CHECK_PACKAGE([JSON], [json-c], [0.13.1])
+ XDT_CHECK_OPTIONAL_PACKAGE([UPOWER_GLIB], [upower-glib], [0.9.0], [upower],
+                            [upower for adapting update interval to power state])
+@@ -121,3 +123,4 @@ echo "Build Configuration:"
+ echo
+ echo "* Debug Support:             $enable_debug"
+ echo "* UPower Glib Support:       ${UPOWER_GLIB_FOUND:-no}"
++echo "* Soup Version:              ${SOUP_VERSION:-no}"
+diff --git a/panel-plugin/weather-config.c b/panel-plugin/weather-config.c
+index d27c825..1035ddd 100644
+--- a/panel-plugin/weather-config.c
++++ b/panel-plugin/weather-config.c
+@@ -238,8 +238,13 @@ sanitize_location_name(const gchar *location_name)
+ 
+ 
+ static void
++#if SOUP_CHECK_VERSION(3, 0, 0)
+ cb_lookup_altitude(GObject *source,
+                    GAsyncResult *result,
++#else
++cb_lookup_altitude(SoupSession *session,
++                   SoupMessage *msg,
++#endif
+                    gpointer user_data)
+ {
+     xfceweather_dialog *dialog = (xfceweather_dialog *) user_data;
+@@ -247,6 +252,7 @@ cb_lookup_altitude(GObject *source,
+     gdouble alt = 0;
+     const gchar *body = NULL;
+     gsize len = 0;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     GError *error = NULL;
+     GBytes *response =
+         soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+@@ -255,6 +261,12 @@ cb_lookup_altitude(GObject *source,
+         g_error_free(error);
+     else
+         body = g_bytes_get_data(response, &len);
++#else
++    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++        body = msg->response_body->data;
++        len = msg->response_body->length;
++    }
++#endif
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -274,19 +286,27 @@ cb_lookup_altitude(GObject *source,
+     else if (dialog->pd->units->altitude == FEET)
+         alt /= 0.3048;
+     gtk_spin_button_set_value(GTK_SPIN_BUTTON(dialog->spin_alt), alt);
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     g_bytes_unref(response);
++#endif
+ }
+ 
+ 
+ static void
++#if SOUP_CHECK_VERSION(3, 0, 0)
+ cb_lookup_timezone(GObject *source,
+                    GAsyncResult *result,
++#else
++cb_lookup_timezone(SoupSession *session,
++                   SoupMessage *msg,
++#endif
+                    gpointer user_data)
+ {
+     xfceweather_dialog *dialog = (xfceweather_dialog *) user_data;
+     xml_timezone *xml_tz;
+     const gchar *body = NULL;
+     gsize len = 0;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     GError *error = NULL;
+     GBytes *response =
+         soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+@@ -295,6 +315,12 @@ cb_lookup_timezone(GObject *source,
+         g_error_free(error);
+     else
+         body = g_bytes_get_data(response, &len);
++#else
++    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++        body = msg->response_body->data;
++        len = msg->response_body->length;
++    }
++#endif
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -311,7 +337,9 @@ cb_lookup_timezone(GObject *source,
+         xml_timezone_free(xml_tz);
+     } else
+         gtk_entry_set_text(GTK_ENTRY(dialog->text_timezone), "");
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     g_bytes_unref(response);
++#endif
+ }
+ 
+ 
+diff --git a/panel-plugin/weather-search.c b/panel-plugin/weather-search.c
+index e030ff8..b07627e 100644
+--- a/panel-plugin/weather-search.c
++++ b/panel-plugin/weather-search.c
+@@ -78,8 +78,13 @@ sanitize_str(const gchar *str)
+ 
+ 
+ static void
++#if SOUP_CHECK_VERSION(3, 0, 0)
+ cb_searchdone(GObject *source,
+               GAsyncResult *result,
++#else
++cb_searchdone(SoupSession *session,
++              SoupMessage *msg,
++#endif
+               gpointer user_data)
+ {
+     search_dialog *dialog = (search_dialog *) user_data;
+@@ -91,6 +96,7 @@ cb_searchdone(GObject *source,
+     GtkTreeSelection *selection;
+     const gchar *body = NULL;
+     gsize len = 0;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     GError *error = NULL;
+     GBytes *response =
+         soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+@@ -99,6 +105,12 @@ cb_searchdone(GObject *source,
+         g_error_free(error);
+     else
+         body = g_bytes_get_data(response, &len);
++#else
++    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++        body = msg->response_body->data;
++        len = msg->response_body->length;
++    }
++#endif
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -109,7 +121,9 @@ cb_searchdone(GObject *source,
+ 
+     doc = get_xml_document(body, len);
+     if (!doc) {
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         g_bytes_unref(response);
++#endif
+         return;
+     }
+ 
+@@ -145,7 +159,9 @@ cb_searchdone(GObject *source,
+         }
+ 
+     gtk_tree_view_column_set_title(dialog->column, _("Results"));
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     g_bytes_unref(response);
++#endif
+ }
+ 
+ 
+@@ -390,8 +406,13 @@ get_preferred_units(const gchar *country_code)
+ 
+ 
+ static void
++#if SOUP_CHECK_VERSION(3, 0, 0)
+ cb_geolocation(GObject *source,
+                GAsyncResult *result,
++#else
++cb_geolocation(SoupSession *session,
++               SoupMessage *msg,
++#endif
+                gpointer user_data)
+ {
+     geolocation_data *data = (geolocation_data *) user_data;
+@@ -400,6 +421,7 @@ cb_geolocation(GObject *source,
+     units_config *units;
+     const gchar *body = NULL;
+     gsize len = 0;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     GError *error = NULL;
+     GBytes *response =
+         soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+@@ -408,6 +430,12 @@ cb_geolocation(GObject *source,
+         g_error_free(error);
+     else
+         body = g_bytes_get_data(response, &len);
++#else
++    if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++        body = msg->response_body->data;
++        len = msg->response_body->length;
++    }
++#endif
+ 
+     if (global_dialog == NULL) {
+         weather_debug("%s called after dialog was destroyed", G_STRFUNC);
+@@ -420,7 +448,9 @@ cb_geolocation(GObject *source,
+ 
+     if (!geo) {
+         data->cb(NULL, NULL, NULL, NULL, data->user_data);
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         g_bytes_unref(response);
++#endif
+         g_free(data);
+         return;
+     }
+@@ -451,7 +481,9 @@ cb_geolocation(GObject *source,
+     g_slice_free(units_config, units);
+     xml_geolocation_free(geo);
+     g_free(full_loc);
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     g_bytes_unref(response);
++#endif
+     g_free(data);
+ }
+ 
+diff --git a/panel-plugin/weather-summary.c b/panel-plugin/weather-summary.c
+index 224bb34..8e79b0a 100644
+--- a/panel-plugin/weather-summary.c
++++ b/panel-plugin/weather-summary.c
+@@ -234,10 +234,16 @@ get_logo_path(void)
+ 
+ 
+ static void
++#if SOUP_CHECK_VERSION(3, 0, 0)
+ logo_fetched(GObject *source,
+              GAsyncResult *result,
++#else
++logo_fetched(SoupSession *session,
++             SoupMessage *msg,
++#endif
+              gpointer user_data)
+ {
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     GError *error = NULL;
+     GBytes *response =
+         soup_session_send_and_read_finish(SOUP_SESSION(source), result, &error);
+@@ -251,12 +257,23 @@ logo_fetched(GObject *source,
+         g_file_set_contents(path, body, len, &error);
+         g_bytes_unref(response);
+         if (error) {
++#else
++    if (msg && msg->response_body && msg->response_body->length > 0) {
++         gchar *path = get_logo_path();
++         GError *error = NULL;
++         GdkPixbuf *pixbuf = NULL;
++         gint scale_factor;
++         if (!g_file_set_contents(path, msg->response_body->data,
++                                  msg->response_body->length, &error)) {
++#endif
+             g_warning("Error downloading met.no logo image to %s, "
+                       "reason: %s\n", path,
+                       error ? error->message : "unknown");
+             g_error_free(error);
+             g_free(path);
++#if SOUP_CHECK_VERSION(3, 0, 0)
+             g_bytes_unref(response);
++#endif
+             return;
+         }
+         scale_factor = gtk_widget_get_scale_factor(user_data);
+@@ -268,9 +285,13 @@ logo_fetched(GObject *source,
+             cairo_surface_destroy(surface);
+             g_object_unref(pixbuf);
+         }
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         g_bytes_unref(response);
+     } else
+         g_error_free(error);
++#else
++    }
++#endif
+ }
+ 
+ 
+diff --git a/panel-plugin/weather.c b/panel-plugin/weather.c
+index 1a84537..db123fa 100644
+--- a/panel-plugin/weather.c
++++ b/panel-plugin/weather.c
+@@ -108,14 +108,22 @@ static void schedule_next_wakeup(plugin_data *data);
+ void
+ weather_http_queue_request(SoupSession *session,
+                            const gchar *uri,
++#if SOUP_CHECK_VERSION(3, 0, 0)
+                            GAsyncReadyCallback callback_func,
++#else
++                           SoupSessionCallback callback_func,
++#endif
+                            gpointer user_data)
+ {
+     SoupMessage *msg;
+ 
+     msg = soup_message_new("GET", uri);
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     soup_session_send_and_read_async(session, msg, G_PRIORITY_DEFAULT, NULL,
+                                      callback_func, user_data);
++#else
++    soup_session_queue_message(session, msg, callback_func, user_data);
++#endif
+ }
+ 
+ 
+@@ -484,8 +492,13 @@ calc_next_download_time(const update_info *upi,
+  * Process downloaded sun astro data and schedule next astro update.
+  */
+ static void
++#if SOUP_CHECK_VERSION(3, 0, 0)
+ cb_astro_update_sun(GObject *source,
+                     GAsyncResult *result,
++#else
++cb_astro_update_sun(SoupSession *session,
++                    SoupMessage *msg,
++#endif
+                     gpointer user_data)
+ {
+     plugin_data *data = user_data;
+@@ -494,6 +507,7 @@ cb_astro_update_sun(GObject *source,
+     guint astro_forecast_days;
+     const gchar *body = NULL;
+     gsize len = 0;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     SoupMessage *msg;
+     GError *error = NULL;
+     GBytes *response;
+@@ -505,6 +519,15 @@ cb_astro_update_sun(GObject *source,
+                                                  result, &error);
+     if (G_LIKELY(error == NULL)) {
+         body = g_bytes_get_data(response, &len);
++#else
++     data->msg_parse->sun_msg_processed++;
++     data->astro_update->http_status_code = msg->status_code;
++     if ((msg->status_code == 200 || msg->status_code == 203)) {
++         if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++             body = msg->response_body->data;
++             len = msg->response_body->length;
++         }
++#endif
+         json_tree = get_json_tree(body, len);
+         if (G_LIKELY(json_tree)) {
+             if (!parse_astrodata_sun(json_tree, data->astrodata))  {
+@@ -520,12 +543,19 @@ cb_astro_update_sun(GObject *source,
+             g_warning("Error parsing sun astronomical data!");
+             weather_debug("No json_tree");
+         }
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         g_bytes_unref(response);
+-    } else {
++#endif
++     } else {
+         data->msg_parse->http_msg_fail = TRUE;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         g_warning_once("Download of sun astronomical data failed: %s",
+                        error->message);
+         g_error_free(error);
++#else
++        g_warning_once("Download of sun astronomical data failed with HTTP Status Code %d, Reason phrase: %s",
++                       msg->status_code, msg->reason_phrase);
++#endif
+     }
+ 
+     astro_forecast_days = data->forecast_days + 1;
+@@ -551,8 +581,13 @@ cb_astro_update_sun(GObject *source,
+  * Process downloaded moon astro data and schedule next astro update.
+  */
+ static void
++#if SOUP_CHECK_VERSION(3, 0, 0)
+ cb_astro_update_moon(GObject *source,
+                      GAsyncResult *result,
++#else
++cb_astro_update_moon(SoupSession *session,
++                     SoupMessage *msg,
++#endif
+                      gpointer user_data)
+ {
+     plugin_data *data = user_data;
+@@ -561,6 +596,7 @@ cb_astro_update_moon(GObject *source,
+     guint astro_forecast_days;
+     const gchar *body = NULL;
+     gsize len = 0;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     SoupMessage *msg;
+     GError *error = NULL;
+     GBytes *response;
+@@ -572,6 +608,15 @@ cb_astro_update_moon(GObject *source,
+     data->astro_update->http_status_code = soup_message_get_status(msg);
+     if (G_LIKELY(error == NULL)) {
+         body = g_bytes_get_data(response, &len);
++#else
++     data->msg_parse->moon_msg_processed++;
++     data->astro_update->http_status_code = msg->status_code;
++     if ((msg->status_code == 200 || msg->status_code == 203)) {
++         if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++             body = msg->response_body->data;
++             len = msg->response_body->length;
++         }
++#endif
+         json_tree = get_json_tree(body, len);
+         if (G_LIKELY(json_tree)) {
+             if (!parse_astrodata_moon(json_tree, data->astrodata))  {
+@@ -587,13 +632,20 @@ cb_astro_update_moon(GObject *source,
+             g_warning("Error parsing moon astronomical data");
+             weather_debug("No json_tree");
+         }
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         g_bytes_unref(response);
+-    } else {
++#endif
++     } else {
+         data->msg_parse->http_msg_fail = TRUE;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         g_warning_once("Download of moon astronomical data failed: %s",
+                        error->message);
+         g_error_free(error);
+-    }
++#else
++        g_warning_once("Download of moon astronomical data failed with HTTP Status Code %d, Reason phrase: %s",
++                       msg->status_code, msg->reason_phrase);
++#endif
++     }
+ 
+     astro_forecast_days = data->forecast_days + 1;
+     if (data->msg_parse->sun_msg_processed == astro_forecast_days && data->msg_parse->moon_msg_processed == astro_forecast_days) {
+@@ -626,8 +678,13 @@ cb_astro_update_moon(GObject *source,
+  * Process downloaded weather data and schedule next weather update.
+  */
+ static void
++#if SOUP_CHECK_VERSION(3, 0, 0)
+ cb_weather_update(GObject *source,
+                   GAsyncResult *result,
++#else
++cb_weather_update(SoupSession *session,
++                  SoupMessage *msg,
++#endif
+                   gpointer user_data)
+ {
+     plugin_data *data = user_data;
+@@ -637,6 +694,7 @@ cb_weather_update(GObject *source,
+     gboolean parsing_error = TRUE;
+     const gchar *body = NULL;
+     gsize len = 0;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     SoupMessage *msg;
+     GError *error = NULL;
+     GBytes *response = NULL;
+@@ -650,6 +708,17 @@ cb_weather_update(GObject *source,
+     data->weather_update->http_status_code = soup_message_get_status(msg);
+     if (G_LIKELY(error == NULL)) {
+         body = g_bytes_get_data(response, &len);
++#else
++     weather_debug("Processing downloaded weather data.");
++     time(&now_t);
++     data->weather_update->attempt++;
++     data->weather_update->http_status_code = msg->status_code;
++     if (msg->status_code == 200 || msg->status_code == 203) {
++         if (G_LIKELY(msg->response_body && msg->response_body->data)) {
++             body = msg->response_body->data;
++             len = msg->response_body->length;
++         }
++#endif
+         doc = get_xml_document(body, len);
+         if (G_LIKELY(doc)) {
+             root_node = xmlDocGetRootElement(doc);
+@@ -661,14 +730,22 @@ cb_weather_update(GObject *source,
+                 }
+             xmlFreeDoc(doc);
+         }
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         g_bytes_unref(response);
++#endif
+         if (parsing_error)
+             g_warning("Error parsing weather data!");
+     } else {
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         weather_debug("Download of weather data failed: %s", error->message);
+         g_error_free(error);
++#else
++        weather_debug
++            ("Download of weather data failed with HTTP Status Code %d, "
++             "Reason phrase: %s", msg->status_code, msg->reason_phrase);
++#endif
+     }
+-    data->weather_update->next = calc_next_download_time(data->weather_update,
++     data->weather_update->next = calc_next_download_time(data->weather_update,
+                                                          now_t);
+ 
+     xml_weather_clean(data->weatherdata);
+@@ -1725,6 +1802,33 @@ mi_click(GtkWidget *widget,
+     update_weatherdata_with_reset(data);
+ }
+ 
++#if !SOUP_CHECK_VERSION(3, 0, 0)
++static void
++proxy_auth(SoupSession *session,
++           SoupMessage *msg,
++           SoupAuth *auth,
++           gboolean retrying,
++           gpointer user_data)
++{
++    SoupURI *soup_proxy_uri;
++    const gchar *proxy_uri;
++
++    if (!retrying) {
++        if (msg->status_code == SOUP_STATUS_PROXY_AUTHENTICATION_REQUIRED) {
++            proxy_uri = g_getenv("HTTP_PROXY");
++            if (!proxy_uri)
++                proxy_uri = g_getenv("http_proxy");
++            if (proxy_uri) {
++                soup_proxy_uri = soup_uri_new(proxy_uri);
++                soup_auth_authenticate(auth,
++                                       soup_uri_get_user(soup_proxy_uri),
++                                       soup_uri_get_password(soup_proxy_uri));
++                soup_uri_free(soup_proxy_uri);
++            }
++        }
++    }
++}
++#endif
+ 
+ #ifdef HAVE_UPOWER_GLIB
+ static void
+@@ -2028,10 +2132,18 @@ static plugin_data *
+ xfceweather_create_control(XfcePanelPlugin *plugin)
+ {
+     plugin_data *data = g_slice_new0(plugin_data);
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     GProxyResolver *proxy_resolver;
++#else
++    SoupURI *soup_proxy_uri;
++#endif
+     const gchar *proxy_uri;
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     const gchar *no_proxy;
+     gchar **no_proxy_lst = NULL;
++#else
++    const gchar *proxy_user;
++#endif
+     GtkWidget *refresh;
+     cairo_surface_t *icon = NULL;
+     data_types lbl;
+@@ -2069,15 +2181,23 @@ xfceweather_create_control(XfcePanelPlugin *plugin)
+ 
+     /* Setup session for HTTP connections */
+     data->session = soup_session_new();
++#if SOUP_CHECK_VERSION(3, 0, 0)
+     soup_session_set_user_agent(data->session,
+                                 PACKAGE_NAME "-" PACKAGE_VERSION);
+     soup_session_set_timeout(data->session, CONN_TIMEOUT);
++#else
++    g_object_set(data->session, SOUP_SESSION_USER_AGENT,
++                 PACKAGE_NAME "-" PACKAGE_VERSION, NULL);
++    g_object_set(data->session, SOUP_SESSION_TIMEOUT,
++                 CONN_TIMEOUT, NULL);
++#endif
+ 
+     /* Set the proxy URI from environment */
+     proxy_uri = g_getenv("HTTP_PROXY");
+     if (!proxy_uri)
+         proxy_uri = g_getenv("http_proxy");
+     if (proxy_uri) {
++#if SOUP_CHECK_VERSION(3, 0, 0)
+         no_proxy = g_getenv("no_proxy");
+         if (!no_proxy)
+             no_proxy = g_getenv("NO_PROXY");
+@@ -2087,6 +2207,18 @@ xfceweather_create_control(XfcePanelPlugin *plugin)
+         g_strfreev(no_proxy_lst);
+         soup_session_set_proxy_resolver(data->session, proxy_resolver);
+         g_object_unref(proxy_resolver);
++#else
++        soup_proxy_uri = soup_uri_new(proxy_uri);
++        g_object_set(data->session, SOUP_SESSION_PROXY_URI,
++                     soup_proxy_uri, NULL);
++        /* check if uri contains authentication info */
++        proxy_user = soup_uri_get_user(soup_proxy_uri);
++        if (proxy_user && strlen(proxy_user) > 0) {
++            g_signal_connect(G_OBJECT(data->session), "authenticate",
++                             G_CALLBACK(proxy_auth), NULL);
++        }
++        soup_uri_free(soup_proxy_uri);
++#endif
+     }
+     /* Otherwise, g_proxy_resolver_get_default() will be used */
+ 
+diff --git a/panel-plugin/weather.h b/panel-plugin/weather.h
+index 01974ce..87a6157 100644
+--- a/panel-plugin/weather.h
++++ b/panel-plugin/weather.h
+@@ -183,7 +183,11 @@ extern gboolean debug_mode;
+ 
+ void weather_http_queue_request(SoupSession *session,
+                                 const gchar *uri,
++#if SOUP_CHECK_VERSION(3, 0, 0)
+                                 GAsyncReadyCallback callback_func,
++#else
++                                SoupSessionCallback callback_func,
++#endif
+                                 gpointer user_data);
+ 
+ void scrollbox_set_visible(plugin_data *data);
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
deleted file mode 100644
index 858bd5459b..0000000000
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Panel plugin to display current temperature and weather condition"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-inherit xfce-panel-plugin
-
-DEPENDS += "libsoup-2.4 dbus-glib upower"
-
-SRC_URI[sha256sum] = "a45146f9a0dcdc95d191c09c64ad279ae289cf8f811c4433e08e31a656845239"
-
-FILES:${PN} += "${datadir}/xfce4/weather"
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.3.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.3.bb
new file mode 100644
index 0000000000..79863bfe20
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Panel plugin to display current temperature and weather condition"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "libsoup dbus-glib upower"
+
+SRC_URI += "file://0001-libxfce4ui-Avoid-deprecated-functions.patch \
+            file://0002-parsers-Generalise-input-to-array-of-gchar.patch \
+            file://0003-libsoup-Port-to-libsoup-3.0.patch \
+            file://0004-Report-UPower-Glib-support.patch \
+            file://0005-Make-libsoup-v3-support-optional.patch \
+"
+SRC_URI[sha256sum] = "002d1fe63906d2f3a012f3cb58cceff1dfbcc466759e36c76d3b03dd01c0dc57"
+
+FILES:${PN} += "${datadir}/xfce4/weather"

