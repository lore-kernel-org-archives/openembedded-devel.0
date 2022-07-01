Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54CEC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:36:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.36836.1656675362464690116
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 209B6113E;
	Fri,  1 Jul 2022 04:36:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43BF73F66F;
	Fri,  1 Jul 2022 04:36:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] python3-hatchling: remove (now in oe-core)
Date: Fri,  1 Jul 2022 12:35:57 +0100
Message-Id: <20220701113559.290350-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 11:36:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97660

As of 846e80 this is now in oe-core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/classes/python_hatchling.bbclass  |  5 -----
 .../python/python3-hatchling_1.3.0.bb         | 21 -------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-python/classes/python_hatchling.bbclass
 delete mode 100644 meta-python/recipes-devtools/python/python3-hatchling=
_1.3.0.bb

diff --git a/meta-python/classes/python_hatchling.bbclass b/meta-python/c=
lasses/python_hatchling.bbclass
deleted file mode 100644
index b3cbe23601..0000000000
--- a/meta-python/classes/python_hatchling.bbclass
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit python_pep517 python3native python3-dir setuptools3-base
-
-DEPENDS +=3D "python3-hatchling-native"
-
-PEP517_BUILD_API =3D "hatchling.build"
diff --git a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.=
bb b/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
deleted file mode 100644
index a6550a9732..0000000000
--- a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY =3D "The extensible, standards compliant build backend used by H=
atch"
-HOMEPAGE =3D "https://hatch.pypa.io/latest/"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcbe2fd33fc9297692812fc94b=
7d27fd9"
-
-inherit pypi python_hatchling
-
-DEPENDS +=3D "python3-pluggy-native python3-tomli-native python3-pathspe=
c-native python3-packaging-native python3-editables-native"
-DEPENDS:remove:class-native =3D "python3-hatchling-native"
-
-SRC_URI[sha256sum] =3D "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f=
2b0040fdddc5b85e"
-
-# Until we have a proper tool to invoke PEP517 builds, hatchling can't
-# bootstrap itself automatically.
-PEP517_BUILD_API =3D "hatchling.ouroboros"
-
-do_compile:prepend() {
-    export PYTHONPATH=3Dsrc
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


