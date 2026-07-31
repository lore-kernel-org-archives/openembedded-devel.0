Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DC1C55173
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 19:15:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3551.1785525326887420387
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 12:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ghxt78Xe;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66297152B
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 12:15:22 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF1843F66F
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785525326; bh=ipsZhwrr28LhEaHhf4+coGXsoESEiSKxU6f5HS8CaME=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ghxt78Xessnw/MI3sCn9E7qQLMZJdhTw+efVrV7ZZ3yk0YVrQOcxdbOg1Qu3xO1Ta
	 iRO7MJxE/0q9akBSHlYHCgY9rECEjVuvM2rJW99YZ9nW7Lwi9Vl94b7t1IMN1+Z8dR
	 2EPr40CbkufDqlygA72ZThafX2WoTlD72B/DBR88=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] lsd: add missing libgit2 build dependency
Date: Fri, 31 Jul 2026 20:15:22 +0100
Message-ID: <20260731191523.2153901-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731191523.2153901-1-ross.burton@arm.com>
References: <20260731191523.2153901-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 19:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128591

Needed since our cargo class now stops the git2-sys crate from using a
bundled copy of libgit2. Also inherit pkgconfig as that is used to find
the system libgit2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/lsd/lsd_1.2.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lsd/lsd_1.2.0.bb b/meta-oe/recipes-=
extended/lsd/lsd_1.2.0.bb
index 7310e56a78..a79616ef6e 100644
--- a/meta-oe/recipes-extended/lsd/lsd_1.2.0.bb
+++ b/meta-oe/recipes-extended/lsd/lsd_1.2.0.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D153d2db1c329=
326a2d9f881317ea942e"
 SRC_URI =3D "git://github.com/lsd-rs/lsd.git;protocol=3Dhttps;branch=3Dm=
ain;tag=3Dv${PV}"
 SRCREV =3D "d5a4e1cb80626d5ec94b237f6b77f7280d0f2fc9"
=20
-inherit cargo cargo-update-recipe-crates
+DEPENDS =3D "libgit2"
+
+inherit cargo cargo-update-recipe-crates pkgconfig
=20
 require ${BPN}-crates.inc
=20
--=20
2.43.0


