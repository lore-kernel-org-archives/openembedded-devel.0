Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE01C79F88
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 15:53:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1527.1788537180179685842
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 08:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VHgOLoG/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF1B7152B
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4303E3F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788537179; bh=4HdhtjiDkkZG/xOT9oSPWM3Dqy5jmdN/Fv4Ec+7U91E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VHgOLoG/3eii+mnLgxmvJJM4BTxwDVcnHDBV7IH4IG1b/+Z9LG9vDHG3RA6lduTSg
	 KcJuXsSse+pSQglJQb9gsWi+nPp/QPM3c87/7pVKYgMk4vvqd50VJsPIITBMaNOJ6I
	 HY5Tf4mJ/qb8qLS79i7GaLEiGXV4Qxgc/Ow/6U4g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] python3-mccabe: remove obsolete DEPENDS
Date: Fri,  4 Sep 2026 16:52:49 +0100
Message-ID: <20260904155251.1373817-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904155251.1373817-1-ross.burton@arm.com>
References: <20260904155251.1373817-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 15:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129770

These dependencies are no longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb =
b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
index 5304917842..c21c87d606 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
@@ -8,6 +8,4 @@ SRC_URI[sha256sum] =3D "348e0240c33b60bbdf4e523192ef919f2=
8cb2c3d7d5c7794f74009290f
=20
 inherit pypi setuptools3
=20
-DEPENDS +=3D "python3-pytest-runner-native"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


