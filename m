Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84960C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 17:08:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12860.1788455280460181779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 10:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=pNJgdoU/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B0611596
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:07:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6015C3F7D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788455279; bh=Y25Dx0p0kdcuTTd8izzuQlrNGlfwM3V8lnadGupqJgY=;
	h=From:To:Subject:Date:From;
	b=pNJgdoU/GtlU6lQUKpPoupedocm337mlkhGyM7XyZO8kGWq1P/RkgSv2EDtxJYjfP
	 8WhO5qmo3ci0uKFHc0402EqIz1tl4pbExe6Y8Of5jfgkNmsQ9v7PrdqfIWJXppYfNv
	 qreb9hyfmqV8gZy+ObMW6Dfvlba0O0O8JdN2CKV8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] python3-thrift: use PYPI_ARCHIVE_NAME_PREFIX
Date: Thu,  3 Sep 2026 18:07:53 +0100
Message-ID: <20260903170754.352677-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 17:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129746

There's a variable to handle tarball conflicts, so use it instead of
appending to the SRC_URI directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrif=
t_0.24.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thri=
ft_0.24.0.bb
index 911ab1ddc6..3d27b7e17d 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.=
0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.=
0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 DEPENDS +=3D "python3-wheel-native"
=20
 # Use different filename to prevent conflicts with thrift itself
-PYPI_SRC_URI:append =3D ";downloadfilename=3D${BP}.${PYPI_PACKAGE_EXT}"
+PYPI_ARCHIVE_NAME_PREFIX =3D "python-"
=20
 RDEPENDS:${PN} +=3D "\
     python3-logging \
--=20
2.43.0


