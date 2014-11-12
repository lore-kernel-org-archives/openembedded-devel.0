Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id CE86F65D4F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 17:04:42 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so5600790wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 09:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=dypG9sWim3x0bcKEYiA/8zo224ylbSE+dcRg9HZn/Vs=;
	b=pISGMe93IRW9ELB8wMEm+pXfX+O7sJ2LDIhC4hcQloffoLCgm4pyBNGqdKhQZbseVV
	GZy8VJcpkBq8y+ORWzn3ZMh2uB4jsbGK9LcIbVPkloXcgSAIB8LC3QrBCKWD4c6ZSRjg
	hlTpfAW3nwaS/UpjlvcAuJYrBG7THEZzZ1W8GaxosHO5IQS9Fp3Mt3Mq2fvdqI/JPZ7m
	CDTB5nks77Q280wbmjmgGo+77wvzGFQE5tIEPEdT69aNtF8BFAcye94BsHSFmg3PKSTl
	ASS3SUuyQovNpeXwS9plXWu4Vd6Gn4TO/AHG3Sem0kyrfI5KByFQqLhjr/wiQMx+Nre1
	rXiw==
X-Received: by 10.194.59.81 with SMTP id x17mr63831767wjq.91.1415811882269;
	Wed, 12 Nov 2014 09:04:42 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	bc1sm22334129wib.16.2014.11.12.09.04.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 09:04:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Nov 2014 18:04:31 +0100
Message-Id: <1415811872-4797-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gparted: initial add 0.20.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Nov 2014 17:04:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...c-use-pkg-config-to-check-for-version-of-.patch | 68 ++++++++++++++++++++++
 .../recipes-extended/gparted/gparted_0.20.0.bb     | 21 +++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch
 create mode 100644 meta-gnome/recipes-extended/gparted/gparted_0.20.0.bb

diff --git a/meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch b/meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch
new file mode 100644
index 0000000..1c99ff5
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch
@@ -0,0 +1,68 @@
+From a39d205ec3c6db6fe98aa2c7f8352db767557f60 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 12 Nov 2014 11:26:19 +0100
+Subject: [PATCH] configure.ac: use pkg-config to check for version of gparted
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+running test programs causes headaches when cross-compiling
+
+Upstream-Status: submitted [1]
+
+[1] https://bugzilla.gnome.org/show_bug.cgi?id=740004
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 34 ++++++----------------------------
+ 1 file changed, 6 insertions(+), 28 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 37025b0..17bb686 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,35 +48,13 @@ LIBPARTED_REQUIRED_VERSION='1.7.1'
+ AC_MSG_CHECKING([for libparted >= $LIBPARTED_REQUIRED_VERSION])
+ LIBPARTED_REQUIRED_INT=`echo "$LIBPARTED_REQUIRED_VERSION" |
+ 	$AWK -F. '{print $1 * 10000 + $2 * 100 + $3}'`
+-AC_RUN_IFELSE(
+-	[AC_LANG_SOURCE(
+-		[[
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <parted/parted.h>
+-
+-int main()
+-{
+-	const char *version = ped_get_version();
+-	if (version == NULL)
+-	{
+-		fprintf(stderr, "ERROR: ped_get_version() returned NULL\n");
+-		return EXIT_FAILURE;
+-	}
+-	printf("%s\n", version);
+-	return EXIT_SUCCESS;
+-}
+-		]]
+-	)],
+-	dnl Run test program again to cache libparted version.
+-	[LIBPARTED_FOUND_VERSION=`./conftest$EXEEXT`
+-	 LIBPARTED_FOUND_INT=`echo "$LIBPARTED_FOUND_VERSION" |
+-		$AWK -F. '{print $1 * 10000 + $2 * 100 + $3}'`
+-	 test "$LIBPARTED_FOUND_INT" -ge "$LIBPARTED_REQUIRED_INT" ||
++
++LIBPARTED_FOUND_VERSION="`pkg-config libparted --modversion`"
++LIBPARTED_FOUND_INT=`echo "$LIBPARTED_FOUND_VERSION" |
++	$AWK -F. '{print $1 * 10000 + $2 * 100 + $3}'`
++
++test "$LIBPARTED_FOUND_INT" -ge "$LIBPARTED_REQUIRED_INT" ||
+ 		AC_MSG_ERROR([*** libparted too old.  Require libparted >= $LIBPARTED_REQUIRED_VERSION but only found libparted $LIBPARTED_FOUND_VERSION.])
+-	],
+-	[AC_MSG_ERROR([*** Error querying libparted version.  Check config.log for details.])]
+-)
+ 
+ 
+ dnl Check for libparted >= 2.2 for improved informing the kernel to
+-- 
+1.8.3.1
+
diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.20.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.20.0.bb
new file mode 100644
index 0000000..30eac8e
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.20.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A partition editor to graphically manage disk partitions "
+HOMEPAGE = "http://gparted.org/index.php"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit autotools pkgconfig
+
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
+    file://0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch \
+"
+SRC_URI[md5sum] = "d9df57f9d4b4dbd148644774f8bbccfb"
+SRC_URI[sha256sum] = "9b34d73d4519352a7e7344c8403ef61253be1b4db3ff332c397b0b1eb5c1ddc2"
+
+DEPENDS = "glib-2.0 gtkmm parted"
+
+EXTRA_OECONF = "--disable-scrollkeeper --disable-doc"
+
+FILES_${PN} += "${datadir}/icons ${datadir}/appdata"
+
+RDEPENDS_${PN} = "dosfstools mtools e2fsprogs"
-- 
1.8.3.1


