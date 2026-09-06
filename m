Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72123C79FA7
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10847.1788687443919576872
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=aCuI+b90;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout02.t-online.de (Postfix) with SMTP id 7D9DFE272
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JO-22AhJk0; Sun, 6 Sep 2026 11:37:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 05/15] gnome-boxes: upgrade 49.0 -> 50.0
Date: Sun,  6 Sep 2026 11:37:03 +0200
Message-ID: <20260906093713.797648-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687438-C23FA956-5CF8EF12/0/0 CLEAN NORMAL
X-TOI-MSGID: 81c4ec9b-4052-4221-a751-256df0f1479c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=AtEK7h4ncS8Quo2vRTGmJVCz8VJ5RmpwI4LPOeAmIag=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=aCuI+b90Hfztqde5KKTNnk6JkGk4GQpMwp+wywDJJN76d9BGwU814kpk57cdao4bG
	 fh0e436MBRQ1Cq1OflOjm9EDx9D+hKXjw48zPZtv3GVHYk1PUpVfaxwYro7iR6uYBb
	 SWZaE10bweWUb0DzNGR7ZM0xt1nQfRl6gUXSbZKZBichmtWX4CcdwvWLpDtEOElF+V
	 H9LcReWpdDyDISCV/cqtu/Jxye0H91TboYIz93oEf94smqcfL0DZZfkNgz+ugzeB/Z
	 GsIUH40z3PshGXMzv0jNxoK47CpPivfhGw2lrP1T/qVuEV3L39GSwm2/QsvhUhLMKh
	 nlylLSDdkh9dw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129784

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-boxes/{gnome-boxes_49.0.bb =3D> gnome-boxes_50.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome=
-boxes/{gnome-boxes_49.0.bb =3D> gnome-boxes_50.0.bb} (90%)

diff --git a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/=
gnome-boxes/gnome-boxes_49.0.bb b/meta-gnome/dynamic-layers/meta-virtuali=
zation/recipes-gnome/gnome-boxes/gnome-boxes_50.0.bb
similarity index 90%
rename from meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/g=
nome-boxes/gnome-boxes_49.0.bb
rename to meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gno=
me-boxes/gnome-boxes_50.0.bb
index ebc630062f..73df03f285 100644
--- a/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_49.0.bb
+++ b/meta-gnome/dynamic-layers/meta-virtualization/recipes-gnome/gnome-b=
oxes/gnome-boxes_50.0.bb
@@ -34,7 +34,7 @@ RDEPENDS:${PN} =3D "glib-2.0-dev libvirt-virsh qemu-com=
mon qemu-system-x86-64 geni
=20
 inherit gnomebase gsettings pkgconfig mime-xdg gtk-icon-cache gobject-in=
trospection vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "fa47266da6f5ef7a904c5b8769d4d871bccd4e6b=
639a363c3235438d7b0e757a"
+SRC_URI[archive.sha256sum] =3D "fd6a5de18d1090946ca99f1f5a34aa3e15dc8183=
f6a72226e8d1504a13672d67"
=20
 GIR_MESON_OPTION =3D ""
 VALA_MESON_OPTION =3D ""
--=20
2.55.0


