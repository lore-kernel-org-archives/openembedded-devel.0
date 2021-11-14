Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539FCC433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 01:07:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.4264.1636852034464558062
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 17:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AktvfZK8;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u17so11390607plg.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 17:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=flBvKCGih6J/DuiKl0tUS9EHl0MCL+eRw2N45QFlHjc=;
        b=AktvfZK8rmpd3+B7sUFeCM/8S4dhO5mffkxXJVVFBUMbgkbK73Sl1nWIgYTo8grL/L
         sqI7ndSP1kKsQjqfHwpKDgOvKFGA+p+ecHFr8GvwjUlbMPW2aBXBAXBEA6M9Umz8UVck
         sblDvsfpekkR5xqaPhjW86kgQcFnK8g3QgpL0/VDJp1UcWiJZwzEuJZgIGxdX6IlKQkP
         Hz6/GAv9KaXFhx4qJVLcW/wdOZBVIH9Q0/yUB8ZDrdWntQM4PhiK4zL2etGvhSlMVPv4
         UgpyZ1QSsqk8XD0bAMyvMA1UpVvsizZzSxT9zhoeZjqYsyzpcvAJiGnhGjZKNM6PEIeU
         WlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=flBvKCGih6J/DuiKl0tUS9EHl0MCL+eRw2N45QFlHjc=;
        b=uB8WwJcTwMfAObyWcTzRG3sNHiTD/pCFFMdORPkb1JVW4aB7XVhBsA/DjjNAmZ42rp
         LDv3zQ48pXKmrqPbnyhpLO+Wg34Gj7QbEuJY/kAo7gw9FMJf/ef9aOVSqgN04z7n4hqL
         v4GRNBQpq6sB+Sh44M0b2+NaTyYag9/myn4bApejSruxI9ZV5wYJz2K81titckf7xKDX
         kOeTPIatmpa4w8J/Y09agGGVw8rhxGpWElmPFAk8sVLnK9IXTI4EuThV7V338hdP2Xh8
         hhfXlcm1sIYy3gXS8AaLye+PJo3vaQ67mb6eTOhvUAQf32/ZUJZuas5oDLvWt1uNLJjA
         3o7g==
X-Gm-Message-State: AOAM532r+2JROEpX2WLMiWu1Bi4wjE4jdIRO6/rPdqAjqnyENfEBWiBk
	pW9AiUpwL0zXv4K5Prbpx18Tq24roxdZ9Q==
X-Google-Smtp-Source: 
 ABdhPJzptnmHcH7mDJ7Ngmd1fwdLcK4QjQJUZgmGBchtTM/EQs0C+x3R8hgZM5cOqOeuFYTswDf3Lg==
X-Received: by 2002:a17:903:185:b0:141:f5f3:dae with SMTP id
 z5-20020a170903018500b00141f5f30daemr22079375plg.56.1636852033805;
        Sat, 13 Nov 2021 17:07:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 k20sm11130894pfc.83.2021.11.13.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 17:07:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] php: Build minilua for build host
Date: Sat, 13 Nov 2021 17:07:09 -0800
Message-Id: <20211114010709.2504225-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114010709.2504225-1-raj.khem@gmail.com>
References: <20211114010709.2504225-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Nov 2021 01:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93940

see https://bugs.php.net/bug.php?id=80717&edit=1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-opcache-jit-use-minilua-in-sysroot.patch | 29 -------------------
 ...10-Fix-opcache-jit-minilua-compiling.patch | 20 +++++++++++++
 meta-oe/recipes-devtools/php/php_8.0.12.bb    |  8 ++---
 3 files changed, 22 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/1010-Fix-opcache-jit-minilua-compiling.patch

diff --git a/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch b/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
deleted file mode 100644
index 2ba0f2b771..0000000000
--- a/meta-oe/recipes-devtools/php/php/0011-opcache-jit-use-minilua-in-sysroot.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From aaa6a81cfb20f9b3c25aa22e5a472c0f2867f72c Mon Sep 17 00:00:00 2001
-From: Claude Bing <cbing@cybernetics.com>
-Date: Tue, 9 Nov 2021 13:11:42 -0500
-Subject: [PATCH 11/11] opcache/jit: use minilua in sysroot
-
-Signed-off-by: Claude Bing <cbing@cybernetics.com>
----
- ext/opcache/jit/Makefile.frag | 7 ++-----
- 1 file changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/ext/opcache/jit/Makefile.frag b/ext/opcache/jit/Makefile.frag
-index b3af5b290a..f2e737e463 100644
---- a/ext/opcache/jit/Makefile.frag
-+++ b/ext/opcache/jit/Makefile.frag
-@@ -1,9 +1,6 @@
- 
--$(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
--	$(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
--
--$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
--	$(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
-+$(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua
-+	@minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
- 
- $(builddir)/jit/zend_jit.lo: \
- 	$(builddir)/jit/zend_jit_x86.c \
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/1010-Fix-opcache-jit-minilua-compiling.patch b/meta-oe/recipes-devtools/php/php/1010-Fix-opcache-jit-minilua-compiling.patch
new file mode 100644
index 0000000000..6f134fabb8
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/1010-Fix-opcache-jit-minilua-compiling.patch
@@ -0,0 +1,20 @@
+From 73ea1d44c1e6b063bfa02e12919ec8a9de3709d8 Mon Sep 17 00:00:00 2001
+From: Michael Heimpold <mhei@heimpold.de>
+Date: Wed, 3 Feb 2021 22:51:34 +0100
+Subject: [PATCH] Fix opcache jit minilua compiling
+
+Signed-off-by: Michael Heimpold <mhei@heimpold.de>
+---
+ ext/opcache/jit/Makefile.frag | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/ext/opcache/jit/Makefile.frag
++++ b/ext/opcache/jit/Makefile.frag
+@@ -1,6 +1,6 @@
+ 
+ $(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
+-	$(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
++	$(HOSTCC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
+ 
+ $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
+ 	$(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.0.12.bb
index 300499de5c..8d24c187ef 100644
--- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
+++ b/meta-oe/recipes-devtools/php/php_8.0.12.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
             file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
             file://0007-sapi-cli-config.m4-fix-build-directory.patch \
             file://0008-ext-imap-config.m4-fix-include-paths.patch \
-            file://0011-opcache-jit-use-minilua-in-sysroot.patch \
+            file://1010-Fix-opcache-jit-minilua-compiling.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
             file://70_mod_php${PHP_MAJOR_VERSION}.conf \
@@ -108,6 +108,7 @@ PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valg
 PACKAGECONFIG[mbregex] = "--enable-mbregex, --disable-mbregex, oniguruma"
 PACKAGECONFIG[mbstring] = "--enable-mbstring,,"
 
+export HOSTCC = "${BUILD_CC}"
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
@@ -258,13 +259,8 @@ RCONFLICTS:${PN}-modphp = "${MODPHP_OLDPACKAGE}"
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/php \
         PHP_PEAR_SYSCONF_DIR=${sysconfdir}/
-
-    if [ "$MACHINE_ARCH" == "x86" || "$MACHINE_ARCH" == "x86-64" ]; then
-        install -m 0755 ${WORKDIR}/build/ext/opcache/minilua ${D}${bindir}/
-    fi
 }
 
-
 # Fails to build with thumb-1 (qemuarm)
 # | {standard input}: Assembler messages:
 # | {standard input}:3719: Error: selected processor does not support Thumb mode `smull r0,r2,r9,r3'
-- 
2.33.1


