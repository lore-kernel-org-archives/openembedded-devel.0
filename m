Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D09C25B4F
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 00:04:36 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.48803.1715558675418190897
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 17:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id 46FD022D54
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 02:04:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.250]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s6JBB-21Ex2v0; Mon, 13 May 2024 02:04:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] glib-testing: add recipe
Date: Mon, 13 May 2024 02:05:01 +0200
Message-ID: <20240513000501.1150851-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715558673-3E98CC7B-04B80DC7/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a0676ae-74f9-4253-a9a2-0e6cf22d15d6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 00:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110328

glib-testing is a build dependency for malcontent, where building the tes=
ts cant be disabled.
We can only disable the run of installed tests in malcontent.

Normally glib-testing gets included as a subproject wrap which is inappro=
priate for
yocto/oe. Thus we need to provide a recipe for it.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-core/glib-2.0/glib-testing_0.1.1.bb    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb

diff --git a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb b/meta-o=
e/recipes-core/glib-2.0/glib-testing_0.1.1.bb
new file mode 100644
index 000000000..ebcc2b267
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "libglib-testing provides test harnesses and mock classes to=
 complement GLib classes"
+HOMEPAGE =3D "https://gitlab.gnome.org/pwithnall/libglib-testing"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D "git://gitlab.gnome.org/pwithnall/libglib-testing.git;protoc=
ol=3Dhttps;branch=3Dmain"
+
+PV =3D "0.1.1"
+S =3D "${WORKDIR}/git"
+SRCREV =3D "e326f73a7139c5e54fcf926896ae6e4cc899a1a7"
+
+inherit  meson pkgconfig
+
+DEPENDS =3D "glib-2.0 gtk-doc-native libxslt-native docbook-xsl-styleshe=
ets-native python3-pygments-native"
--=20
2.44.0


