Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4890CC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:51:18 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.12189.1663681874994877181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 06:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id C9B2BCAEE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:50:54 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.47.161]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oadeI-2AM2YD0; Tue, 20 Sep 2022 15:50:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] appstream-glib: fix manpage generation
Date: Tue, 20 Sep 2022 15:50:31 +0200
Message-Id: <20220920135031.3080802-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1663681854-EDFF0A26-E45070CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c03be60-3a1c-4329-9ceb-2e309eb56be6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 13:51:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98908

Creating manpages is set by default but fails with:

| I/O error : Attempt to load network entity http://docbook.sourceforge.n=
et/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net=
/release/xsl/current/manpages/docbook.xsl"
| cannot parse http://docbook.sourceforge.net/release/xsl/current/manpage=
s/docbook.xsl

Disable manpage generation by default but fix the dependencies, so it wou=
ldn't fail

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/appstream-glib/appstream-glib_0.7.18.bb  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7=
.18.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.=
bb
index 45a28ed96..c56e9e3dd 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
@@ -17,7 +17,7 @@ DEPENDS =3D " \
     libstemmer \
 "
=20
-inherit meson gobject-introspection gettext bash-completion pkgconfig
+inherit meson gobject-introspection gettext bash-completion pkgconfig ma=
npages
=20
 SRC_URI =3D "https://people.freedesktop.org/~hughsient/${BPN}/releases/$=
{BP}.tar.xz"
 SRC_URI[sha256sum] =3D "ca1ed22e3bde3912cb903aaa7de085d55771da454f1c0573=
fd9608e1de9c4002"
@@ -26,6 +26,9 @@ EXTRA_OEMESON =3D " \
     -Drpm=3Dfalse \
 "
=20
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,docbook-xml-dtd4=
-native docbook-xsl-stylesheets-native libxslt-native"
+
 FILES:${PN} +=3D "${libdir}/asb-plugins-5"
=20
 FILES:${PN}-dev +=3D " \
--=20
2.34.1


