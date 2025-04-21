Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD80C369D2
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 15:30:18 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.17915.1745249412596254635
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 08:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id AB38D7E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 17:30:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6t62-0ecHtR0; Mon, 21 Apr 2025 17:30:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-mixer: use vorbisfile for vorbis
Date: Mon, 21 Apr 2025 17:30:04 +0200
Message-ID: <20250421153004.3136-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745249410-D57F9A30-8DE23B0A/0/0 CLEAN NORMAL
X-TOI-MSGID: 1b3ce119-4e27-482d-b7d6-d850cf4562ac
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 15:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117008

By default libsdl2-mixer uses stb_vorbis and its implementation
cannot handle ogg/vorbis if the file contains skeleton metadata.
This unfortunately breaks at least dungeon_rush

Use vorbisfile instead to fix the problem

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
index 71d3dd7f90..ef205745a0 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
@@ -20,6 +20,8 @@ do_configure:prepend() {
 	touch ${STAGING_BINDIR}/wvtag
 }
=20
+EXTRA_OECMAKE +=3D "-DSDL2MIXER_VORBIS=3DVORBISFILE -DSDL2MIXER_VORBIS_V=
ORBISFILE=3DON"
+
 FILES:${PN} +=3D "${datadir}/licenses"
=20
 RDEPENDS:${PN} =3D "fluidsynth-bin wavpack-bin"
--=20
2.49.0


