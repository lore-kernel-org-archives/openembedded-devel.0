Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B343AC433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:49:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13698.1639414193744982948
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69BFB139F
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:49:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1552C3F73B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:49:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] srecord: properly initialize libtool
Date: Mon, 13 Dec 2021 16:49:49 +0000
Message-Id: <20211213164949.267531-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213164949.267531-1-ross.burton@arm.com>
References: <20211213164949.267531-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 16:49:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94340

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../srecord/files/libtool.patch               | 67 +++++++++++++++++++
 .../recipes-support/srecord/srecord_1.64.bb   |  7 ++
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-support/srecord/files/libtool.patch

diff --git a/meta-oe/recipes-support/srecord/files/libtool.patch b/meta-o=
e/recipes-support/srecord/files/libtool.patch
new file mode 100644
index 0000000000..95063cea59
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/files/libtool.patch
@@ -0,0 +1,67 @@
+Instead of just looking for a libtool binary, actually configure libtool=
.
+
+As the build doesn't use automake we need to manually set top_builddir i=
n the Makefile.
+
+Upstream-Status: Inactive-Upstream [2014]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index a2b5494..aa0b8ca 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -36,6 +36,7 @@
+ #
+ srcdir =3D @srcdir@
+ VPATH =3D @srcdir@
++top_builddir =3D @srcdir@
+
+ #
+ # the name of the install program to use
+diff --git a/etc/configure.ac b/etc/configure.ac
+index e444543..b137443 100644
+--- a/etc/configure.ac
++++ b/etc/configure.ac
+@@ -161,42 +161,7 @@ AS_IF([test "x$with_gcrypt" !=3D xno], AC_GCRYPT_SE=
TUP())
+ dnl!
+ dnl!  Now look for libtool.
+ dnl!
+-AC_CHECK_PROGS(LIBTOOL, libtool)
+-if test -z "$LIBTOOL"
+-then
+-  AC_MSG_RESULT([
+-        You must have GNU Libtool installed to build srecord.
+-        Homepage: http://www.gnu.org/software/libtool/])
+-  OK=3Dno
+-  if apt-get --version > /dev/null 2> /dev/null; then
+-    AC_MSG_RESULT([
+-        The following command may be used to install it:
+-        sudo apt-get install libtool
+-    ])
+-    OK=3Dyes
+-  fi
+-  if yum --version > /dev/null 2> /dev/null; then
+-    AC_MSG_RESULT([
+-        The following command may be used to install it:
+-        sudo yum install libtool
+-    ])
+-    OK=3Dyes
+-  fi
+-  if pkg_info -a > /dev/null 2> /dev/null; then
+-    AC_MSG_RESULT([
+-        The following command may be used to install it:
+-        sudo pkg_add -r libtool
+-    ])
+-    OK=3Dyes
+-  fi
+-  if test "$OK" !=3D "yes"; then
+-    AC_MSG_RESULT([
+-        If you are using a package based install, you will need the
+-        libtool package.
+-    ])
+-  fi
+-  exit 1
+-fi
++LT_INIT
+
+ dnl
+ dnl     If the soelim program exists, and understands the -I option,
diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/re=
cipes-support/srecord/srecord_1.64.bb
index 3ad2d72777..6f9418b718 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.64.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8dfcbf2f0a144b=
97f0931b6394debea7"
 SRC_URI =3D " \
     http://srecord.sourceforge.net/srecord-${PV}.tar.gz \
     file://add-option-to-remove-docs.patch \
+    file://libtool.patch \
 "
=20
 SRC_URI[md5sum] =3D "4de4a7497472d7972645c2af91313769"
@@ -17,6 +18,12 @@ DEPENDS =3D "boost groff-native"
=20
 inherit autotools-brokensep
=20
+do_configure:prepend() {
+    # To autoreconf we need the script in ${S}, we can't tell autotools =
to use
+    # etc/ because then it can't find the Makefile.in
+    ln -s ${S}/etc/configure.ac ${S}
+}
+
 PACKAGECONFIG ??=3D "gcrypt"
 PACKAGECONFIG[gcrypt] =3D "--with-gcrypt,--without-gcrypt,libgcrypt"
=20
--=20
2.25.1


