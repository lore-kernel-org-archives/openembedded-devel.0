Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18CAD5D677
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:29:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.77936.1731000545907910695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78A17497
	for <openembedded-devel@lists.openembedded.org>; Thu,  7 Nov 2024 09:29:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 342B73F6A8
	for <openembedded-devel@lists.openembedded.org>; Thu,  7 Nov 2024 09:29:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python 2/7] python3-gevent: inherit cython class
Date: Thu,  7 Nov 2024 17:28:57 +0000
Message-Id: <20241107172902.4018835-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107172902.4018835-1-ross.burton@arm.com>
References: <20241107172902.4018835-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Nov 2024 17:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113751

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-gevent_24.2.1.bb      | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb=
 b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
index e44972178e..9f96b00953 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
@@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event=
 loop."
 HOMEPAGE =3D "http://www.gevent.org"
 LICENSE =3D "MIT & Python-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4de99aac27b470c29c6c309e0c279=
b65"
-DEPENDS +=3D "python3-greenlet-native python3-greenlet libev libuv pytho=
n3-cython-native python3-cffi-native"
+DEPENDS +=3D "python3-greenlet-native python3-greenlet libev libuv pytho=
n3-cffi-native"
=20
 RDEPENDS:${PN} =3D "python3-greenlet \
 		  python3-mime \
@@ -18,7 +18,7 @@ SRC_URI +=3D "file://0001-_setuputils.py-Do-not-add-sys=
_inc_dir.patch \
=20
 SRC_URI[sha256sum] =3D "432fc76f680acf7cf188c2ee0f5d3ab73b63c1f03114c7cd=
8a34cebbe5aa2056"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta cython
=20
 # Don't embed libraries, link to the system provided libs instead
 export GEVENTSETUP_EMBED_CARES =3D "0"
@@ -33,10 +33,6 @@ do_configure:append() {
 	rm -rf ${S}/src/gevent/*.c
 }
=20
-do_compile:append() {
-        sed -i -e 's#${WORKDIR}##g' ${S}/src/gevent/*.c ${S}/src/gevent/=
libev/*.c ${S}/src/gevent/resolver/*.c
-}
-
 # http://errors.yoctoproject.org/Errors/Details/766918/
 # src/gevent/queue.c:11894:83: error: passing argument 1 of '__pyx_vtabp=
tr_6gevent_14_gevent_cqueue_UnboundQueue->__pyx_base.put' from incompatib=
le pointer type [-Wincompatible-pointer-types]
 # src/gevent/queue.c:11894:114: error: passing argument 4 of '__pyx_vtab=
ptr_6gevent_14_gevent_cqueue_UnboundQueue->__pyx_base.put' from incompati=
ble pointer type [-Wincompatible-pointer-types]
--=20
2.34.1


