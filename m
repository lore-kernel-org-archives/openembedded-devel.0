Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D9CC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 19:42:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12430.1646768554081816303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 11:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C10B91650
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Mar 2022 11:42:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6063FA45
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Mar 2022 11:42:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] poetry-core: clean up class
Date: Tue,  8 Mar 2022 19:42:28 +0000
Message-Id: <20220308194229.1260292-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 19:42:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95889

There's been a lot of work on this class so clean it up a bit.

Rationalise imports, python3-dir is already included in python3native.

Don't write a helper script in do_configure, just call the API in
do_compile.  In the long term this should be using pypa/build instead
of calling the API directly.

Stub out do_configure as the base configure isn't useful.

Write the wheel to PIP_INSTALL_DIST_PATH instead of hard-coding S/dist,
and clean it.

Use EXPORT_FUNCTIONS on the tasks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/classes/poetry_core.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classe=
s/poetry_core.bbclass
index 4b3f9631e2..fb37c78c78 100644
--- a/meta-python/classes/poetry_core.bbclass
+++ b/meta-python/classes/poetry_core.bbclass
@@ -1,15 +1,15 @@
-inherit pip_install_wheel python3native python3-dir setuptools3-base
+inherit pip_install_wheel python3native setuptools3-base
=20
-DEPENDS +=3D "python3 python3-poetry-core-native python3-pip-native"
+DEPENDS +=3D "python3-poetry-core-native"
=20
-do_configure () {
-    mkdir -p ${S}/dist
-    cat > ${S}/build-it.py << EOF
-from poetry.core.masonry import api
-api.build_wheel('${S}/dist')
-EOF
+poetry_core_do_configure () {
+    :
 }
=20
-do_compile () {
-    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/build=
-it.py
+# TODO: ideally this uses pypa/build
+poetry_core_do_compile () {
+    nativepython3 -c "from poetry.core.masonry import api; api.build_whe=
el('${PIP_INSTALL_DIST_PATH}')"
 }
+do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
+
+EXPORT_FUNCTIONS do_configure do_compile
--=20
2.25.1


