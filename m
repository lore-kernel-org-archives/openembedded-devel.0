Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B76D7308D
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 13:53:17 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16758.1775310791412840862
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2026 06:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=JCShQjjJ;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout08.t-online.de (Postfix) with SMTP id 0E66DE022
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Apr 2026 15:53:09 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.174.190]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w91Qx-198RQP0; Sat, 4 Apr 2026 15:53:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libavif: enable libyuv support
Date: Sat,  4 Apr 2026 15:53:00 +0200
Message-ID: <20260404135300.105475-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1775310787-E4FF6827-16DE4B7C/0/0 CLEAN NORMAL
X-TOI-MSGID: 9115709c-160b-4163-8b83-21c5e48bc2d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775310789; i=f_l_k@t-online.de;
	bh=BoteG/ZS10E06+6ijZyMTsQQKkeNWXg3KASTAsdOeeU=;
	h=From:To:Subject:Date;
	b=JCShQjjJ7Endsd+8+X2kR/1TaR7p8H6HzD3MXqWBqIK3r3TUhTMmtq6X+HGu621ZU
	 8qkYtvrHf3GG8h/cqFJ2BQT61LjRpy8RWAik7w7EjEJq2J93inaJhC1kR/JVd0qH1/
	 uxTK+4BNDkkMSIZh+3NmBNzzpvLDRDd3CYymPd3e4zRbphqB2YWJkuD8NcgtP8DNTG
	 hhdK+R7Z2AWzkm1nBifI0u9KunevdlYq9YuKF9y09PRdQGE8S00y4GZ2vGFDkk4uEm
	 jhpRD2gdJKVlmbJPf5mKtB5jR3zcR9Ldp8DE5xfcRI9RYNPjqTvn0K5Zq2/dbY5y2F
	 HMFd3F+juLLHQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2026 13:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125997

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb =
b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
index b8008b6980..a6e90335f8 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.4.1.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D51549db094182=
9faeedcc86efec2f4c0"
=20
 SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;=
branch=3Dmain;tag=3Dv${PV};name=3Dlibavif"
 SRC_URI +=3D "git://github.com/kmurray/libargparse.git;protocol=3Dhttps;=
nobranch=3D1;name=3Dlibargparse;subdir=3D${S}/ext/libargparse"
+SRC_URI +=3D "git://chromium.googlesource.com/libyuv/libyuv;protocol=3Dh=
ttps;nobranch=3D1;name=3Dlibyuv;subdir=3D${S}/ext/libyuv"
 SRCREV_libavif =3D "6543b22b5bc706c53f038a16fe515f921556d9b3"
 SRCREV_libargparse =3D "ee74d1b53bd680748af14e737378de57e2a0a954"
+SRCREV_libyuv =3D "6067afde563c3946eebd94f146b3824ab7a97a9c"
 SRCREV_FORMAT =3D "libavif"
=20
 DEPENDS =3D "nasm-native"
@@ -18,7 +20,7 @@ inherit cmake pkgconfig
 EXTRA_OECMAKE +=3D " \
     -DAVIF_BUILD_MAN_PAGES=3DOFF \
     -DAVIF_CODEC_RAV1E=3DOFF \
-    -DAVIF_LIBYUV=3DOFF \
+    -DAVIF_LIBYUV=3DLOCAL \
 "
=20
 PACKAGECONFIG ?=3D "dav1d gdk-pixbuf"
--=20
2.53.0


