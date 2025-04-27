Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDC8C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 20:51:42 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.33560.1745787094236229870
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 13:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout10.t-online.de (Postfix) with SMTP id 71B9AA43
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 22:51:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.99]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u98yI-48V3Sb0; Sun, 27 Apr 2025 22:51:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libosinfo: update 1.11.0 -> 1.12.0
Date: Sun, 27 Apr 2025 22:51:23 +0200
Message-ID: <20250427205123.2533427-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745787090-927FB92C-F7C1C27B/0/0 CLEAN NORMAL
X-TOI-MSGID: 08910ac5-6ef9-48de-93b1-cf6ba4251a16
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 20:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117177

- remove backported patch
- add a patch to fix:
| ../git/osinfo/osinfo_loader.c:357:5: error: 'content' is deprecated [-W=
error=3Ddeprecated-declarations]
|   357 |     ret =3D g_strdup((char *)buf->content);
|       |     ^~~
| In file included from /home/flk/poky/build/tmp/work/corei7-64-poky-linu=
x/libosinfo/1.12.0/recipe-sysroot/usr/include/libxml2/libxml/parser.h:16,
|                  from ../git/osinfo/osinfo_loader.c:29:
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libosinfo/1.12.0/rec=
ipe-sysroot/usr/include/libxml2/libxml/tree.h:103:14: note: declared here
|   103 |     xmlChar *content XML_DEPRECATED_MEMBER;
|       |              ^~~~~~~
| ../git/osinfo/osinfo_loader.c: At top level:
| ../git/osinfo/osinfo_loader.c:1905:42: error: expected ';', ',' or ')' =
before 'ATTRIBUTE_UNUSED'
|  1905 | catchXMLError(void *ctx, const char *msg ATTRIBUTE_UNUSED, ...)
|       |                                          ^~~~~~~~~~~~~~~~
| ../git/osinfo/osinfo_loader.c: In function 'osinfo_loader_process_xml':
| ../git/osinfo/osinfo_loader.c:1948:25: error: 'catchXMLError' undeclare=
d (first use in this function)
|  1948 |     pctxt->sax->error =3D catchXMLError;
|       |                         ^~~~~~~~~~~~~
| ../git/osinfo/osinfo_loader.c:1948:25: note: each undeclared identifier=
 is reported only once for each function it appears in
| cc1: all warnings being treated as errors

1.12.0 - Oct 23, 2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Some memory leak fixes #156
- Adapt to change in libxml2 #155
- Several CI improvements
- Several translations improvements

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...rror-struct-constant-in-propagate_li.patch | 32 -------
 ...38535637ec668e658d43f04f60f11f51574f.patch | 86 +++++++++++++++++++
 ...ibosinfo_1.11.0.bb =3D> libosinfo_1.12.0.bb} |  4 +-
 3 files changed, 88 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libosinfo/libosinfo/0001-osin=
fo-Make-xmlError-struct-constant-in-propagate_li.patch
 create mode 100644 meta-oe/recipes-support/libosinfo/libosinfo/0adf38535=
637ec668e658d43f04f60f11f51574f.patch
 rename meta-oe/recipes-support/libosinfo/{libosinfo_1.11.0.bb =3D> libos=
info_1.12.0.bb} (89%)

