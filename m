Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEFDEB64DC
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 13:27:29 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web10.16265.1687613245673549784
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jun 2023 06:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=AgYlJwok;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: crg7475@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4QpFJq0K0xz9sQb
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jun 2023 15:27:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1687613243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VzVCbYsgP08r5N2nRxzJBmb4cTLtvezvQaoNGwYzlSc=;
	b=AgYlJwoks98xvwT55PHdfmTxl+VZSBNPHxHftkz0DYOd5tTrTexCi1rSjCSjXCZkyp9Vc/
	wkmQ5opdcFa/4KBQgSQVKCNpxjJFyUcbXLVr94B5Hcse1d3VQdl3J3CHvwMX28rG3KjDNf
	Oa0bRGlAswuP2/TpYylB60TzpjNFP4kF0Yk/AyZrHq5zdtr/EpFYz19RARtAlJIlYJ5hkf
	wzxUZYzWbUCVRFnS0gfksrPacZC3JNewi6Zi7VnovlJlVvHN/w4tO2Lr3UYuwvjeOFLFZA
	3gy6kbX4jwpa7IijBsxHpjD6nGBDeKtFje2zFdTMjgkuYACdCjChcRh0UBbF/w==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/3] pipewire: Add dedicated aes67 package and fix rlimits.d package assignment
Date: Sat, 24 Jun 2023 15:27:15 +0200
Message-Id: <20230624132715.1664863-3-crg7475@mailbox.org>
In-Reply-To: <20230624132715.1664863-1-crg7475@mailbox.org>
References: <20230624132715.1664863-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 5cf6eec5799ffbc1855
X-MBO-RS-META: knd73buso79weyberuczwg79anzweiit
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jun 2023 13:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103556

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../recipes-multimedia/pipewire/pipewire_0.3.71.bb       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
index 414ae3ea8d..14a0e02f81 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
@@ -249,6 +249,7 @@ PACKAGES =3D+ "\
     ${PN}-modules-meta \
     ${PN}-alsa-card-profile \
     ${PN}-v4l2 \
+    ${PN}-aes67 \
     gstreamer1.0-pipewire \
 "
=20
@@ -263,8 +264,6 @@ FILES:${PN} =3D " \
     ${systemd_user_unitdir} \
     ${bindir}/pipewire \
     ${bindir}/pipewire-avb \
-    ${bindir}/pipewire-aes67 \
-    ${sysconfdir}/security/limits.d \
 "
=20
 RRECOMMENDS:${PN}:class-target +=3D " \
@@ -358,6 +357,7 @@ RRECOMMENDS:${PN}-modules +=3D "${PN}-modules-meta"
 CONFFILES:${PN}-modules-rt =3D "${datadir}/pipewire/client-rt.conf"
 FILES:${PN}-modules-rt +=3D " \
     ${datadir}/pipewire/client-rt.conf \
+    ${sysconfdir}/security/limits.d/* \
     "
=20
 CONFFILES:${PN}-modules-filter-chain =3D "${datadir}/pipewire/filter-cha=
in/*"
@@ -376,6 +376,11 @@ FILES:${PN}-v4l2 +=3D " \
     ${libdir}/${PW_MODULE_SUBDIR}/v4l2/libpw-v4l2.so \
 "
=20
+# AES67 is a standard for audio over IP, from the Audio Engineering Soci=
ety (AES).
+FILES:${PN}-aes67 +=3D " \
+    ${bindir}/pipewire-aes67 \
+"
+
 FILES:gstreamer1.0-pipewire =3D " \
     ${libdir}/gstreamer-1.0/* \
 "
--=20
2.34.1


