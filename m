Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DFDC369DF
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.4198.1745526862783306600
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id 55E0119FA
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H2-38CNSc0; Thu, 24 Apr 2025 22:34:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 10/18] wxwidgets: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:58 +0200
Message-ID: <20250424203406.2113462-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526861-4B7FDA5A-B04B06C8/0/0 CLEAN NORMAL
X-TOI-MSGID: b4d01dcb-efc7-4864-89c8-a56deea2ff5c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117101

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb b/meta=
-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 71e2a60e0c..1ef707ca60 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -74,7 +74,7 @@ PACKAGECONFIG[libsecret] =3D "-DwxUSE_SECRETSTORE=3DON,=
-DwxUSE_SECRETSTORE=3DOFF,libse
 PACKAGECONFIG[lzma] =3D "-DwxUSE_LIBLZMA=3DON,-DwxUSE_LIBLZMA=3DOFF,xz"
 PACKAGECONFIG[mspack] =3D "-DwxUSE_LIBMSPACK=3DON,-DwxUSE_LIBMSPACK=3DOF=
F,libmspack"
 PACKAGECONFIG[opengl] =3D "-DwxUSE_OPENGL=3DON,-DwxUSE_OPENGL=3DOFF,libg=
lu"
-PACKAGECONFIG[sdl_audio] =3D "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,l=
ibsdl2"
+PACKAGECONFIG[sdl_audio] =3D "-DwxUSE_LIBSDL=3DON,-DwxUSE_LIBSDL=3DOFF,v=
irtual/libsdl2"
 PACKAGECONFIG[webkit] =3D "-DwxUSE_WEBVIEW_WEBKIT=3DON,-DwxUSE_WEBVIEW_W=
EBKIT=3DOFF,webkitgtk3,,,no_gui"
 PACKAGECONFIG[curl] =3D "-DwxUSE_WEBREQUEST_CURL=3DON,-DwxUSE_WEBREQUEST=
_CURL=3DOFF,curl"
=20
--=20
2.49.0


