Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D92C369D3
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:49:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.12049.1745228945533685903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 087B8F8
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:48:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6nlX-0UaYJb0; Mon, 21 Apr 2025 11:48:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 7/9] libsdl3-ttf: add recipe
Date: Mon, 21 Apr 2025 11:48:30 +0200
Message-ID: <20250421094832.67450-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421094832.67450-1-f_l_k@t-online.de>
References: <20250421094832.67450-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745228919-4B7FD94A-F20B8D27/0/0 CLEAN NORMAL
X-TOI-MSGID: 937d1ba2-d714-45e8-82a0-f0caaf685547
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 09:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116996

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb b/meta=
-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
new file mode 100644
index 0000000000..f914d1dcff
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Simple DirectMedia Layer truetype font library"
+SECTION =3D "libs"
+DEPENDS =3D "libsdl3 freetype"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
+
+SRC_URI =3D "http://www.libsdl.org/projects/SDL_ttf/release/SDL3_ttf-${P=
V}.tar.gz \
+"
+SRC_URI[sha256sum] =3D "63547d58d0185c833213885b635a2c0548201cc8f301e658=
7c0be1a67e1e045d"
+
+S =3D "${WORKDIR}/SDL3_ttf-${PV}"
+
+inherit cmake pkgconfig
+
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.49.0


