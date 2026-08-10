Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3243FC5B569
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28241.1786364496589003943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tog4r2RQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E93814BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BFC2E3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364496; bh=zkqqOrHIyQquzeXd0D1dsSNpc4nuOZRnpVTUwF/RRFY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tog4r2RQanvskIrtme7XticsbLN6LPJdRlsPcnxA6RbpOX0/qbabyJ5jzXzSJIZ5L
	 iLZ4+3YKmJmFIP3613H8nIC3ECmqyM+m7+q8NMMz1l3Y3H/nDzUEHHPh996n6j35bd
	 wpBS1skF+tFyGes6TSvv+XX5sxA5PECjoR2PHSCg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/24] python3-pint: fix build dependencies
Date: Mon, 10 Aug 2026 13:21:12 +0100
Message-ID: <20260810122130.633299-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128886

pint uses hatchling, so remove the python_setuptools_build_meta inherit
and setuptools/setuptools-scm dependencies.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pint_0.25.3.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb b=
/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
index fff2b08324..dd2a782b0e 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
@@ -6,18 +6,17 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbccf824202692270a1e0829a62e3f=
47b"
=20
-inherit pypi python_hatchling ptest-python-pytest python_setuptools_buil=
d_meta
+inherit pypi python_hatchling ptest-python-pytest
=20
 SRC_URI[sha256sum] =3D "f8f5df6cf65314d74da1ade1bf96f8e3e4d0c41b51577ac5=
3c49e7d44ca5acee"
=20
-DEPENDS +=3D "python3-setuptools-scm-native python3-hatch-vcs-native"
+DEPENDS +=3D "python3-hatch-vcs-native"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
 PTEST_PYTEST_DIR =3D "pint"
=20
 RDEPENDS:${PN} +=3D " \
-	python3-setuptools \
 	python3-packaging \
 	python3-platformdirs \
 "
@@ -32,4 +31,3 @@ RDEPENDS:${PN}-ptest +=3D " \
 	python3-pytest-subtests \
 	python3-statistics \
 "
-
--=20
2.43.0


