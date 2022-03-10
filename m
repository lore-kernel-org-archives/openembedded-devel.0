Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1082C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9347.1646918729541376458
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39A7F1691
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCEAB3FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:28 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/9] python3-twisted: remove empty PN-src and PN-dbg
Date: Thu, 10 Mar 2022 13:25:21 +0000
Message-Id: <20220310132523.2253188-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310132523.2253188-1-ross.burton@arm.com>
References: <20220310132523.2253188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95929

Nothing is packaged in these, there are no debug symbols and the sources
are packaged into the regular packages.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-twisted_22.2.0.bb                | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.b=
b b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index 2cf5ccc65d..5a000bc6a1 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -78,7 +78,6 @@ RDEPENDS:${PN}-web +=3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-words +=3D "${PN}-core"
 RDEPENDS:${PN}-flow +=3D "${PN}-core"
 RDEPENDS:${PN}-pair +=3D "${PN}-core"
-RDEPENDS:${PN}-dbg =3D "${PN}"
=20
 FILES:${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dist-i=
nfo/*"
=20
@@ -243,22 +242,10 @@ ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugi=
ns/twisted_pair.py* \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
 "
=20
-FILES:${PN}-dbg +=3D " \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
-${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
-"
-
 FILES:${PN}-doc +=3D " \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_pydoctortempla=
tes/ \
 "
=20
-RDEPENDS:${PN}-src =3D "${PN}"
-FILES:${PN}-src =3D " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
-"
-
 FILES:${PN}-core:append =3D " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc =
\
--=20
2.25.1


