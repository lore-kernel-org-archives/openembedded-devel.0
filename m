Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ACD10A88E9
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 16:57:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53252.1774544235579217195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 09:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=eTJRBzSz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEFC32C41
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 09:57:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 68E443F905
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774544234; bh=90hBQjjwN3YoSx8gkCSihy97hU7H4TEIZf8oDB+64D4=;
	h=From:To:Subject:Date:From;
	b=eTJRBzSzfhDQD4LJyyZNIGvBWqROKK/fiyH87BkL/2ywvpVks7v3tb1B8m/brItic
	 OgWH0OgMxaSzNxrZmkRv1cU8UHMZLc8qcHe+O4amR+g1//8iIbxL6Lx6LpFDxpOLyt
	 iDmUJXEifJbsLypkXWtNsmw3g+HBH0RAodwTYitw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-py7zr: remove python3-pyzstd
Date: Thu, 26 Mar 2026 16:57:10 +0000
Message-ID: <20260326165710.1971260-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 16:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125762

This dependency was replaced with the standard compression.zstd module
in 1.1.0[1].

[1] https://github.com/miurahr/py7zr/commit/ccf0def15e4542ffc24e2a6f00570=
622ed04a0c9

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb b=
/meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb
index 5a0fe86ebd..b4c6c1672b 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb
@@ -23,7 +23,6 @@ RDEPENDS:${PN} +=3D "\
     python3-pybcj \
     python3-inflate64 \
     python3-pyppmd \
-    python3-pyzstd \
     python3-brotli \
     python3-multiprocessing \
     python3-datetime \
--=20
2.43.0


