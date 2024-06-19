Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E0DC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:23:02 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.16738.1718788974262493062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxrJD8ik;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f09eaf420so756244166b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718788972; x=1719393772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V8KFPJZ/HUHYgGuPk1S4QVIIZXUglYqRNockeQ/zURU=;
        b=hxrJD8ikexlt0UuZH014HybDlMJWJ1pWBnd3rIPmJbQQz5RMunFU8LBuse9qmNOJ6B
         9DHChpnkNkiT5bFMdcFjFKYu83pSavLqmG/Id/xzUGC22Icj1ZMLQvvVphSot5k/Tcn0
         64SOeEd5VHn0pSXVGombdKY8pYhV81Gqjyhh9hwbvlquaq69U9G3skDHh1h0hpXGth5O
         E5XvjQeWqqvpd4l432gpYdygGpNB7xo3gWK2qVjNyJxBYgbyBGkYPiMbXDObf+WjhK7p
         1kj8BfwgFcYgsp6EBrav7tkGN2/OUOT+rj5D8HYonah0uwas7vBrZe/UMimrkZc8ZclE
         Ln4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718788972; x=1719393772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8KFPJZ/HUHYgGuPk1S4QVIIZXUglYqRNockeQ/zURU=;
        b=gDKqBjYCp45CHZ60ARwRr+6ZNJA3WjoBmJ3b0VyGOhH2PDNMZYdsxGC/Tq8Kk0Ihvx
         Pj/qBXnKcqG/eazH730k2YEHBXaTO7qLZ9lf1XGvDWuSm1KN7uohvZ6/tnGI/67eTbuj
         LWkdL6Yesh7Zozrtf8o4tY/kpsfVYOLQLpn1Tgp1Q4UoNuXz63NeVh8RbXGUwTHmSxOb
         +QA7EF++dULKHeTfb5WEyjEe83+MpydWqtErAILgMT3el7DqaiifCLO1Er9prMHqLkMc
         fI1vuMiGMU6EM3290MEAOqYdm/RsbBQCCjm9M+1/MmCepqYHmmUyXe9L7GAyUTdgY9Xp
         qFUw==
X-Gm-Message-State: AOJu0Yz/OQ5XHH9tcp9VuVLP18WDOOlJQzSeMQBvw2oE6Jsh6yny/R+t
	tK5/98q6HRhb6f0SjtnNMPn2XTXU08OZcgbKES6gOBrQxSIDCRxIaOM4LQ==
X-Google-Smtp-Source: AGHT+IHbgV8IOEn+w2zyOpybjY8OU9pO17EkLDFLBIRt4OxlQ4UnBmb4fwFpoRl9TCc9hNTaif9ZpQ==
X-Received: by 2002:a17:906:fe4d:b0:a6f:4b7d:599b with SMTP id a640c23a62f3a-a6fab64869dmr144131766b.33.1718788972372;
        Wed, 19 Jun 2024 02:22:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750ad082sm16398708f8f.59.2024.06.19.02.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:22:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libnewt: add from oe-core
Date: Wed, 19 Jun 2024 11:22:48 +0200
Message-Id: <20240619092248.2800247-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 09:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110962

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-detect-gold-as-GNU-linker-too.patch  | 29 ++++++++++
 ...tinfo-library-to-the-linking-librari.patch | 26 +++++++++
 .../newt/files/cross_ar.patch                 | 56 +++++++++++++++++++
 .../recipes-extended/newt/libnewt_0.52.24.bb  | 56 +++++++++++++++++++
 4 files changed, 167 insertions(+)
 create mode 100644 meta-oe/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
 create mode 100644 meta-oe/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch
 create mode 100644 meta-oe/recipes-extended/newt/files/cross_ar.patch
 create mode 100644 meta-oe/recipes-extended/newt/libnewt_0.52.24.bb

