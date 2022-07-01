Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60D0CCA479
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:36:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.37290.1656675363982247296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9B16113E;
	Fri,  1 Jul 2022 04:36:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED68E3F66F;
	Fri,  1 Jul 2022 04:36:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] python3-editables: remove (now in oe-core)
Date: Fri,  1 Jul 2022 12:35:59 +0100
Message-Id: <20220701113559.290350-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701113559.290350-1-ross.burton@arm.com>
References: <20220701113559.290350-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 11:36:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97662

As of 781da720 this is now in oe-core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-editables_0.3.bb  | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-editables=
_0.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-editables_0.3.bb=
 b/meta-python/recipes-devtools/python/python3-editables_0.3.bb
deleted file mode 100644
index b42ff06872..0000000000
--- a/meta-python/recipes-devtools/python/python3-editables_0.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY =3D "A Python library for creating editable wheels"
-HOMEPAGE =3D "https://github.com/pfmoore/editables"
-SECTION =3D "devel/python"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D41bc1be47b7bb8240db3ef928=
c7cb0bf"
-
-SRC_URI[sha256sum] =3D "167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f=
7b410cde16161b1a"
-
-inherit pypi python_setuptools_build_meta
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


