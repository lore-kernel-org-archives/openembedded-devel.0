Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9D0C4167B
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 11:46:24 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.25363.1699616780680322521
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 03:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id 30223617AC
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 12:45:32 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.113]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1Px1-21NTYv0; Fri, 10 Nov 2023 12:45:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/4] gupnp: Upgrade 0.10.2 -> 0.12.1
Date: Fri, 10 Nov 2023 12:45:43 +0100
Message-ID: <20231110114546.306710-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699616727-317F9820-B921A49B/0/0 CLEAN NORMAL
X-TOI-MSGID: f65fcf23-fde5-409c-b2d7-95fb88f477b7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 11:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106541

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-all-Drop-xmlRecoverMemory.patch      | 107 ------------------
 ...roperly-spell-provide-in-.wrap-files.patch |  25 ----
 .../gupnp/{gupnp_1.4.1.bb =3D> gupnp_1.6.6.bb}  |  10 +-
 3 files changed, 3 insertions(+), 139 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001=
-all-Drop-xmlRecoverMemory.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001=
-build-properly-spell-provide-in-.wrap-files.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.4.1.bb =3D> g=
upnp_1.6.6.bb} (68%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-all-Dr=
op-xmlRecoverMemory.patch b/meta-multimedia/recipes-connectivity/gupnp/gu=
pnp/0001-all-Drop-xmlRecoverMemory.patch
deleted file mode 100644
index a3941f345..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-all-Drop-xmlR=
ecoverMemory.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From 46f13d9929c81ec2340a1a5d48f596b1892c5a81 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Thu, 4 May 2023 19:14:29 +0200
-Subject: [PATCH] all: Drop xmlRecoverMemory
-
-use xmlReadMemory, also use NONET flat
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Backport [https://github.com/GNOME/gupnp/commit/80e6899=
5b745a5900eaaa1d0c424d3a9d354e42d]
----
- libgupnp/gupnp-control-point.c        | 7 +++++--
- libgupnp/gupnp-service-info.c         | 7 +++++--
- libgupnp/gupnp-service-proxy-action.c | 7 +++++--
- libgupnp/gupnp-service-proxy.c        | 7 +++++--
- libgupnp/gupnp-service.c              | 7 +++++--
- 5 files changed, 25 insertions(+), 10 deletions(-)
-
-diff --git a/libgupnp/gupnp-control-point.c b/libgupnp/gupnp-control-poi=
nt.c
-index dc04732..99ebda5 100644
---- a/libgupnp/gupnp-control-point.c
-+++ b/libgupnp/gupnp-control-point.c
-@@ -608,8 +608,11 @@ got_description_url (SoupSession           *session=
,
-                 xmlDoc *xml_doc;
-=20
-                 /* Parse response */
--                xml_doc =3D xmlRecoverMemory (msg->response_body->data,
--                                            msg->response_body->length)=
;
-+                xml_doc =3D xmlReadMemory (msg->response_body->data,
-+                                         msg->response_body->length,
-+                                         NULL,
-+                                         NULL,
-+                                         XML_PARSE_NONET | XML_PARSE_RE=
COVER);
-                 if (xml_doc) {
-                         doc =3D gupnp_xml_doc_new (xml_doc);
-=20
-diff --git a/libgupnp/gupnp-service-info.c b/libgupnp/gupnp-service-info=
.c
-index 9a9f4de..d468801 100644
---- a/libgupnp/gupnp-service-info.c
-+++ b/libgupnp/gupnp-service-info.c
-@@ -592,8 +592,11 @@ got_scpd_url (G_GNUC_UNUSED SoupSession *session,
-         if (SOUP_STATUS_IS_SUCCESSFUL (msg->status_code)) {
-                 xmlDoc *scpd;
-=20
--                scpd =3D xmlRecoverMemory (msg->response_body->data,
--                                         msg->response_body->length);
-+                scpd =3D xmlReadMemory (msg->response_body->data,
-+                                      msg->response_body->length,
-+                                      NULL,
-+                                      NULL,
-+                                      XML_PARSE_NONET | XML_PARSE_RECOV=
ER);
-                 if (scpd) {
-                         introspection =3D gupnp_service_introspection_n=
ew (scpd);
-=20
-diff --git a/libgupnp/gupnp-service-proxy-action.c b/libgupnp/gupnp-serv=
ice-proxy-action.c
-index 4d9336c..ef8a808 100644
---- a/libgupnp/gupnp-service-proxy-action.c
-+++ b/libgupnp/gupnp-service-proxy-action.c
-@@ -86,8 +86,11 @@ check_action_response (G_GNUC_UNUSED GUPnPServiceProx=
y *proxy,
-         }
-=20
-         /* Parse response */
--        response =3D xmlRecoverMemory (action->msg->response_body->data=
,
--                                     action->msg->response_body->length=
);
-+        response =3D xmlReadMemory (action->msg->response_body->data,
-+                                  action->msg->response_body->length,
-+                                  NULL,
-+                                  NULL,
-+                                  XML_PARSE_NONET | XML_PARSE_RECOVER);
-=20
-         if (!response) {
-                 if (action->msg->status_code =3D=3D SOUP_STATUS_OK) {
-diff --git a/libgupnp/gupnp-service-proxy.c b/libgupnp/gupnp-service-pro=
xy.c
-index 25d5ef6..af2fd46 100644
---- a/libgupnp/gupnp-service-proxy.c
-+++ b/libgupnp/gupnp-service-proxy.c
-@@ -1560,8 +1560,11 @@ server_handler (G_GNUC_UNUSED SoupServer        *=
soup_server,
-         }
-=20
-         /* Parse the actual XML message content */
--        doc =3D xmlRecoverMemory (msg->request_body->data,
--                                msg->request_body->length);
-+        doc =3D xmlReadMemory (msg->request_body->data,
-+                             msg->request_body->length,
-+                             NULL,
-+                             NULL,
-+                             XML_PARSE_NONET | XML_PARSE_RECOVER);
-         if (doc =3D=3D NULL) {
-                 /* Failed */
-                 g_warning ("Failed to parse NOTIFY message body");
-diff --git a/libgupnp/gupnp-service.c b/libgupnp/gupnp-service.c
-index 67b3d43..0ebfb26 100644
---- a/libgupnp/gupnp-service.c
-+++ b/libgupnp/gupnp-service.c
-@@ -985,8 +985,11 @@ control_server_handler (SoupServer                 =
     *server,
-                 *end =3D '\0';
-=20
-         /* Parse action_node */
--        doc =3D xmlRecoverMemory (msg->request_body->data,
--                                msg->request_body->length);
-+        doc =3D xmlReadMemory (msg->request_body->data,
-+                             msg->request_body->length,
-+                             NULL,
-+                             NULL,
-+                             XML_PARSE_NONET | XML_PARSE_RECOVER);
-         if (doc =3D=3D NULL) {
-                 soup_message_set_status (msg, SOUP_STATUS_BAD_REQUEST);
-=20
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-=
properly-spell-provide-in-.wrap-files.patch b/meta-multimedia/recipes-con=
nectivity/gupnp/gupnp/0001-build-properly-spell-provide-in-.wrap-files.pa=
tch
deleted file mode 100644
index 66f07094c..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properl=
y-spell-provide-in-.wrap-files.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7a4515a356a3d5eb2af1f602c77a42a544e71efa Mon Sep 17 00:00:00 2001
-From: Jan Beich <jbeich@FreeBSD.org>
-Date: Sun, 9 Jul 2023 03:30:47 +0000
-Subject: [PATCH] build: properly spell [provide] in *.wrap files
-
-meson.build:1:0: ERROR: Unexpected "[provides]" section, did you mean "[=
provide]"?
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gupnp/-/commit=
/884639bd29323cbb8fbd36bc69d08097a2ae2cd1]
----
- subprojects/gssdp-1.2.wrap | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/subprojects/gssdp-1.2.wrap b/subprojects/gssdp-1.2.wrap
-index 469c75d..466b83b 100644
---- a/subprojects/gssdp-1.2.wrap
-+++ b/subprojects/gssdp-1.2.wrap
-@@ -3,6 +3,6 @@ url =3D https://gitlab.gnome.org/GNOME/gssdp.git
- revision =3D gssdp-1.4
- depth =3D 1
- =20
--[provides]
-+[provide]
- dependency_name =3D gssdp-1.2
-=20
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb b/=
meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
similarity index 68%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
index efeb66f28..c6738923a 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
@@ -3,15 +3,11 @@ DESCRIPTION =3D "GUPnP is an elegant, object-oriented o=
pen source framework for cr
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-DEPENDS =3D "e2fsprogs gssdp libsoup-2.4 libxml2"
+DEPENDS =3D "e2fsprogs gssdp libsoup-3.0 libxml2"
=20
-inherit meson pkgconfig vala gobject-introspection
+inherit gnomebase pkgconfig vala gobject-introspection
=20
-SRC_URI =3D "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz \
-    file://0001-all-Drop-xmlRecoverMemory.patch \
-    file://0001-build-properly-spell-provide-in-.wrap-files.patch \
-"
-SRC_URI[sha256sum] =3D "899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55=
345ab3281655dc0c"
+SRC_URI[archive.sha256sum] =3D "c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3d=
ae2891e311a993a574f5a04f"
=20
 SYSROOT_PREPROCESS_FUNCS +=3D "gupnp_sysroot_preprocess"
=20
--=20
2.42.0


