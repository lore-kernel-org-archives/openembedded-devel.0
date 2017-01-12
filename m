Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wj0-f175.google.com (mail-wj0-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 712DF719B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 09:19:51 +0000 (UTC)
Received: by mail-wj0-f175.google.com with SMTP id ew7so7612076wjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 01:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8YHWgkA0GIHSk0WreiSaJPd8CvDX/2JjAqMdArBNVfQ=;
	b=vYOKv6ZV4Yex5tY7PxyZvp2ndDxhNTbpKM7bKxy6p6g92jLBPCdJTpes13ohiQg43L
	aF1xDOrQcDcfk9KNQ6IcScP02umwDSu4yJwlvSS6E/rtjSdhzRavCho3MmuIW/PHJE1u
	/TADqzBg7fewyrgm8oI7lQUysWjJqXGc1NrjsrUiIaGfA4be9mm9+t6X9V7BByfNmyuR
	INpW+ptaJLf6ARqn/T+C64RozUD/4c/Pz+/Xu65jS/Ov7FZ2+Kdbz2IObs6tbrgM1BGj
	MTcobZHSNzxb2TRSGxnsn8HvZ5YzHLgPYdUrkGiBwlVtBtVPiAsOCAKFZUraLZhHUz/q
	GYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8YHWgkA0GIHSk0WreiSaJPd8CvDX/2JjAqMdArBNVfQ=;
	b=sI/pKT3Mrv7NQFBTojTwqVBlT2//xDNa4cmKpqw8v8MqyodKAtwSZFRGmxRFvyJ79s
	Bo6u9H1PlfiirEnAsgTJkbN4by3XEzj5K1jD+acCR7l/H0NzwHpa7ddGcJ2GeSq7OMTV
	/1EAC3msnDW913hgW3dbMNmbjiFq1/JTIwS+sy+qL6Ov6CpNldDbVLlk6xEQXthuoCN8
	xcvoJDOL33R8aIUOcGD8LeoEL3GY7fN5pqeEJ/aP9G6w5iv+Am8QzkJlQFo9pc5nSqIV
	dvj1470iXDoJWaI8BasM456UhfO2TIebXjufqPqyVjc2BiCZ3USFTKaW+ME7/1GHyWgu
	XKOg==
X-Gm-Message-State: AIkVDXJFlgd3S2Pm/bSS6+PYRraQLw27WUK79AHjgeRK9UCCUaSqXeDdPalLrTvW14fJZKd0
X-Received: by 10.194.246.69 with SMTP id xu5mr7983845wjc.85.1484212791057;
	Thu, 12 Jan 2017 01:19:51 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	f67sm2118835wmd.13.2017.01.12.01.19.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Jan 2017 01:19:50 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2017 10:19:47 +0100
Message-Id: <1484212787-20341-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
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
X-List-Received-Date: Thu, 12 Jan 2017 09:19:53 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../nano/nano-2.2.5/ncursesw.includedir.patch                | 12 ------------
 meta-oe/recipes-support/nano/nano.inc                        |  8 +++-----
 meta-oe/recipes-support/nano/nano_2.2.5.bb                   |  8 --------
 meta-oe/recipes-support/nano/nano_2.7.4.bb                   |  4 ++++
 4 files changed, 7 insertions(+), 25 deletions(-)
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
index 0f31c6c..e17b16e 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -8,12 +8,10 @@ SECTION = "console/utils"
 DEPENDS = "ncurses"
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


