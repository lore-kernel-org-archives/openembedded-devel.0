Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A225971DED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 19:29:11 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r144so101599833wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 11:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OdIVhsIBvEKeO/TN4RpsHiP/SQUHmqR4bIoil2TUw44=;
	b=yUMiYOcaITnthsof7aXuF3fZ3mYB3ZphDT0nMEYQw+ZygcedZmisWZbUg2an2pWE+K
	XKBYsc2fH529Qx3q2XD6bVGLk+6eULmYje73Y3L3CB9gHPX9Qy9PYqr/AS8q4qC0H4Aq
	cS4kJSTVCKPuBJb0j0MNLCQrWBM0DJNzY7xEleYPMt1WI3smhvyv1uOtx8dFB5ODG0qb
	bw5hOtsS0tP7elYRPBoWMXYFPq8loVQtSFExJdblowzYlho2T0lmxwN1J8QG7HuXlgGU
	iRjYcnvIUtdLTdUw/m4kWeVJhb4JI4Es05hRyZuJSdyWck3xtGKWVMRnrHwycczyJcAZ
	TPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OdIVhsIBvEKeO/TN4RpsHiP/SQUHmqR4bIoil2TUw44=;
	b=oVCqEltaLaFpgJJ+TDduDwyeWrywL2wQy430zet/LQyuVynecbYgdGUjk2tpcAZrzi
	/bfia6TtQ/VK2z+ruFW41mqISmOe9BiS4RwvmFYHEOnbhH55zvhECJ5rBQDikBVeOw14
	tPUjY0/Nbi5Q+qYpm1OIFrjbYfMIjawkD8J4k9+vbtn+iboxBsb9SWxu0B9u203KsTEI
	wDl4cFryTuX6sdki3asoHZfKBHR1ovf60uS7WrvdUC0Z2g3RZpcimuUhIsYvEJAytUZg
	q7yIL01gj0VAcO/TUKaJn1H9qeWFsxWbR58CYne/LuByutQ39jeznoHIqDgn4c9tjz9k
	Zjxg==
X-Gm-Message-State: AIkVDXJ9UysXldgCGg4Lc0hROqWZrM5sg6bjvJVuZvnwcogY+HGfqPRJk+g1MTa8NPHYJJIn
X-Received: by 10.28.153.196 with SMTP id b187mr27547wme.53.1485458951823;
	Thu, 26 Jan 2017 11:29:11 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	m29sm4047302wrm.38.2017.01.26.11.29.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 11:29:11 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jan 2017 20:28:16 +0100
Message-Id: <1485458896-9302-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2] nano: upgrade to 2.7.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2017 19:29:12 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../nano/nano-2.2.5/ncursesw.includedir.patch                | 12 ------------
 meta-oe/recipes-support/nano/nano.inc                        | 10 ++++------
 meta-oe/recipes-support/nano/nano_2.2.5.bb                   |  8 --------
 meta-oe/recipes-support/nano/nano_2.7.4.bb                   |  4 ++++
 4 files changed, 8 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
 delete mode 100644 meta-oe/recipes-support/nano/nano_2.2.5.bb
 create mode 100644 meta-oe/recipes-support/nano/nano_2.7.4.bb

diff --git a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch b/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
deleted file mode 100644
index 0f224be..0000000
--- a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr nano-2.2.5.orig//configure.ac nano-2.2.5/configure.ac
---- nano-2.2.5.orig//configure.ac	2010-08-06 03:00:51.000000000 +0200
-+++ nano-2.2.5/configure.ac	2010-08-10 14:11:52.000000000 +0200
-@@ -442,7 +442,7 @@
-     AC_CHECK_HEADERS(ncurses.h)
- 
-     if test x$enable_utf8 != xno; then
--	AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB="-lncursesw" CPPFLAGS="-I/usr/include/ncursesw $CPPFLAGS" CURSES_LIB_NAME=ncursesw CURSES_LIB_WIDE=yes])
-+	AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB="-lncursesw" CURSES_LIB_NAME=ncursesw CURSES_LIB_WIDE=yes])
-     fi
- 
-     if eval "test x$CURSES_LIB_NAME = x"; then
diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index 0f31c6c..8a1d71f 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -5,15 +5,13 @@ HOMEPAGE = "http://www.nano-editor.org/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SECTION = "console/utils"
-DEPENDS = "ncurses"
+DEPENDS = "ncurses file"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-INC_PR = "r3"
-
 PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
+SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
-PACKAGECONFIG[tiny] = "--enable-tiny,--enable-all,"
+PACKAGECONFIG[tiny] = "--enable-tiny,"
diff --git a/meta-oe/recipes-support/nano/nano_2.2.5.bb b/meta-oe/recipes-support/nano/nano_2.2.5.bb
deleted file mode 100644
index e656f46..0000000
--- a/meta-oe/recipes-support/nano/nano_2.2.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-include nano.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://ncursesw.includedir.patch"
-
-SRC_URI[md5sum] = "77a10a49589f975ce98350a4527a2ebf"
-SRC_URI[sha256sum] = "9015945d1badabbada203b37c4779d3dd1066234235c714deb439989c5cd7d9e"
diff --git a/meta-oe/recipes-support/nano/nano_2.7.4.bb b/meta-oe/recipes-support/nano/nano_2.7.4.bb
new file mode 100644
index 0000000..eaf393e
--- /dev/null
+++ b/meta-oe/recipes-support/nano/nano_2.7.4.bb
@@ -0,0 +1,4 @@
+include nano.inc
+
+SRC_URI[md5sum] = "c011c7f9e47cb1da27d4e7cc8b56ec6a"
+SRC_URI[sha256sum] = "752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7259a63e225b659b9"
-- 
2.7.4


