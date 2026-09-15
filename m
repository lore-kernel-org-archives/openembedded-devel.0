Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461B3C982C5
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18080.1789458273617067528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=NDlg/N6D;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id E1D5F1C3EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:19 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npp-00ds5m0; Tue, 15 Sep 2026 09:44:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 07/31] gnome-backgrounds: upgrade 50.0 -> 51.0
Date: Tue, 15 Sep 2026 09:43:23 +0200
Message-ID: <20260915074347.6003-7-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458250-C7FFC9B9-0E8C7A94/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a4a50d7-9ad2-4e7c-96b3-e3ca1d82b3ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458259; i=f_l_k@t-online.de;
	bh=1CEAcBjyitO7OpTFnX3NE9vx/5D8JqZ+0ag2Vt6mrTE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NDlg/N6D31O9Q+NW+6LFFZQadEScz9FfTHoN+Owqdiqmf0VTHsTv63iXRodmaNDZG
	 AgWmY2pRZKYra2y4uAm9qRm9kXBSZxlFmsd3PKor3wWDHi94CUYCPc6i+pA15hiqeH
	 uJ1owRIQtHOeGyf1LHGE2rySCEOTVcWYHXETZKnUr+MoRiuexfAGztDVXxAHjt8T2w
	 w+V57voSNbcnA94olNkD59sMNjVVcn3JVZ+yyfgwWLubZJqju+cpRDTlqRQ7B6dIWS
	 3KqGdeCkrztQjZtvG9U7wgUfUrnF+myr7isVhX4GPQMopbtF1WttM5SXzVkidpjQvr
	 EIMpMy6tcUGyA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130053

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-backgrounds_50.0.bb =3D> gnome-backgrounds_51.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_50.=
0.bb =3D> gnome-backgrounds_51.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds=
_50.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_5=
1.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_=
50.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_51=
.0.bb
index a898e13418..67e8a267ef 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_50.0.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_51.0.b=
b
@@ -6,7 +6,7 @@ SECTION =3D "x11/gnome"
=20
 inherit gnomebase gettext allarch
=20
-SRC_URI[archive.sha256sum] =3D "1acdba7acb4f34c7321febc6273444344fd55fd5=
93611d446de70860183b52b8"
+SRC_URI[archive.sha256sum] =3D "5811d24118d78f41b66c616efb1094c20507cb54=
6e484dca4963fe738a4ba7db"
=20
 FILES:${PN} +=3D " \
     ${datadir}/backgrounds \
--=20
2.55.0


