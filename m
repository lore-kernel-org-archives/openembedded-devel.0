Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B717CC25B75
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 20:32:18 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web10.14011.1716755513848152719
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 May 2024 13:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=mGW3xfL1;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 0123A38AE;
	Sun, 26 May 2024 22:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1716755511;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=1827; bh=/TMevMyAUSnbNlur+vLq1FRpX+0qjj3Ppd6gcZSPNFE=;
	b=mGW3xfL1enlvtiOiPUsBoe6tP2PuG/O5L1f0RCkndLmipRzuhnUHnyzNMZCh0/Jx
	do4fSxnuGEYe+jOwGWHKaX1giyCGKrFZrM5j6X03odQ7S8J+n1Bk1twxKgxLx4Hys58
	9dINdoBZowoV9Eri9Ya4zjF2tlWHxV5EEXc7qwHfBIwNEXJxMLXcZOzt/5qllX7+rLu
	CEpoRpDV8X0MmZS3/xBDxdqoziQOSQJJRGN/Gv848nWyU9naZ+2dxIu87/YA/BbAbTf
	GFyyNDRBElfWh2FXmXqN/XPmHKuGRxw+27MwX9r2VxYT7MSfDNsREzn0Ro5FoHTKUBj
	SAqNnRoO2A==
Received: by smtp.mailfence.com with ESMTPSA ; Sun, 26 May 2024 22:31:49 +0200 (CEST)
From: robert.joslyn@redrectangle.org
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][scarthgap][PATCH] fwupd: fix uefi capsule update build error
Date: Sun, 26 May 2024 13:31:20 -0700
Message-ID: <20240526203120.2867389-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 May 2024 20:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110532

From: Mikko Rapeli <mikko.rapeli@linaro.org>

plugin_uefi_capsule_splash does not provide "enabled" or "disabled"
options but only basic bool "true" and "false". Fixes do_configure()
failure with
PACKAGECONFIG:append =3D " plugin_tpm plugin_uefi_pk plugin_uefi_capsule =
":

| ../fwupd-1.9.18/meson.build:1:0: ERROR: Value disabled is not boolean (=
true or false).

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb b/meta-oe/recipes-=
bsp/fwupd/fwupd_1.9.18.bb
index d20d5ed2a..e6c276ba4 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
@@ -104,7 +104,7 @@ PACKAGECONFIG[plugin_synaptics_mst] =3D "-Dplugin_syn=
aptics_mst=3Denabled,-Dplugin_s
 PACKAGECONFIG[plugin_synaptics_rmi] =3D "-Dplugin_synaptics_rmi=3Denable=
d,-Dplugin_synaptics_rmi=3Ddisabled"
 PACKAGECONFIG[plugin_tpm] =3D "-Dplugin_tpm=3Denabled,-Dplugin_tpm=3Ddis=
abled,tpm2-tss"
 # Turn off the capsule splash as it needs G-I at buildtime, which isn't =
currently supported
-PACKAGECONFIG[plugin_uefi_capsule] =3D "-Dplugin_uefi_capsule=3Denabled =
-Dplugin_uefi_capsule_splash=3Ddisabled,-Dplugin_uefi_capsule=3Ddisabled,=
efivar fwupd-efi"
+PACKAGECONFIG[plugin_uefi_capsule] =3D "-Dplugin_uefi_capsule=3Denabled =
-Dplugin_uefi_capsule_splash=3Dfalse,-Dplugin_uefi_capsule=3Ddisabled,efi=
var fwupd-efi"
 PACKAGECONFIG[plugin_uefi_pk] =3D "-Dplugin_uefi_pk=3Denabled,-Dplugin_u=
efi_pk=3Ddisabled"
 PACKAGECONFIG[plugin_uf2] =3D "-Dplugin_uf2=3Denabled,-Dplugin_uf2=3Ddis=
abled"
 PACKAGECONFIG[plugin_upower] =3D "-Dplugin_upower=3Denabled,-Dplugin_upo=
wer=3Ddisabled"
--=20
2.44.1


