Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17C2CDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:32:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.215068.1697549547882707960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6E551007;
	Tue, 17 Oct 2023 06:33:07 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C954C3F5A1;
	Tue, 17 Oct 2023 06:32:26 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: diego.sueiro@arm.com,
	rahul.singh@arm.com
Subject: [PATCH 1/2] linuxptp: Drop unneeded downstream patches
Date: Tue, 17 Oct 2023 14:32:13 +0100
Message-Id: <20231017133214.1562048-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017133214.1562048-1-luca.fancellu@arm.com>
References: <20231017133214.1562048-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 13:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105553

Drop Use-cross-cpp-in-incdefs.patch which is "Inappropriate"
but can removed just by passing CROSS_COMPILE=3D'${TARGET_PREFIX}'
into EXTRA_OEMAKE.

Drop build-Allow-CC-and-prefix-to-be-overriden.patch that can
be removed by passing CC=3D'${CC}' in EXTRA_OEMAKE and, as already
the case, passing prefix=3D${prefix} in the oe_runmake command line.

While there, drop ARCH from EXTRA_OEMAKE because it's not used in
the codebase.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../linuxptp/Use-cross-cpp-in-incdefs.patch   | 28 ---------------
 ...-Allow-CC-and-prefix-to-be-overriden.patch | 35 -------------------
 .../linuxptp/linuxptp_4.1.bb                  |  5 ++-
 3 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cr=
oss-cpp-in-incdefs.patch
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/build-=
Allow-CC-and-prefix-to-be-overriden.patch

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp=
-in-incdefs.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cr=
oss-cpp-in-incdefs.patch
deleted file mode 100644
index 9c87851e48ef..000000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-inc=
defs.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From be8808005772da48c052cf34a343a6d140541f6a Mon Sep 17 00:00:00 2001
-From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
-Date: Fri, 23 Dec 2016 18:12:29 +0100
-Subject: [PATCH] linuxptp: Use cross cpp in incdefs
-
-Use cross cpp incdefs.sh shell script since we are doing cross compiling
-we need to ensure we use correct setttings from toolchain
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- incdefs.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/incdefs.sh b/incdefs.sh
-index a9e94f7..dd1692f 100755
---- a/incdefs.sh
-+++ b/incdefs.sh
-@@ -27,7 +27,7 @@ user_flags()
- 	printf " -D_GNU_SOURCE"
-=20
- 	# Get list of directories searched for header files.
--	dirs=3D$(echo "" | ${CROSS_COMPILE}cpp -Wp,-v 2>&1 >/dev/null | grep ^=
" /")
-+	dirs=3D$(${CPP} -Wp,-v -xc /dev/null 2>&1 >/dev/null | grep ^" /")
-=20
- 	# Look for clock_adjtime().
- 	for d in $dirs; do
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-C=
C-and-prefix-to-be-overriden.patch b/meta-oe/recipes-connectivity/linuxpt=
p/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
deleted file mode 100644
index d4d6fac0ee5c..000000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-p=
refix-to-be-overriden.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 886bca11ff8fcc55386b6e4397b13e64950f93fb Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Tue, 1 Jul 2014 17:37:31 -0300
-Subject: [PATCH] build: Allow CC and prefix to be overriden
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
----
- makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/makefile b/makefile
-index 3e3b8b3..5c1a1f9 100644
---- a/makefile
-+++ b/makefile
-@@ -18,7 +18,7 @@
- KBUILD_OUTPUT ?=3D
-=20
- DEBUG	=3D
--CC	=3D $(CROSS_COMPILE)gcc
-+CC	?=3D $(CROSS_COMPILE)gcc
- VER     =3D -DVER=3D$(version)
- CFLAGS	=3D -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)
- LDLIBS	=3D -lm -lrt -pthread $(EXTRA_LDFLAGS)
-@@ -43,7 +43,7 @@ incdefs :=3D $(shell $(srcdir)/incdefs.sh)
- version :=3D $(shell $(srcdir)/version.sh $(srcdir))
- VPATH	=3D $(srcdir)
-=20
--prefix	=3D /usr/local
-+prefix	?=3D /usr/local
- sbindir	=3D $(prefix)/sbin
- mandir	=3D $(prefix)/man
- man8dir	=3D $(mandir)/man8
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta=
-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
index 95ed76e621e6..d362eaa004a0 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 LINUXPTP_SRC_URI =3D "http://sourceforge.net/projects/linuxptp"
=20
 SRC_URI =3D "${LINUXPTP_SRC_URI}/files/v4.1/linuxptp-${PV}.tgz \
-           file://build-Allow-CC-and-prefix-to-be-overriden.patch \
-           file://Use-cross-cpp-in-incdefs.patch \
            file://0001-include-string.h-for-strncpy.patch \
            file://systemd/phc2sys@.service \
            file://systemd/ptp4l@.service \
@@ -23,7 +21,8 @@ inherit systemd
 UPSTREAM_CHECK_URI =3D "${LINUXPTP_SRC_URI}/files/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
=20
-EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} EXTRA_CFLAGS=3D'${CFLAGS}' mandi=
r=3D${mandir}"
+EXTRA_OEMAKE =3D "CC=3D'${CC}' CROSS_COMPILE=3D'${TARGET_PREFIX}' \
+    EXTRA_CFLAGS=3D'${CFLAGS}' mandir=3D'${mandir}'"
=20
 export KBUILD_OUTPUT=3D"${RECIPE_SYSROOT}"
=20
--=20
2.34.1


