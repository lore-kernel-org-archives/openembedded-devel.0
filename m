Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7B8C43217
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 12:12:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8426.1653394325343223832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 05:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED4C723A;
	Tue, 24 May 2022 05:12:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1C463F66F;
	Tue, 24 May 2022 05:12:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 7/7] python3-cppy: fix inherits and DEPENDS
Date: Tue, 24 May 2022 13:11:53 +0100
Message-Id: <20220524121153.1175133-7-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97248

This recipe inherited python_flit_core, but actually builds with setuptoo=
ls.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb b/=
meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
index 57ef3b2776..270f74963d 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
@@ -7,11 +7,11 @@ SRC_URI[sha256sum] =3D "83b43bf17b1085ac15c5debdb42154f=
138b928234b21447358981f69d0
=20
 RDEPENDS:${PN} +=3D "python3-setuptools python3-distutils"
=20
-inherit pypi python_flit_core=20
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI +=3D " file://0001-Fix-build-error-as-following.patch \
            "
=20
-DEPENDS +=3D "python3-setuptools-native"
+DEPENDS +=3D "python3-setuptools-scm-native"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


