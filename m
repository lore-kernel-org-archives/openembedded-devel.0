Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49281C5B56A
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28558.1786364503906437617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QtH+IyJF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 834BB14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 18B083F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364503; bh=DHBjjsnQ80reIgnGkkQGpe6IQTKHNhGM75aOXFzqgYg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QtH+IyJFwraf391e7fICimlVjTEr90GKFpSFfgnqakTc7/pYg4OK99PXesDYRyE65
	 3tIg+4cfaTxU1xrNNpm7GEEyBP6Rv50NQpo2kTOv23ilUO6O7tTpkgI+Nlr+P0rOCe
	 LJRXoqb6zCYirZ1fQ6ZWlSd1BlqEPNT6b5nA0Oes=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/24] python3-constantly: use correct build backend
Date: Mon, 10 Aug 2026 13:21:22 +0100
Message-ID: <20260810122130.633299-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128896

This package uses setuptools now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-constantly_23.10.4.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-constantly_23.10=
.4.bb b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
index 2df501aaa6..7645cdc132 100644
--- a/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-constantly_23.10.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De393e4ddd223e3=
a74982efa784f89fd7"
=20
 SRC_URI[sha256sum] =3D "aa92b70a33e2ac0bb33cd745eb61776594dc48764b06c35e=
0efd050b7f1c7cbd"
=20
-inherit pypi python_poetry_core=20
+inherit pypi python_setuptools_build_meta=20
=20
 DEPENDS +=3D "python3-versioneer-native"
=20
--=20
2.43.0


