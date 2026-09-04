Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C460C79F82
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:53:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13163.1788526429895290962
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hnBedaLb;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F3BB143D
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 05:53:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02E8D3F673
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788526429; bh=0+rVRO1+1wR1a5vT3M2XYMj6sg7hRq/D9UK8DxXGzQU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hnBedaLb4fMmGEfs/+GoT7x42q63jo4mqXLUekPUerTGSgsGc+DBwz74mz5l4ALil
	 57W45+LH+1AKXmz0ssv5nRrkAnl/oP1D0pcpEBp5Lh2FyZmgZnkMDA4uF/aHI1NGiA
	 mYvjfFhjG2Q4LlcYchdH45JZcv6/C5LoD4Ycw7cg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] python3-mlcommons-loadgen: remove redundant assignment
Date: Fri,  4 Sep 2026 13:53:43 +0100
Message-ID: <20260904125343.693490-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904125343.693490-1-ross.burton@arm.com>
References: <20260904125343.693490-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 12:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129767

UPSTREAM_CHECK_PYPI_PACKAGE is set to the default values, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-mlcommons-loadgen_6.0.17.bb                          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/pytho=
n3-mlcommons-loadgen_6.0.17.bb b/meta-python/recipes-devtools/python3-mlc=
ommons-loadgen/python3-mlcommons-loadgen_6.0.17.bb
index 0fbbd106b7..c0db4dc831 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlco=
mmons-loadgen_6.0.17.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlco=
mmons-loadgen_6.0.17.bb
@@ -19,7 +19,6 @@ SRC_URI +=3D " \
 "
=20
 PYPI_PACKAGE =3D "mlcommons_loadgen"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "mlcommons_loadgen"
=20
 SRC_URI[sha256sum] =3D "a2e85d09e3cc0c606f89bfe1fbf97537c8b5b238ae0afbd9=
23ad9c710fcf2ca8"
=20
--=20
2.43.0


