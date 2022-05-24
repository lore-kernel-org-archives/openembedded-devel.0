Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBC9C4167B
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 12:12:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8521.1653394318894884247
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 05:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6600023A;
	Tue, 24 May 2022 05:11:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9175C3F66F;
	Tue, 24 May 2022 05:11:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/7] python3-setuptools-declarative-requirements: add new
 recipe
Date: Tue, 24 May 2022 13:11:48 +0100
Message-Id: <20220524121153.1175133-2-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97243

Some Python packages use this in their setup.cfg.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 +
 ...hon3-setuptools-declarative-requirements_1.2.0.bb | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-setuptool=
s-declarative-requirements_1.2.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index bab637bfb2..594a72f526 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -389,6 +389,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-send2trash \
     python3-sentry-sdk \
     python3-serpent \
+    python3-setuptools-declarative-requirements \
     python3-setuptools-scm-git-archive \
     python3-sh \
     python3-sijax \
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-decla=
rative-requirements_1.2.0.bb b/meta-python/recipes-devtools/python/python=
3-setuptools-declarative-requirements_1.2.0.bb
new file mode 100644
index 0000000000..9628656ad6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setuptools-declarative-=
requirements_1.2.0.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "File support for setuptools declarative setup.cfg"
+HOMEPAGE =3D "https://pypi.org/project/setuptools-declarative-requiremen=
ts/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
+
+SRC_URI[sha256sum] =3D "d11fdb5ef818c65b20bc241e0f5ef44905a5640b681dae21=
ba1ac1742dab1fd1"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS +=3D "python3-setuptools-scm-native"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


