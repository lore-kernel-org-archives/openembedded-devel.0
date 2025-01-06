Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F28E77199
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 18:01:21 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.735.1736186476103038158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 10:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 957C3468
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jan 2025 19:01:14 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.190]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tUrPd-0Py1Lu0; Mon, 6 Jan 2025 19:01:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] packagegoup-meta-multimedia: adjust RDEPENDS for h264/hevc
Date: Mon,  6 Jan 2025 19:01:33 +0100
Message-ID: <20250106180133.308686-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106180133.308686-1-f_l_k@t-online.de>
References: <20250106180133.308686-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736186473-6EFFA99A-CEE3631F/0/0 CLEAN NORMAL
X-TOI-MSGID: 6062a4a9-8e47-44c1-a098-73d78ff5a991
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 18:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114669

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegrou=
p-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/p=
ackagegroup-meta-multimedia.bb
index 618eaa68d1..83efaaa125 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
@@ -53,7 +53,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
     opus-tools \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "sox st=
reamripper", "", d)} \
     tinyalsa \
-    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.util=
s.contains_any("TRANSLATED_TARGET_ARCH", "i586 i686 x86-64", "x265", "", =
d), "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "x265 o=
penh264 libde265", "", d)} \
 "
 RDEPENDS:packagegroup-meta-multimedia:remove:libc-musl =3D "projucer"
=20
--=20
2.47.1


