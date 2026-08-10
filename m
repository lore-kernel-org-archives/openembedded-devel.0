Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7D9C5B571
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28244.1786364498804454749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jKr6ABgW;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E0F214BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E8E263F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364498; bh=p9i9TAoemA5xXWd5Xyxbs8ft2ITg80ojZni/PEBTx10=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jKr6ABgWDNHaPlfut4qO2vMSqQKuuDOpQg41UU1Z06663y0ZMeGop1U/gSfVa5lt0
	 qHIvFB5vraGh9bcwsnvjA+qDoK15efli4Kz5gjF64wH1/p+BWGAa6LOfU9vmiQ6M3k
	 bCUjY9j9Fag33R4cvFqUqqrMDbaauZvJnBpYefOQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/24] python3-asyncinotify: use correct build backend
Date: Mon, 10 Aug 2026 13:21:15 +0100
Message-ID: <20260810122130.633299-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128889

This package uses flit now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-asyncinotify_4.4.4.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.4=
.4.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.4.bb
index f2f868e972..5a51601f47 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df75d2927d3c1ed=
2414ef72048f5ad640"
=20
 SRC_URI[sha256sum] =3D "a8afc92bec6666807ca50524156fca22655325cba6e2b51d=
842b8ec0d399c708"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 RDEPENDS:${PN} +=3D " \
     python3-asyncio \
--=20
2.43.0


