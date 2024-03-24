Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB10C47DD9
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 09:23:34 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.26152.1711272211864673410
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Mar 2024 02:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout04.t-online.de (Postfix) with SMTP id A93EE22518
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 10:23:17 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.9]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1roK4T-27qOrx0; Sun, 24 Mar 2024 10:23:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] evolution-data-server: disable tests and examples
Date: Sun, 24 Mar 2024 10:23:35 +0100
Message-ID: <20240324092335.2319272-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711272197-2EFFAC95-6F5EA015/0/0 CLEAN NORMAL
X-TOI-MSGID: 573544a9-d133-4939-b236-dd4478388828
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 09:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109564

- Building the examples pulls in a requirement for gtk+3
  Also disable installed_tests and maintainer_mode
- Use json-glib by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.bb           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index 8b6a7b2a0..103bad1b6 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -2,7 +2,7 @@ require ${BPN}.inc
=20
 DEPENDS =3D " \
     ${BPN}-native gperf-native \
-    glib-2.0 gtk4 libxml2 icu \
+    glib-2.0 json-glib gtk4 libxml2 icu \
     dbus db virtual/libiconv zlib libsoup-3.0 libical nss libsecret \
 "
=20
@@ -31,6 +31,9 @@ EXTRA_OECMAKE =3D " \
     -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
     -DENABLE_GTK=3DOFF \
     -DENABLE_GTK4=3DON \
+    -DENABLE_INSTALLED_TESTS=3DOFF \
+    -DENABLE_EXAMPLES=3DOFF \
+    -DENABLE_MAINTAINER_MODE=3DOFF \
 "
=20
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_COMPILER=3D${STAGING_BIND=
IR}/g-ir-compiler-wrapper"
--=20
2.44.0


