Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534B0C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:16:12 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.2058.1667848569524274954
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 5543A62E4
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 20:15:45 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.160]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1os7ay-16iIin0; Mon, 7 Nov 2022 20:15:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] rest: upgrade 0.8.1 -> 0.9.0
Date: Mon,  7 Nov 2022 20:15:37 +0100
Message-Id: <20221107191537.45452-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667848544-C9C89B6F-EAD52EAE/0/0 CLEAN NORMAL
X-TOI-MSGID: 97b6d1f6-ebce-4d0b-9c1f-f358feb94230
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 19:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99481

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Use-GUri-instead-of-SoupURI.patch    |  181 --
 .../rest/files/0002-Port-to-libsoup3.patch    | 1696 -----------------
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb   |   33 -
 meta-gnome/recipes-gnome/rest/rest_0.9.0.bb   |   25 +
 4 files changed, 25 insertions(+), 1910 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/rest/files/0001-Use-GUri-ins=
tead-of-SoupURI.patch
 delete mode 100644 meta-gnome/recipes-gnome/rest/files/0002-Port-to-libs=
oup3.patch
 delete mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
 create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.9.0.bb

diff --git a/meta-gnome/recipes-gnome/rest/files/0001-Use-GUri-instead-of=
-SoupURI.patch b/meta-gnome/recipes-gnome/rest/files/0001-Use-GUri-instea=
d-of-SoupURI.patch
deleted file mode 100644
index 37ba0a042..000000000
--- a/meta-gnome/recipes-gnome/rest/files/0001-Use-GUri-instead-of-SoupUR=
I.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From d39fd6d5f4c0a63cc048b84b0f989cb83f31e5fe Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Tue, 8 Jun 2021 10:57:06 +0200
-Subject: [PATCH 1/2] Use GUri instead of SoupURI
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/librest/-/mer=
ge_requests/6]
----
- configure.ac               |  2 +-
- rest-extras/flickr-proxy.c | 19 ++++++++++++++-----
- rest/oauth-proxy-call.c    | 19 ++++++++++++++-----
- rest/oauth2-proxy.c        | 22 +++++++++++-----------
- 4 files changed, 40 insertions(+), 22 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d15e592..d586e69 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,7 +40,7 @@ AM_PROG_CC_C_O
- LT_PREREQ([2.2.6])
- LT_INIT([disable-static])
-=20
--PKG_CHECK_MODULES(GLIB, glib-2.0 >=3D 2.44)
-+PKG_CHECK_MODULES(GLIB, glib-2.0 >=3D 2.67.4)
- PKG_CHECK_MODULES(SOUP, libsoup-2.4 >=3D 2.42)
- PKG_CHECK_MODULES(XML, libxml-2.0)
- PKG_CHECK_MODULES(GTHREAD, gthread-2.0)
-diff --git a/rest-extras/flickr-proxy.c b/rest-extras/flickr-proxy.c
-index 3342a4d..7726359 100644
---- a/rest-extras/flickr-proxy.c
-+++ b/rest-extras/flickr-proxy.c
-@@ -304,13 +304,13 @@ flickr_proxy_build_login_url (FlickrProxy *proxy,
-                               const char  *frob,
-                               const char  *perms)
- {
--  SoupURI *uri;
-+  GUri *uri;
-   GHashTable *params;
-   char *sig, *s;
-+  char *query;
-=20
-   g_return_val_if_fail (FLICKR_IS_PROXY (proxy), NULL);
-=20
--  uri =3D soup_uri_new ("http://flickr.com/services/auth/");
-   params =3D g_hash_table_new (g_str_hash, g_str_equal);
-=20
-   g_hash_table_insert (params, "api_key", proxy->priv->api_key);
-@@ -321,14 +321,23 @@ flickr_proxy_build_login_url (FlickrProxy *proxy,
-=20
-   sig =3D flickr_proxy_sign (proxy, params);
-   g_hash_table_insert (params, "api_sig", sig);
-+  query =3D soup_form_encode_hash (params);
-=20
--  soup_uri_set_query_from_form (uri, params);
-+  uri =3D g_uri_build (G_URI_FLAGS_ENCODED,
-+                     "http",
-+                     NULL,
-+                     "flickr.com",
-+                     -1,
-+                     "services/auth/",
-+                     query,
-+                     NULL);
-=20
--  s =3D soup_uri_to_string (uri, FALSE);
-+  s =3D g_uri_to_string (uri);
-=20
-+  g_free (query);
-   g_free (sig);
-   g_hash_table_destroy (params);
--  soup_uri_free (uri);
-+  g_uri_unref (uri);
-=20
-   return s;
- }
-diff --git a/rest/oauth-proxy-call.c b/rest/oauth-proxy-call.c
-index c90c69d..e238c3c 100644
---- a/rest/oauth-proxy-call.c
-+++ b/rest/oauth-proxy-call.c
-@@ -30,7 +30,7 @@
-=20
- G_DEFINE_TYPE (OAuthProxyCall, oauth_proxy_call, REST_TYPE_PROXY_CALL)
-=20
--#define OAUTH_ENCODE_STRING(x_) (x_ ? soup_uri_encode( (x_), "!$&'()*+,=
;=3D@") : g_strdup (""))
-+#define OAUTH_ENCODE_STRING(x_) (x_ ? g_uri_escape_string( (x_), NULL, =
TRUE) : g_strdup (""))
-=20
- static char *
- sign_plaintext (OAuthProxyPrivate *priv)
-@@ -136,15 +136,24 @@ sign_hmac (OAuthProxy *proxy, RestProxyCall *call,=
 GHashTable *oauth_params)
