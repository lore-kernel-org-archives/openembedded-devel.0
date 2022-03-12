Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C07EC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 20:06:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8392.1647115573946617006
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 12:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAE2F106F
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 12:06:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98F0F3FA32
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 12:06:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] poetry_core: update for renamed class pip_install_wheel to
 python_pep517
Date: Sat, 12 Mar 2022 20:06:09 +0000
Message-Id: <20220312200609.382925-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 20:06:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95963

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/classes/poetry_core.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classe=
s/poetry_core.bbclass
index fb37c78c78..b2b80efa4f 100644
--- a/meta-python/classes/poetry_core.bbclass
+++ b/meta-python/classes/poetry_core.bbclass
@@ -1,4 +1,4 @@
-inherit pip_install_wheel python3native setuptools3-base
+inherit python_pep517 python3native setuptools3-base
=20
 DEPENDS +=3D "python3-poetry-core-native"
=20
@@ -8,8 +8,8 @@ poetry_core_do_configure () {
=20
 # TODO: ideally this uses pypa/build
 poetry_core_do_compile () {
-    nativepython3 -c "from poetry.core.masonry import api; api.build_whe=
el('${PIP_INSTALL_DIST_PATH}')"
+    nativepython3 -c "from poetry.core.masonry import api; api.build_whe=
el('${PEP517_WHEEL_PATH}')"
 }
-do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
+do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
 EXPORT_FUNCTIONS do_configure do_compile
--=20
2.25.1


