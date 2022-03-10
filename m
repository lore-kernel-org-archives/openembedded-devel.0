Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E034EC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9118.1646918727396518782
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06EAE1691
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB0633FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/9] python3-configparser: remove, not needed for Python 3
Date: Thu, 10 Mar 2022 13:25:17 +0000
Message-Id: <20220310132523.2253188-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310132523.2253188-1-ross.burton@arm.com>
References: <20220310132523.2253188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95925

This is a backport of the Python 3 configparser for Python 2 users, so
obviously it makes no sense to have for Python 3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb       |  1 -
 .../python/python3-configparser_5.2.0.bb            | 13 -------------
 2 files changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-configpar=
ser_5.2.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index ae454e789b..6eb803bd2a 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -82,7 +82,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-colorzero \
     python3-configargparse \
     python3-configobj \
-    python3-configparser \
     python3-configshell-fb \
     python3-constantly \
     python3-contextlib2 \
diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.2=
.0.bb b/meta-python/recipes-devtools/python/python3-configparser_5.2.0.bb
deleted file mode 100644
index e629331330..0000000000
--- a/meta-python/recipes-devtools/python/python3-configparser_5.2.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY =3D "This module provides the ConfigParser class which implement=
s a basic configuration language which provides a structure similar to wh=
at's found in Microsoft Windows INI files."
-SECTION =3D "devel/python"
-HOMEPAGE =3D "https://docs.python.org/3/library/configparser.html"
-LICENSE =3D "MIT"
-
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D10;endline=3D10;md5=3D=
23f9ad5cad3d8cc0336e2a5d8a87e1fa"
-
-SRC_URI[sha256sum] =3D "1b35798fdf1713f1c3139016cfcbc461f09edbf099d1fb65=
8d4b7479fcaa3daa"
-
-DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-nativ=
e"
-inherit pypi setuptools3
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


