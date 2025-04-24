Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467A1C3ABA0
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.4137.1745526865325302043
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout07.t-online.de (Postfix) with SMTP id AD09C18D8
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H3-38CNSi0; Thu, 24 Apr 2025 22:34:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 16/18] libsdl2-compat: provide virtual/libsdl2
Date: Thu, 24 Apr 2025 22:34:04 +0200
Message-ID: <20250424203406.2113462-16-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526861-6AFFAA5A-47D6954D/0/0 CLEAN NORMAL
X-TOI-MSGID: fcf55811-7052-4f3e-a683-0b908e6ccc1d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117112

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
index cf580e49f8..4553ac14e1 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
@@ -16,7 +16,7 @@ S =3D "${WORKDIR}/sdl2-compat-${PV}"
=20
 DEPENDS +=3D "libsdl3"
=20
-PROVIDES =3D "libsdl2"
+PROVIDES =3D "virtual/libsdl2"
=20
 inherit cmake pkgconfig upstream-version-is-even features_check
=20
--=20
2.49.0


