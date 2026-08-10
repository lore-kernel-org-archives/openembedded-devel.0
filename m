Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB047C5B574
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28249.1786364506070305544
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Qw91MpCb;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1D2214BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A93A3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364505; bh=zjryCyQJcTKkz3RbchTH3emzZoXVXFZ7FtieklcN1iI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qw91MpCb6O7YZf4lrRUFSRJQgisTdowIYrgv67bbQ414Q3J7QF+di+ckRjCqWeHJJ
	 MXPRcvXc/Xlpv49SPWUTj57lVX9ELjRH7cvGcNH7tN5poE66kg3JnsmR9S1vJu6HgI
	 ZXAJVGXsRhJj8NTulHt7hyEFyM+yc1+SkLkGTINc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/24] python3-cerberus: use correct build backend
Date: Mon, 10 Aug 2026 13:21:25 +0100
Message-ID: <20260810122130.633299-19-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128899

This package uses setuptools now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.b=
b b/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
index c075f4279c..7b868fad5e 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.8.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D48f8e9432d0dac=
5e0e7a18211a0bacdb"
=20
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
-inherit pypi python_poetry_core
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "579554887ffd189226774b87570f4a76db75cf0efcbaffca=
cd5e98b8ee877f61"
--=20
2.43.0


