Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B57C55174
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 01:34:24 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34562.1785720863768611376
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 18:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Z6XeMUtk;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id 8ABCC757
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Aug 2026 03:34:21 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.211]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wqhZN-2g9OAT0; Mon, 3 Aug 2026 03:34:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcec: update 7.1.1 -> 8.1.3
Date: Mon,  3 Aug 2026 03:34:15 +0200
Message-ID: <20260803013415.86099-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1785720861-367FBBDA-F3E8FA9E/0/0 CLEAN NORMAL
X-TOI-MSGID: 7517c3a0-e9d8-4c9b-8e48-e3441b825d0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1785720861; i=f_l_k@t-online.de;
	bh=hS+EWCJ6HnwfERfA27MEtJ3NKax2KnqIt/F8F61lqSY=;
	h=From:To:Subject:Date;
	b=Z6XeMUtkC+yapK+Q72z9+n5FxzoltuHt8WQ+yBkfrYVLkjeXwkGHBm4zgLdYgOiMv
	 ZKJHYJtzqrbA0zifgX1G9dOQB+U2MKXvbRVb5w6A0zqrxkpqBe3k9eAr0QbS3oR8kG
	 Juk8GG5T8hdBgVdlWTg8wEmBXI/wmGewQVI6fnxgAjSOOXB7LT4RgviIFgnvFzQgdr
	 nVKzeU8m62A1RqlXivRCuXc8dZY+EJp+CRaJMUhh/bEcALqTBL0MYoyCm+QDRaG5nP
	 IYWB1bSPuatQotnSScIIJxFQXY07WTR3ruLKFMUMpBzui0njsx9OXM72VBendVNQ5M
	 8guhZzl56VTcA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 01:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128671

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libcec/{libcec_7.1.1.bb =3D> libcec_8.1.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libcec/{libcec_7.1.1.bb =3D> libcec_8.1.=
3.bb} (96%)

diff --git a/meta-oe/recipes-extended/libcec/libcec_7.1.1.bb b/meta-oe/re=
cipes-extended/libcec/libcec_8.1.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/libcec/libcec_7.1.1.bb
rename to meta-oe/recipes-extended/libcec/libcec_8.1.3.bb
index 9d0015534b..dd118753cd 100644
--- a/meta-oe/recipes-extended/libcec/libcec_7.1.1.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_8.1.3.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "p8platform udev ncurses swig-native python3"
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 lib=
xrandr', '', d)}"
 DEPENDS:append:rpi =3D "${@bb.utils.contains('MACHINE_FEATURES', 'vc4gra=
phics', '', ' userland', d)}"
=20
-SRCREV =3D "3519af0715e654c43382423d843ad658f2e01cb4"
+SRCREV =3D "bfc6a5fe0425d09f02e282f676113cc3150c118f"
 SRC_URI =3D "git://github.com/Pulse-Eight/libcec.git;branch=3Drelease;pr=
otocol=3Dhttps;tag=3D${BPN}-${PV} \
            file://0001-Enhance-reproducibility.patch \
           "
--=20
2.55.0


