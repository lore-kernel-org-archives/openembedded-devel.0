Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188A2FD5F86
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 06:43:32 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100249.1775630609079044292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 23:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=bluMvWGd;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd91.mgt.mul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout07.t-online.de (Postfix) with SMTP id 9DD88E8D3
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 08:43:26 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.170.104]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wAMdF-0Db5wv0; Wed, 8 Apr 2026 08:43:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcanberra: disable gtk-doc
Date: Wed,  8 Apr 2026 08:43:15 +0200
Message-ID: <20260408064315.177092-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1775630601-F77FC6A3-78A93D3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 8538f8f3-9544-44ed-ad6f-a463772f8dd3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1775630606; i=f_l_k@t-online.de;
	bh=71DkCV62+Ecp2vpjL3EVAP/YY/ikx8yzFkv71qiK5rI=;
	h=From:To:Subject:Date;
	b=bluMvWGdgeJOdW1OoEAYRBK42WlHSSQg6cFKS3avq8SPypVIV6Ub7iVTqZVJsI6SU
	 pFGCn6DzIssD5lbIhiHRD3vfPTduYs2vqFd6VnWGui26dzsUW8aPe/I5N/oCcsGXKj
	 HDpRo2KnrC1Ooh7Z9+9KmR6+K4cN4dJ0zt9bUj/R2gsCVv3FDwYewZFJ6ZD+lmZ47G
	 li3TmSUOhba3REBsXPO4DfX7crar1qIDe/OTd4JwxFibSC/G0F4dd7dvmnNkIYPSID
	 2HjwiIztrC2omlRGreu+evvQvZ5aysaRI+tIlbZzjQOvmuXe9dhdC4Q+q34fW5a3mN
	 j35F54KnicghQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 06:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126099

gkt-doc build uses the deprecated gtkdoc-mktmpl tool, which was dropped b=
y upstream
in version 1.26 of gtk-doc and fails if 'api-documentation' is in DISTRO_=
FEATURES.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb b=
/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
index 2c063fd995..de87d5b9c3 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LGPL;md5=3D2d5025d4aa3495bef=
ef8f17206a5b0a1 \
=20
 DEPENDS =3D "libtool libvorbis"
=20
-inherit autotools gtk-doc
+inherit autotools
=20
 SRC_URI =3D " \
     git://salsa.debian.org/gnome-team/libcanberra;protocol=3Dhttps;branc=
h=3Ddebian/latest;tag=3Ddebian/${PV} \
@@ -19,6 +19,7 @@ EXTRA_OECONF =3D "\
     --disable-oss \
     --disable-tdb \
     --disable-lynx \
+    --disable-gtk-doc \
 "
=20
 PACKAGECONFIG ??=3D " \
--=20
2.53.0


