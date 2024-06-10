Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E46BC27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 09:30:30 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.15545.1718011825131910349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 02:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id B99E211EB8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 11:29:49 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.42.224]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGbLZ-4EdM6D0; Mon, 10 Jun 2024 11:29:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libgee: downgrade incompatible-pointer-types back to warning
Date: Mon, 10 Jun 2024 11:30:38 +0200
Message-ID: <20240610093038.2236-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1718011789-1E7FBCAA-A4490FBF/0/0 CLEAN NORMAL
X-TOI-MSGID: ef081e44-b473-44ed-822a-b1160e6fb432
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 09:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110793

Workaround to fix build with gcc14

I had a look here and to me it seems like it needs to be to be fixed most=
ly in vala
https://gitlab.com/fweimer-rh/fedora-modernc/-/blob/main/pkg/l/libgee.md?=
ref_type=3Dheads

The issue has been reported for various distributions
https://lists.opensuse.org/archives/list/bugs@lists.opensuse.org/message/=
7GKXU2QW6DCH6AJQ62PLFWDMRNTEM5FD/
https://bugs.gentoo.org/920315

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/r=
ecipes-devtools/libgee/libgee_0.20.6.bb
index 9e52fe0ce..7e2781bcb 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase vala gobject-introspection
=20
+CFLAGS +=3D "-Wno-incompatible-pointer-types"
+
 do_configure:prepend() {
     MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversio=
n.m4"
     for i in ${MACROS}; do
--=20
2.45.1


