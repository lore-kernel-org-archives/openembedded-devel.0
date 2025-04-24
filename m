Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520A1C3ABA2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.4204.1745526865379378907
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout07.t-online.de (Postfix) with SMTP id AB30018D6
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H3-38CNSh0; Thu, 24 Apr 2025 22:34:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 15/18] libsdl2-ttf: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:34:03 +0200
Message-ID: <20250424203406.2113462-15-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526861-29FF8A5A-50910841/0/0 CLEAN NORMAL
X-TOI-MSGID: dae6ec54-5745-4fbb-861e-22d0622e5d4e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117113

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb b/meta=
-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
index ae9a430cf5..d06f41bd0e 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.24.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Simple DirectMedia Layer truetype font library"
 SECTION =3D "libs"
-DEPENDS =3D "libsdl2 freetype virtual/egl"
+DEPENDS =3D "virtual/libsdl2 freetype virtual/egl"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
=20
--=20
2.49.0


