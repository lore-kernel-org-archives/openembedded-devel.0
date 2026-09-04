Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70F3C79F89
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11562.1788520953922606062
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 04:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CWz5hTLp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB11E153B
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3118D3F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788520953; bh=TKRMr7VJ3ZM4RPiJaC2vS/q0f6jqzOEbRlUSysc8WvE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CWz5hTLp217KjN5hAeaWKpNowP6/QsUSRVSKJhIgDMln857Qmj4LTlXYOnnw8TAp3
	 z1SObVmDpPgr3cvLPIsBjSw57U9zR0yboPg4WfV5lmnoL/vo/1UMjswZlIVF170peb
	 XPTNl4gDUaNp6HA4EsbtQUt/FIaFpswyX7J/rQ1s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 6/9] python3-future: remove obsolete PYPI_PACKAGE_HASH
Date: Fri,  4 Sep 2026 12:22:19 +0100
Message-ID: <20260904112222.114451-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904112222.114451-1-ross.burton@arm.com>
References: <20260904112222.114451-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 11:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129760

The need for PYPI_PACKAGE_HASH was removed in 2016[1].

[1] meta-oe 7edad4def40 ("pypi: update the base pypi url to use the
    package info without requiring the hash")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-future_1.0.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-future_1.0.0.bb =
b/meta-python/recipes-devtools/python/python3-future_1.0.0.bb
index eb66a7d33ce..810ab9c9b75 100644
--- a/meta-python/recipes-devtools/python/python3-future_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-future_1.0.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dce268d4c2f=
911490f47ac5473a24bb89"
=20
 SRC_URI[sha256sum] =3D "bd2968309307861edae1458a4f8a4f3598c03be43b975210=
76aebf5d94c07b05"
=20
-PYPI_PACKAGE_HASH =3D "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce=
94c0bb94d3d"
-
 inherit pypi setuptools3
=20
 BBCLASSEXTEND =3D "native"
--=20
2.43.0


