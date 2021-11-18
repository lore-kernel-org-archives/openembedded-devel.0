Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9F8C43217
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3702.1637251904514145144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 919631042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B5043F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/19] python3-gevent: use system libraries instead of
 embedding
Date: Thu, 18 Nov 2021 16:11:33 +0000
Message-Id: <20211118161138.663375-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94039

gevent by default will build its own c-ares and libuv, but that build
needs patches and embedded libraries are bad form.

DEPEND on the recipes instead, and turn off embedding.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python-gevent/libev-conf.patch     | 26 -------------------
 .../python/python3-gevent_21.8.0.bb           | 22 ++++++----------
 2 files changed, 8 insertions(+), 40 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent/lib=
ev-conf.patch

diff --git a/meta-python/recipes-devtools/python/python-gevent/libev-conf=
.patch b/meta-python/recipes-devtools/python/python-gevent/libev-conf.pat=
ch
deleted file mode 100644
index 79c1867ba7..0000000000
--- a/meta-python/recipes-devtools/python/python-gevent/libev-conf.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2294734ef9d5e2efb05820e9759a1635799bdea9 Mon Sep 17 00:00:00 2001
-From: Andrej Rode <andrej.rode@ettus.com>
-Date: Mon, 10 Apr 2017 19:25:18 -0700
-Subject: [PATCH] libev: make configure crosscompile compatible
-
-Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
----
- deps/libev/configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/libev/configure b/deps/libev/configure
-index 743817e..96c2366 100755
---- a/deps/libev/configure
-+++ b/deps/libev/configure
-@@ -2208,7 +2208,7 @@ fi
- ac_ext=3Dc
- ac_cpp=3D'$CPP $CPPFLAGS'
- ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
--ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftes=
t.$ac_ext $LIBS >&5'
-+ac_link=3D'$CC -static -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS=
 conftest.$ac_ext $LIBS >&5'
- ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
-=20
-=20
---=20
-2.10.2
-
diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb=
 b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
index 74ae6cf69d..8fb6e18504 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
@@ -7,27 +7,21 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4de99aac27b4=
70c29c6c309e0c279b65 \
                     file://NOTICE;md5=3D18108df3583462cafd457f024b9b09b5=
 \
                     file://deps/libev/LICENSE;md5=3Dd6ad416afd040c90698e=
dcdf1cbee347 \
                     "
-DEPENDS +=3D "libevent"
-DEPENDS +=3D "${PYTHON_PN}-greenlet"
+DEPENDS +=3D "${PYTHON_PN}-greenlet libev c-ares"
+
 RDEPENDS:${PN} =3D "${PYTHON_PN}-greenlet \
 		  ${PYTHON_PN}-mime \
 		  ${PYTHON_PN}-pprint \
 		 "
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/python-gevent:"
+SRC_URI[sha256sum] =3D "43e93e1a4738c922a2416baf33f0afb0a20b22d3dba88672=
0bc037cd02a98575"
=20
-SRC_URI:append =3D " \
-    file://libev-conf.patch;patch=3D1;pnum=3D1 \
-"
+inherit pypi setuptools3
=20
-SRC_URI[sha256sum] =3D "43e93e1a4738c922a2416baf33f0afb0a20b22d3dba88672=
0bc037cd02a98575"
+# Don't embed libraries, link to the system instead
+export GEVENTSETUP_EMBED =3D "0"
=20
-# The python-gevent has no autoreconf ability
-# and the logic for detecting a cross compile is flawed
-# so always force a cross compile
+# Delete the embedded copies of libraries so we can't accidentally link =
to them
 do_configure:append() {
-	sed -i -e 's/^cross_compiling=3Dno/cross_compiling=3Dyes/' ${S}/deps/li=
bev/configure
-	sed -i -e 's/^cross_compiling=3Dno/cross_compiling=3Dyes/' ${S}/deps/c-=
ares/configure
+	rm -rf ${S}/deps
 }
-
-inherit pypi setuptools3
--=20
2.25.1


