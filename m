Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2341C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 21:07:16 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.4949.1745528830528164652
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 14:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id 1C5CF7B2
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 23:07:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83mm-2SnPuM0; Thu, 24 Apr 2025 23:07:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libsdl2-compat: make use of virtual/libsdl3
Date: Thu, 24 Apr 2025 23:06:59 +0200
Message-ID: <20250424210659.2282492-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424210659.2282492-1-f_l_k@t-online.de>
References: <20250424210659.2282492-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745528828-84FF6AE4-B04B8FEC/0/0 CLEAN NORMAL
X-TOI-MSGID: 8471717f-f13c-4a08-88a0-d55304853a73
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 21:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117119

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
index 4553ac14e1..af65c810eb 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "http://www.libsdl.org/release/sdl2-compat-=
${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "eb02c4c47d90e7a2585a65c712cf4a08ff4c37c0a1efc17a=
f49d8ebde3292c23"
 S =3D "${WORKDIR}/sdl2-compat-${PV}"
=20
-DEPENDS +=3D "libsdl3"
+DEPENDS +=3D "virtual/libsdl3"
=20
 PROVIDES =3D "virtual/libsdl2"
=20
--=20
2.49.0


