Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E94C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:25:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9118.1646918727396518782
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FEDE1691
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3E273FA27
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:25:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/9] python3-pyzmq: clean up recipe
Date: Thu, 10 Mar 2022 13:25:19 +0000
Message-Id: <20220310132523.2253188-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310132523.2253188-1-ross.burton@arm.com>
References: <20220310132523.2253188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 13:25:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95927

Put the patch into a directory named after PN to avoid needing to set
FILESEXTRAPATHS.

Remove explicit FILES:${PN}-dbg, as these are packaged automatically.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{python-pyzmq =3D> python3-pyzmq}/club-rpath-out.patch      | 0
 meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb   | 4 ----
 2 files changed, 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyzmq =3D> python3-py=
zmq}/club-rpath-out.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-=
out.patch b/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-=
out.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyzmq/club-rpath-o=
ut.patch
rename to meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-ou=
t.patch
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb =
b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
index 09e7341877..d2893ccbb1 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.BSD;md5=3D11c65680f6=
37c3df7f58bbc8d133e96e \
                     file://COPYING.LESSER;md5=3D12c592fa0bcfff3fb0977b06=
6e9cb69e"
 DEPENDS =3D "zeromq"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/python-pyzmq:"
-
 SRC_URI +=3D "file://club-rpath-out.patch"
 SRC_URI[sha256sum] =3D "8eddc033e716f8c91c6a2112f0a8ebc5e00532b4a6ae1eb0=
ccc48e027f9c671c"
=20
@@ -17,8 +15,6 @@ RDEPENDS:${PN} +=3D " \
 	${PYTHON_PN}-json \
 "
=20
-FILES:${PN}-dbg =3D+ "${PYTHON_SITEPACKAGES_DIR}/zmq/backend/cython/.deb=
ug"
-
 do_compile:prepend() {
     echo [global] > ${S}/setup.cfg
     echo zmq_prefix =3D ${STAGING_DIR_HOST} >> ${S}/setup.cfg
--=20
2.25.1


