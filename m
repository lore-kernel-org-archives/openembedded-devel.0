Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7D1C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 08:32:16 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.9373.1663662734660970899
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 01:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout03.t-online.de (Postfix) with SMTP id 1CF71528D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 10:32:12 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.47.161]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oaYfp-38Fg2r0; Tue, 20 Sep 2022 10:32:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] appstream-glib: fix manpage generation
Date: Tue, 20 Sep 2022 10:31:57 +0200
Message-Id: <20220920083157.660480-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1663662730-CBFFBE65-10215C49/0/0 CLEAN NORMAL
X-TOI-MSGID: 690df097-bb14-4afe-a7e1-3afae7939bf0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 08:32:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98900

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
 .../recipes-support/appstream-glib/appstream-glib_0.7.18.bb    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7=
.18.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.=
bb
index 45a28ed96..b5d60b13a 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
@@ -26,6 +26,9 @@ EXTRA_OEMESON =3D " \
     -Drpm=3Dfalse \
 "
=20
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[man] =3D "-Dman=3Dtrue,-Dman=3Dfalse,docbook-xml-dtd4-nati=
ve docbook-xsl-stylesheets-native libxslt-native"
+
 FILES:${PN} +=3D "${libdir}/asb-plugins-5"
=20
 FILES:${PN}-dev +=3D " \
--=20
2.34.1


