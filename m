Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F92DC5B56F
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28556.1786364500975641735
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vEAnNfG0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FF4614BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2643C3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364500; bh=tgFrT8BqLQ/t1QfsFzHLQGFygpOmaQbfprHXDuXxnZg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vEAnNfG0ySe2Ony766Gne3nv/bxQxgadZmHecVK6gFb4yxyTLzgaXXJy2hQkKthLw
	 WfoueF37Y/echbg9yKdbpmFe3aJBWp44AoSyPhn4yMzZI2WicVDQpxe0KHEcKbe9qu
	 Z1JxmA0oEc+rZ9SFURJLBiPnpXGPMy+tcxSQGNps=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/24] python3-awesomeversion: use correct build backend
Date: Mon, 10 Aug 2026 13:21:18 +0100
Message-ID: <20260810122130.633299-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128892

This package uses hatching.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-awesomeversion_25.8.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_2=
5.8.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_25.=
8.0.bb
index 338ba7e97a..4fc385128e 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_25.8.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_25.8.0.b=
b
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] =3D "e6cd08c90292a11f30b8de401863dcde7=
bc66a671d8173f9066ebd15d9
=20
 RDEPENDS:${PN} +=3D "python3-profile python3-logging"
=20
-inherit pypi python_hatchling python_poetry_core
+inherit pypi python_hatchling
--=20
2.43.0


