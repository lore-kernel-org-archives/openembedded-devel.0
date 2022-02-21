Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00887C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 18:20:38 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web12.2339.1645467636736857606
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 10:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout08.t-online.de (Postfix) with SMTP id 502DEEE27
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:20:34 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.166.220]) by fwd71.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nMDIX-3oCSbx0; Mon, 21 Feb 2022 19:20:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH] libxfce4util: inherit vala
Date: Mon, 21 Feb 2022 19:20:12 +0100
Message-Id: <20220221182012.2513597-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645467634-00001674-12366197/0/0 CLEAN NORMAL
X-TOI-MSGID: f07c861f-2b5f-44ad-a917-cfcd9c4169f8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 18:20:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95423

This fixes do_configure error:

| libxfce4util/Makefile.am:159: error: ENABLE_VAPIGEN does not appear in =
AM_CONDITIONAL

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb b=
/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
index 1a0b7183e..9462b28ac 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
@@ -4,6 +4,6 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616=
475"
 DEPENDS =3D "intltool-native xfce4-dev-tools-native glib-2.0"
=20
-inherit xfce gtk-doc gobject-introspection
+inherit xfce gtk-doc gobject-introspection vala
=20
 SRC_URI[sha256sum] =3D "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743=
f55abd87d8b55b83"
--=20
2.25.1


