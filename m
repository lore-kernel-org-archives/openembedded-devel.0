Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC20AC5B573
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28242.1786364498027873302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=RxyosSvn;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FA6214BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 352183F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364497; bh=lSZSsSk53VYgfsBGivYUWJRtF3tuIW6NJTBu4HutnJk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RxyosSvnQl7KI00NrUG/kZGPb/EUdJnuqAE2U1y/8ZiX4zuIFk8i/ndKWb9kw/L8f
	 rYYT8z9KfNdk/uFtgr39pTi/NjqUmiziFCQzqpS07tvLlfwg4lQsgewlaFCq68uVRp
	 zAOwKA3AnzLywSx+n5sersus1prB3p8s0iuSuuts=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/24] python3-obd: remove build-dependencies from RDEPENDS
Date: Mon, 10 Aug 2026 13:21:14 +0100
Message-ID: <20260810122130.633299-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128888

These are not needed at runtime.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-obd_0.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb b/m=
eta-python/recipes-devtools/python/python3-obd_0.7.3.bb
index e7eb3a784d..2a3eb752eb 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] =3D "27b8f043376ca700edb98bf5216e29122=
95ecde0e735b260999f2d9ddf
=20
 inherit python_setuptools_build_meta pypi
=20
-RDEPENDS:${PN} +=3D "python3-pyserial python3-pint python3-setuptools py=
thon3-packaging"
+RDEPENDS:${PN} +=3D "python3-pyserial python3-pint"
--=20
2.43.0


