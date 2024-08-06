Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB3CC52D76
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 16:39:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11940.1722962367372895918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 09:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF30EFEC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B56553F766
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 09:39:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python 4/7] python3-pytest-runner: add from openembedded-core
Date: Tue,  6 Aug 2024 17:39:15 +0100
Message-Id: <20240806163918.2186435-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806163918.2186435-1-ross.burton@arm.com>
References: <20240806163918.2186435-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 16:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111589

This recipe is being removed from oe-core, so add to meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-pytest-runner_6.0.1.bb         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-ru=
nner_6.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_6.=
0.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.=
bb
new file mode 100644
index 0000000000..e5e5e048bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Invoke py.test as distutils command with dependency resolut=
ion"
+HOMEPAGE =3D "https://pypi.org/project/pytest-runner/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7a7126e068206290f3fe9f8d6c713=
ea6"
+
+SRC_URI[sha256sum] =3D "70d4739585a7008f37bf4933c013fdb327b8878a5a69fcbb=
3316c88882f0f49b"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS +=3D " \
+    python3-setuptools-scm-native"
+
+RDEPENDS:${PN} =3D "python3-setuptools python3-debugger python3-json pyt=
hon3-io"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


