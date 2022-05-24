Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1EAC4167D
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 12:12:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8524.1653394320136674747
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 05:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ADEA1FB;
	Tue, 24 May 2022 05:11:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDFDC3F66F;
	Tue, 24 May 2022 05:11:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/7] python3-editables: add new recipe
Date: Tue, 24 May 2022 13:11:49 +0100
Message-Id: <20220524121153.1175133-3-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97244

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../recipes-devtools/python/python3-editables_0.3.bb  | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-editables=
_0.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index 594a72f526..7836853cd5 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -106,6 +106,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-dominate \
     python3-dynamic-dispatch \
     python3-ecdsa \
+    python3-editables \
     python3-editor \
     python3-email-validator \
     python3-engineio \
diff --git a/meta-python/recipes-devtools/python/python3-editables_0.3.bb=
 b/meta-python/recipes-devtools/python/python3-editables_0.3.bb
new file mode 100644
index 0000000000..b42ff06872
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-editables_0.3.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "A Python library for creating editable wheels"
+HOMEPAGE =3D "https://github.com/pfmoore/editables"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D41bc1be47b7bb8240db3ef928=
c7cb0bf"
+
+SRC_URI[sha256sum] =3D "167524e377358ed1f1374e61c268f0d7a4bf7dbd046c656f=
7b410cde16161b1a"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


