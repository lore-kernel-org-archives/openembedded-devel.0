Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A73C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 12:37:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5913.1657888663451688252
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B99D1D13;
	Fri, 15 Jul 2022 05:37:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82A983F73D;
	Fri, 15 Jul 2022 05:37:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] python3-pytest-forked: loosen dependency checking
Date: Fri, 15 Jul 2022 13:37:40 +0100
Message-Id: <20220715123740.980121-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 12:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97842

This package has strict build dependencies defined in pyproject.toml:

requires =3D ['setuptools ~=3D 41.4', 'setuptools_scm ~=3D 3.3', 'wheel ~=
=3D 0.33.6']

The ~=3D operator is "compatible release", so "setuptools ~=3D 41.4" can =
be
read as "setuptools >=3D 41.4, setuptools =3D=3D 41.*".

We have setuptools 62.6.0 and do builds using our own packages instead
of building inside virtual environments, so these dependencies cannot
be satisfied.

Resolve this by passing --loose-depends to picobuild, which effectively
turns ~=3D into >=3D.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pytest-forked_1.4.0.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.=
4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.=
bb
index a751ad6e5a..34dd9c407e 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.4.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D "8b67587c8f98cbbadfdd804539ed5455b=
6ed03802203485dd2f53c1422
=20
 inherit pypi python_setuptools_build_meta
=20
+PEP517_PICOBUILD_OPTS =3D "--loose-depends"
+
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
 RDEPENDS:${PN} +=3D " \
--=20
2.34.1


