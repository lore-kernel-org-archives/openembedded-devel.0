Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88445C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 02:57:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.2341.1643079472276911401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 18:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=toHD8S+I;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4BEAC80636;
	Tue, 25 Jan 2022 03:57:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643079469;
	bh=J1AP0lGdNRM/xQOMpgZdN4Gz/lua9qW0JANwh+rbxiE=;
	h=From:To:Cc:Subject:Date:From;
	b=toHD8S+I1sRZYX1rbGWkBe1WuuhZEFLwPgEXcBz6UuMmr44NWwxMpxSsZyrx0sS+V
	 5ELBI5F+hzvd3f6rrgMx9IB7ljRXwbasqnpPz3dvFFbtdmKypfb985rrQdV8G/EnCW
	 V6WZZzkwYTLQGr1YaSXda/VuGBjxsXS8svFbbSpToprq4SiUfqY2X1vmXGXOEbXCUP
	 bEGd6fs6/174TK8Eo79ykJK3g50j+kW92mGSPfSZbe+PT9KdpYkZ2kDIbIAu2PfIlg
	 934FpIlxExTiZpsRa/w7MozHhKq3g+u+SZ5cqBg8KiNRbMUnAlyyUXa7rgwdm/0rpn
	 dOgJ8UsxlF60A==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] freerdp: Update to FreeRDP 2.5.0
Date: Tue, 25 Jan 2022 03:57:34 +0100
Message-Id: <20220125025734.131167-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 02:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95047

Update FreeRDP to latest stable version, 2.5.0,
to pull in latest batch of bugfixes.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 .../freerdp/{freerdp_2.4.1.bb =3D> freerdp_2.5.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.4.1.bb =3D> freerdp_2.=
5.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.5.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb
index 571ba5fcb..ae7ba4aee 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE =3D "1"
 PKGV =3D "${GITPKGVTAG}"
=20
-SRCREV =3D "d39a7ba5c38e3ba3b99b1558dc2ab0970cbfb0c5"
+SRCREV =3D "d50aef95520df4216c638495a6049125c00742cb"
 SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;pr=
otocol=3Dhttps \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
--=20
2.34.1


