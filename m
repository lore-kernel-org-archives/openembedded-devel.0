Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C57CA6019
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 13:48:26 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7640.1791551797892535508
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 06:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=Klf0hwaN;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: bst@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 02599201CD6;
	Fri, 09 Oct 2026 15:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791551795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tl7mzraDaP/UBLwBEjJ8RkWUPYSe1kT5W4ZJene9Wmk=;
	b=Klf0hwaN9pfV7DfB0U/vYUg48y8mPHBRtLScneAMbbEK3XkakPsLI1YB0bi7wtVEdolzVN
	Ygd7bmcpP/zk9fSUYUiIOA+K1yNGDkmRXnIOXNP+4I/yWxo2d79FpIVnUe8MCMFgsxLWgN
	ATMYzkN7Ex1zY8jQlu4MDxWONOfwsOExYwy647GeG7BEJwCAE/eVv5FO6asFTPiW1SHQma
	cEp156ecelXrwos2Jf8IwgyLwCJRkIRQdteF2aDJwpSl2Urq5YjJiH7FVXohEDmpbAbfKm
	Cxnt9zqFd+s7+1R4VkwpCawvnLtoHkOhGB+K3chGUL1luRKVBBEpfphlec4j8A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791551795; a=rsa-sha256;
	cv=none;
	b=MBHtmqqMdLpZxlEgBPw+A15bkKpUVRftaoqWqfMFIpBTubenNXX46C5x1eSKEil/YFYTXa
	IWC5bzL1iTV8IJHHUr35jlZMvVJAsF0NuhEYirNAKjN7T7miMbaxm+2EcikrMjbzsb27iX
	KdKeAYodwdnR7ssWpQt2yat0pbvuRwskoT2koiK4O83cxA2foF0IIzLUB5QHN+RWnX82S2
	3lA4pW+KwB49Isxomkx8eLAGiDJsZ2bNZV1l2q5Q+qcRH3xkQSGzNt8EWmNhjQTESV2b7r
	uMaF492B451GDYSIfGV+Hl8aKK+1JYZ6B7IE6z+2tBQb66oZaeCugehbv5+/YQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=bst@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791551795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tl7mzraDaP/UBLwBEjJ8RkWUPYSe1kT5W4ZJene9Wmk=;
	b=A3SpBo90G0blfBmFnUnYCygwrKTmEsGN/NO6x9UvRw/onGp8N488EA6/HGQo/n+abbF43W
	ZS0EOjBfNKNfRtssfzvhvQ+hGRQTTCWsT4FmtrU+bIAJ0jG36MA60EZVyz3e5u6nVufUGI
	bslIn2aLGSFfoLmRUbXEkHHLNbkOKl2NQBAAP3gjGw7YD9pcxhfKdRbyuF5KA332jRsQeF
	bx7ZIs9h+2sktA58zJ2wAGvcAJ/3nO8nstyy4nb88AJP7uGA8FF0aPFXclotwJbKMZqGXk
	3H4USBTyddeNgW0tYGfyyvGH26zEgOvvv/sPoqgx/G033tVAnC6/cQHYrM0i7w==
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <bst@pengutronix.de>)
	id 1xFASg-0053Ki-2l;
	Fri, 09 Oct 2026 15:16:34 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-oe][blacksail][PATCH] pcsc-lite: create pcscd user and group also via useradd
Date: Fri,  9 Oct 2026 15:16:27 +0200
Message-ID: <20261009131633.4147806-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 13:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130696

The recipe currently only does this via systemd-sysusers. This does not
work for read-only root filesystems, though. So use useradd to create
the pcscd user and group.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb b/meta-=
oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
index a8735a449f..daa1b78304 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
@@ -14,7 +14,7 @@ DEPENDS =3D "autoconf-archive-native flex-native"
 SRC_URI =3D "https://pcsclite.apdu.fr/files/${BP}.tar.xz"
 SRC_URI[sha256sum] =3D "bfcfe38a20afc49849c6bf55325e38f449fc4b26d3923fdc=
32b969ae41a8741b"
=20
-inherit meson systemd pkgconfig perlnative
+inherit meson systemd pkgconfig perlnative useradd
=20
 EXTRA_OEMESON =3D " \
     -Dlibusb=3Dfalse \
@@ -37,6 +37,9 @@ RRECOMMENDS:${PN} =3D "ccid"
 RRECOMMENDS:${PN}:class-native =3D ""
 RPROVIDES:${PN}:append:class-native =3D " pcsc-lite-lib-native"
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --shell /sbin/nologin=
 --user-group pcscd"
+
 FILES:${PN} =3D "${sbindir}/pcscd \
                ${datadir}/polkit-1 \
                ${systemd_system_unitdir}/pcscd.service \
--=20
2.47.3


