Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC83C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 19:11:27 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web08.2424.1648667486541869793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 12:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=CegYmgzj;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4KTGHv2dHqz9sSF
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 21:11:23 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1648667481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d9dW7VEComNmfwDJ/MyLk77wREm8k/h6whHdZQK7w8U=;
	b=CegYmgzjsWdzPOdEPW/HDtmuKXwQiSQ+O8pSfygKt7F7IOU3VRBj+idLlWhGx1+NdAvtXe
	HnP6tGXF7tpKf0pXkLtr7lcp0VNrYB3xFE3FodqoP8bcCip2UNXNs5j/BlCnfJuIuU+MEE
	Fd/k5qgbP11TucgOBfL7ZZOz0c9NvOGKGmthgJVylp9vm+budOMmyx0gljSaegakwwkRL+
	hQ/4lWXaptKRsBpdIbWEvsQh6uWVVMAX7LxVlm7FQZ1LaZS5CjE51m8Q+S5i15Y9jwIMZR
	Qf4AClAYdWrcTCdxJhfNIiYoJVRJA3t+q72Cq3z/ZEk93xCsHB4R9R8zOv1bLA==
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libopenmpt: Remove unnecessary python code
 block
Date: Wed, 30 Mar 2022 21:11:13 +0200
Message-Id: <20220330191115.112414-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 19:11:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96268

This code block used to be necessary when both SDL1 and SDL2 were
supported. Nowadays, libopenmpt only supports SDL2, so drop this.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb       | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6=
.2.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
index a7b6b0007..700df2cef 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
@@ -64,12 +64,6 @@ do_install_ptest() {
     install -m 0644 ${S}/libopenmpt/libopenmpt_version.mk ${D}${PTEST_PA=
TH}/libopenmpt
 }
=20
-python __anonymous() {
-    packageconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
-    if ("sdl" in packageconfig) and ("sdl2" in packageconfig):
-        bb.error("sdl and sdl2 packageconfigs cannot be both enabled")
-}
-
 PACKAGES =3D+ "${PN}-openmpt123 ${PN}-openmpt123-doc"
 FILES:${PN}-openmpt123 =3D "${bindir}/openmpt123"
 FILES:${PN}-openmpt123-doc =3D "${mandir}/man1/openmpt123*"
--=20
2.32.0


