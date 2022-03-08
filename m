Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1044FC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 19:42:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12747.1646768554683907774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 11:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52BE01655
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Mar 2022 11:42:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2DB63FA45
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Mar 2022 11:42:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] python3-poetry-core: self-bootstrap
Date: Tue,  8 Mar 2022 19:42:29 +0000
Message-Id: <20220308194229.1260292-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308194229.1260292-1-ross.burton@arm.com>
References: <20220308194229.1260292-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 19:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95890

Poetry can bootstrap itself, so just inherit poetry_core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-poetry-core_1.0.8.bb           | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.=
8.bb b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
index 8ac9ed2be3..99ec763c4d 100644
--- a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
@@ -21,7 +21,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D104d5c3c653a=
eededf4076773aa4c236 \
=20
 SRC_URI[sha256sum] =3D "951fc7c1f8d710a94cb49019ee3742125039fc659675912e=
a614ac2aa405b118"
=20
-inherit pip_install_wheel python3native python3-dir pypi setuptools3-bas=
e
+inherit poetry_core pypi
+
 PIP_INSTALL_PACKAGE =3D "poetry_core"
=20
 RDEPENDS:${PN}:append:class-target =3D "\
@@ -42,16 +43,4 @@ RDEPENDS:${PN} +=3D "\
     python3-six \
 "
=20
-do_configure () {
-    mkdir -p ${B}/dist
-    cat > ${B}/build-it.py << EOF
-from poetry.core.masonry import api
-api.build_wheel('${B}/dist')
-EOF=20
-}
-
-do_compile () {
-    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${B}/build=
-it.py
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


