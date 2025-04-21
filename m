Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E51C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:48:46 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.12036.1745228921735331657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout04.t-online.de (Postfix) with SMTP id 03476EC
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:48:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6nlX-0UaYJV0; Mon, 21 Apr 2025 11:48:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/9] libxmp: add recipe
Date: Mon, 21 Apr 2025 11:48:24 +0200
Message-ID: <20250421094832.67450-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745228919-E57F994A-372D1241/10/3626336762 SUSPECT URL
X-TOI-MSGID: 2676b9fe-868c-48be-b91c-30730068aa6d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 09:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116991

libxmp is a requirement for libsdl2-mixer

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb b/meta-oe/=
recipes-multimedia/libxmp/libxmp_4.6.2.bb
new file mode 100644
index 0000000000..c67b80b750
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Extended Module Player Library"
+HOMEPAGE =3D "http://xmp.sourceforge.net/"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D59;md5=3Dea030bd80f99071=
b0d3f9a9f752d1ca8"
+
+inherit cmake pkgconfig
+
+SRC_URI =3D "git://github.com/libxmp/libxmp.git;protocol=3Dhttps;branch=3D=
master"
+SRCREV =3D "828ef357943e1fbb13910e7a6fca21987c5c5827"
+
+S =3D "${WORKDIR}/git"
--=20
2.49.0


