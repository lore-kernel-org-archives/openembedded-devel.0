Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4D6C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:14:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.294.1684948483221496607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 10:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0DF91042;
	Wed, 24 May 2023 10:15:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5117A3F6C4;
	Wed, 24 May 2023 10:14:42 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/6] python3-pydbus-manager: remove obsolete recipe
Date: Wed, 24 May 2023 18:14:33 +0100
Message-Id: <20230524171438.122588-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 17:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102785

From: Ross Burton <ross.burton@arm.com>

This project has been untouched upstream for six years and doesn't appear
to be considered "finished".

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 -
 .../python/python3-pydbus-manager_git.bb          | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydbus-ma=
nager_git.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index 4965e69e02..c78fd1e7f7 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -315,7 +315,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-pyconnman \
     python3-pycurl \
     python3-pydbus \
-    python3-pydbus-manager \
     python3-pydicti \
     python3-pyephem \
     python3-pyexpect \
diff --git a/meta-python/recipes-devtools/python/python3-pydbus-manager_g=
it.bb b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
deleted file mode 100644
index 796f7219ac..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "DBus.ObjectManager implementation for pydbus"
-AUTHOR =3D "S=C3=A9bastien Corne"
-
-LICENSE =3D "WTFPL"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fd5bb1dae91ba145745db55870be=
6a7"
-
-inherit setuptools3
-
-SRC_URI =3D "git://github.com/seebz/pydbus-manager.git;branch=3Dmaster;p=
rotocol=3Dhttps"
-SRCREV =3D "6b576b969cbda50521dca62a7df929167207f9fc"
-PV =3D "git${SRCPV}"
-
-S =3D "${WORKDIR}/git"
-
-RDEPENDS:${PN} +=3D "python3-pydbus"
--=20
2.34.1


