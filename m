Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683DCC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:36 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.4139.1745526867234282634
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout07.t-online.de (Postfix) with SMTP id AEEA019D5
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H4-38CNSk0; Thu, 24 Apr 2025 22:34:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 18/18] python3-kiv: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:34:06 +0200
Message-ID: <20250424203406.2113462-18-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526862-8BFFCA5A-5D23B87D/0/0 CLEAN NORMAL
X-TOI-MSGID: b0181279-d225-4479-9043-17999ff0a364
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117115

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/=
meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
index 69cf86530a..dd60ea43d5 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
@@ -46,7 +46,7 @@ ANY_OF_DISTRO_FEATURES =3D "x11 wayland"
 DEPENDS +=3D " \
     gstreamer1.0 \
     gstreamer1.0-python \
-    libsdl2 \
+    virtual/libsdl2 \
     libsdl2-ttf \
     libsdl2-image \
     libsdl2-mixer \
--=20
2.49.0


