Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A21C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:57:17 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.5385.1711184229499632162
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 54C545E904
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:57:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnxBY-09puTZ0; Sat, 23 Mar 2024 09:57:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] msgraph: add recipe
Date: Sat, 23 Mar 2024 09:57:27 +0100
Message-ID: <20240323085727.237078-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711184224-CDFF8957-599FA0DA/0/0 CLEAN NORMAL
X-TOI-MSGID: c622eac5-dad8-4c69-9fd5-5d45066742e6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109545

libmsgraph would be required for onedrive support in gvfs

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/msgraph/msgraph_0.2.1.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb b/meta-gno=
me/recipes-gnome/msgraph/msgraph_0.2.1.bb
new file mode 100644
index 000000000..4c11a8d13
--- /dev/null
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "libmsgraph is a GLib-based library for accessing online ser=
ive APIs using MS Graph protocol."
+LICENSE =3D "LGPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce9=
404"
+
+inherit gnomebase gobject-introspection gi-docgen
+
+SRC_URI[archive.sha256sum] =3D "e0e59eaa8ae3e0a48ec0a6c2fed0470856a70924=
8e9212b6a1d037de5792ecbb"
+
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+
+EXTRA_OEMESON =3D "-Dtests=3Dfalse"
+
+DEPENDS =3D " \
+    glib-2.0\
+    json-glib \
+    rest \
+    gnome-online-accounts \
+"
--=20
2.44.0


