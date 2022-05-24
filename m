Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A7AC4332F
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 12:12:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8523.1653394323769012828
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 05:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 697901FB;
	Tue, 24 May 2022 05:12:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 878ED3F66F;
	Tue, 24 May 2022 05:12:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/7] python3-traitlets: upgrade to 5.2.1
Date: Tue, 24 May 2022 13:11:52 +0100
Message-Id: <20220524121153.1175133-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524121153.1175133-1-ross.burton@arm.com>
References: <20220524121153.1175133-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 12:12:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97247

This now uses hatching to build.

Also remove redundant PYPI_PACKAGE assignment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ython3-traitlets_5.2.0.bb =3D> python3-traitlets_5.2.1.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.2.0.bb =3D=
> python3-traitlets_5.2.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.=
bb b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.2.0.b=
b
rename to meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
index 56ebaac675..3bc977279a 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
@@ -4,13 +4,11 @@ AUTHOR =3D "IPython Development Team <ipython-dev@scipy=
.org>"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3D9c125dfc5ff5364d40b5f56f02=
cd9de3"
=20
-PYPI_PACKAGE =3D "traitlets"
+SRC_URI[sha256sum] =3D "a415578cde1985f1b773faefe49e9f078d345f38665ce3e9=
e914ec7b41150ce9"
=20
-SRC_URI[sha256sum] =3D "60474f39bf1d39a11e0233090b99af3acee93bbc2281777e=
61dd8c87da8a0014"
+inherit pypi python_hatchling
=20
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-ipython-genutils \
     ${PYTHON_PN}-decorator \
 "
-
-inherit pypi python_setuptools_build_meta
--=20
2.25.1


