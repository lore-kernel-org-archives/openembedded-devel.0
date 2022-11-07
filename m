Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3CAC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:49:06 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.363.1667850544414549601
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id DC454C830
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 20:49:01 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.160]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1os87B-16cWh70; Mon, 7 Nov 2022 20:49:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] gnome-online-accounts: update 3.44.0 -> 3.46.0
Date: Mon,  7 Nov 2022 20:48:50 +0100
Message-Id: <20221107194850.56652-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667850541-B37EAB6F-6F6B37D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 55e831bb-4c22-4022-bd22-038c6876bd3a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 19:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99482

---
 .../files/0001-Update-to-rest-1.0.patch       | 160 ------------------
 .../gnome-online-accounts_3.44.0.bb           |  34 ----
 .../gnome-online-accounts_3.46.0.bb           |  31 ++++
 3 files changed, 31 insertions(+), 194 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/files/=
0001-Update-to-rest-1.0.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts_3.44.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-=
online-accounts_3.46.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/files/0001-Up=
date-to-rest-1.0.patch b/meta-gnome/recipes-gnome/gnome-online-accounts/f=
iles/0001-Update-to-rest-1.0.patch
deleted file mode 100644
index 4a47fb2db..000000000
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/files/0001-Update-to=
-rest-1.0.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 3c4a6eda580c6e38aeedb63d73ae7b96cc7f9a07 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Mon, 7 Jun 2021 16:31:18 +0200
-Subject: [PATCH] Update to rest 1.0
-
-Updates to use the rest 1.0 API
-
-Upstream-Status: Inappropriate [rest 1.0 is not released yet]
-
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- configure.ac                       |  2 +-
- src/goabackend/goalastfmprovider.c | 26 +++++++++++++-------------
- src/goabackend/goaoauthprovider.c  | 17 +++++++++++------
- src/goabackend/goarestproxy.h      |  2 --
- 4 files changed, 25 insertions(+), 22 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1f88bbd..e43303d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,7 +129,7 @@ if test "$enable_backend" !=3D "no"; then
-   AC_SUBST(JSON_GLIB_CFLAGS)
-   AC_SUBST(JSON_GLIB_LIBS)
-=20
--  PKG_CHECK_MODULES(REST, [rest-0.7])
-+  PKG_CHECK_MODULES(REST, [rest-1.0])
-   AC_SUBST(REST_CFLAGS)
-   AC_SUBST(REST_LIBS)
-=20
-diff --git a/src/goabackend/goalastfmprovider.c b/src/goabackend/goalast=
fmprovider.c
-index cb9a6f2..a2db037 100644
---- a/src/goabackend/goalastfmprovider.c
-+++ b/src/goabackend/goalastfmprovider.c
-@@ -483,18 +483,18 @@ add_account_cb (GoaManager *manager, GAsyncResult =
*res, gpointer user_data)
-=20
- static void
- check_cb (RestProxyCall *call,
--          const GError *error,
--          GObject *weak_object,
-+          GAsyncResult *result,
-           gpointer user_data)
- {
-   AddAccountData *data =3D user_data;
-   JsonNode *session;
--  JsonParser *parser;
-+  JsonParser *parser =3D NULL;
-   JsonObject *json_obj;
-   JsonObject *session_obj;
-   const gchar *payload;
-=20
--  parser =3D NULL;
-+  if (!rest_proxy_call_invoke_finish (call, result, &data->error))
-+    goto out;
-=20
-   parser =3D json_parser_new ();
-   payload =3D rest_proxy_call_get_payload (call);
-@@ -562,12 +562,12 @@ on_rest_proxy_call_cancelled_cb (GCancellable *can=
cellable, RestProxyCall *call)
- }
-=20
- static void
--lastfm_login (GoaProvider                  *provider,
--              const gchar                  *username,
--              const gchar                  *password,
--              GCancellable                 *cancellable,
--              RestProxyCallAsyncCallback   callback,
--              gpointer                     user_data)
-+lastfm_login (GoaProvider          *provider,
-+              const gchar          *username,
-+              const gchar          *password,
-+              GCancellable         *cancellable,
-+              GAsyncReadyCallback   callback,
-+              gpointer              user_data)
- {
-   AddAccountData *data =3D user_data;
-   RestProxyCall *call;
-@@ -598,7 +598,7 @@ lastfm_login (GoaProvider                  *provider=
,
-   rest_proxy_call_add_param (call, "api_sig", sig_md5);
-   rest_proxy_call_add_param (call, "format", "json");
-=20
--  rest_proxy_call_async (call, callback, NULL, data, &data->error);
-+  rest_proxy_call_invoke_async (call, NULL, callback, data);
-=20
-   g_signal_connect (cancellable, "cancelled", G_CALLBACK (on_rest_proxy=
_call_cancelled_cb), call);
-=20
-@@ -665,7 +665,7 @@ add_account (GoaProvider    *provider,
-                 username,
-                 password,
-                 data.cancellable,
--                (RestProxyCallAsyncCallback) check_cb,
-+                (GAsyncReadyCallback) check_cb,
-                 &data);
-=20
-   gtk_widget_set_sensitive (data.connect_button, FALSE);
-@@ -819,7 +819,7 @@ refresh_account (GoaProvider    *provider,
-                 username,
-                 password,
-                 data.cancellable,
--                (RestProxyCallAsyncCallback) check_cb,
-+                (GAsyncReadyCallback) check_cb,
-                 &data);
-   gtk_widget_set_sensitive (data.connect_button, FALSE);
-   gtk_widget_show (data.progress_grid);
-diff --git a/src/goabackend/goaoauthprovider.c b/src/goabackend/goaoauth=
provider.c
-index 0bfab6b..6a69251 100644
---- a/src/goabackend/goaoauthprovider.c
-+++ b/src/goabackend/goaoauthprovider.c
-@@ -699,9 +699,15 @@ on_web_view_decide_policy (WebKitWebView           =
 *web_view,
- }
-=20
- static void
--rest_proxy_call_cb (RestProxyCall *call, const GError *error, GObject *=
weak_object, gpointer user_data)
-+rest_proxy_call_cb (GObject *source, GAsyncResult *result, gpointer use=
r_data)
- {
-+  RestProxyCall *call =3D REST_PROXY_CALL (source);
-   IdentifyData *data =3D user_data;
-+
-+  if (!rest_proxy_call_invoke_finish (call, result, &data->error))
-+    {
-+      g_prefix_error (&data->error, _("Error getting a Request Token: "=
));
-+    }
-   g_main_loop_quit (data->loop);
- }
-=20
-@@ -768,11 +774,7 @@ get_tokens_and_identity (GoaOAuthProvider *provider=
,
-       for (n =3D 0; request_params[n] !=3D NULL; n +=3D 2)
-         rest_proxy_call_add_param (call, request_params[n], request_par=
ams[n+1]);
-     }
--  if (!rest_proxy_call_async (call, rest_proxy_call_cb, NULL, &data, &d=
ata.error))
--    {
--      g_prefix_error (&data.error, _("Error getting a Request Token: ")=
);
--      goto out;
--    }
-+  rest_proxy_call_invoke_async (call, NULL, rest_proxy_call_cb, &data);
-=20
-   goa_utils_set_dialog_title (GOA_PROVIDER (provider), dialog, add_acco=
unt);
-=20
-@@ -794,6 +796,9 @@ get_tokens_and_identity (GoaOAuthProvider *provider,
-   g_main_loop_run (data.loop);
-   gtk_container_remove (GTK_CONTAINER (grid), spinner);
-=20
-+  if (data.error)
-+    goto out;
-+
-   if (rest_proxy_call_get_status_code (call) !=3D 200)
-     {
-       gchar *msg;
-diff --git a/src/goabackend/goarestproxy.h b/src/goabackend/goarestproxy=
.h
-index 09fb076..4948cb7 100644
---- a/src/goabackend/goarestproxy.h
-+++ b/src/goabackend/goarestproxy.h
-@@ -27,8 +27,6 @@
-=20
- G_BEGIN_DECLS
-=20
--G_DEFINE_AUTOPTR_CLEANUP_FUNC (RestProxy, g_object_unref);
--
- #define GOA_TYPE_REST_PROXY (goa_rest_proxy_get_type ())
- G_DECLARE_FINAL_TYPE (GoaRestProxy, goa_rest_proxy, GOA, REST_PROXY, Re=
stProxy);
-=20
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.44.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.44.0.bb
deleted file mode 100644
index 451670e64..000000000
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.44.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY =3D "GNOME Online Accounts - Single sign-on framework for GNOME"
-LICENSE =3D "LGPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34c88b124db5fb2762c1676be7dad=
d36"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-
-inherit gnomebase gsettings gobject-introspection gsettings gtk-doc vala=
 gettext features_check
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-DEPENDS =3D "glib-2.0"
-
-SRC_URI +=3D "file://0001-Update-to-rest-1.0.patch"
-SRC_URI[archive.sha256sum] =3D "381d5d4106f435b6f87786aa049be784774e1599=
6adcc02789807afc87ea7342"
-
-# backend is required for gnome-control-center
-PACKAGECONFIG =3D "backend other"
-
-PACKAGECONFIG[backend] =3D "--enable-backend,--disable-backend,gtk+3 web=
kitgtk libsoup-2.4 json-glib libsecret rest libxml2"
-PACKAGECONFIG[krb5] =3D "--enable-kerberos, --disable-kerberos , krb5 gc=
r"
-
-# no extra dependencies!
-PACKAGECONFIG[other] =3D " \
-    --enable-facebook  --enable-foursquare  --enable-exchange  --enable-=
flickr  --enable-google  --enable-imap-smtp  --enable-owncloud  --enable-=
windows-live,\
-    --disable-facebook --disable-foursquare --disable-exchange --disable=
-flickr --disable-google --disable-imap-smtp --disable-owncloud --disable=
-windows-live, \
-"
-
-FILES:${PN} +=3D " \
-    ${datadir}/dbus-1 \
-    ${libdir}/goa-1.0/web-extensions/*.so \
-"
-
-# looked into pkg-config file: it is not a bug - they mean it
-FILES:${PN}-dev +=3D "${libdir}/goa-1.0/include"
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.46.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.46.0.bb
new file mode 100644
index 000000000..0603a2d89
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.46.0.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "GNOME Online Accounts - Single sign-on framework for GNOME"
+LICENSE =3D "LGPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D34c88b124db5fb2762c1676be7dad=
d36"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala fe=
atures_check
+
+DEPENDS =3D "gtk+3 gtk+3-native gdk-pixbuf dbus json-glib libxml2 webkit=
gtk glib-2.0 rest libsecret"
+
+SRC_URI[archive.sha256sum] =3D "5e7859ce4858a6b99d3995ed70527d66e297bb90=
bbf75ec8780fe9da22c1fcaa"
+
+PACKAGECONFIG_SOUP ?=3D "soup3"
+PACKAGECONFIG ?=3D "kerberos owncloud lastfm google windows_live ${PACKA=
GECONFIG_SOUP}"
+
+PACKAGECONFIG[kerberos] =3D "-Dkerberos=3Dtrue, -Dkerberos=3Dfalse,krb5 =
gcr"
+PACKAGECONFIG[exchange] =3D "-Dexchange=3Dtrue, -Dexchange=3Dfalse"
+PACKAGECONFIG[google] =3D "-Dgoogle=3Dtrue, -Dgoogle=3Dfalse"
+PACKAGECONFIG[owncloud] =3D "-Downcloud=3Dtrue, -Downcloud=3Dfalse"
+PACKAGECONFIG[windows_live] =3D "-Dwindows_live=3Dtrue, -Dwindows_live=3D=
false"
+PACKAGECONFIG[lastfm] =3D "-Dlastfm=3Dtrue, -Dlastfm=3Dfalse"
+PACKAGECONFIG[soup2] =3D ",,libsoup-2.4,,,soup3"
+PACKAGECONFIG[soup3] =3D ",,libsoup-3.0,,,soup2"
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
+    ${libdir}/goa-1.0/web-extensions/*.so \
+"
+
+# looked into pkg-config file: it is not a bug - they mean it
+FILES:${PN}-dev +=3D "${libdir}/goa-1.0/include"
--=20
2.34.1


