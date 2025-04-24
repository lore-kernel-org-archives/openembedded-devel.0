Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28894C369DC
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.4135.1745526863430965634
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 1182C1354
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H2-38CNSb0; Thu, 24 Apr 2025 22:34:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 09/18] linuxconsole: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:57 +0200
Message-ID: <20250424203406.2113462-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526860-AA7FBA5A-52DAE4EF/0/0 CLEAN NORMAL
X-TOI-MSGID: da67f73e-f6f0-488f-8ef4-2a64bf50ed07
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117109

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb =
b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
index a2a420ced8..53023b99a0 100644
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
@@ -35,7 +35,7 @@ SYSTEMD_AUTO_ENABLE:inputattach =3D "enable"
 PROVIDES +=3D "joystick"
=20
 PACKAGECONFIG ??=3D "sdl"
-PACKAGECONFIG[sdl] =3D ",,libsdl2"
+PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2"
=20
 do_compile() {
     if ! ${@bb.utils.contains('PACKAGECONFIG', 'sdl', 'true', 'false', d=
)}; then
--=20
2.49.0


