Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA77C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 16:41:55 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.75549.1698597707793335610
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Oct 2023 09:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id 84EB365960
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Oct 2023 17:41:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.58]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qx8r9-4F7sWn0; Sun, 29 Oct 2023 17:41:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openbox: Drop deprecated libcroco dependency
Date: Sun, 29 Oct 2023 17:41:58 +0100
Message-ID: <20231029164158.186054-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1698597703-EF7FDD63-A625CDBF/0/0 CLEAN NORMAL
X-TOI-MSGID: 4a907c8a-687a-40f1-a935-6a7e008aab6f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Oct 2023 16:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105787

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/=
recipes-graphics/openbox/openbox_3.6.1.bb
index 4c97c0397..9a1507731 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "openbox Window Manager"
 SECTION =3D "x11/wm"
-DEPENDS =3D "glib-2.0 pango libxml2 virtual/libx11 libcroco librsvg gdk-=
pixbuf"
+DEPENDS =3D "glib-2.0 pango libxml2 virtual/libx11 librsvg gdk-pixbuf"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
=20
--=20
2.42.0


