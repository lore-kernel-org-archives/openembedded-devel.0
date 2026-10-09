Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F1FCA6019
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 12:32:46 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6739.1791548892771800699
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 05:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=BRzh2ome;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: bst@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 33AF2201BC6;
	Fri, 09 Oct 2026 14:28:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791548890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tl7mzraDaP/UBLwBEjJ8RkWUPYSe1kT5W4ZJene9Wmk=;
	b=BRzh2omevwYls6Sl/mJL5kUzj/5gi06NK7A2H0XBgarasb8yo2qdtcmD6nLLwSgSLvJyH2
	MVKIDHWD6H6gbmn0olx6JLbE7Gzw8L/A0jZQYnJTzL63ostAxc/aredLNgZfzppQER4DAS
	9JyUxwDZ6gvWXWoonHhrFhNHcClKS6EWKOK9zPBEPdQoanNvm00+RqXCgkVnnJUhPsOrYD
	JIH3NlXQDr0JAJtSToz5E0CrK4WqN5WyaMeVN0k0oVlrJV3l5ZTEtGCiVMWscKkilGs9Y/
	WpX0yAeNRroLKEUeilItNTV/WkMFn/9VjZtrv+REh4p4YBmXY6+RJetypyROHg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791548890; a=rsa-sha256;
	cv=none;
	b=dIBfGMIvHUfVSERULoLN/EwuzBz6IqsqHWKDX2wSFl5oNRdFmvP/k9mtTPjIt12FQI72jT
	QWJJ8CJjmTs1GjBV0z5EsEy5AnSiAaFKpcymkWL+UpivPvzHguIrTBVsvzNDySNArTUdRF
	RSO0eBFzVQKbAaQehym84kqZRob7csdUGkfLeGdlbIdfxnh973g3N2WT1x7w9FvMuC02v7
	w31Q9URtIJzwatoM+Pggj5DvwnByABorvu9PreYYxM9SC/BKx9nus9BZjce1PZE9lLJS9u
	lW75OuobSgJPgR/OOTZBkcG5iixs1XcMhvyigLKOkAMGBfOTrTYt6WZmGUv6ww==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=bst@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791548890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tl7mzraDaP/UBLwBEjJ8RkWUPYSe1kT5W4ZJene9Wmk=;
	b=Fd3Lu83yto7SU+m7rmzghytntOLPKz3TJ+4i/zoKnQlOe6Yrso8wNxEhmbTeMb0BW5mbGa
	BG6iVIiq9xYpyH++0+q3RblNKLHxzxgUZrKJ2+OpH8lfAZ/zXRO5DqBAl76dkxxhzDop6g
	cIPD3f+SlWU8wsADpzXIMXfoPqDnuVc5M1tZI/e4FrSskZr74L1J7IYdM7AoVBYgp4G7Mz
	/aAwQZKCZg21caIEOeWTvO+2I62Ag4qHomcMD/fXEq4YP7SB5eqyupwjBWBI9VHsuqCUEr
	PDI9X0BoO0Dsvvo7Z0OvTXS6ZyRTuBJYHHW4NKMPV5zdyZZffUezOEBQAzp5iw==
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <bst@pengutronix.de>)
	id 1xF9hq-0052mZ-0G;
	Fri, 09 Oct 2026 14:28:10 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-oe][PATCH] pcsc-lite: create pcscd user and group also via useradd
Date: Fri,  9 Oct 2026 14:27:48 +0200
Message-ID: <20261009122808.4086502-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 12:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130695

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


