Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2755C54E41
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:08:54 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.1667.1709924924915293737
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 11:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id B22705A80
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 20:08:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rifZv-1zryw10; Fri, 8 Mar 2024 20:08:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/5] libvncserver: fix reproducibility issue
Date: Fri,  8 Mar 2024 20:08:29 +0100
Message-ID: <20240308190829.2442866-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308190829.2442866-1-f_l_k@t-online.de>
References: <20240308190829.2442866-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709924903-2F7FD9FB-34DD3B39/0/0 CLEAN NORMAL
X-TOI-MSGID: bc63bcab-6f5b-41da-98d6-d7f878519dc1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 19:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109236

remove STAGING_DIR_HOST from the LibVNCServerTargets.cmake file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb=
 b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index 50bdad57d..ce01593b8 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -50,3 +50,7 @@ SRCREV =3D "10e9eb75f73e973725dc75c373de5d89807af028"
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D "-DMAKE_INSTALL_LIBDIR=3D${libdir}"
+
+do_install:append() {
+    sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${libdir}/cmake/LibVNCServe=
r/LibVNCServerTargets.cmake
+}
--=20
2.44.0


