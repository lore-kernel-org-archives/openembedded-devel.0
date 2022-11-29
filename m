Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F7EC4167B
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 06:57:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.142766.1669705060826659058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 22:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id E502E6EC8
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 07:57:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.163]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozuYB-3ii2470; Tue, 29 Nov 2022 07:57:03 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 7/7] evolution-data-server: remove libgdata dependency
Date: Tue, 29 Nov 2022 07:56:43 +0100
Message-Id: <20221129065643.82373-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129065643.82373-1-f_l_k@t-online.de>
References: <20221129065643.82373-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669705023-08E92417-D221BD41/0/0 CLEAN NORMAL
X-TOI-MSGID: fc1c984a-74e4-46fc-94f8-ca8c4194dd26
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 06:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99842

libgdata is not a dependency of evolution-data-server anymore

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index 681ff677a..c2f543ffc 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -2,7 +2,7 @@ require ${BPN}.inc
=20
 DEPENDS =3D " \
     ${BPN}-native intltool-native gperf-native \
-    glib-2.0 gtk+3 gtk4 libgdata libxml2 icu \
+    glib-2.0 gtk+3 gtk4 libxml2 icu \
     dbus db virtual/libiconv zlib libsoup-3.0 libical nss libsecret \
 "
=20
--=20
2.34.1


