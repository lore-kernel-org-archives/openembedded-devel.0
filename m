Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3A0C433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 17:23:58 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web12.753.1651857828392647200
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 May 2022 10:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout09.t-online.de (Postfix) with SMTP id B25881DF56
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  6 May 2022 19:23:46 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.224.120]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nn1g9-0wtDOL0; Fri, 6 May 2022 19:23:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] minidlna: fix obsolete license warning
Date: Fri,  6 May 2022 19:23:27 +0200
Message-Id: <20220506172327.1214402-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1651857825-00010BFA-8A37122A/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b94d79a-1df3-4bec-b9cb-209b16ebf510
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 May 2022 17:23:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96974

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/m=
eta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index b913a8393..4959a3c8d 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "MiniDLNA (aka ReadyDLNA) is server software with the ai=
m of \
 being fully compliant with DLNA/UPnP-AV clients."
-LICENSE =3D "GPL-2.0|BSD-3-Clause"
+LICENSE =3D "GPL-2.0-only|BSD-3-Clause"
 DEPENDS =3D "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag lib=
vorbis"
=20
 # because it depends on libav which has commercial flag
--=20
2.25.1


