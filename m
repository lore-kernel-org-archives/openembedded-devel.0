Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30485C79F8C
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11565.1788520955981131527
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 04:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Gof5HwqY;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BACB3153B
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1EA6C3F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788520955; bh=68R2RNLq2AVzye5mS1R/UnvHR8MjWYxLAmZxn5L6ZeM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Gof5HwqY/vuJ0Le/KUkbGOOS9mo2+K/4NCBE6ygPxZgOsA5sp0T1/LE2/8pdPbgDq
	 MocPDt1UCptTZCRAltbMsreA7pTlIPtvtMoHXrzfMSFczr+KseLe6n+jb+rUf60dva
	 IMrogHWeCUDpIubdio00skSFp5U8X9AsstlKVWM4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 9/9] python3-jstyleson: remove redundant PYPI_PACKAGE_EXT
Date: Fri,  4 Sep 2026 12:22:22 +0100
Message-ID: <20260904112222.114451-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904112222.114451-1-ross.burton@arm.com>
References: <20260904112222.114451-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 11:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129763

".tar.gz" is the default value, so there's no need to set this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.=
bb b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
index ff9d7dd552f..d7bad943698 100644
--- a/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jstyleson_0.0.2.bb
@@ -6,8 +6,6 @@ SRC_URI +=3D " file://LICENSE "
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/LICENSE;md5=3Dd97b96c7337934ee=
448ffd4392f32079"
=20
-PYPI_PACKAGE_EXT =3D "tar.gz"
-
 inherit pypi setuptools3
=20
 SRC_URI[sha256sum] =3D "680003f3b15a2959e4e6a351f3b858e3c07dd3e073a0d549=
54e34d8ea5e1308e"
--=20
2.43.0


