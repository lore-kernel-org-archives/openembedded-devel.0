Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD084C5B56D
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28557.1786364501675661337
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=rsv0fral;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53BE71516
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA4F53F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364501; bh=3h0pBQlh+YLFrysIWCVsjy4vHHM4L/tTqFdS8yVbFpQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rsv0fralnqFEW0uTZBsdrY6GbvSZ+JxK0MR8SBX2FUHj+kXP8p7+Gsb404dUeJDdK
	 MnI6uAM6BuCLE0SZ0ntw3fJsVlJQKZkiSWQKz6ZtUIlGYXLRc9M94CKnujfSy/frb4
	 UClRJxiVYNrM0uS56kyjpaHxQzxsWL1aynJXeZbA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/24] python3-bitstring: use correct build backend
Date: Mon, 10 Aug 2026 13:21:19 +0100
Message-ID: <20260810122130.633299-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128893

This package uses setuptools now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.4.0.=
bb b/meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb
index cec183f302..ee2e8807c4 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D963a24c175e658=
fbf16a764135121ffa"
=20
 SRC_URI[sha256sum] =3D "e682ac522bb63e041d16cbc9d0ca86a4f00194db16d0847c=
7efe066f836b2e37"
=20
-inherit pypi python_poetry_core
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "\
     python3-core \
--=20
2.43.0


