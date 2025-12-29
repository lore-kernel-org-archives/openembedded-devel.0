Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B55E92FD8
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 20:30:04 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50964.1767040203401514913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 12:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id 4BC3BE9CA
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 21:30:00 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.149]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vaJsM-1kWXiL0; Mon, 29 Dec 2025 21:29:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tmux: add packageconfig for sixel support
Date: Mon, 29 Dec 2025 21:29:47 +0100
Message-ID: <20251229202947.115090-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1767040199-727D1069-57B2D285/0/0 CLEAN NORMAL
X-TOI-MSGID: 603efd69-4d05-4603-8b68-3d3af900e35a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 20:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122998

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/tmux/tmux_3.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.6.bb b/meta-oe/recipes-=
extended/tmux/tmux_3.6.bb
index 5daa1b174a..199863d7e4 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.6.bb
@@ -17,6 +17,7 @@ inherit autotools pkgconfig
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[utempter] =3D "ac_cv_header_utempter_h=3Dyes,ac_cv_header_=
utempter_h=3Dno,libutempter,"
+PACKAGECONFIG[sixel] =3D "--enable-sixel,--disable-sixel"
=20
 do_configure:prepend() {
     # The 'compat' directory is needed for output during the build but i=
t's
--=20
2.52.0


