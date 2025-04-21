Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF28C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 11:04:36 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.12979.1745233474575994980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 04:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 81FE23B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 13:04:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6owu-0mdSJl0; Mon, 21 Apr 2025 13:04:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libxmp: add recipe
Date: Mon, 21 Apr 2025 13:04:21 +0200
Message-ID: <20250421110421.578306-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745233468-6FFFCADA-897179B8/10/3626336762 SUSPECT URL
X-TOI-MSGID: d8c1eabc-3ced-4f72-8109-300a876f50bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117005

libxmp is a requirement for libsdl2-mixer

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb b/meta-oe/=
recipes-multimedia/libxmp/libxmp_4.6.2.bb
new file mode 100644
index 0000000000..e4cc5c93b9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.2.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Extended Module Player Library"
+HOMEPAGE =3D "http://xmp.sourceforge.net/"
+LICENSE =3D "MIT"
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


