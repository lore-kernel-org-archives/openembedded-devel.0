Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDB1C5B572
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28555.1786364500245338673
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZQPcmZlp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19AC14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66E4F3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364499; bh=QsbvQLPTN0dvRPQOkPH4+B8CHRXjM652jNVrgGaKAeg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZQPcmZlpOVIOvoCJSykecXE35DMl3nd/tYUG6fba4cA9nLPN0Tgr5Kcp2+CqZ+rYt
	 ckquuguoyC9g4WnFOoBR20UGWoNrVtuKyEvcRxrhcnePTkRjdyutCY1h/WVJY2JROH
	 LaNyDbWxFh5VWLd6PlP7ie8ZJQaLntPBsxWzCsEI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/24] python3-automat: use correct build backend
Date: Mon, 10 Aug 2026 13:21:17 +0100
Message-ID: <20260810122130.633299-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128891

This package uses setuptools now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-automat_25.4.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-automat_25.4.16.=
bb b/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
index c5ba16fc0d..e95138849d 100644
--- a/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4ad213bcca8168=
8e94593e5f60c87477"
=20
 SRC_URI[sha256sum] =3D "0017591a5477066e90d26b0e696ddc143baafd87b588cfac=
8100bc6be9634de0"
=20
-inherit pypi python_hatchling
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "\
     python3-hatch-vcs-native \
--=20
2.43.0


