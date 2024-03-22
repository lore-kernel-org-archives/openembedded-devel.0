Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE46C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 20:50:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6177.1711140610646070926
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 13:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=igJQKo2P;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 55AC387D87;
	Fri, 22 Mar 2024 21:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1711140608;
	bh=lrs6Ii1TOP4C9mk7XUedCov9VPZoXO6GoX+l05NTs70=;
	h=From:To:Cc:Subject:Date:From;
	b=igJQKo2Pp/jWT5weKXZtv4aLJLPwW1oQRy2DQJe4FYx7urhGxt/kaXYpvH1MdvN1U
	 M5SC+KjJh69YUnx5u2hAVkWQwDgbu+gwbEgF7ECQT92CMXc7eppbvDibpaeYKYQ6Mq
	 rP9eV2Wce2GnPT+nv2lK5PA+5UqaAttqgUG1cc0zoXhgtv7SXbvCS74ixUbxBN1rym
	 1+ERqPDJOqf3gpu2j0wGRCj6Dy6/DQRCgKASkFs8cdYRHLSSZN71SWW2EXgmrJy4jE
	 LStz5gv8B0eBjQ4ksw4VaUPzSdX8XorPE3tOE4fB8KxriEC0h1FhSa7ZarnFsY0eEQ
	 9V7EWkCQFcTmQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/3] lvgl: Drop superfluous ALLOW_EMPTY
Date: Fri, 22 Mar 2024 21:49:13 +0100
Message-ID: <20240322204951.43007-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109527

This ALLOW_EMPTY was a workaround for LVGL built as static library.
The lvgl is now built as shared library, drop this remnant.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.1.0.bb
index fc967e6d1..304068399 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
@@ -21,8 +21,6 @@ inherit cmake
 EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=3D=
ON"
 S =3D "${WORKDIR}/git"
=20
-ALLOW_EMPTY:${PN} =3D "1"
-
 PACKAGECONFIG ??=3D "drm"
 require lv-conf.inc
=20
--=20
2.43.0


