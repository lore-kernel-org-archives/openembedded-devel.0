Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAECBF8FA93
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 15:11:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34308.1776784285663977745
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 08:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=SkgNnGLb;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7703E263D
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:11:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D3E83FAF5
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776784285; bh=JOpFhyM5wKjKfi+H1h3sB4ZlEbBtXVO+HJ4bIKahhMU=;
	h=From:To:Subject:Date:From;
	b=SkgNnGLbiobi3j7k0rkphFqJoiOL5I2eZ47DJQxFndDVjOoioJ/BzVyrN7r1iDdQ6
	 SP9UNBZdsMNprMZ3lZRtcZp5mgolOWiunYUHINfD2iFFtT17ZFYmzcmpbhxEsxEPU3
	 IHb+eUW+z6vORRceNcKt4GC1Lg2FaeyIw70G2HF4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libspdm: update SRCREV to final 3.8.2 release
Date: Tue, 21 Apr 2026 16:11:21 +0100
Message-ID: <20260421151121.752096-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 15:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126533

The initial 3.8.2 tag pointing at 5cf0acb8 ("Update version for 3.8.2
release") was actually a pre-release and that tag has since moved.

Now that 3.8.2 has offically been released we can update the SRCREV.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb b/meta-oe/r=
ecipes-support/libspdm/libspdm_3.8.2.bb
index 04f1ffc1fc..7d227d4148 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81=
a88da8e812af43728b72dd7"
 DEPENDS =3D "openssl"
=20
 SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Drelease-3.8;prot=
ocol=3Dhttps;tag=3D${PV}"
-SRCREV =3D "5cf0acb87b2f36f8d70a89e5da8476d85db59f46"
+SRCREV =3D "f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d"
=20
 inherit cmake
=20
--=20
2.43.0


