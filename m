Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38821C5AE5D
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28559.1786364504688051401
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=C/YJToqj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4181714BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC6093F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364504; bh=j635/s7kDtAfOP3gcpJ4LcCD3EobrMy0BuYHA5CIit0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C/YJToqjcVOBms606LtobpLNUBOkri9E5H1P9t0Jf7hWf5ikjJNaEG9gMBR7MbuCV
	 gQHJi/RSJsczDYZRWtqCUZyVO712UjUx+ky5D2775K5JqzU/gs8eN7OvxvMTsTGp3F
	 weK6ONQmK3KNdEkm+ycvZcRSZE7gsXvDWTbSvBfc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/24] python3-matplotlib-inline: use correct build backend
Date: Mon, 10 Aug 2026 13:21:23 +0100
Message-ID: <20260810122130.633299-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128897

This package uses flit now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-matplotlib-inline_0.2.2.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inlin=
e_0.2.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inlin=
e_0.2.2.bb
index ee98ae4b40..b80fc10030 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2=
.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.2=
.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] =3D "72f3fe8fce36b70d4a5b612f899090cd0=
401deddc4ea90e1572b9f4bfb
 PYPI_PACKAGE =3D "matplotlib_inline"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_flit_core
=20
 RDEPENDS:${PN} =3D "python3-traitlets"
--=20
2.43.0


