Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E526FF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 15:52:15 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88.1777996331942537637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 08:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=TGi5x0ou;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout02.t-online.de (Postfix) with SMTP id B835DED73
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 May 2026 17:52:09 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.234.37]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wKI49-0vmTAI0; Tue, 5 May 2026 17:52:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] kmscon: update 9.3.3 -> 9.3.5
Date: Tue,  5 May 2026 17:52:00 +0200
Message-ID: <20260505155200.43091-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505155200.43091-1-f_l_k@t-online.de>
References: <20260505155200.43091-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1777996329-337FD814-4AE662F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 3f4fcdc4-ec30-4be1-96f4-7d5dba5f07a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1777996329; i=f_l_k@t-online.de;
	bh=lW6xCENaqIAx0uH8XwaWGvG4ePkkD9Tu93IZ+S9c+DA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TGi5x0ouUpz0qdJOA+rTrZ6fsOeFu9g64dgcHh96941b6Y9/xJQyiMSlQ6kXdKunh
	 AZOkha3eI/9XpUFr1s6fHZURjfE/1PqNBNylOkmWjBIcgMrdPuS3UxmLPBBtCxXyl/
	 1k33eX0RLb37nqQz6UBDyB8h68JTYYL/uitOHq/hMMyKWl8JDaj4Jfbak9XvJ1mgBh
	 M/hNbZKoMqN6SdOR6ik4mYrwMbSP8eEOCEcRZYIJjv948EtC7XVhQSo2mClrXMxKzE
	 IXwJXkxsz/ESJw3awJam4h5EAVs+N1/Cx/FSVYOutuV8X3xFhFs6KWzB4JEEMxeaPM
	 EIZ2yrNtJv4MA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 15:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126794

---
 .../kmscon/{kmscon_9.3.3.bb =3D> kmscon_9.3.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_9.3.3.bb =3D> kmscon_9.3.=
5.bb} (97%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb b/meta-oe/re=
cipes-graphics/kmscon/kmscon_9.3.5.bb
similarity index 97%
rename from meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
index 46550bb6d1..b730faf414 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_9.3.3.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.3.5.bb
@@ -21,7 +21,7 @@ DEPENDS =3D "\
 "
=20
 SRC_URI =3D "git://github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dma=
in;tag=3Dv${PV}"
-SRCREV =3D "03e50c7db0489daaa41b5f62946fd6aaeab63a6e"
+SRCREV =3D "a8832afb1dcca5bb4c0476d4c13c7239fecbd93a"
=20
 inherit meson pkgconfig systemd
=20
--=20
2.54.0