-   if (priv->oauth_echo) {
-     g_string_append_uri_escaped (text, priv->service_url, NULL, FALSE);
-   } else if (priv->signature_host !=3D NULL) {
--    SoupURI *url =3D soup_uri_new (url_str);
-+    GUri *url =3D g_uri_parse (url_str, G_URI_FLAGS_ENCODED, NULL);
-+    GUri *new_url;
-     gchar *signing_url;
-=20
--    soup_uri_set_host (url, priv->signature_host);
--    signing_url =3D soup_uri_to_string (url, FALSE);
-+    new_url =3D g_uri_build (g_uri_get_flags (url),
-+                           g_uri_get_scheme (url),
-+                           g_uri_get_userinfo (url),
-+                           priv->signature_host,
-+                           g_uri_get_port (url),
-+                           g_uri_get_path (url),
-+                           g_uri_get_query (url),
-+                           g_uri_get_fragment (url));
-+    signing_url =3D g_uri_to_string (new_url);
-=20
-     g_string_append_uri_escaped (text, signing_url, NULL, FALSE);
-=20
--    soup_uri_free (url);
-+    g_uri_unref (new_url);
-+    g_uri_unref (url);
-     g_free (signing_url);
-   } else {
-     g_string_append_uri_escaped (text, url_str, NULL, FALSE);
-diff --git a/rest/oauth2-proxy.c b/rest/oauth2-proxy.c
-index 24e5da0..3382f8b 100644
---- a/rest/oauth2-proxy.c
-+++ b/rest/oauth2-proxy.c
-@@ -37,8 +37,6 @@ oauth2_proxy_error_quark (void)
-     return g_quark_from_static_string ("rest-oauth2-proxy");
- }
-=20
--#define EXTRA_CHARS_ENCODE "!$&'()*+,;=3D@"
--
- enum {
-   PROP_0,
-   PROP_CLIENT_ID,
-@@ -242,8 +240,8 @@ append_query_param (gpointer key, gpointer value, gp=
ointer user_data)
-     char *encoded_val, *encoded_key;
-     char *param;
-=20
--    encoded_val =3D soup_uri_encode (value, EXTRA_CHARS_ENCODE);
--    encoded_key =3D soup_uri_encode (key, EXTRA_CHARS_ENCODE);
-+    encoded_val =3D g_uri_escape_string (value, NULL, TRUE);
-+    encoded_key =3D g_uri_escape_string (key, NULL, TRUE);
-=20
-     param =3D g_strdup_printf ("%s=3D%s", encoded_key, encoded_val);
-     g_free (encoded_key);
-@@ -295,8 +293,8 @@ oauth2_proxy_build_login_url_full (OAuth2Proxy *prox=
y,
-         g_hash_table_foreach (extra_params, append_query_param, params)=
;
-     }
-=20
--    encoded_uri =3D soup_uri_encode (redirect_uri, EXTRA_CHARS_ENCODE);
--    encoded_id =3D soup_uri_encode (proxy->priv->client_id, EXTRA_CHARS=
_ENCODE);
-+    encoded_uri =3D g_uri_escape_string (redirect_uri, NULL, TRUE);
-+    encoded_id =3D g_uri_escape_string (proxy->priv->client_id, NULL, T=
RUE);
-=20
-     url =3D g_strdup_printf ("%s?client_id=3D%s&redirect_uri=3D%s&type=3D=
user_agent",
-                            proxy->priv->auth_endpoint, encoded_id,
-@@ -378,20 +376,22 @@ oauth2_proxy_extract_access_token (const char *url=
)
- {
-   GHashTable *params;
-   char *token =3D NULL;
--  SoupURI *soupuri =3D soup_uri_new (url);
-+  const char *fragment;
-+  GUri *uri =3D g_uri_parse (url, G_URI_FLAGS_ENCODED, NULL);
-=20
--  if (soupuri->fragment !=3D NULL) {
--    params =3D soup_form_decode (soupuri->fragment);
-+  fragment =3D g_uri_get_fragment (uri);
-+  if (fragment !=3D NULL) {
-+    params =3D soup_form_decode (fragment);
-=20
-     if (params) {
-       char *encoded =3D g_hash_table_lookup (params, "access_token");
-       if (encoded)
--        token =3D soup_uri_decode (encoded);
-+        token =3D g_uri_unescape_string (encoded, NULL);
-=20
-       g_hash_table_destroy (params);
-     }
-   }
--  soup_uri_free (soupuri);
-+  g_uri_unref (uri);
-=20
-   return token;
- }
---=20
-2.33.1
-
diff --git a/meta-gnome/recipes-gnome/rest/files/0002-Port-to-libsoup3.pa=
tch b/meta-gnome/recipes-gnome/rest/files/0002-Port-to-libsoup3.patch
deleted file mode 100644
index eed522f77..000000000
--- a/meta-gnome/recipes-gnome/rest/files/0002-Port-to-libsoup3.patch
+++ /dev/null
@@ -1,1696 +0,0 @@
-From 3dc630ae5b9dc6cda1ba318de2cd654aaba7b4a2 Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Tue, 8 Jun 2021 17:44:04 +0200
-Subject: [PATCH 2/2] Port to libsoup3
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/librest/-/mer=
ge_requests/6]
----
- configure.ac                |  39 ++++-
- rest-extras.pc.in           |   2 +-
- rest-extras/youtube-proxy.c | 110 +++++++++++---
- rest.pc.in                  |   2 +-
- rest/rest-private.h         |  22 ++-
- rest/rest-proxy-auth.c      |  16 ++
- rest/rest-proxy-call.c      | 296 +++++++++++++++++++++++++++++-------
- rest/rest-proxy.c           | 209 ++++++++++++++++++++++---
- tests/custom-serialize.c    |  18 +++
- tests/proxy-continuous.c    |  37 ++++-
- tests/proxy.c               |  63 +++++++-
- tests/threaded.c            |  17 +++
- 12 files changed, 719 insertions(+), 112 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d586e69..75c02fe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -20,12 +20,6 @@ AM_INIT_AUTOMAKE([1.11 foreign -Wno-portability no-de=
fine dist-xz])
-=20
- AM_SILENT_RULES([yes])
-=20
--API_MAJOR=3D1
--API_MINOR=3D0
--AC_SUBST([API_VERSION],[$API_MAJOR.$API_MINOR])
--AC_SUBST([API_VERSION_AM],[$API_MAJOR\_$API_MINOR])
--AC_DEFINE_UNQUOTED(API_VERSION, [$API_VERSION], [API version])
--
- AC_CANONICAL_HOST
-=20
- AC_PROG_CC
-@@ -41,7 +35,6 @@ LT_PREREQ([2.2.6])
- LT_INIT([disable-static])
-=20
- PKG_CHECK_MODULES(GLIB, glib-2.0 >=3D 2.67.4)
--PKG_CHECK_MODULES(SOUP, libsoup-2.4 >=3D 2.42)
- PKG_CHECK_MODULES(XML, libxml-2.0)
- PKG_CHECK_MODULES(GTHREAD, gthread-2.0)
-=20
-@@ -58,6 +51,37 @@ AC_PATH_PROG([GLIB_MKENUMS],[glib-mkenums])
- localedir=3D${datadir}/locale
- AC_SUBST(localedir)
-=20
-+AC_MSG_CHECKING([for libsoup version to use])
-+AC_ARG_WITH(soup,
-+            [AC_HELP_STRING([--soup=3D2|3],
-+                            [version of libsoup library to use (default=
: 2)])],
-+            [case "$withval" in
-+                2|3) ;;
-+                *) AC_MSG_ERROR([invalid argument "$withval" for --with=
-soup]) ;;
-+             esac],
-+            [with_soup=3D2])
-+AC_MSG_RESULT([$with_soup])
-+
-+API_MAJOR=3D1
-+
-+if test "$with_soup" =3D "2"; then
-+    PKG_CHECK_MODULES(SOUP, libsoup-2.4 >=3D 2.42)
-+    SOUP_API_VERSION=3D2.4
-+    API_MINOR=3D0
-+    AC_DEFINE([WITH_SOUP_2],[1],[Define if libsoup version used is 2])
-+else
-+    PKG_CHECK_MODULES(SOUP, libsoup-3.0 >=3D 2.99.8)
-+    SOUP_API_VERSION=3D3.0
-+    API_MINOR=3D1
-+fi
-+
-+AM_CONDITIONAL([WITH_SOUP_2],[test "$with_soup" =3D "2"])
-+AC_SUBST(SOUP_API_VERSION)
-+
-+AC_SUBST([API_VERSION],[$API_MAJOR.$API_MINOR])
-+AC_SUBST([API_VERSION_AM],[$API_MAJOR\_$API_MINOR])
-+AC_DEFINE_UNQUOTED(API_VERSION, [$API_VERSION], [API version])
-+
- dnl =3D=3D=3D Coverage report =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- AC_PATH_PROG([GCOV], [lcov], [enable_gcov=3Dno])
-=20
-@@ -130,6 +154,7 @@ echo "                 LibRest $VERSION"
- echo "                 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
"
- echo ""
- echo "                   prefix:   ${prefix}"
-+echo "          libsoup version:   ${with_soup}"
- echo ""
- echo "            Documentation:   ${enable_gtk_doc}"
- echo "       Introspection data:   ${enable_introspection}"
-diff --git a/rest-extras.pc.in b/rest-extras.pc.in
-index 39f21bf..3723d6d 100644
---- a/rest-extras.pc.in
-+++ b/rest-extras.pc.in
-@@ -9,4 +9,4 @@ Description: RESTful web api query library
- Version: @VERSION@
- Libs: -L${libdir} -lrest-extras-${apiversion}
- Cflags: -I${includedir}/rest-${apiversion}
--Requires: glib-2.0 libsoup-2.4 libxml-2.0
-+Requires: glib-2.0 libsoup-@SOUP_API_VERSION@ libxml-2.0
-diff --git a/rest-extras/youtube-proxy.c b/rest-extras/youtube-proxy.c
-index be0cf08..cd598f4 100644
---- a/rest-extras/youtube-proxy.c
-+++ b/rest-extras/youtube-proxy.c
-@@ -246,6 +246,9 @@ typedef struct {
-   GObject *weak_object;
-   gpointer user_data;
-   gsize uploaded;
-+#ifndef WITH_SOUP_2
-+  GCancellable *cancellable;
-+#endif
- } YoutubeProxyUploadClosure;
-=20
- static void
-@@ -255,7 +258,11 @@ _upload_async_weak_notify_cb (gpointer *data,
-   YoutubeProxyUploadClosure *closure =3D
-     (YoutubeProxyUploadClosure *) data;
-=20
-+#ifdef WITH_SOUP_2
-   _rest_proxy_cancel_message (REST_PROXY (closure->proxy), closure->mes=
sage);
-+#else
-+  g_cancellable_cancel (closure->cancellable);
-+#endif
- }
-=20
- static void
-@@ -267,6 +274,9 @@ _upload_async_closure_free (YoutubeProxyUploadClosur=
e *closure)
-                          closure);
-=20
-   g_object_unref (closure->proxy);
-+#ifndef WITH_SOUP_2
-+  g_object_unref (closure->cancellable);
-+#endif
-=20
-   g_slice_free (YoutubeProxyUploadClosure, closure);
- }
-@@ -286,6 +296,9 @@ _upload_async_closure_new (YoutubeProxy *self,
-   closure->message =3D message;
-   closure->weak_object =3D weak_object;
-   closure->user_data =3D user_data;
-+#ifndef WITH_SOUP_2
-+  closure->cancellable =3D g_cancellable_new ();
-+#endif
-=20
-   if (weak_object !=3D NULL)
-     g_object_weak_ref (weak_object,
-@@ -295,41 +308,67 @@ _upload_async_closure_new (YoutubeProxy *self,
- }
-=20
- static void
--_upload_completed_cb (SoupSession *session,
--                      SoupMessage *message,
-+_upload_completed_cb (SoupMessage *message,
-+                      GBytes      *payload,
-+                      GError      *error,
-                       gpointer     user_data)
- {
-   YoutubeProxyUploadClosure *closure =3D
-     (YoutubeProxyUploadClosure *) user_data;
--  GError *error =3D NULL;
-+  gsize length;
-+  gconstpointer data;
-+  guint status_code;
-+  const char *reason_phrase;
-=20
-   if (closure->callback =3D=3D NULL)
-     return;
-=20
--  if (message->status_code < 200 || message->status_code >=3D 300)
--    error =3D g_error_new_literal (REST_PROXY_ERROR,
--                                 message->status_code,
--                                 message->reason_phrase);
--
--  closure->callback (closure->proxy, message->response_body->data,
--                     message->request_body->length,
--                     message->request_body->length,
-+#ifdef WITH_SOUP_2
-+  status_code =3D message->status_code;
-+  reason_phrase =3D message->reason_phrase;
-+#else
-+  status_code =3D soup_message_get_status (message);
-+  reason_phrase =3D soup_message_get_reason_phrase (message);
-+#endif
-+
-+  if (status_code < 200 || status_code >=3D 300)
-+    {
-+      g_clear_error (&error);
-+      error =3D g_error_new_literal (REST_PROXY_ERROR,
-+                                   status_code,
-+                                   reason_phrase);
-+    }
-+
-+  data =3D g_bytes_get_data (payload, &length);
-+  closure->callback (closure->proxy, data, length, length,
-                      error, closure->weak_object, closure->user_data);
-+  g_bytes_unref (payload);
-=20
-   _upload_async_closure_free (closure);
- }
-=20
- static void
- _message_wrote_data_cb (SoupMessage               *msg,
-+#ifdef WITH_SOUP_2
-                         SoupBuffer                *chunk,
-+#else
-+                        gsize                      chunk_size,
-+#endif
-                         YoutubeProxyUploadClosure *closure)
- {
--  closure->uploaded =3D closure->uploaded + chunk->length;
-+#ifdef WITH_SOUP_2
-+  gsize chunk_size =3D chunk->length;
-+  goffset content_length =3D msg->request_body->length;
-+#else
-+  goffset content_length =3D soup_message_headers_get_content_length (s=
oup_message_get_request_headers (msg));
-+#endif
-+
-+  closure->uploaded =3D closure->uploaded + chunk_size;
-=20
--  if (closure->uploaded < msg->request_body->length)
-+  if (closure->uploaded < content_length)
-     closure->callback (closure->proxy,
-                        NULL,
--                       msg->request_body->length,
-+                       content_length,
-                        closure->uploaded,
-                        NULL,
-                        closure->weak_object,
-@@ -364,7 +403,12 @@ youtube_proxy_upload_async (YoutubeProxy           =
   *self,
-   SoupMultipart *mp;
-   SoupMessage *message;
-   SoupMessageHeaders *part_headers;
-+  SoupMessageHeaders *request_headers;
-+#ifdef WITH_SOUP_2
-   SoupBuffer *sb;
-+#else
-+  GBytes *sb;
-+#endif
-   gchar *content_type;
-   gchar *atom_xml;
-   GMappedFile *map;
-@@ -380,10 +424,17 @@ youtube_proxy_upload_async (YoutubeProxy          =
    *self,
-=20
-   atom_xml =3D _construct_upload_atom_xml (fields, incomplete);
-=20
-+#ifdef WITH_SOUP_2
-   sb =3D soup_buffer_new_with_owner (atom_xml,
-                                    strlen(atom_xml),
-                                    atom_xml,
-                                    (GDestroyNotify) g_free);
-+#else
-+  sb =3D g_bytes_new_with_free_func (atom_xml,
-+                                   strlen (atom_xml),
-+                                   (GDestroyNotify) g_free,
-+                                   atom_xml);
-+#endif
-=20
-   part_headers =3D soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTI=
PART);
-=20
-@@ -393,7 +444,11 @@ youtube_proxy_upload_async (YoutubeProxy           =
   *self,
-=20
-   soup_multipart_append_part (mp, part_headers, sb);
-=20
-+#ifdef WITH_SOUP_2
-   soup_buffer_free (sb);
-+#else
-+  g_bytes_unref (sb);
-+#endif
-=20
-   content_type =3D g_content_type_guess (
-       filename,
-@@ -401,24 +456,37 @@ youtube_proxy_upload_async (YoutubeProxy          =
    *self,
-       g_mapped_file_get_length (map),
-       NULL);
-=20
-+#ifdef WITH_SOUP_2
-   sb =3D soup_buffer_new_with_owner (g_mapped_file_get_contents (map),
-                                    g_mapped_file_get_length (map),
-                                    map,
-                                    (GDestroyNotify) g_mapped_file_unref=
);
-+#else
-+  sb =3D g_bytes_new_with_free_func (g_mapped_file_get_contents (map),
-+                                   g_mapped_file_get_length (map),
-+                                   (GDestroyNotify) g_mapped_file_unref=
,
-+                                   map);
-+#endif
-=20
-   soup_message_headers_replace (part_headers, "Content-Type", content_t=
ype);
-=20
-   soup_multipart_append_part (mp, part_headers, sb);
-=20
-+#ifdef WITH_SOUP_2
-   soup_buffer_free (sb);
--
-   soup_message_headers_free (part_headers);
--
-   message =3D soup_form_request_new_from_multipart (UPLOAD_URL, mp);
-+  request_headers =3D message->request_headers;
-+#else
-+  g_bytes_unref (sb);
-+  soup_message_headers_unref (part_headers);
-+  message =3D soup_message_new_from_multipart (UPLOAD_URL, mp);
-+  request_headers =3D soup_message_get_request_headers (message);
-+#endif
-=20
-   soup_multipart_free (mp);
-=20
--  _set_upload_headers (self, message->request_headers, filename);
-+  _set_upload_headers (self, request_headers, filename);
-=20
-   closure =3D _upload_async_closure_new (self, callback, message, weak_=
object,
-                                        user_data);
-@@ -429,7 +497,13 @@ youtube_proxy_upload_async (YoutubeProxy           =
   *self,
-                     closure);
-=20
-=20
--  _rest_proxy_queue_message (REST_PROXY (self), message, _upload_comple=
ted_cb,
-+  _rest_proxy_queue_message (REST_PROXY (self), message,
-+#ifdef WITH_SOUP_2
-+                             NULL,
-+#else
-+                             closure->cancellable,
-+#endif
-+                             _upload_completed_cb,
-                              closure);
-=20
-   return TRUE;
-diff --git a/rest.pc.in b/rest.pc.in
-index 94c384b..e6bae3e 100644
---- a/rest.pc.in
-+++ b/rest.pc.in
-@@ -9,4 +9,4 @@ Description: RESTful web api query library
- Version: @VERSION@
- Libs: -L${libdir} -lrest-${apiversion}
- Cflags: -I${includedir}/rest-${apiversion}
--Requires: glib-2.0 libsoup-2.4 libxml-2.0
-+Requires: glib-2.0 libsoup-@SOUP_API_VERSION@ libxml-2.0
-diff --git a/rest/rest-private.h b/rest/rest-private.h
-index 9e91fa0..6e71322 100644
---- a/rest/rest-private.h
-+++ b/rest/rest-private.h
-@@ -31,6 +31,11 @@
-=20
- G_BEGIN_DECLS
-=20
-+typedef void (*RestMessageFinishedCallback) (SoupMessage *msg,
-+                                             GBytes      *body,
-+                                             GError      *error,
-+                                             gpointer     user_data);
-+
- typedef enum
- {
-   REST_DEBUG_XML_PARSER =3D 1 << 0,
-@@ -53,12 +58,23 @@ gboolean _rest_proxy_get_binding_required (RestProxy=
 *proxy);
- const gchar *_rest_proxy_get_bound_url (RestProxy *proxy);
- void _rest_proxy_queue_message (RestProxy   *proxy,
-                                 SoupMessage *message,
--                                SoupSessionCallback callback,
-+                                GCancellable *cancellable,
-+                                RestMessageFinishedCallback callback,
-                                 gpointer user_data);
- void _rest_proxy_cancel_message (RestProxy   *proxy,
-                                  SoupMessage *message);
--guint _rest_proxy_send_message (RestProxy   *proxy,
--                                SoupMessage *message);
-+GBytes *_rest_proxy_send_message (RestProxy    *proxy,
-+                                  SoupMessage  *message,
-+                                  GCancellable *cancellable,
-+                                  GError      **error);
-+void _rest_proxy_send_message_async (RestProxy          *proxy,
-+                                     SoupMessage        *message,
-+                                     GCancellable       *cancellable,
-+                                     GAsyncReadyCallback callback,
-+                                     gpointer            user_data);
-+GInputStream *_rest_proxy_send_message_finish (RestProxy    *proxy,
-+                                               GAsyncResult *result,
-+                                               GError      **error);
-=20
- RestXmlNode *_rest_xml_node_new (void);
- void         _rest_xml_node_reverse_children_siblings (RestXmlNode *nod=
e);
-diff --git a/rest/rest-proxy-auth.c b/rest/rest-proxy-auth.c
-index b96e443..0b2ec9f 100644
---- a/rest/rest-proxy-auth.c
-+++ b/rest/rest-proxy-auth.c
-@@ -29,7 +29,9 @@
- struct _RestProxyAuthPrivate {
-   /* used to hold state during async authentication */
-   RestProxy *proxy;
-+#ifdef WITH_SOUP_2
-   SoupSession *session;
-+#endif
-   SoupMessage *message;
-   SoupAuth *auth;
-   gboolean paused;
-@@ -43,7 +45,9 @@ rest_proxy_auth_dispose (GObject *object)
-   RestProxyAuthPrivate *priv =3D ((RestProxyAuth*)object)->priv;
-=20
-   g_clear_object (&priv->proxy);
-+#ifdef WITH_SOUP_2
-   g_clear_object (&priv->session);
-+#endif
-   g_clear_object (&priv->message);
-   g_clear_object (&priv->auth);
-=20
-@@ -73,13 +77,17 @@ rest_proxy_auth_new (RestProxy *proxy,
-   RestProxyAuth *rest_auth;
-=20
-   g_return_val_if_fail (REST_IS_PROXY (proxy), NULL);
-+#ifdef WITH_SOUP_2
-   g_return_val_if_fail (SOUP_IS_SESSION (session), NULL);
-+#endif
-   g_return_val_if_fail (SOUP_IS_MESSAGE (message), NULL);
-   g_return_val_if_fail (SOUP_IS_AUTH (soup_auth), NULL);
-=20
-   rest_auth =3D REST_PROXY_AUTH (g_object_new (REST_TYPE_PROXY_AUTH, NU=
LL));
-   rest_auth->priv->proxy =3D g_object_ref(proxy);
-+#ifdef WITH_SOUP_2
-   rest_auth->priv->session =3D g_object_ref(session);
-+#endif
-   rest_auth->priv->message =3D g_object_ref(message);
-   rest_auth->priv->auth =3D g_object_ref(soup_auth);
-=20
-@@ -104,7 +112,9 @@ rest_proxy_auth_pause (RestProxyAuth *auth)
-       return;
-=20
-   auth->priv->paused =3D TRUE;
-+#ifdef WITH_SOUP_2
-   soup_session_pause_message (auth->priv->session, auth->priv->message)=
;
-+#endif
- }
-=20
- /**
-@@ -128,7 +138,9 @@ rest_proxy_auth_unpause (RestProxyAuth *auth)
-   soup_auth_authenticate (auth->priv->auth, username, password);
-   g_free (username);
-   g_free (password);
-+#ifdef WITH_SOUP_2
-   soup_session_unpause_message (auth->priv->session, auth->priv->messag=
e);
-+#endif
-   auth->priv->paused =3D FALSE;
- }
-=20
-@@ -146,7 +158,11 @@ rest_proxy_auth_cancel (RestProxyAuth *auth)
- {
-   g_return_if_fail (REST_IS_PROXY_AUTH (auth));
-=20
-+#ifdef WITH_SOUP_2
-   soup_session_cancel_message (auth->priv->session, auth->priv->message=
, SOUP_STATUS_CANCELLED);
-+#else
-+  soup_auth_cancel (auth->priv->auth);
-+#endif
- }
-=20
- G_GNUC_INTERNAL gboolean rest_proxy_auth_is_paused (RestProxyAuth *auth=
)
-diff --git a/rest/rest-proxy-call.c b/rest/rest-proxy-call.c
-index 2ab722f..62b00da 100644
---- a/rest/rest-proxy-call.c
-+++ b/rest/rest-proxy-call.c
-@@ -20,12 +20,14 @@
-  *
-  */
-=20
-+#include <config.h>
- #include <rest/rest-proxy.h>
- #include <rest/rest-proxy-call.h>
- #include <rest/rest-params.h>
- #include <libsoup/soup.h>
-=20
- #include "rest-private.h"
-+#include "rest-proxy-auth-private.h"
- #include "rest-proxy-call-private.h"
-=20
-=20
-@@ -38,12 +40,15 @@ struct _RestProxyCallAsyncClosure {
- };
- typedef struct _RestProxyCallAsyncClosure RestProxyCallAsyncClosure;
-=20
-+#define READ_BUFFER_SIZE 8192
-+
- struct _RestProxyCallContinuousClosure {
-   RestProxyCall *call;
-   RestProxyCallContinuousCallback callback;
-   GObject *weak_object;
-   gpointer userdata;
-   SoupMessage *message;
-+  guchar buffer[READ_BUFFER_SIZE];
- };
- typedef struct _RestProxyCallContinuousClosure RestProxyCallContinuousC=
losure;
-=20
-@@ -70,8 +75,7 @@ struct _RestProxyCallPrivate {
-   gchar *url;
-=20
-   GHashTable *response_headers;
--  goffset length;
--  gchar *payload;
-+  GBytes *payload;
-   guint status_code;
-   gchar *status_message;
-=20
-@@ -160,7 +164,7 @@ rest_proxy_call_finalize (GObject *object)
-   g_free (priv->method);
-   g_free (priv->function);
-=20
--  g_free (priv->payload);
-+  g_clear_pointer (&priv->payload, g_bytes_unref);
-   g_free (priv->status_message);
-=20
-   g_free (priv->url);
-@@ -546,14 +550,23 @@ _populate_headers_hash_table (const gchar *name,
-   g_hash_table_insert (headers, g_strdup (name), g_strdup (value));
- }
-=20
-+#ifdef WITH_SOUP_2
- /* I apologise for this macro, but it saves typing ;-) */
- #define error_helper(x) g_set_error_literal(error, REST_PROXY_ERROR, x,=
 message->reason_phrase)
-+#endif
- static gboolean
- _handle_error_from_message (SoupMessage *message, GError **error)
- {
--  if (message->status_code < 100)
-+  guint status_code;
-+  const char *reason_phrase;
-+
-+#ifdef WITH_SOUP_2
-+  status_code =3D message->status_code;
-+
-+  if (status_code < 100)
-   {
--    switch (message->status_code)
-+    g_clear_error (error);
-+    switch (status_code)
-     {
-       case SOUP_STATUS_CANCELLED:
-         error_helper (REST_PROXY_ERROR_CANCELLED);
-@@ -580,61 +593,84 @@ _handle_error_from_message (SoupMessage *message, =
GError **error)
-     }
-     return FALSE;
-   }
-+  reason_phrase =3D message->reason_phrase;
-+#else
-+  status_code =3D soup_message_get_status (message);
-+  reason_phrase =3D soup_message_get_reason_phrase (message);
-+#endif
-=20
--  if (message->status_code >=3D 200 && message->status_code < 300)
-+  if (status_code >=3D 200 && status_code < 300)
-   {
-     return TRUE;
-   }
-=20
-+  if (*error !=3D NULL)
-+    return FALSE;
-+
-   /* If we are here we must be in some kind of HTTP error, lets try */
-   g_set_error_literal (error,
-                        REST_PROXY_ERROR,
--                       message->status_code,
--                       message->reason_phrase);
-+                       status_code,
-+                       reason_phrase);
-   return FALSE;
- }
-=20
- static gboolean
--finish_call (RestProxyCall *call, SoupMessage *message, GError **error)
-+finish_call (RestProxyCall *call, SoupMessage *message, GBytes *payload=
, GError **error)
- {
-   RestProxyCallPrivate *priv =3D GET_PRIVATE (call);
-+  SoupMessageHeaders *response_headers;
-=20
-   g_assert (call);
-   g_assert (message);
-+  g_assert (payload);
-+
-+#ifdef WITH_SOUP_2
-+  response_headers =3D message->response_headers;
-+#else
-+  response_headers =3D soup_message_get_response_headers (message);
-+#endif
-=20
-   /* Convert the soup headers in to hash */
-   /* FIXME: Eeek..are you allowed duplicate headers? ... */
-   g_hash_table_remove_all (priv->response_headers);
--  soup_message_headers_foreach (message->response_headers,
-+  soup_message_headers_foreach (response_headers,
-       (SoupMessageHeadersForeachFunc)_populate_headers_hash_table,
-       priv->response_headers);
-=20
--  priv->payload =3D g_memdup (message->response_body->data,
--                            message->response_body->length + 1);
--  priv->length =3D message->response_body->length;
-+  priv->payload =3D payload;
-=20
-+#ifdef WITH_SOUP_2
-   priv->status_code =3D message->status_code;
-   priv->status_message =3D g_strdup (message->reason_phrase);
-+#else
-+  priv->status_code =3D soup_message_get_status (message);
-+  priv->status_message =3D g_strdup (soup_message_get_reason_phrase (me=
ssage));
-+#endif
-=20
-   return _handle_error_from_message (message, error);
- }
-=20
- static void
--_continuous_call_message_completed_cb (SoupSession *session,
--                                       SoupMessage *message,
--                                       gpointer     userdata)
-+_continuous_call_message_completed (SoupMessage *message,
-+                                    GError      *error,
-+                                    gpointer     userdata)
- {
-   RestProxyCallContinuousClosure *closure;
-   RestProxyCall *call;
-   RestProxyCallPrivate *priv;
--  GError *error =3D NULL;
-=20
-   closure =3D (RestProxyCallContinuousClosure *)userdata;
-   call =3D closure->call;
-   priv =3D GET_PRIVATE (call);
-=20
-+#ifdef WITH_SOUP_2
-   priv->status_code =3D message->status_code;
-   priv->status_message =3D g_strdup (message->reason_phrase);
-+#else
-+  priv->status_code =3D soup_message_get_status (message);
-+  priv->status_message =3D g_strdup (soup_message_get_reason_phrase (me=
ssage));
-+#endif
-=20
-   _handle_error_from_message (message, &error);
-=20
-@@ -657,6 +693,7 @@ _continuous_call_message_completed_cb (SoupSession *=
session,
-=20
-   priv->cur_call_closure =3D NULL;
-   g_object_unref (closure->call);
-+  g_object_unref (message);
-   g_slice_free (RestProxyCallContinuousClosure, closure);
- }
-=20
-@@ -715,6 +752,49 @@ set_url (RestProxyCall *call)
-   return TRUE;
- }
-=20
-+#ifndef WITH_SOUP_2
-+static gboolean
-+authenticate (RestProxyCall *call,
-+              SoupAuth      *soup_auth,
-+              gboolean       retrying,
-+              SoupMessage   *message)
-+{
-+  RestProxyCallPrivate *priv =3D GET_PRIVATE (call);
-+  RestProxyAuth *rest_auth;
-+  gboolean try_auth;
-+
-+  rest_auth =3D rest_proxy_auth_new (priv->proxy, NULL, message, soup_a=
uth);
-+  g_signal_emit_by_name (priv->proxy, "authenticate", rest_auth, retryi=
ng, &try_auth);
-+  if (try_auth && !rest_proxy_auth_is_paused (rest_auth)) {
-+    char *username, *password;
-+
-+    g_object_get (priv->proxy, "username", &username, "password", &pass=
word, NULL);
-+    soup_auth_authenticate (soup_auth, username, password);
-+    g_free (username);
-+    g_free (password);
-+  }
-+  g_object_unref (rest_auth);
-+
-+  return try_auth;
-+}
-+
-+static gboolean
-+accept_certificate (RestProxyCall        *call,
-+                    GTlsCertificate      *tls_certificate,
-+                    GTlsCertificateFlags *tls_errors,
-+                    SoupMessage          *message)
-+{
-+        RestProxyCallPrivate *priv =3D GET_PRIVATE (call);
-+        gboolean ssl_strict;
-+
-+        if (tls_errors =3D=3D 0)
-+                return TRUE;
-+
-+        g_object_get (priv->proxy, "ssl-strict", &ssl_strict, NULL);
-+        return !ssl_strict;
-+}
-+#endif
-+
- static SoupMessage *
- prepare_message (RestProxyCall *call, GError **error_out)
- {
-@@ -722,6 +802,7 @@ prepare_message (RestProxyCall *call, GError **error=
_out)
-   RestProxyCallClass *call_class;
-   const gchar *user_agent;
-   SoupMessage *message;
-+  SoupMessageHeaders *request_headers;
-   GError *error =3D NULL;
-=20
-   call_class =3D REST_PROXY_CALL_GET_CLASS (call);
-@@ -748,6 +829,9 @@ prepare_message (RestProxyCall *call, GError **error=
_out)
-     gchar *content;
-     gchar *content_type;
-     gsize content_len;
-+#ifndef WITH_SOUP_2
-+    GBytes *body;
-+#endif
-=20
-     if (!call_class->serialize_params (call, &content_type,
-                                        &content, &content_len, &error))
-@@ -780,8 +864,14 @@ prepare_message (RestProxyCall *call, GError **erro=
r_out)
-                              "Could not parse URI");
-         return NULL;
-     }
-+#ifdef WITH_SOUP_2
-     soup_message_set_request (message, content_type,
-                               SOUP_MEMORY_TAKE, content, content_len);
-+#else
-+    body =3D g_bytes_new_take (content, content_len);
-+    soup_message_set_request_body_from_bytes (message, content_type, bo=
dy);
-+    g_bytes_unref (body);
-+#endif
-=20
-     g_free (content_type);
-   } else if (rest_params_are_strings (priv->params)) {
-@@ -798,9 +888,15 @@ prepare_message (RestProxyCall *call, GError **erro=
r_out)
-=20
-     hash =3D rest_params_as_string_hash_table (priv->params);
-=20
-+#ifdef WITH_SOUP_2
-     message =3D soup_form_request_new_from_hash (priv->method,
-                                                priv->url,
-                                                hash);
-+#else
-+    message =3D soup_message_new_from_encoded_form (priv->method,
-+                                                  priv->url,
-+                                                  soup_form_encode_hash=
 (hash));
-+#endif
-=20
-     g_hash_table_unref (hash);
-=20
-@@ -827,19 +923,28 @@ prepare_message (RestProxyCall *call, GError **err=
or_out)
-       if (rest_param_is_string (param)) {
-         soup_multipart_append_form_string (mp, name, rest_param_get_con=
tent (param));
-       } else {
--        SoupBuffer *sb;
--
--        sb =3D soup_buffer_new_with_owner (rest_param_get_content (para=
m),
--                                         rest_param_get_content_length =
(param),
--                                         rest_param_ref (param),
--                                         (GDestroyNotify)rest_param_unr=
ef);
-+#ifdef WITH_SOUP_2
-+        SoupBuffer *sb =3D soup_buffer_new_with_owner (rest_param_get_c=
ontent (param),
-+                                                     rest_param_get_con=
tent_length (param),
-+                                                     rest_param_ref (pa=
ram),
-+                                                     (GDestroyNotify)re=
st_param_unref);
-+#else
-+        GBytes *sb =3D g_bytes_new_with_free_func (rest_param_get_conte=
nt (param),
-+                                                 rest_param_get_content=
_length (param),
-+                                                 (GDestroyNotify)rest_p=
aram_unref,
-+                                                 rest_param_ref (param)=
);
-+#endif
-=20
-         soup_multipart_append_form_file (mp, name,
-                                          rest_param_get_file_name (para=
m),
-                                          rest_param_get_content_type (p=
aram),
-                                          sb);
-=20
-+#ifdef WITH_SOUP_2
-         soup_buffer_free (sb);
-+#else
-+        g_bytes_unref (sb);
-+#endif
-       }
-     }
-=20
-@@ -853,19 +958,36 @@ prepare_message (RestProxyCall *call, GError **err=
or_out)
-         return NULL;
-     }
-=20
-+#ifdef WITH_SOUP_2
-     message =3D soup_form_request_new_from_multipart (priv->url, mp);
-+#else
-+    message =3D soup_message_new_from_multipart (priv->url, mp);
-+#endif
-=20
-     soup_multipart_free (mp);
-   }
-=20
-+#ifdef WITH_SOUP_2
-+  request_headers =3D message->request_headers;
-+#else
-+  request_headers =3D soup_message_get_request_headers (message);
-+  g_signal_connect_swapped (message, "authenticate",
-+                            G_CALLBACK (authenticate),
-+                            call);
-+  g_signal_connect_swapped (message, "accept-certificate",
-+                            G_CALLBACK (accept_certificate),
-+                            call);
-+#endif
-+
-+
-   /* Set the user agent, if one was set in the proxy */
-   user_agent =3D rest_proxy_get_user_agent (priv->proxy);
-   if (user_agent) {
--    soup_message_headers_append (message->request_headers, "User-Agent"=
, user_agent);
-+    soup_message_headers_append (request_headers, "User-Agent", user_ag=
ent);
-   }
-=20
-   /* Set the headers */
--  g_hash_table_foreach (priv->headers, set_header, message->request_hea=
ders);
-+  g_hash_table_foreach (priv->headers, set_header, request_headers);
-=20
-   return message;
- }
-@@ -878,17 +1000,17 @@ _call_message_call_cancelled_cb (GCancellable  *c=
ancellable,
- }
-=20
- static void
--_call_message_call_completed_cb (SoupSession *session,
--                                 SoupMessage *message,
-+_call_message_call_completed_cb (SoupMessage *message,
-+                                 GBytes      *payload,
-+                                 GError      *error,
-                                  gpointer     user_data)
- {
-   GTask *task =3D user_data;
-   RestProxyCall *call;
--  GError *error =3D NULL;
-=20
-   call =3D REST_PROXY_CALL (g_task_get_source_object (task));
-=20
--  finish_call (call, message, &error);
-+  finish_call (call, message, payload, &error);
-=20
-   if (error !=3D NULL)
-     g_task_return_error (task, error);
-@@ -938,6 +1060,7 @@ rest_proxy_call_invoke_async (RestProxyCall      *c=
all,
-=20
-   _rest_proxy_queue_message (priv->proxy,
-                              message,
-+                             priv->cancellable,
-                              _call_message_call_completed_cb,
-                              task);
- }
-@@ -962,16 +1085,55 @@ rest_proxy_call_invoke_finish (RestProxyCall  *ca=
ll,
- }
-=20
- static void
--_continuous_call_message_got_chunk_cb (SoupMessage                    *=
msg,
--                                       SoupBuffer                     *=
chunk,
--                                       RestProxyCallContinuousClosure *=
closure)
-+_continuous_call_read_cb (GObject      *source,
-+                          GAsyncResult *result,
-+                          gpointer      user_data)
- {
-+  GInputStream *stream =3D G_INPUT_STREAM (source);
-+  RestProxyCallContinuousClosure *closure =3D user_data;
-+  RestProxyCallPrivate *priv =3D GET_PRIVATE (closure->call);
-+  gssize bytes_read;
-+  GError *error =3D NULL;
-+
-+  bytes_read =3D g_input_stream_read_finish (stream, result, &error);
-+  if (bytes_read <=3D 0)
-+    {
-+      _continuous_call_message_completed (closure->message, error, user=
_data);
-+      return;
-+    }
-+
-   closure->callback (closure->call,
--                     chunk->data,
--                     chunk->length,
-+                     (gconstpointer)closure->buffer,
-+                     bytes_read,
-                      NULL,
-                      closure->weak_object,
-                      closure->userdata);
-+
-+  g_input_stream_read_async (stream, closure->buffer, READ_BUFFER_SIZE,=
 G_PRIORITY_DEFAULT,
-+                             priv->cancellable, _continuous_call_read_c=
b, closure);
-+}
-+
-+static void
-+_continuous_call_message_sent_cb (GObject      *source,
-+                                  GAsyncResult *result,
-+                                  gpointer      user_data)
-+{
-+  RestProxy *proxy =3D REST_PROXY (source);
-+  RestProxyCallContinuousClosure *closure =3D user_data;
-+  RestProxyCallPrivate *priv =3D GET_PRIVATE (closure->call);
-+  GInputStream *stream;
-+  GError *error =3D NULL;
-+
-+  stream =3D _rest_proxy_send_message_finish (proxy, result, &error);
-+  if (!stream)
-+    {
-+      _continuous_call_message_completed (closure->message, error, user=
_data);
-+      return;
-+    }
-+
-+  g_input_stream_read_async (stream, closure->buffer, READ_BUFFER_SIZE,=
 G_PRIORITY_DEFAULT,
-+                             priv->cancellable, _continuous_call_read_c=
b, closure);
-+  g_object_unref (stream);
- }
-=20
-=20
-@@ -1021,9 +1183,6 @@ rest_proxy_call_continuous (RestProxyCall         =
           *call,
-   if (message =3D=3D NULL)
-     return FALSE;
-=20
--  /* Must turn off accumulation */
--  soup_message_body_set_accumulate (message->response_body, FALSE);
--
-   closure =3D g_slice_new0 (RestProxyCallContinuousClosure);
-   closure->call =3D g_object_ref (call);
-   closure->callback =3D callback;
-@@ -1041,33 +1200,29 @@ rest_proxy_call_continuous (RestProxyCall       =
             *call,
-         closure);
-   }
-=20
--  g_signal_connect (message,
--                    "got-chunk",
--                    (GCallback)_continuous_call_message_got_chunk_cb,
--                    closure);
--
--  _rest_proxy_queue_message (priv->proxy,
--                             message,
--                             _continuous_call_message_completed_cb,
--                             closure);
-+  _rest_proxy_send_message_async (priv->proxy,
-+                                  message,
-+                                  priv->cancellable,
-+                                  _continuous_call_message_sent_cb,
-+                                  closure);
-   return TRUE;
- }
-=20
- static void
--_upload_call_message_completed_cb (SoupSession *session,
--                                   SoupMessage *message,
-+_upload_call_message_completed_cb (SoupMessage *message,
-+                                   GBytes      *payload,
-+                                   GError      *error,
-                                    gpointer     user_data)
- {
-   RestProxyCall *call;
-   RestProxyCallPrivate *priv;
--  GError *error =3D NULL;
-   RestProxyCallUploadClosure *closure;
-=20
-   closure =3D (RestProxyCallUploadClosure *) user_data;
-   call =3D closure->call;
-   priv =3D GET_PRIVATE (call);
-=20
--  finish_call (call, message, &error);
-+  finish_call (call, message, payload, &error);
-=20
-   closure->callback (closure->call,
-                      closure->uploaded,
-@@ -1093,14 +1248,25 @@ _upload_call_message_completed_cb (SoupSession *=
session,
-=20
- static void
- _upload_call_message_wrote_data_cb (SoupMessage                *msg,
-+#ifdef WITH_SOUP_2
-                                     SoupBuffer                 *chunk,
-+#else
-+                                    gsize                       chunk_s=
ize,
-+#endif
-                                     RestProxyCallUploadClosure *closure=
)
- {
--  closure->uploaded =3D closure->uploaded + chunk->length;
-+#ifdef WITH_SOUP_2
-+  gsize chunk_size =3D chunk->length;
-+  goffset content_length =3D msg->request_body->length;
-+#else
-+  goffset content_length =3D soup_message_headers_get_content_length (s=
oup_message_get_request_headers (msg));
-+#endif
-=20
--  if (closure->uploaded < msg->request_body->length)
-+  closure->uploaded =3D closure->uploaded + chunk_size;
-+
-+  if (closure->uploaded < content_length)
-     closure->callback (closure->call,
--                       msg->request_body->length,
-+                       content_length,
-                        closure->uploaded,
-                        NULL,
-                        closure->weak_object,
-@@ -1178,6 +1344,7 @@ rest_proxy_call_upload (RestProxyCall             =
   *call,
-=20
-   _rest_proxy_queue_message (priv->proxy,
-                              message,
-+                             priv->cancellable,
-                              _upload_call_message_completed_cb,
-                              closure);
-   return TRUE;
-@@ -1206,6 +1373,10 @@ rest_proxy_call_cancel (RestProxyCall *call)
-   if (priv->cancellable)
-     {
-       g_signal_handler_disconnect (priv->cancellable, priv->cancel_sig)=
;
-+#ifndef WITH_SOUP_2
-+      if (!g_cancellable_is_cancelled (priv->cancellable))
-+              g_cancellable_cancel (priv->cancellable);
-+#endif
-       g_clear_object (&priv->cancellable);
-     }
-=20
-@@ -1240,6 +1411,7 @@ rest_proxy_call_sync (RestProxyCall *call,
-   RestProxyCallPrivate *priv =3D GET_PRIVATE (call);
-   SoupMessage *message;
-   gboolean ret;
-+  GBytes *payload;
-=20
-   g_return_val_if_fail (REST_IS_PROXY_CALL (call), FALSE);
-=20
-@@ -1247,9 +1419,9 @@ rest_proxy_call_sync (RestProxyCall *call,
-   if (!message)
-     return FALSE;
-=20
--  _rest_proxy_send_message (priv->proxy, message);
-+  payload =3D _rest_proxy_send_message (priv->proxy, message, priv->can=
cellable, error_out);
-=20
--  ret =3D finish_call (call, message, error_out);
-+  ret =3D finish_call (call, message, payload, error_out);
-=20
-   g_object_unref (message);
-=20
-@@ -1314,9 +1486,16 @@ rest_proxy_call_get_response_headers (RestProxyCa=
ll *call)
- goffset
- rest_proxy_call_get_payload_length (RestProxyCall *call)
- {
-+  GBytes *payload;
-+
-   g_return_val_if_fail (REST_IS_PROXY_CALL (call), 0);
-=20
--  return GET_PRIVATE (call)->length;
-+  payload =3D GET_PRIVATE (call)->payload;
-+#ifdef WITH_SOUP_2
-+  return payload ? g_bytes_get_size (payload) - 1 : 0;
-+#else
-+  return payload ? g_bytes_get_size (payload) : 0;
-+#endif
- }
-=20
- /**
-@@ -1331,9 +1510,12 @@ rest_proxy_call_get_payload_length (RestProxyCall=
 *call)
- const gchar *
- rest_proxy_call_get_payload (RestProxyCall *call)
- {
-+  GBytes *payload;
-+
-   g_return_val_if_fail (REST_IS_PROXY_CALL (call), NULL);
-=20
--  return GET_PRIVATE (call)->payload;
-+  payload =3D GET_PRIVATE (call)->payload;
-+  return payload ? g_bytes_get_data (payload, NULL) : NULL;
- }
-=20
- /**
-diff --git a/rest/rest-proxy.c b/rest/rest-proxy.c
-index 80972a3..171f6cb 100644
---- a/rest/rest-proxy.c
-+++ b/rest/rest-proxy.c
-@@ -45,6 +45,9 @@ struct _RestProxyPrivate {
-   SoupSession *session;
-   gboolean disable_cookies;
-   char *ssl_ca_file;
-+#ifndef WITH_SOUP_2
-+  gboolean ssl_strict;
-+#endif
- };
-=20
-=20
-@@ -116,11 +119,15 @@ rest_proxy_get_property (GObject   *object,
-       g_value_set_string (value, priv->password);
-       break;
-     case PROP_SSL_STRICT: {
-+#ifdef WITH_SOUP_2
-       gboolean ssl_strict;
-       g_object_get (G_OBJECT(priv->session),
-                     "ssl-strict", &ssl_strict,
-                     NULL);
-       g_value_set_boolean (value, ssl_strict);
-+#else
-+      g_value_set_boolean (value, priv->ssl_strict);
-+#endif
-       break;
-     }
-     case PROP_SSL_CA_FILE:
-@@ -172,9 +179,13 @@ rest_proxy_set_property (GObject      *object,
-       priv->password =3D g_value_dup_string (value);
-       break;
-     case PROP_SSL_STRICT:
-+#ifdef WITH_SOUP_2
-       g_object_set (G_OBJECT(priv->session),
-                     "ssl-strict", g_value_get_boolean (value),
-                     NULL);
-+#else
-+      priv->ssl_strict =3D g_value_get_boolean (value);
-+#endif
-       break;
-     case PROP_SSL_CA_FILE:
-       g_free(priv->ssl_ca_file);
-@@ -207,6 +218,7 @@ default_authenticate_cb (RestProxy *self,
-   return !retrying;
- }
-=20
-+#ifdef WITH_SOUP_2
- static void
- authenticate (RestProxy   *self,
-               SoupMessage *msg,
-@@ -224,6 +236,7 @@ authenticate (RestProxy   *self,
-     soup_auth_authenticate (soup_auth, priv->username, priv->password);
-   g_object_unref (G_OBJECT (rest_auth));
- }
-+#endif
-=20
- static void
- rest_proxy_constructed (GObject *object)
-@@ -238,14 +251,20 @@ rest_proxy_constructed (GObject *object)
-   }
-=20
-   if (REST_DEBUG_ENABLED(PROXY)) {
-+#ifdef WITH_SOUP_2
-     SoupSessionFeature *logger =3D (SoupSessionFeature*)soup_logger_new=
 (SOUP_LOGGER_LOG_BODY, 0);
-+#else
-+    SoupSessionFeature *logger =3D (SoupSessionFeature*)soup_logger_new=
 (SOUP_LOGGER_LOG_HEADERS);
-+#endif
-     soup_session_add_feature (priv->session, logger);
-     g_object_unref (logger);
-   }
-=20
-+#ifdef WITH_SOUP_2
-   /* session lifetime is same as self, no need to keep signalid */
-   g_signal_connect_swapped (priv->session, "authenticate",
-                             G_CALLBACK(authenticate), object);
-+#endif
- }
-=20
- static void
-@@ -391,23 +410,62 @@ rest_proxy_class_init (RestProxyClass *klass)
-   proxy_class->authenticate =3D default_authenticate_cb;
- }
-=20
-+static gboolean
-+transform_ssl_ca_file_to_tls_database (GBinding     *binding,
-+                                       const GValue *from_value,
-+                                       GValue       *to_value,
-+                                       gpointer      user_data)
-+{
-+  g_value_take_object (to_value,
-+                       g_tls_file_database_new (g_value_get_string (fro=
m_value), NULL));
-+  return TRUE;
-+}
-+
-+static gboolean
-+transform_tls_database_to_ssl_ca_file (GBinding     *binding,
-+                                       const GValue *from_value,
-+                                       GValue       *to_value,
-+                                       gpointer      user_data)
-+{
-+  GTlsDatabase *tls_database;
-+  char *path =3D NULL;
-+
-+  tls_database =3D g_value_get_object (from_value);
-+  if (tls_database)
-+    g_object_get (tls_database, "anchors", &path, NULL);
-+  g_value_take_string (to_value, path);
-+  return TRUE;
-+}
-+
- static void
- rest_proxy_init (RestProxy *self)
- {
-   RestProxyPrivate *priv =3D GET_PRIVATE (self);
-+  GTlsDatabase *tls_database;
-+
-+#ifndef WITH_SOUP_2
-+  priv->ssl_strict =3D TRUE;
-+#endif
-=20
-   priv->session =3D soup_session_new ();
-=20
- #ifdef REST_SYSTEM_CA_FILE
-   /* with ssl-strict (defaults TRUE) setting ssl-ca-file forces all
-    * certificates to be trusted */
--  g_object_set (priv->session,
--                "ssl-ca-file", REST_SYSTEM_CA_FILE,
--                NULL);
-+  tls_database =3D g_tls_file_database_new (REST_SYSTEM_CA_FILE, NULL);
-+  if (tls_database) {
-+          g_object_set (priv->session,
-+                        "tls-database", tls_database,
-+                        NULL);
-+          g_object_unref (tls_database);
-+  }
- #endif
--  g_object_bind_property (self, "ssl-ca-file",
--                          priv->session, "ssl-ca-file",
--                          G_BINDING_BIDIRECTIONAL);
-+  g_object_bind_property_full (self, "ssl-ca-file",
-+                               priv->session, "tls-database",
-+                               G_BINDING_BIDIRECTIONAL,
-+                               transform_ssl_ca_file_to_tls_database,
-+                               transform_tls_database_to_ssl_ca_file,
-+                               NULL, NULL);
- }
-=20
- /**
-@@ -689,27 +747,127 @@ rest_proxy_simple_run (RestProxy *proxy,
-   return ret;
- }
-=20
-+typedef struct {
-+  RestMessageFinishedCallback callback;
-+  gpointer user_data;
-+} RestMessageQueueData;
-+
-+#ifdef WITH_SOUP_2
-+static void
-+message_finished_cb (SoupSession *session,
-+                     SoupMessage *message,
-+                     gpointer     user_data)
-+{
-+  RestMessageQueueData *data =3D user_data;
-+  GBytes *body;
-+  GError *error =3D NULL;
-+
-+  body =3D g_bytes_new (message->response_body->data,
-+                      message->response_body->length + 1);
-+  data->callback (message, body, error, data->user_data);
-+  g_free (data);
-+}
-+#else
-+static void
-+message_send_and_read_ready_cb (GObject      *source,
-+                                GAsyncResult *result,
-+                                gpointer      user_data)
-+{
-+  SoupSession *session =3D SOUP_SESSION (source);
-+  RestMessageQueueData *data =3D user_data;
-+  GBytes *body;
-+  GError *error =3D NULL;
-+
-+  body =3D soup_session_send_and_read_finish (session, result, &error);
-+  data->callback (soup_session_get_async_result_message (session, resul=
t), body, error, data->user_data);
-+  g_free (data);
-+}
-+#endif
-+
- void
--_rest_proxy_queue_message (RestProxy   *proxy,
--                           SoupMessage *message,
--                           SoupSessionCallback callback,
--                           gpointer user_data)
-+_rest_proxy_queue_message (RestProxy                  *proxy,
-+                           SoupMessage                *message,
-+                           GCancellable               *cancellable,
-+                           RestMessageFinishedCallback callback,
-+                           gpointer                    user_data)
- {
-   RestProxyPrivate *priv =3D GET_PRIVATE (proxy);
-+  RestMessageQueueData *data;
-=20
-   g_return_if_fail (REST_IS_PROXY (proxy));
-   g_return_if_fail (SOUP_IS_MESSAGE (message));
-=20
-+  data =3D g_new0 (RestMessageQueueData, 1);
-+  data->callback =3D callback;
-+  data->user_data =3D user_data;
-+
-+#ifdef WITH_SOUP_2
-   soup_session_queue_message (priv->session,
-                               message,
--                              callback,
--                              user_data);
-+                              message_finished_cb,
-+                              data);
-+#else
-+  soup_session_send_and_read_async (priv->session,
-+                                    message,
-+                                    G_PRIORITY_DEFAULT,
-+                                    cancellable,
-+                                    message_send_and_read_ready_cb,
-+                                    data);
-+#endif
-+}
-+
-+static void
-+message_send_ready_cb (GObject      *source,
-+                       GAsyncResult *result,
-+                       gpointer      user_data)
-+{
-+  SoupSession *session =3D SOUP_SESSION (source);
-+  GTask *task =3D user_data;
-+  GInputStream *stream;
-+  GError *error =3D NULL;
-+
-+  stream =3D soup_session_send_finish (session, result, &error);
-+  if (stream)
-+    g_task_return_pointer (task, stream, g_object_unref);
-+  else
-+    g_task_return_error (task, error);
-+  g_object_unref (task);
-+}
-+
-+void
-+_rest_proxy_send_message_async (RestProxy          *proxy,
-+                                SoupMessage        *message,
-+                                GCancellable       *cancellable,
-+                                GAsyncReadyCallback callback,
-+                                gpointer            user_data)
-+{
-+  RestProxyPrivate *priv =3D GET_PRIVATE (proxy);
-+  GTask *task;
-+
-+  task =3D g_task_new (proxy, cancellable, callback, user_data);
-+  soup_session_send_async (priv->session,
-+                           message,
-+#ifndef WITH_SOUP_2
-+                           G_PRIORITY_DEFAULT,
-+#endif
-+                           cancellable,
-+                           message_send_ready_cb,
-+                           task);
-+}
-+
-+GInputStream *
-+_rest_proxy_send_message_finish (RestProxy    *proxy,
-+                                 GAsyncResult *result,
-+                                 GError      **error)
-+{
-+  return g_task_propagate_pointer (G_TASK (result), error);
- }
-=20
- void
- _rest_proxy_cancel_message (RestProxy   *proxy,
-                             SoupMessage *message)
- {
-+#ifdef WITH_SOUP_2
-   RestProxyPrivate *priv =3D GET_PRIVATE (proxy);
-=20
-   g_return_if_fail (REST_IS_PROXY (proxy));
-@@ -718,16 +876,31 @@ _rest_proxy_cancel_message (RestProxy   *proxy,
-   soup_session_cancel_message (priv->session,
-                                message,
-                                SOUP_STATUS_CANCELLED);
-+#endif
- }
-=20
--guint
--_rest_proxy_send_message (RestProxy   *proxy,
--                          SoupMessage *message)
-+GBytes *
-+_rest_proxy_send_message (RestProxy    *proxy,
-+                          SoupMessage  *message,
-+                          GCancellable *cancellable,
-+                          GError      **error)
- {
-   RestProxyPrivate *priv =3D GET_PRIVATE (proxy);
-+  GBytes *body;
-=20
--  g_return_val_if_fail (REST_IS_PROXY (proxy), 0);
--  g_return_val_if_fail (SOUP_IS_MESSAGE (message), 0);
-+  g_return_val_if_fail (REST_IS_PROXY (proxy), NULL);
-+  g_return_val_if_fail (SOUP_IS_MESSAGE (message), NULL);
-+
-+#ifdef WITH_SOUP_2
-+  soup_session_send_message (priv->session, message);
-+  body =3D g_bytes_new (message->response_body->data,
-+                      message->response_body->length + 1);
-+#else
-+  body =3D soup_session_send_and_read (priv->session,
-+                                     message,
-+                                     cancellable,
-+                                     error);
-+#endif
-=20
--  return soup_session_send_message (priv->session, message);
-+  return body;
- }
-diff --git a/tests/custom-serialize.c b/tests/custom-serialize.c
-index c3fde93..01b3a56 100644
---- a/tests/custom-serialize.c
-+++ b/tests/custom-serialize.c
-@@ -88,22 +88,40 @@ custom_proxy_call_init (CustomProxyCall *self)
- }
-=20
- static void
-+#ifdef WITH_SOUP_2
- server_callback (SoupServer *server, SoupMessage *msg,
-                  const char *path, GHashTable *query,
-                  SoupClientContext *client, gpointer user_data)
-+#else
-+server_callback (SoupServer *server, SoupServerMessage *msg,
-+                 const char *path, GHashTable *query, gpointer user_dat=
a)
-+#endif
- {
-   if (g_str_equal (path, "/ping")) {
-     const char *content_type =3D NULL;
-+#ifdef WITH_SOUP_2
-     SoupMessageHeaders *headers =3D msg->request_headers;
-     SoupMessageBody *body =3D msg->request_body;
-+#else
-+    SoupMessageHeaders *headers =3D soup_server_message_get_request_hea=
ders (msg);
-+    SoupMessageBody *body =3D soup_server_message_get_request_body (msg=
);
-+#endif
-     content_type =3D soup_message_headers_get_content_type (headers, NU=
LL);
-     g_assert_cmpstr (content_type, =3D=3D, "application/json");
-=20
-     g_assert_cmpstr (body->data, =3D=3D, "{}");
-=20
-+#ifdef WITH_SOUP_2
-     soup_message_set_status (msg, SOUP_STATUS_OK);
-+#else
-+    soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
-+#endif
-   } else {
-+#ifdef WITH_SOUP_2
-     soup_message_set_status (msg, SOUP_STATUS_NOT_IMPLEMENTED);
-+#else
-+    soup_server_message_set_status (msg, SOUP_STATUS_NOT_IMPLEMENTED, N=
ULL);
-+#endif
-   }
- }
-=20
-diff --git a/tests/proxy-continuous.c b/tests/proxy-continuous.c
-index 8f4b7a8..7967bbd 100644
---- a/tests/proxy-continuous.c
-+++ b/tests/proxy-continuous.c
-@@ -39,9 +39,15 @@ static SoupServer *server;
- static gboolean
- send_chunks (gpointer user_data)
- {
--  SoupMessage *msg =3D SOUP_MESSAGE (user_data);
-   guint i;
-   guint8 data[SIZE_CHUNK];
-+#ifdef WITH_SOUP_2
-+  SoupMessage *msg =3D SOUP_MESSAGE (user_data);
-+  SoupMessageBody *response_body =3D msg->response_body;
-+#else
-+  SoupServerMessage *msg =3D SOUP_SERVER_MESSAGE (user_data);
-+  SoupMessageBody *response_body =3D soup_server_message_get_response_b=
ody (msg);
-+#endif
-=20
-   for (i =3D 0; i < SIZE_CHUNK; i++)
-   {
-@@ -49,12 +55,12 @@ send_chunks (gpointer user_data)
-     server_count++;
-   }
-=20
--  soup_message_body_append (msg->response_body, SOUP_MEMORY_COPY, data,=
 SIZE_CHUNK);
-+  soup_message_body_append (response_body, SOUP_MEMORY_COPY, data, SIZE=
_CHUNK);
-   soup_server_unpause_message (server, msg);
-=20
-   if (server_count =3D=3D NUM_CHUNKS * SIZE_CHUNK)
-   {
--    soup_message_body_complete (msg->response_body);
-+    soup_message_body_complete (response_body);
-     return FALSE;
-   } else {
-     return TRUE;
-@@ -62,13 +68,28 @@ send_chunks (gpointer user_data)
- }
-=20
- static void
-+#ifdef WITH_SOUP_2
- server_callback (SoupServer *server, SoupMessage *msg,
-                  const char *path, GHashTable *query,
-                  SoupClientContext *client, gpointer user_data)
-+#else
-+server_callback (SoupServer *server, SoupServerMessage *msg,
-+                 const char *path, GHashTable *query, gpointer user_dat=
a)
-+#endif
- {
-+#ifdef WITH_SOUP_2
-+  SoupMessageHeaders *response_headers =3D msg->response_headers;
-+#else
-+  SoupMessageHeaders *response_headers =3D soup_server_message_get_resp=
onse_headers (msg);
-+#endif
-+
-   g_assert_cmpstr (path, =3D=3D, "/stream");
-+#ifdef WITH_SOUP_2
-   soup_message_set_status (msg, SOUP_STATUS_OK);
--  soup_message_headers_set_encoding (msg->response_headers,
-+#else
-+  soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
-+#endif
-+  soup_message_headers_set_encoding (response_headers,
-                                      SOUP_ENCODING_CHUNKED);
-   soup_server_pause_message (server, msg);
-=20
-@@ -142,13 +163,21 @@ continuous ()
-   uris =3D soup_server_get_uris (server);
-   g_assert (g_slist_length (uris) > 0);
-=20
-+#ifdef WITH_SOUP_2
-   url =3D soup_uri_to_string (uris->data, FALSE);
-+#else
-+  url =3D g_uri_to_string (uris->data);
-+#endif
-=20
-   loop =3D g_main_loop_new (NULL, FALSE);
-=20
-   proxy =3D rest_proxy_new (url, FALSE);
-   stream_test (proxy);
-+#ifdef WITH_SOUP_2
-   g_slist_free_full (uris, (GDestroyNotify)soup_uri_free);
-+#else
-+  g_slist_free_full (uris, (GDestroyNotify)g_uri_unref);
-+#endif
-=20
-   g_main_loop_run (loop);
-   g_free (url);
-diff --git a/tests/proxy.c b/tests/proxy.c
-index 89a9325..652c600 100644
---- a/tests/proxy.c
-+++ b/tests/proxy.c
-@@ -49,20 +49,35 @@ SoupServer *server;
- GMainLoop *server_loop;
-=20
- static void
-+#ifdef WITH_SOUP_2
- server_callback (SoupServer *server, SoupMessage *msg,
-                  const char *path, GHashTable *query,
-                  SoupClientContext *client, gpointer user_data)
-+#else
-+server_callback (SoupServer *server, SoupServerMessage *msg,
-+                 const char *path, GHashTable *query, gpointer user_dat=
a)
-+#endif
- {
-   if (g_str_equal (path, "/ping")) {
-+#ifdef WITH_SOUP_2
-     soup_message_set_status (msg, SOUP_STATUS_OK);
-+#else
-+    soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
-+#endif
-   }
-   else if (g_str_equal (path, "/echo")) {
-     const char *value;
-=20
-     value =3D g_hash_table_lookup (query, "value");
-+#ifdef WITH_SOUP_2
-     soup_message_set_response (msg, "text/plain", SOUP_MEMORY_COPY,
-                                value, strlen (value));
-     soup_message_set_status (msg, SOUP_STATUS_OK);
-+#else
-+    soup_server_message_set_response (msg, "text/plain", SOUP_MEMORY_CO=
PY,
-+                                      value, strlen (value));
-+    soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
-+#endif
-   }
-   else if (g_str_equal (path, "/reverse")) {
-     char *value;
-@@ -70,9 +85,15 @@ server_callback (SoupServer *server, SoupMessage *msg=
,
-     value =3D g_strdup (g_hash_table_lookup (query, "value"));
-     g_strreverse (value);
-=20
-+#ifdef WITH_SOUP_2
-     soup_message_set_response (msg, "text/plain", SOUP_MEMORY_TAKE,
-                                value, strlen (value));
-     soup_message_set_status (msg, SOUP_STATUS_OK);
-+#else
-+    soup_server_message_set_response (msg, "text/plain", SOUP_MEMORY_TA=
KE,
-+                                       value, strlen (value));
-+    soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
-+#endif
-   }
-   else if (g_str_equal (path, "/status")) {
-     const char *value;
-@@ -81,25 +102,61 @@ server_callback (SoupServer *server, SoupMessage *m=
sg,
-     value =3D g_hash_table_lookup (query, "status");
-     if (value) {
-       status =3D atoi (value);
-+#ifdef WITH_SOUP_2
-       soup_message_set_status (msg, status ?: SOUP_STATUS_INTERNAL_SERV=
ER_ERROR);
-+#else
-+      soup_server_message_set_status (msg, status ?: SOUP_STATUS_INTERN=
AL_SERVER_ERROR, NULL);
-+#endif
-     } else {
-+#ifdef WITH_SOUP_2
-       soup_message_set_status (msg, SOUP_STATUS_INTERNAL_SERVER_ERROR);
-+#else
-+      soup_server_message_set_status (msg, SOUP_STATUS_INTERNAL_SERVER_=
ERROR, NULL);
-+#endif
-     }
-   }
-   else if (g_str_equal (path, "/useragent/none")) {
--    if (soup_message_headers_get (msg->request_headers, "User-Agent") =3D=
=3D NULL) {
-+#ifdef WITH_SOUP_2
-+    SoupMessageHeaders *request_headers =3D msg->request_headers;
-+#else
-+    SoupMessageHeaders *request_headers =3D soup_server_message_get_req=
uest_headers (msg);
-+#endif
-+
-+    if (soup_message_headers_get (request_headers, "User-Agent") =3D=3D=
 NULL) {
-+#ifdef WITH_SOUP_2
-       soup_message_set_status (msg, SOUP_STATUS_OK);
-+#else
-+      soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
-+#endif
-     } else {
-+#ifdef WITH_SOUP_2
-       soup_message_set_status (msg, SOUP_STATUS_EXPECTATION_FAILED);
-+#else
-+      soup_server_message_set_status (msg, SOUP_STATUS_EXPECTATION_FAIL=
ED, NULL);
-+#endif
-     }
-   }
-   else if (g_str_equal (path, "/useragent/testsuite")) {
-+#ifdef WITH_SOUP_2
-+    SoupMessageHeaders *request_headers =3D msg->request_headers;
-+#else
-+    SoupMessageHeaders *request_headers =3D soup_server_message_get_req=
uest_headers (msg);
-+#endif
-     const char *value;
--    value =3D soup_message_headers_get (msg->request_headers, "User-Age=
nt");
-+    value =3D soup_message_headers_get (request_headers, "User-Agent");
-     if (g_strcmp0 (value, "TestSuite-1.0") =3D=3D 0) {
-+#ifdef WITH_SOUP_2
-       soup_message_set_status (msg, SOUP_STATUS_OK);
-+#else
-+      soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
-+#endif
-     } else {
-+#ifdef WITH_SOUP_2
-       soup_message_set_status (msg, SOUP_STATUS_EXPECTATION_FAILED);
-+#else
-+      soup_server_message_set_status (msg, SOUP_STATUS_EXPECTATION_FAIL=
ED, NULL);
-+#endif
-+
-     }
-   }
- }
-@@ -325,7 +382,7 @@ main (int argc, char **argv)
-   char *url;
-   RestProxy *proxy;
-=20
--  server =3D soup_server_new ("", NULL);
-+  server =3D soup_server_new (NULL);
-   g_thread_new ("Server Thread", server_thread_func, NULL);
-=20
-   url =3D g_strdup_printf ("http://127.0.0.1:%d/", PORT);
-diff --git a/tests/threaded.c b/tests/threaded.c
-index a251900..411361c 100644
---- a/tests/threaded.c
-+++ b/tests/threaded.c
-@@ -36,13 +36,22 @@ GMainLoop *main_loop;
- SoupServer *server;
-=20
- static void
-+#ifdef WITH_SOUP_2
- server_callback (SoupServer *server, SoupMessage *msg,
-                  const char *path, GHashTable *query,
-                  SoupClientContext *client, gpointer user_data)
-+#else
-+server_callback (SoupServer *server, SoupServerMessage *msg,
-+                 const char *path, GHashTable *query, gpointer user_dat=
a)
-+#endif
- {
-   g_assert_cmpstr (path, =3D=3D, "/ping");
-=20
-+#ifdef WITH_SOUP_2
-   soup_message_set_status (msg, SOUP_STATUS_OK);
-+#else
-+  soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
-+#endif
-   g_atomic_int_add (&threads_done, 1);
-=20
-   if (threads_done =3D=3D N_THREADS) {
-@@ -96,7 +105,11 @@ static void ping ()
-   uris =3D soup_server_get_uris (server);
-   g_assert (g_slist_length (uris) > 0);
-=20
-+#ifdef WITH_SOUP_2
-   url =3D soup_uri_to_string (uris->data, FALSE);
-+#else
-+  url =3D g_uri_to_string (uris->data);
-+#endif
-=20
-   main_loop =3D g_main_loop_new (NULL, TRUE);
-=20
-@@ -109,7 +122,11 @@ static void ping ()
-   g_main_loop_run (main_loop);
-=20
-   g_free (url);
-+#ifdef WITH_SOUP_2
-   g_slist_free_full (uris, (GDestroyNotify)soup_uri_free);
-+#else
-+  g_slist_free_full (uris, (GDestroyNotify)g_uri_unref);
-+#endif
-   g_object_unref (server);
-   g_main_loop_unref (main_loop);
- }
---=20
-2.33.1
-
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.8.1.bb
deleted file mode 100644
index f1c9915c0..000000000
--- a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY =3D "library to access web services that claim to be "RESTful""
-HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-
-DEPENDS =3D " \
-    libxml2-native \
-    glib-2.0-native \
-    glib-2.0 \
-    libsoup-2.4 \
-"
-
-inherit gnomebase gobject-introspection gtk-doc vala
-
-PV .=3D "+git${SRCPV}"
-SRCREV =3D "7b46065dea860ef09861f4d70124728b8270c8b7"
-SRC_URI =3D "git://gitlab.gnome.org/GNOME/librest;protocol=3Dhttps;branc=
h=3Dmaster \
-    file://0001-Use-GUri-instead-of-SoupURI.patch \
-    file://0002-Port-to-libsoup3.patch \
-"
-S =3D "${WORKDIR}/git"
-
-do_configure:prepend() {
-    # rest expects introspection.m4 at custom location (see aclocal.m4).
-    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}=
/build
-}
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/rest/.libs"
-}
-
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.0.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.0.bb
new file mode 100644
index 000000000..2256a1899
--- /dev/null
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.0.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "library to access web services that claim to be "RESTful""
+HOMEPAGE =3D "https://wiki.gnome.org/Projects/Librest"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+DEPENDS =3D " \
+    gi-docgen \
+    gi-docgen-native \
+    glib-2.0 \
+    glib-2.0-native \
+    json-glib \
+    libxml2-native \
+"
+
+inherit gnomebase gobject-introspection vala pkgconfig
+
+PACKAGECONFIG_SOUP ?=3D "soup3"
+PACKAGECONFIG ??=3D "${PACKAGECONFIG_SOUP}"
+
+PACKAGECONFIG[soup2] =3D "-Dsoup2=3Dtrue,,libsoup-2.4"
+PACKAGECONFIG[soup3] =3D "-Dsoup2=3Dfalse,,libsoup-3.0"
+
+SRC_URI[archive.sha256sum] =3D "85b2bc9341128139539b53ee53f0533310bc9639=
2fd645863a040410b81ebe66"
--=20
2.34.1


