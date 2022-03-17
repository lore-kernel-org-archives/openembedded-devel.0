Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4A0C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 15:02:36 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web12.11360.1647529354860385504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 08:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id 4963713916
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 16:02:33 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.192]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUre4-3V0t2P0; Thu, 17 Mar 2022 16:02:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] libvdpau: allow to build native and nativesdk
Date: Thu, 17 Mar 2022 16:02:24 +0100
Message-Id: <20220317150224.217641-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647529352-00010BFA-11DE49A9/0/0 CLEAN NORMAL
X-TOI-MSGID: 2052bfdc-ea77-4448-8283-6b147ca15ec4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 15:02:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96039

This fixes an error if trying to add libvdpau to mesa PACKAGECONFIG
---
 meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb b/meta-oe/rec=
ipes-graphics/vdpau/libvdpau_1.5.bb
index 1dc3b9acd..db3c04558 100644
--- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.5.bb
@@ -21,3 +21,5 @@ do_install:append() {
 FILES:${PN}-dbg +=3D "${libdir}/vdpau/.debug"
 FILES:${PN}-dev +=3D "${libdir}/vdpau/lib*${SOLIBSDEV}"
 FILES:${PN} +=3D "${libdir}/vdpau/lib*${SOLIBS}"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


