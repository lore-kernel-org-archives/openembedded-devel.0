Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3EEC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 06:57:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.66968.1701327412879673813
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 22:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id BB47348D8F
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 07:56:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.44.42]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r8ayf-4TUGtH0; Thu, 30 Nov 2023 07:56:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCHv2 3/3] spice-gtk: Set meson version based on PV
Date: Thu, 30 Nov 2023 07:57:22 +0100
Message-ID: <20231130065722.18367-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231130065722.18367-1-f_l_k@t-online.de>
References: <20231130065722.18367-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701327410-57FA8986-039F5375/0/0 CLEAN NORMAL
X-TOI-MSGID: 35e10a69-bef8-4549-970b-576a3e6d1ca1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 06:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107166

This fixes build for gnome-boxes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/me=
ta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 3d34f222d..82ce7067d 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -52,6 +52,10 @@ GTKDOC_MESON_OPTION =3D 'gtk_doc'
 GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
 GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
=20
+do_configure:prepend() {
+	echo ${PV} > ${S}/.tarball-version
+}
+
 PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'va=
pi', '', d)} smartcard"
 PACKAGECONFIG[vapi] =3D "-Dvapi=3Denabled,-Dvapi=3Ddisabled"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Denabled,-Dsmartcard=3Ddisabl=
ed,libcacard"
--=20
2.42.1


