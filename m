Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2541EC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28248.1786364505317978738
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cca2iijk;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F336B14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B1D13F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364504; bh=4YA1Hcdave/tZmReC+ubq3HYV1Fpm2C+whl6OvjWVTM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cca2iijkhjW2+tImdD4lR1TsXkLv3843UT8bFGdFf5Kc3HwywN111kISZPO6YCIph
	 iZGI910uDYpffKuryc204fjGp+gipTaYLl5EZvFgTHhfaHssdgSyLs4EI3qCUC6SPM
	 o+nrfXCOZj0z5dJyoY1Bu7hI0etfH/pH1OJhksmg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/24] python3-tinycss2: use correct build backend
Date: Mon, 10 Aug 2026 13:21:24 +0100
Message-ID: <20260810122130.633299-18-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128898

This package uses flit now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.b=
b b/meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb
index c75c741368..dae22c359e 100644
--- a/meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb
@@ -8,6 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d072d7e30e34f=
33f8ae956ada04fa2c"
=20
 SRC_URI[sha256sum] =3D "d339d2b616ba90ccce58da8495a78f46e55d4d25f9fd71df=
d526f07e7d53f957"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


