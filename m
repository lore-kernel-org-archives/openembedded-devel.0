Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wj0-f175.google.com (mail-wj0-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2D35971A32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 11:36:48 +0000 (UTC)
Received: by mail-wj0-f175.google.com with SMTP id tn15so100125616wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 03:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=39sjZW18n0b2VjJK7ZeKgniBlDr+F4bCCIFjNwDGo2s=;
	b=dx+Kxu5NNWFVLuXV8Svx93/mhZjF6EfQ26qyW7kPHGeHmhH9VubpQhHdOAnzb333cM
	sh/OSg1Kw/eZPkHfLT8rLu9DW8elo/fI58UdVrCT+uY+lsaSKCL0thKKob7u7J4a3ecl
	imD8Jp3kv/nXRXbAxVfinDhReqfG0giua7DBw3DyNDHQ7mIPau3y3iU+xWXHdPPM9mcD
	DzU6fZXpNDW5RZuBLEKwKctLNfdDnj0oogglfy4+r2SNU0Ctdx0xwseM7qMa2Tmknb4q
	iJE0vbWctdXHg85VERwnjvOAXCPymPvVFBDar0ynKuOSjUlJ0VkPTCKjn6J5Lm6KPgZ7
	hiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=39sjZW18n0b2VjJK7ZeKgniBlDr+F4bCCIFjNwDGo2s=;
	b=svaVbhRkPwe7HRWWDknZs3qwwJ3JlnzKt9PmDrKAD14AeqhvI0p3IZOUwhxZrq3rSh
	FnpmOZ4Z7et1Upppchd5mtp1NIkPhcON8fXRV4je3j0CAQrDUhgODjLGVwdsZMN0ZyfN
	qYvtYi7jNuizeVF1dOLJV7B05vSTfJWPM6buRKudSlBGZs7+FDWtlFJ3vrwLpwitVd8L
	GxFk7Gu4fZChiHY1G4UETs+H3K8dR6cI96vJRK+zp6Lyvlg13a1h9abP3V0ev5OtB7Ua
	pUeaZNDdE4hxz4xBr17onyQaSfwxX+rzugZVDO/6axx/TiwbGbjRTPZTS5knWr/jswHA
	0EsQ==
X-Gm-Message-State: AIkVDXJtBa6TNIhgZmjdNEpgNs8tO07oXomrGzZCQrZd45zz6T76kNPoogZm0WgY2rFkghm3
X-Received: by 10.194.57.206 with SMTP id k14mr5518844wjq.30.1484134608753;
	Wed, 11 Jan 2017 03:36:48 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	f76sm8581669wmd.15.2017.01.11.03.36.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jan 2017 03:36:47 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jan 2017 12:36:28 +0100
Message-Id: <1484134588-15143-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] nano: upgrade to 2.7.4
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
X-List-Received-Date: Wed, 11 Jan 2017 11:36:49 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../nano/nano-2.2.5/ncursesw.includedir.patch                | 12 ------------
 meta-oe/recipes-support/nano/nano.inc                        |  6 +++---
 meta-oe/recipes-support/nano/nano_2.2.5.bb                   |  8 --------
 meta-oe/recipes-support/nano/nano_2.7.4.bb                   |  6 ++++++
 4 files changed, 9 insertions(+), 23 deletions(-)
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
index 0f31c6c..8a9f1e8 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -12,8 +12,8 @@ INC_PR = "r3"
 
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
index 0000000..5016f2e
--- /dev/null
+++ b/meta-oe/recipes-support/nano/nano_2.7.4.bb
@@ -0,0 +1,6 @@
+include nano.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "c011c7f9e47cb1da27d4e7cc8b56ec6a"
+SRC_URI[sha256sum] = "752170643039e2c95a433de357f0c70a8c4c4c561a90a7e7259a63e225b659b9"
-- 
2.7.4


