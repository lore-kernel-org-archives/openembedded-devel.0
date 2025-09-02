Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCFECA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 18:07:59 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.web10.84696.1756836477980029550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 11:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=kOBDdEaj;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=GqakEf7q;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cGYcp6P07z9sjQ;
	Tue,  2 Sep 2025 20:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756836474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6MhpwWRV/1Z0xTvnN74fznYlUD7lGONFgNYy4TXrS5w=;
	b=kOBDdEajASgeevXsJNFiEJHEoXlSaGlAGtRyJ4RAL8nD/7IRnSyRFMTgFbc07yK0zAV5op
	M/EUBhSFjteBvesJHBEBFwFFqYH+hxviNA/a/tR3q6oaWaLEVsGalL5M92Ewpo1J6MeOU+
	/L9wlIVAliG4M9EDw078X7U1Mtx7uW+IIMPH0xylA/R7aD5cuMhHe7m27a+kt9uREggViH
	/pvSB30ABVGv8YP9gOoFgaOEuPE8z+ZxY3AhgyADKyyeVum2oQkuDjCa4uROC3HSJWMdvl
	3AGvd2s86lMTvrma5I6S1cmx37aTXCh5elFRVS6AEjx/I62CRc59+GqHrnIhxA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756836473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6MhpwWRV/1Z0xTvnN74fznYlUD7lGONFgNYy4TXrS5w=;
	b=GqakEf7q0BXWtYlUepl3NKgY9IPzHS9DHeNTEKbS48RVN4NiLUf09er1NhITS6pKJDHENo
	F6uw6//XGD/sgbSTHk0lsA03lH1uiLeIn0/MnuQBILXjSvd2Qvtwnx4qLJqddFWPgzJi0m
	SexdmALxWURkGJI2zsMeq6Eq3/1gcy6ZDu8vOs4gNU65QkRQc0IjIGSD1m8/mh7356OtWf
	BugDBrgWvC+PF0A9BQLmjudrFxVi1GTu2yMQasJ7Rp+DqerqaCZYrvgdPiZBIov1Gh955+
	mH8JoU07pFYHtQI62Q0F55a1EpooP34kdcHknRbHJIXc9wT7m/qoI6ONHchusQ==
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Kelefa Sane <kelefa.sane@smile.fr>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][RESEND PATCH v2] imx-cst: Replace hard-coded linux64 with linux${SITEINFO_BITS}
Date: Tue,  2 Sep 2025 20:07:38 +0200
Message-ID: <20250902180740.263633-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-MBO-RS-ID: fbcc3d2bd5e5906e6cb
X-MBO-RS-META: 5iupz1i4tjsak8nukgwrahqhjnmu3wpa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 18:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119185

Replace hard-coded linux64 with linux${SITEINFO_BITS}. This way,
32bit machines can also build and use this tool correctly.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Kelefa Sane <kelefa.sane@smile.fr>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
Cc: Yoann Congal <yoann.congal@smile.fr>
---
V2: - inherit siteinfo
---
 meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb b/meta-oe/r=
ecipes-support/imx-cst/imx-cst_3.4.1.bb
index 12b319843e..97117eb914 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
@@ -25,15 +25,17 @@ S =3D "${UNPACKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_V=
ERSION}"
=20
 EXTRA_OEMAKE =3D 'CC=3D"${CC}" LD=3D"${CC}" AR=3D"${AR}" OBJCOPY=3D"${OB=
JCOPY}"'
=20
+inherit siteinfo
+
 do_compile() {
-    oe_runmake -C code/obj.linux64 OSTYPE=3Dlinux64 ENCRYPTION=3Dyes COP=
TIONS=3D"${CFLAGS} ${CPPFLAGS}" LDOPTIONS=3D"${LDFLAGS}"
+    oe_runmake -C code/obj.linux${SITEINFO_BITS} OSTYPE=3Dlinux${SITEINF=
O_BITS} ENCRYPTION=3Dyes COPTIONS=3D"${CFLAGS} ${CPPFLAGS}" LDOPTIONS=3D"=
${LDFLAGS}"
     oe_runmake -C add-ons/hab_csf_parser COPTS=3D"${CFLAGS} ${CPPFLAGS} =
${LDFLAGS}"
 }
=20
 do_install () {
     install -d ${D}${bindir}
-    install -m 755 ${S}/code/obj.linux64/cst ${D}${bindir}/
-    install -m 755 ${S}/code/obj.linux64/srktool ${D}${bindir}
+    install -m 755 ${S}/code/obj.linux${SITEINFO_BITS}/cst ${D}${bindir}=
/
+    install -m 755 ${S}/code/obj.linux${SITEINFO_BITS}/srktool ${D}${bin=
dir}
     install -m 755 ${S}/add-ons/hab_csf_parser/csf_parser ${D}${bindir}
 }
=20
--=20
2.50.1


