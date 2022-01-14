Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B96C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:53:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7296.1642168435346481315
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00B5E101E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:53:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A05793F774
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:53:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] python3-smbus: use setuptools
Date: Fri, 14 Jan 2022 13:53:52 +0000
Message-Id: <20220114135352.3996274-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114135352.3996274-1-ross.burton@arm.com>
References: <20220114135352.3996274-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 13:53:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94836

Port the use of distutils to setuptools, as distutils is deprecated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...etuptools-as-distutils-is-deprecated.patch | 25 +++++++++++++++++++
 .../python/python3-smbus_4.3.bb               |  8 +++---
 2 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-smbus/000=
1-Use-setuptools-as-distutils-is-deprecated.patch

diff --git a/meta-python/recipes-devtools/python/python3-smbus/0001-Use-s=
etuptools-as-distutils-is-deprecated.patch b/meta-python/recipes-devtools=
/python/python3-smbus/0001-Use-setuptools-as-distutils-is-deprecated.patc=
h
new file mode 100644
index 0000000000..6aafd6a952
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-smbus/0001-Use-setuptoo=
ls-as-distutils-is-deprecated.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Submitted [https://lore.kernel.org/linux-i2c/2022011413=
4910.3994688-1-ross.burton@arm.com/T/#u]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From fa522a9a390b1857a58ec1f55da1465c542fd106 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 14 Jan 2022 13:38:34 +0000
+Subject: [PATCH] Use setuptools as distutils is deprecated
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ py-smbus/setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/py-smbus/setup.py b/py-smbus/setup.py
+index 28a4500..26db33a 100644
+--- a/py-smbus/setup.py
++++ b/py-smbus/setup.py
+@@ -1,6 +1,6 @@
+ #!/usr/bin/env python
+=20
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+=20
+ setup(	name=3D"smbus",
+ 	version=3D"1.1",
diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb b/m=
eta-python/recipes-devtools/python/python3-smbus_4.3.bb
index a09a108b36..ecdff3adad 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
@@ -2,13 +2,15 @@ SUMMARY =3D "Set of i2c tools for linux - Python module=
"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://py-smbus/smbusmodule.c;beginline=3D1;endlin=
e=3D18;md5=3D46e424fb045901ab25e0f92c28c80055"
=20
-SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV=
}.tar.gz "
+SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV=
}.tar.gz \
+           file://0001-Use-setuptools-as-distutils-is-deprecated.patch \
+           "
 SRC_URI[sha256sum] =3D "eec464e42301d93586cbeca3845ed61bff40f560670e5b35=
baec57301d438148"
=20
 DEPENDS +=3D "i2c-tools"
=20
 S =3D "${WORKDIR}/i2c-tools-${PV}"
=20
-inherit distutils3
+inherit setuptools3
=20
-DISTUTILS_SETUP_PATH =3D "${S}/py-smbus"
+SETUPTOOLS_SETUP_PATH =3D "${S}/py-smbus"
--=20
2.25.1


