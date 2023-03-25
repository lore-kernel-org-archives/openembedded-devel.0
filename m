Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C943EC77B7D
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.17462.1679731399438666421
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 53DA922355
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrq-0RoPhl0; Sat, 25 Mar 2023 09:03:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 29/32] wxwidgets: build with webkitgtk-4
Date: Sat, 25 Mar 2023 09:02:53 +0100
Message-Id: <20230325080256.923752-29-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731394-8656CC08-BB81B136/0/0 CLEAN NORMAL
X-TOI-MSGID: ac7719d9-f784-4932-898c-28debf683276
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101738

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta=
-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
index 39b6a2bc7..159b28e73 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
@@ -74,7 +74,7 @@ PACKAGECONFIG[lzma] =3D "-DwxUSE_LIBLZMA=3DON,-DwxUSE_L=
IBLZMA=3DOFF,xz"
 PACKAGECONFIG[mspack] =3D "-DwxUSE_LIBMSPACK=3DON,-DwxUSE_LIBMSPACK=3DOF=
F,libmspack"
 PACKAGECONFIG[opengl] =3D "-DwxUSE_OPENGL=3DON,-DwxUSE_OPENGL=3DOFF,libg=
lu"
 PACKAGECONFIG[sdl_audio] =3D "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,l=
ibsdl2"
-PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_W=
EBKIT=3DOFF,webkitgtk,,,no_gui"
+PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_W=
EBKIT=3DOFF,webkitgtk-4,,,no_gui"
 PACKAGECONFIG[curl] =3D "-DwxUSE_WEBREQUEST_CURL=3DON,-DwxUSE_WEBREQUEST=
_CURL=3DOFF,curl"
=20
 # Support LFS unconditionally
--=20
2.34.1


