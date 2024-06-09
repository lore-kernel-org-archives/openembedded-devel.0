Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D6DC27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 18:44:36 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.2718.1717958670154465693
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 11:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id BC929607D7
	for <openembedded-devel@lists.openembedded.org>; Sun,  9 Jun 2024 20:44:27 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.230]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGNWl-0xf3tx0; Sun, 9 Jun 2024 20:44:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libgee: downgrade incompatible-pointer-types back to warning
Date: Sun,  9 Jun 2024 20:45:03 +0200
Message-ID: <20240609184503.3742334-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1717958667-C7FFCD1D-7A4B8E3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 25a26e81-09ec-4bb0-a28a-404fc49a5df9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 18:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110783

Workaround to fix build with gcc14

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/r=
ecipes-devtools/libgee/libgee_0.20.6.bb
index 0ed6e8235..4f9099ff0 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase vala gobject-introspection
=20
+CFLAGS +=3D "-Wno-incompatible-pointer-types"
+
 do_configure:prepend() {
     MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversio=
n.m4"
     for i in ${MACROS}; do
--=20
2.45.1


