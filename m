Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CFEC433FE
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 12:12:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8610.1653394317812284551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 05:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EC731FB;
	Tue, 24 May 2022 05:11:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53DD73F66F;
	Tue, 24 May 2022 05:11:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/7] python3-setuptools-scm-git-archive: add new recipe
Date: Tue, 24 May 2022 13:11:47 +0100
Message-Id: <20220524121153.1175133-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 12:12:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97242

Some Python packages use this at build time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 +
 .../python3-setuptools-scm-git-archive_1.1.bb     | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-setuptool=
s-scm-git-archive_1.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index 6ca652e12d..bab637bfb2 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -389,6 +389,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-send2trash \
     python3-sentry-sdk \
     python3-serpent \
+    python3-setuptools-scm-git-archive \
     python3-sh \
     python3-sijax \
     python3-simpleeval \
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm-g=
it-archive_1.1.bb b/meta-python/recipes-devtools/python/python3-setuptool=
s-scm-git-archive_1.1.bb
new file mode 100644
index 0000000000..472c4eb1c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm-git-arch=
ive_1.1.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "setuptools_scm plugin for git archives"
+HOMEPAGE =3D "https://pypi.org/project/setuptools-scm-git-archive/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D838c366f69b72c5df05c96dff79b3=
5f2"
+
+SRC_URI[sha256sum] =3D "6026f61089b73fa1b5ee737e95314f41cb512609b3935303=
85ed281d0b46c062"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE =3D "setuptools_scm_git_archive"
+PYPI_SRC_URI =3D "https://files.pythonhosted.org/packages/7e/2c/0c15b29a=
1b5940250bfdc4a4f53272e35cd7cf8a34159291b6b4ec9eb291/${PYPI_ARCHIVE_NAME}=
"
+
+DEPENDS +=3D "python3-setuptools-scm-native"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


