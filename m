Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BF5CCA483
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 12:44:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7009.1657802654158635438
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 05:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D31B13D5;
	Thu, 14 Jul 2022 05:44:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67F8B3F73D;
	Thu, 14 Jul 2022 05:44:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/8] python3-pytest-helpers-namespace: add missing build
 dependencies
Date: Thu, 14 Jul 2022 13:44:03 +0100
Message-Id: <20220714124405.2037213-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220714124405.2037213-1-ross.burton@arm.com>
References: <20220714124405.2037213-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Jul 2022 12:44:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97828

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-pytest-helpers-namespace_2021.12.29.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-n=
amespace_2021.12.29.bb b/meta-python/recipes-devtools/python/python3-pyte=
st-helpers-namespace_2021.12.29.bb
index 00e73f5bd8..cf62e1f03b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespac=
e_2021.12.29.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespac=
e_2021.12.29.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] =3D "792038247e0021beb966a7ea6e3a70ff5=
fcfba77eb72c6ec8fd6287af8
=20
 inherit pypi python_setuptools_build_meta
=20
+DEPENDS +=3D "python3-setuptools-scm-native python3-setuptools-declarati=
ve-requirements-native"
+
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-pytest \
 "
--=20
2.34.1


