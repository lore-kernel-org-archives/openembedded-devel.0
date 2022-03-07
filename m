Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3312EC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:17:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.25753.1646655460583777275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 04:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC6AE1042
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 04:17:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 976B13F73D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 04:17:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] python3-meh: use setuptools_legacy
Date: Mon,  7 Mar 2022 12:17:35 +0000
Message-Id: <20220307121735.1850958-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307121735.1850958-1-ross.burton@arm.com>
References: <20220307121735.1850958-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 12:17:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95850

This setup.py installs data_files with absolute paths, which isn't
supported by bdist_wheel.  Use setuptools_legacy as the legacy install
task needs to be used.

Also update patch status on the setuptools port.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python-meh/python3-meh_0.50.1.bb                 | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.b=
b b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
index 9f72b72623..1d9af438da 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE =3D "https://github.com/rhinstaller/python-meh"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-inherit setuptools3
+inherit setuptools3_legacy
=20
 S =3D "${WORKDIR}/git"
=20
@@ -14,12 +14,4 @@ SRC_URI =3D "git://github.com/rhinstaller/python-meh.g=
it;protocol=3Dhttps;branch=3Drhe
           "
 SRCREV =3D "c321ce22950aff76611a3c6beffa02b5ea3adbed"
=20
-PIP_INSTALL_PACKAGE =3D "python_meh"
-
-do_install:append () {
-    install -d ${D}/${datadir}/python-meh
-    mv ${D}${PYTHON_SITEPACKAGES_DIR}${datadir}/python-meh/* ${D}/${data=
dir}/python-meh/
-}
-
-FILES:${PN} +=3D "${datadir}/*"
-
+FILES:${PN} +=3D "${datadir}/python-meh"
--=20
2.25.1


