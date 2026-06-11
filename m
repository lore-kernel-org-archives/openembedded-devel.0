Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF35CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:57:01 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41077.1781168220093430001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=cXW5ido+;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout04.t-online.de (Postfix) with SMTP id 0B677625
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:56:58 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXbDZ-3J4dNZ0; Thu, 11 Jun 2026 10:56:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/3] libdvdnav: switch to meson buildsystem
Date: Thu, 11 Jun 2026 10:56:45 +0200
Message-ID: <20260611085647.233427-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781168213-DBFFCB6E-8D6CCEDA/0/0 CLEAN NORMAL
X-TOI-MSGID: 8dc49fe6-8dbb-4848-ba28-2d2bbd54be6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781168217; i=f_l_k@t-online.de;
	bh=Z6h8ZITB7ShE8x/o2TM4S42NnH2xDwuSskffm72eltg=;
	h=From:To:Subject:Date;
	b=cXW5ido+TU5QV86UNg7Ia4f3oCIgcoNVm6RvzaosvLTiw8535VcY7iZRt2BfpH5hA
	 Q01SKLeQ09K3HLifPh6eOgpN1kMacJ2zw3RmnmqMQqJ2klT++YaIwaUAxRhWsEwKDf
	 8W9orNHn3TFjVCGXau+Wt170I46H3LVWT4lcp8f+Je/h1CfzaDJYEkbQg7pAmgQ7TJ
	 H/QjJrkujdzTFX8IUFUFAqRF58qEkAsqgLCDfyzqDxvjYOPFzNEQz9NcpQlU1MqzvJ
	 +V7/njKwEQwH3c/deP4G27FdBoUWiiIXcZU0MsT7xQIrHz+Xf7hH8O+yr8baZ+MztL
	 YhfJpS2Vc7qRA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 08:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127521

autotools buildsystem has been removed:
do_configure: no configure script found

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/libdvdnav/libdvdnav_7.0.0.bb         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_7.0.0=
.bb b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_7.0.0.bb
index 3d73996cfb..746608da28 100644
--- a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_7.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_7.0.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f"
 DEPENDS =3D "libdvdread"
=20
 SRC_URI =3D "https://download.videolan.org/pub/videolan/${BPN}/${PV}/${B=
P}.tar.xz"
-SRC_URI[md5sum] =3D "e9e9f137cdd52828abc0c61b727ea579"
 SRC_URI[sha256sum] =3D "a2a18f5ad36d133c74bf9106b6445806fa253b09141a4639=
2550394b647b221e"
=20
-inherit autotools lib_package binconfig pkgconfig
+inherit meson lib_package binconfig pkgconfig manpages
+
+PACKAGECONFIG[manpages] =3D "-Denable_docs=3Dtrue,-Denable_docs=3Dfalse,=
doxygen-native"
=20
-CONFIGUREOPTS:remove =3D "--disable-silent-rules"
=20
--=20
2.54.0


