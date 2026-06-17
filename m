Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A08CD98F6
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 15:09:45 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17698.1781708984367351979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 08:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=E/mHoGWK;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id 025E4903
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 17:09:42 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.174.202]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wZrtc-3OHBkP0; Wed, 17 Jun 2026 17:09:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-disk-utility: move to dynamic-layers
Date: Wed, 17 Jun 2026 17:09:33 +0200
Message-ID: <20260617150933.12506-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781708980-28FF6821-C0A3BEA9/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a001ab1-6c9c-4b03-84a8-0be7941ae1ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781708981; i=f_l_k@t-online.de;
	bh=ALVJqbZi9jNeJuV2pfb/k6LMfF/hPb1rItD5g8N+Z94=;
	h=From:To:Subject:Date;
	b=E/mHoGWKjMtHHsS5NgsAopEQNE7LTt7bJ+SFEAcOYVuSIFVLsCDVNIf7MdqDQNekt
	 Rz3jmkva9ekexZxLeRQDT6xUdEt5mp1JRQb4KbTBMrdGqqKAk25jeQFY42v8R5n9jE
	 bLzmXIFHBq7xngYk5B+qiHYEg9dRwr9OSdpA8yKX4JDUv7vBFNI9o2iysXy1mSiuvB
	 UOQRtDk+0zijT1F7yvtBpPzVUcN6UEo1/jMCuIlaZ4ACqEjKGbyM6SMIh8RgVnaFL5
	 +NUsJewpz2NcWYdLokjKBstc2mjN5PRB2bkZebnLo80nnsGw7wEuEW0ObHdLG+uyH6
	 G6ym38mQLicWA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 15:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127659

gnome-disk-utility depends on libdvdread which is available in meta-multi=
media

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/conf/layer.conf                                       | 1 +
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1.bb  | 0
 2 files changed, 1 insertion(+)
 rename meta-gnome/{ =3D> dynamic-layers/meta-multimedia}/recipes-gnome/g=
nome-disk-utility/gnome-disk-utility_46.1.bb (100%)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 4094e5194e..27032ac69d 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -28,6 +28,7 @@ BBFILES_DYNAMIC +=3D " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/=
*/*/*.bb \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/=
*/*/*.bbappend \
     security:${LAYERDIR}/dynamic-layers/meta-security/*/*/*.bb \
+    multimedia-layer:${LAYERDIR}/dynamic-layers/meta-multimedia/*/*/*.bb=
 \
 "
=20
 # List of known non-reproducible package of the meta-gnome layer
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_46.1.bb b/meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnom=
e-disk-utility/gnome-disk-utility_46.1.bb
similarity index 100%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utilit=
y_46.1.bb
rename to meta-gnome/dynamic-layers/meta-multimedia/recipes-gnome/gnome-d=
isk-utility/gnome-disk-utility_46.1.bb
--=20
2.54.0


