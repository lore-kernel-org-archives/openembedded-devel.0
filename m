Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5879CCA482
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 12:44:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7007.1657802652840428381
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 05:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0063415A1;
	Thu, 14 Jul 2022 05:44:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A7553F73D;
	Thu, 14 Jul 2022 05:44:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/8] python3-pytest-html: fix DEPENDS, don't depend on pip
Date: Thu, 14 Jul 2022 13:44:01 +0100
Message-Id: <20220714124405.2037213-4-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97826

Add a DEPENDS on ptyhon3-setuptools-scm-git-archive-native as the setup.p=
y
uses it.

In the future we'll have a Python building tool which validates build
requirements, so remove pip from those dependencies as it shouldn't depen=
d
on a specific build tool being present.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-pytest-html/no-pip.patch   | 24 +++++++++++++++++++
 .../python/python3-pytest-html_3.1.1.bb       |  4 ++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-ht=
ml/no-pip.patch

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html/no-p=
ip.patch b/meta-python/recipes-devtools/python/python3-pytest-html/no-pip=
.patch
new file mode 100644
index 0000000000..e120498846
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-html/no-pip.patc=
h
@@ -0,0 +1,24 @@
+Upstream-Status: Submitted [https://github.com/pytest-dev/pytest-html/pu=
ll/516]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From d7fbc79d428323c838ce68a51e1e1806c2096a76 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 23 May 2022 13:46:50 +0100
+Subject: [PATCH] pip isn't a build dependency
+
+It's possible, and even desirable, to build modern Python code without p=
ip, for example by using the `build` and `installer` packages.
+---
+ pyproject.toml | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 2683f072..e3f25bf7 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,5 @@
+ [build-system]
+ requires =3D [
+-  "pip >=3D 19.3.1",
+   "setuptools >=3D 42",
+   "setuptools_scm[toml] >=3D 3.5.0",
+   "setuptools_scm_git_archive >=3D 1.1",
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.=
1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
index ce55554a01..1bbdfb633b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
@@ -10,6 +10,10 @@ PYPI_PACKAGE =3D "pytest-html"
=20
 inherit pypi python_setuptools_build_meta
=20
+DEPENDS +=3D "python3-setuptools-scm-git-archive-native"
+
+SRC_URI +=3D "file://no-pip.patch"
+
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-pytest \
 "
--=20
2.34.1


