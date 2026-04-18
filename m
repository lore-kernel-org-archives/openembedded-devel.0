Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32CAF99C8A
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 14:35:47 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67967.1776522939631941563
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Apr 2026 07:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=MY9Kn92O;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id 6417A1C3EE
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 16:35:37 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.175.141]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wE6ll-0Toyqw0; Sat, 18 Apr 2026 16:35:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/3] libdvdcss: use https for fetching code
Date: Sat, 18 Apr 2026 16:35:30 +0200
Message-ID: <20260418143531.2034507-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418143531.2034507-1-f_l_k@t-online.de>
References: <20260418143531.2034507-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1776522937-6DFF9407-B7A5CE59/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a2c56e9-abcc-4e90-99dd-45dc6a0962af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1776522937; i=f_l_k@t-online.de;
	bh=kMtlSRaNVU+Zm5ApgN5jrjqIIkvOExUsp38t/X869/A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MY9Kn92Om8LdXt/lrrVLlbS2eWBa9dQ0YbPqpcPDcKDkyvZVJymjWoI6/qj32qvgX
	 2Z7gaOMaqzNwonIAAbO8a3GLAy3DSKbgdyu9ZYGcLqVsY7OmZP9bkdNAJAE7gTmANJ
	 vcBO9jYrqqwHQxjIEDsP5EIeyDCJZcSEzs4jvNHcvoYwt2L6QemqPxDog/LrRtyKoA
	 LZm0K0mQyRuEDYBr4kFBclsiV9bi7nRgQo6oyzbjoJSDUgfQsQaUPGb3s/3q7muHbz
	 52HNsf18+xrF8lzhUnfmgAabgM6+afGXThs6A/glXHsZb4QiJCDSndKm+frwphTQKD
	 aiSf5cu4JoEHw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Apr 2026 14:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126456

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb b/=
meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
index 42c771e0ff..a8758b1e9b 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.4.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "libdvdcss is a simple library designed f=
or accessing DVDs like a
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-SRC_URI =3D "http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-=
${PV}.tar.bz2"
+SRC_URI =3D "https://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss=
-${PV}.tar.bz2"
=20
 inherit autotools
=20
--=20
2.53.0


