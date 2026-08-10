Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1487BC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28566.1786364509761750178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lTbcemhI;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 650CB14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECA193F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364509; bh=ZqcRG3e87lBevzQeFGHXkEPBJVMqpNiDkHV0wga8Nms=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lTbcemhIV4aJfhMoaTCFDzpTtFNhSIb7TlwBIxzKoNOolqcgLyZMhFHTyxz4/bR4r
	 HkXZMcZmQx4onX2knD7wT9h88ld8DsMqmTt7sBNijlglfimMZm1g2H3VVrDOObhfm5
	 LxNM9zCGaRoqAmeXqfvDyab+QcqAUfdbGaDoAB2g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 24/24] python3-python-xmp-toolkit: use correct build backend
Date: Mon, 10 Aug 2026 13:21:30 +0100
Message-ID: <20260810122130.633299-24-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128904

This package uses flit now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-python-xmp-toolkit_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-python-xmp-toolk=
it_2.1.0.bb b/meta-python/recipes-devtools/python/python3-python-xmp-tool=
kit_2.1.0.bb
index 3c761ba1dc..3a269744d9 100644
--- a/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.=
0.bb
+++ b/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.=
0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D30fa74de63728a=
f31f13dc3bb8cb1756"
=20
 SRC_URI[sha256sum] =3D "ca0aa2c60d418dd2558767db59953ab5954fb5b87dc0b50c=
ecd60566b0b4e2da"
=20
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_flit_core ptest-python-pytest
=20
 PYPI_PACKAGE =3D "python_xmp_toolkit"
=20
--=20
2.43.0


