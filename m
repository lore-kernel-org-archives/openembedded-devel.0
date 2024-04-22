Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A532C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:44:13 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.18807.1713793445971824480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 06:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id B6934ECBD
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 15:44:03 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.11]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rytxh-2q1m5J0; Mon, 22 Apr 2024 15:44:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] spice-gtk: add PACKAGECONFIG for webdav
Date: Mon, 22 Apr 2024 15:44:10 +0200
Message-ID: <20240422134410.1637017-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713793441-1DFF8D4A-EE72AB47/0/0 CLEAN NORMAL
X-TOI-MSGID: 97f707fe-dbbc-45c6-828c-fac18a423ff7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 13:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110103

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.42.bb
index b7c43bf2d..c8a3f7f53 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -59,6 +59,7 @@ do_configure:prepend() {
 PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'va=
pi', '', d)} smartcard"
 PACKAGECONFIG[vapi] =3D "-Dvapi=3Denabled,-Dvapi=3Ddisabled"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard"
+PACKAGECONFIG[webdav] =3D "-Dwebdav=3Denabled,-Dwebdav=3Ddisabled,phodav=
 libsoup"
=20
 EXTRA_OEMESON =3D "-Dpie=3Dtrue -Dusb-ids-path=3D${datadir}/hwdata/usb.i=
ds "
 EXTRA_OEMESON:append:libc-musl =3D " -Dcoroutine=3Dlibucontext"
--=20
2.44.0


