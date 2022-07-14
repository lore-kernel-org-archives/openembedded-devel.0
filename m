Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA096CCA480
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 12:44:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7123.1657802651756220788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 05:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A68B41CE2;
	Thu, 14 Jul 2022 05:44:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C114F3F73D;
	Thu, 14 Jul 2022 05:44:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/8] python3-simpleeval: remove 'build' build dependency
Date: Thu, 14 Jul 2022 13:43:59 +0100
Message-Id: <20220714124405.2037213-2-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97824

In the future we'll have a Python building tool which validates build
requirements.  No package should require a specific tool to be present
(not even used, just present), so remove the dependency on 'build'.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-simpleeval/no-build.patch  | 24 +++++++++++++++++++
 .../python/python3-simpleeval_0.9.12.bb       |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeva=
l/no-build.patch

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval/no-bu=
ild.patch b/meta-python/recipes-devtools/python/python3-simpleeval/no-bui=
ld.patch
new file mode 100644
index 0000000000..b090755f8a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simpleeval/no-build.pat=
ch
@@ -0,0 +1,24 @@
+Upstream-Status: Submitted [https://github.com/danthedeckie/simpleeval/p=
ull/119]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 08bc99211aec32882d5f1c83896eb5d72b9fb125 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 23 May 2022 11:35:00 +0100
+Subject: [PATCH] pyproject.toml: remove build as a build-dependency
+
+pypa/build is one possible build tool, but not the only build tool.  For=
cing build to be present as a build dependency is meaningless: either the=
 user is using build so obviously have build, or are using something else=
 so having build is irrelevant.
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 052a55a..416482b 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires =3D ["setuptools>=3D30.3.0", "wheel", "build"]
++requires =3D ["setuptools>=3D30.3.0", "wheel"]
+ build-backend =3D "setuptools.build_meta"
+=20
+ [tool.black]
diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.1=
2.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
index 343e5c03de..c9cf33d023 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.12.bb
@@ -10,6 +10,7 @@ inherit pypi python_setuptools_build_meta ptest
 BBCLASSEXTEND =3D "native nativesdk"
=20
 SRC_URI +=3D " \
+	file://no-build.patch \
 	file://run-ptest \
 "
=20
--=20
2.34.1