diff --git a/meta-oe/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch b/meta-oe/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
new file mode 100644
index 000000000..090ed5c1c
--- /dev/null
+++ b/meta-oe/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
@@ -0,0 +1,29 @@
+From 08ba909500412611953aea0fa2fe0d8fe76b6e24 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 21 Sep 2016 21:14:40 +0200
+Subject: [PATCH] detect gold as GNU linker too
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 468c718..cd93f30 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,7 +28,7 @@ AC_CHECK_SIZEOF([void *])
+ AC_MSG_CHECKING([for GNU ld])
+ LD=$($CC -print-prog-name=ld 2>&5)
+ 
+-if test $($LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ld") = 0; then
++if test $($LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ") = 0; then
+   # Not
+   GNU_LD=""
+   AC_MSG_RESULT([no])
diff --git a/meta-oe/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch b/meta-oe/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch
new file mode 100644
index 000000000..bc55582fd
--- /dev/null
+++ b/meta-oe/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch
@@ -0,0 +1,26 @@
+From fad40cfc18a42946a9a9e440c3434cd6b847ff9d Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Mon, 18 Jan 2016 17:05:19 +0000
+Subject: [PATCH] Makefile.in: Add tinfo library to the linking libraries
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index a85d00f..98b85f9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -1,4 +1,4 @@
+-LIBS = -lslang @LIBS@
++LIBS = -lslang -ltinfo @LIBS@
+ LIBTCL = @TCL_LIB_FLAG@
+ 
+ CC = @CC@
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-extended/newt/files/cross_ar.patch b/meta-oe/recipes-extended/newt/files/cross_ar.patch
new file mode 100644
index 000000000..86cc0be1d
--- /dev/null
+++ b/meta-oe/recipes-extended/newt/files/cross_ar.patch
@@ -0,0 +1,56 @@
+Fix cross link using autoconf detected AR
+
+If building on 32bit host and creating 64bit libraries, the target
+package builds should not invoke the 32bit hosts's ar.  Specifically
+you will get an error message like:
+
+x86_64-linux-gcc    -m64 --sysroot=/opt/qemux86-64/tmp/sysroots/qemux86-64 -g -o test test.o libnewt.a -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lslang
+libnewt.a: could not read symbols: Archive has no index; run ranlib to add one
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in  | 3 ++-
+ configure.ac | 4 ++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+Index: newt-0.52.20/Makefile.in
+===================================================================
+--- newt-0.52.20.orig/Makefile.in
++++ newt-0.52.20/Makefile.in
+@@ -7,6 +7,7 @@ CFLAGS = @CFLAGS@
+ LDFLAGS = @LDFLAGS@
+ CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@
+ GNU_LD = @GNU_LD@
++AR = @AR@
+ 
+ VERSION = @VERSION@
+ TAG = r$(subst .,-,$(VERSION))
+@@ -109,7 +110,7 @@ whiptcl.$(SOEXT): $(WHIPTCLOBJS) $(LIBNE
+ 	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.$(SOEXT) $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
+ 
+ $(LIBNEWT): $(LIBOBJS)
+-	ar rv $@ $^
++	$(AR) rv $@ $^
+ 
+ newt.o $(SHAREDDIR)/newt.o: newt.c Makefile
+ 
+Index: newt-0.52.20/configure.ac
+===================================================================
+--- newt-0.52.20.orig/configure.ac
++++ newt-0.52.20/configure.ac
+@@ -15,6 +15,10 @@ AC_PROG_INSTALL
+ AC_PROG_LN_S
+ AC_PROG_GREP
+ AC_SYS_LARGEFILE
++AN_MAKEVAR([AR], [AC_PROG_AR])
++AN_PROGRAM([ar], [AC_PROG_AR])
++AC_DEFUN([AC_PROG_AR], [AC_CHECK_TOOL(AR, ar, :)])
++AC_PROG_AR
+ 
+ AC_CHECK_SIZEOF([long])
+ AC_CHECK_SIZEOF([long long])
diff --git a/meta-oe/recipes-extended/newt/libnewt_0.52.24.bb b/meta-oe/recipes-extended/newt/libnewt_0.52.24.bb
new file mode 100644
index 000000000..1e39a1c5c
--- /dev/null
+++ b/meta-oe/recipes-extended/newt/libnewt_0.52.24.bb
@@ -0,0 +1,56 @@
+SUMMARY = "A library for text mode user interfaces"
+
+DESCRIPTION = "Newt is a programming library for color text mode, widget based user \
+interfaces.  Newt can be used to add stacked windows, entry widgets, \
+checkboxes, radio buttons, labels, plain text fields, scrollbars, \
+etc., to text mode user interfaces.  This package also contains the \
+shared library needed by programs built with newt, as well as a \
+/usr/bin/dialog replacement called whiptail.  Newt is based on the \
+slang library."
+
+HOMEPAGE = "https://releases.pagure.org/newt/"
+SECTION = "libs"
+
+LICENSE = "LGPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+# slang needs to be >= 2.2
+DEPENDS = "slang popt python3"
+
+SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
+           file://cross_ar.patch \
+           file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
+           file://0001-detect-gold-as-GNU-linker-too.patch \
+           "
+
+SRC_URI[sha256sum] = "5ded7e221f85f642521c49b1826c8de19845aa372baf5d630a51774b544fbdbb"
+
+S = "${WORKDIR}/newt-${PV}"
+
+inherit autotools-brokensep python3native python3-dir python3targetconfig
+
+EXTRA_OECONF = "--without-tcl --with-python"
+
+EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
+
+CLEANBROKEN = "1"
+
+export CPPFLAGS
+
+PACKAGES:prepend = "whiptail ${PN}-python "
+
+RDEPENDS:${PN}-python += "python3-core"
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
+
+do_configure:prepend() {
+    sh autogen.sh
+}
+
+do_compile:prepend() {
+    # Make sure the recompile is OK
+    rm -f ${B}/.depend
+}
+
+FILES:whiptail = "${bindir}/whiptail"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