diff --git a/meta-oe/recipes-support/libosinfo/libosinfo/0001-osinfo-Make=
-xmlError-struct-constant-in-propagate_li.patch b/meta-oe/recipes-support=
/libosinfo/libosinfo/0001-osinfo-Make-xmlError-struct-constant-in-propaga=
te_li.patch
deleted file mode 100644
index 467c6b4baf..0000000000
--- a/meta-oe/recipes-support/libosinfo/libosinfo/0001-osinfo-Make-xmlErr=
or-struct-constant-in-propagate_li.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5bbdd06503456784c5ffa22409e8bab50470d673 Mon Sep 17 00:00:00 2001
-From: Michal Privoznik <mprivozn@redhat.com>
-Date: Mon, 27 Nov 2023 15:11:45 +0100
-Subject: [PATCH] osinfo: Make xmlError struct constant in
- propagate_libxml_error()
-
-In libxml2 commit v2.12.0~14 the API changed so that
-xmlGetLastError() returns pointer to a constant xmlError struct.
-Reflect this change in our code.
-
-Upstream-Status: Backport [https://gitlab.com/libosinfo/libosinfo/-/merg=
e_requests/155]
-Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
----
- osinfo/osinfo_install_script.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/osinfo/osinfo_install_script.c b/osinfo/osinfo_install_scri=
pt.c
-index 5800f37..303245a 100644
---- a/osinfo/osinfo_install_script.c
-+++ b/osinfo/osinfo_install_script.c
-@@ -769,7 +769,7 @@ static void propagate_libxml_error(GError **error, c=
onst char *format, ...) G_GN
-=20
- static void propagate_libxml_error(GError **error, const char *format, =
...)
- {
--    xmlErrorPtr err =3D xmlGetLastError();
-+    const xmlError *err =3D xmlGetLastError();
-     char *prefix;
-     va_list ap;
-=20
---=20
-2.44.0
-
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo/0adf38535637ec66=
8e658d43f04f60f11f51574f.patch b/meta-oe/recipes-support/libosinfo/libosi=
nfo/0adf38535637ec668e658d43f04f60f11f51574f.patch
new file mode 100644
index 0000000000..f76aef8b25
--- /dev/null
+++ b/meta-oe/recipes-support/libosinfo/libosinfo/0adf38535637ec668e658d4=
3f04f60f11f51574f.patch
@@ -0,0 +1,86 @@
+From 0adf38535637ec668e658d43f04f60f11f51574f Mon Sep 17 00:00:00 2001
+From: Roman Bogorodskiy <bogorodskiy@gmail.com>
+Date: Thu, 10 Apr 2025 13:54:02 +0200
+Subject: [PATCH] loader: don't use libxml2 deprecated APIs
+
+Address the following items:
+
+ - Deprecated direct access to buf's content
+ - Mismatching error function signature
+ - Deprecated direct access to ctxt's lastError
+
+Signed-off-by: Roman Bogorodskiy <bogorodskiy@gmail.com>
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Backport [https://gitlab.com/libosinfo/libosinfo/-/comm=
it/0adf38535637ec668e658d43f04f60f11f51574f.patch]
+---
+ osinfo/osinfo_loader.c | 42 +++++++++++++++++++++++-------------------
+ 1 file changed, 23 insertions(+), 19 deletions(-)
+
+diff --git a/osinfo/osinfo_loader.c b/osinfo/osinfo_loader.c
+index 0a9004af..b3fd4535 100644
+--- a/osinfo/osinfo_loader.c
++++ b/osinfo/osinfo_loader.c
+@@ -354,7 +354,7 @@ osinfo_loader_doc(const char *xpath,
+         xmlXPathFreeObject(obj);
+         OSINFO_LOADER_SET_ERROR(err, "Cannot format stylesheet");
+     }
+-    ret =3D g_strdup((char *)buf->content);
++    ret =3D g_strdup((char *)xmlBufferContent(buf));
+=20
+     xmlBufferFree(buf);
+     xmlXPathFreeObject(obj);
+@@ -1902,28 +1902,32 @@ static void osinfo_loader_root(OsinfoLoader *loa=
der,
+ }
+=20
+ static void
+-catchXMLError(void *ctx, const char *msg ATTRIBUTE_UNUSED, ...)
++catchXMLError(void *ctx, const char *msg, ...)
+ {
+     xmlParserCtxtPtr ctxt =3D (xmlParserCtxtPtr) ctx;
++    const xmlError *xmlErr =3D NULL;
++    g_autofree gchar *xmlmsg =3D NULL;
+=20
+-    if (ctxt && ctxt->_private) {
+-        GError **err =3D ctxt->_private;
+-        if (!error_is_set(err)) {
+-            gchar *xmlmsg;
+-            if (ctxt->lastError.file) {
+-                xmlmsg =3D g_strdup_printf("%s:%d: %s",
+-                                         ctxt->lastError.file,
+-                                         ctxt->lastError.line,
+-                                         ctxt->lastError.message);
+-            } else {
+-                xmlmsg =3D g_strdup_printf("at line %d: %s",
+-                                         ctxt->lastError.line,
+-                                         ctxt->lastError.message);
+-            }
+-            OSINFO_LOADER_SET_ERROR(ctxt->_private, xmlmsg);
+-            g_free(xmlmsg);
+-        }
++    if (!ctxt || !ctxt->_private)
++        return;
++
++    if (error_is_set(ctxt->_private))
++        return;
++
++    if (!(xmlErr =3D xmlCtxtGetLastError(ctx)))
++        return;
++
++    if (xmlErr->file) {
++        xmlmsg =3D g_strdup_printf("%s:%d: %s",
++                                 xmlErr->file,
++                                 xmlErr->line,
++                                 xmlErr->message);
++    } else {
++        xmlmsg =3D g_strdup_printf("at line %d: %s",
++                                 xmlErr->line,
++                                 xmlErr->message);
+     }
++    OSINFO_LOADER_SET_ERROR(ctxt->_private, xmlmsg);
+ }
+=20
+ static void osinfo_loader_process_xml(OsinfoLoader *loader,
+--=20
+GitLab
+
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb b/meta=
-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
similarity index 89%
rename from meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
rename to meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
index 727d5ecf89..edcebf522a 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.11.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd6538=
0cdd255951079008b364516c"
 SRC_URI =3D " \
 	git://gitlab.com/libosinfo/libosinfo.git;branch=3Dmain;protocol=3Dhttps=
 \
 	file://0001-meson.build-allow-crosscompiling-gir.patch \
-	file://0001-osinfo-Make-xmlError-struct-constant-in-propagate_li.patch =
\
+	file://0adf38535637ec668e658d43f04f60f11f51574f.patch \
 "
=20
-SRCREV =3D "ca9dd5b810dc04ea38048ae9be491654c8596ef9"
+SRCREV =3D "b505ef5161d2552102a743acd4ad83298d3d8f99"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.49.0


