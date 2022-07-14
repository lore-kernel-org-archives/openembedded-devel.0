Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3588CCA485
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 12:44:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7008.1657802652275867872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 05:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53EA413D5;
	Thu, 14 Jul 2022 05:44:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DC753F73D;
	Thu, 14 Jul 2022 05:44:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/8] python3-pyrad: fix build system specification
Date: Thu, 14 Jul 2022 13:44:00 +0100
Message-Id: <20220714124405.2037213-3-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97825

The upstream pyproject.toml says it needs to be built with the Poetry
frontend, but that's deprecated behaviour and it should use the Poetry
Core API instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3-pyrad/use-poetry-core.patch       | 26 +++++++++++++++++++
 .../python/python3-pyrad_2.4.bb               |  2 ++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyrad/use=
-poetry-core.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyrad/use-poetry=
-core.patch b/meta-python/recipes-devtools/python/python3-pyrad/use-poetr=
y-core.patch
new file mode 100644
index 0000000000..43a177da0a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyrad/use-poetry-core.p=
atch
@@ -0,0 +1,26 @@
+Upstream-Status: Backport [https://github.com/pyradius/pyrad/commit/ffe1=
82a44909e8f8278fb3e2ea052ddc097b48b9]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a4b70067dd6269e14a2f9530d820390a8a454231 Mon Sep 17 00:00:00 2001
+From: Martin Weinelt <hexa@darmstadt.ccc.de>
+Date: Thu, 14 Apr 2022 22:07:37 +0200
+Subject: [PATCH] Use poetry-core for pyproject based builds
+
+https://github.com/python-poetry/poetry-core#why-is-this-required
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 87b1df3..711c52f 100755
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+-requires =3D ["poetry>=3D1.0"]
+-build-backend =3D "poetry.masonry.api"
++requires =3D ["poetry-core>=3D1.0.0"]
++build-backend =3D "poetry.core.masonry.api"
+=20
+ [tool.poetry]
+ name =3D "pyrad"
diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/m=
eta-python/recipes-devtools/python/python3-pyrad_2.4.bb
index b2d0dc324b..bce1e2fd14 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
@@ -6,4 +6,6 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3De910b35b0ef4e1f665
 PYPI_PACKAGE =3D "pyrad"
 SRC_URI[sha256sum] =3D "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a6=
9beaff15c47e30d9"
=20
+SRC_URI +=3D "file://use-poetry-core.patch"
+
 inherit pypi python_poetry_core
--=20
2.34.1


