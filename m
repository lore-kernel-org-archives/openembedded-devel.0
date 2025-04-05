Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AE3C369A1
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 07:02:32 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.2116.1743836548783995318
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Apr 2025 00:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout07.t-online.de (Postfix) with SMTP id 3FDAA1FF5
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Apr 2025 09:02:26 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.218]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u0xXr-0u7tvG0; Sat, 5 Apr 2025 09:02:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] libgsf: fix lack of whitespace around the assignment
Date: Sat,  5 Apr 2025 09:02:10 +0200
Message-ID: <20250405070210.1416757-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405070210.1416757-1-f_l_k@t-online.de>
References: <20250405070210.1416757-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743836543-C57F9CE7-05AD6181/0/0 CLEAN NORMAL
X-TOI-MSGID: 6ab9bed8-2c4f-459f-ae65-1d2d94c73d00
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 07:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116598

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb b/meta-gno=
me/recipes-gnome/libgsf/libgsf_1.14.53.bb
index ffa24e8120..b0df3a64b6 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D61464cfe342798=
eeced82efe9ae55f63"
=20
 SECTION =3D "libs"
=20
-DEPENDS=3D "libxml2 bzip2 glib-2.0 zlib"
+DEPENDS =3D "libxml2 bzip2 glib-2.0 zlib"
=20
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
--=20
2.49.0


