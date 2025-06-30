Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F2EC8302B
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 15:17:20 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.43513.1751296637138014161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 08:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id 30482814
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 17:17:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.244]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWGFr-1XEyEj0; Mon, 30 Jun 2025 17:17:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tk: add INCLUDEDIR for tcl9.0
Date: Mon, 30 Jun 2025 17:16:55 +0200
Message-ID: <20250630151655.3505250-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1751296631-CEFFB505-6520D43E/0/0 CLEAN NORMAL
X-TOI-MSGID: 00232e95-992c-4177-936a-5d4787f9ace0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 15:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118176

this fixes a build error:
| In file included from /home/flk/poky/build/tmp/work/corei7-64-poky-linu=
x/tk/9.0.1/sources/tk9.0.1/unix/../generic/tkPort.h:21,
|                  from /home/flk/poky/build/tmp/work/corei7-64-poky-linu=
x/tk/9.0.1/sources/tk9.0.1/unix/../generic/tkInt.h:19,
|                  from /home/flk/poky/build/tmp/work/corei7-64-poky-linu=
x/tk/9.0.1/sources/tk9.0.1/unix/../generic/tkGrab.c:13:
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/tk/9.0.1/sources/tk9=
.0.1/unix/../generic/tk.h:19:10: fatal error: tcl.h: No such file or dire=
ctory
|    19 | #include <tcl.h>

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes=
-devtools/tcltk/tk_9.0.1.bb
index 504b40927e..4da4814f29 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
@@ -30,6 +30,7 @@ S =3D "${UNPACKDIR}/${BPN}${PV}"
 # Short version format: "8.6"
 VER =3D "${@os.path.splitext(d.getVar('PV'))[0]}"
=20
+CFLAGS +=3D "-I${STAGING_INCDIR}/tcl${VER}"
 LDFLAGS +=3D "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
=20
 inherit autotools features_check pkgconfig
--=20
2.49.0


