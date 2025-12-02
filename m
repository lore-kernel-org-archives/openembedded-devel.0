Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB01CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 12:34:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6757.1764678835306348963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 04:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iF4RJkko;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47796a837c7so38766515e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 04:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764678834; x=1765283634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJF8m9Gz00Hjw1jToUI32zivRED89jXfKHbOCw8Osxc=;
        b=iF4RJkkoU2AgNV6eEbAdrtCkqsVFZYXcorupC7aWcFKgnvu67R5kh60a8vOtygDWpq
         uA4JGDVVJ1SA9OJ/enmBk2+HRdPaBrB46I7BNrEAIdb3Qe+o2+GlMtxhjd/GXUc4LX7Z
         VedKWAbc1sexksTMF9CXicgX0wsFgC2FvA4Zm6trv+0pJBrz4sYPyiuIPPtPraE1MB6O
         YhI7HP/zMkWyRqpLVEEC2RAtHPNiSHYi6PX3JKu24cstB5ll/Z7uNqCPihHDC7UfoY1A
         uAyRRoM4VMWe4AGLKWa+wG1R8nu24moDUUOEhzUb837hC2iL/B6bPLPLyYehL2BPC5Rh
         mBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678834; x=1765283634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJF8m9Gz00Hjw1jToUI32zivRED89jXfKHbOCw8Osxc=;
        b=DDP4qGZ2V7Jk0Eu7r73yl2Xr3XXsceyoEIIwfZeMJZmuQgOGETpQ12EfGZq9d+Pe/G
         Pn5niLsr3xriRrskuUfUbi3NNGCeXnmjXIaziuX8CL2lR1XxTvCqgQxokgy+xidBmb+w
         CIgCOYgneHtLFtmtZk244bRj45hOB3pOhxJtw8814O+1DZjGAzzeo7jDBsR2zB/ykF4+
         N3fh0QyC8dmUsQK+0SwSaEKBZ68qvuVPTGM3U+BK8aC4fJkv22ibsrhmqA3ON2bIk2GB
         w8sly+r/ImhbgQyg6scwFoOJ/TVb0Sys+xy80Y9ciMl/XsEhhGsy3De0wFw7KyI2ZzEh
         uejg==
X-Gm-Message-State: AOJu0YwSnd+nEQU7DgKkwPEqwOE+tgNPlQCPLxQa4oj+XIDU5JqwfZwS
	pk+KQ3CWAa1qGoKMW7vHHeB5kUyOiyDVR+9pEBoMZUQvossQXTT1990F1f/NLw==
X-Gm-Gg: ASbGncu65A45b5/fdQRs0VckkzIwAk7TBd9Cy0VZhK5xFNsC7YfvgtA2u22XmMhpV4L
	cM2SewrV4djbMdYIF+gy15NEx/lHnNz546UvT7bhBYGGNZNhOUJu98Y9ZB+RUKC5JkdtED1/u8j
	j9XEUWZe7PvHRC1roISyxXm0oYFpwYnCmMHgiZMXa8OyRdq9PnCiMBGFNcYnpH0XNknrCqFpkf1
	l5lHt0QA8GBLTQlYnH9BQGcBGrG0fjdSfCsqpGn0JZwmafpalJSKPNdQwU2djWSpaR53NJiWJyT
	WvJ5h8/1mPgrFaFPmS/WsrverIrEvvPceGQy4r9U3dDuB+9a5oN9iQ9o+e4ZG8ofQf8swCkwJGi
	my9V0KoKosgfd6C5k7FOK7F9h9A4EV8h1F6eDpyHwqpLgit5czoTvcmX4bCqkgbyNf/cZ56PF3G
	dYrvKrjr8+
X-Google-Smtp-Source: AGHT+IGBjogJpdqBECxdqNJHCrUJJr7NlQdtMt5iEtD1VpvFcm33NjPEMGNwwwua21p4gOBVEvBwdw==
X-Received: by 2002:a05:600c:4f83:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-477c01b23b1mr483028995e9.16.1764678833518;
        Tue, 02 Dec 2025 04:33:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164ceecsm303438075e9.14.2025.12.02.04.33.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:33:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/3] gradm: fix installation with usrmerge enabled
Date: Tue,  2 Dec 2025 13:33:50 +0100
Message-ID: <20251202123351.1645828-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202123351.1645828-1-skandigraun@gmail.com>
References: <20251202123351.1645828-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122262

In case usrmerge DISTRO_FEATURE is enabled, the recipe installs its
binaries into /sbin folder, which however supposed to be a symlink
to /usr/sbin folder, thus ultimately failing the installation.

To avoid this problem, backport a patch from master branch that allows
specifying the installation location.

This is a partial backport of 682657248c654c54ac87edc9bf0a95fb59ff0b1e

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gradm/0001-make-Define-SBINDIR-flag.patch | 69 +++++++++++++++++++
 .../gradm/gradm_3.1-201903191516.bb           |  2 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch

diff --git a/meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch b/meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch
new file mode 100644
index 0000000000..1c0f3bfbae
--- /dev/null
+++ b/meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch
@@ -0,0 +1,69 @@
+From 12bc62ac26df012fc143913b6e046a3cf5127db2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Apr 2022 09:20:49 -0700
+Subject: [PATCH] make: Define SBINDIR flag
+
+Provides a facility to control install locations of /sbin elements from
+environment
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index deed94c..9190fe9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,6 +25,7 @@ MKNOD=/bin/mknod
+ CC=/usr/bin/gcc
+ FIND=/usr/bin/find
+ LIBS := $(shell if [ "`uname -m`" != "sparc64" -a "`uname -m`" != "x86_64" ]; then echo "-lfl" ; else echo "" ; fi)
++SBINDIR=/sbin
+ OPT_FLAGS := -O2
+ # for older versions of grsecurity, comment the above line and uncomment the below:
+ #OPT_FLAGS := $(shell if [ "`uname -m`" != "sparc64" ] && [ "`uname -m`" != "x86_64" ]; then echo "-O2" ; else echo "-O2 -m64" ; fi)
+@@ -136,15 +137,15 @@ lex.learn_pass1.o: lex.learn_pass1.c learn_pass1.tab.h
+ lex.learn_pass2.o: lex.learn_pass2.c learn_pass2.tab.h
+ 
+ install: $(GRADM_BIN) gradm.8 policy grlearn
+-	@mkdir -p $(DESTDIR)/sbin
++	@mkdir -p $(DESTDIR)$(SBINDIR)
+ 	@echo "Installing gradm..."
+-	@$(INSTALL) -m 0755 $(GRADM_BIN) $(DESTDIR)/sbin
++	@$(INSTALL) -m 0755 $(GRADM_BIN) $(DESTDIR)$(SBINDIR)
+ 	@if [ -f $(GRADM_PAM) ] ; then \
+ 		echo "Installing gradm_pam..." ; \
+-		$(INSTALL) -m 4755 $(GRADM_PAM) $(DESTDIR)/sbin ; \
++		$(INSTALL) -m 4755 $(GRADM_PAM) $(DESTDIR)$(SBINDIR) ; \
+ 	fi
+ 	@echo "Installing grlearn..."
+-	@$(INSTALL) -m 0700 grlearn $(DESTDIR)/sbin
++	@$(INSTALL) -m 0700 grlearn $(DESTDIR)$(SBINDIR)
+ 	@mkdir -p -m 700 $(DESTDIR)$(GRSEC_DIR)
+ 	@if [ ! -f $(DESTDIR)$(GRSEC_DIR)/policy ] ; then \
+ 		if [ -f $(DESTDIR)$(GRSEC_DIR)/acl ] ; then \
+@@ -170,15 +171,15 @@ install: $(GRADM_BIN) gradm.8 policy grlearn
+ 		echo "KERNEL==\"grsec\",          MODE=\"0622\"" >> $(DESTDIR)/etc/udev/rules.d/80-grsec.rules ; \
+ 		echo "LABEL=\"permissions_end\"" >> $(DESTDIR)/etc/udev/rules.d/80-grsec.rules ; \
+ 	fi
+-	@if [ -f $(DESTDIR)/sbin/udevadm ] ; then \
+-		$(DESTDIR)/sbin/udevadm trigger --action=change ; \
++	@if [ -f $(DESTDIR)$(SBINDIR)/udevadm ] ; then \
++		$(DESTDIR)$(SBINDIR)/udevadm trigger --action=change ; \
+ 	fi
+ 	@echo "Installing gradm manpage..."
+ 	@mkdir -p $(DESTDIR)$(MANDIR)/man8
+ 	@$(INSTALL) -m 0644 gradm.8 $(DESTDIR)$(MANDIR)/man8/$(GRADM_BIN).8
+-	@if [ -x /sbin/$(GRADM_BIN) ] ; then \
++	@if [ -x $(SBINDIR)/$(GRADM_BIN) ] ; then \
+ 		if [ -z $(DESTDIR) ] && [ ! -f $(GRSEC_DIR)/pw ] ; then \
+-			/sbin/$(GRADM_BIN) -P ; \
++			$(SBINDIR)/$(GRADM_BIN) -P ; \
+ 		fi \
+ 	fi
+ 	@true
+-- 
+2.36.0
+
diff --git a/meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb b/meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb
index 0513f0dca0..796659e8b0 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb
@@ -14,6 +14,7 @@ DEPENDS = "flex-native bison-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam
 SRC_URI = "http://grsecurity.net/stable/${BP}.tar.gz \
            file://0001-Makefile-remove-strip.patch \
            file://0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch \
+           file://0001-make-Define-SBINDIR-flag.patch \
            "
 SRC_URI[md5sum] = "5099c715433981d5a3eed8ded7c5bbc0"
 SRC_URI[sha256sum] = "d3a0b6383ff97a2054941d71133c737efae66afdd8eef59346c031ae15c75ff3"
@@ -35,6 +36,7 @@ do_compile() {
 do_install() {
     oe_runmake 'CC=${CC}'                               \
                'DESTDIR=${D}'                           \
+               'SBINDIR=${base_sbindir}'                \
                'LIBS='                                  \
                'LLEX=${STAGING_BINDIR_NATIVE}/lex'      \
                'FLEX=${STAGING_BINDIR_NATIVE}/flex'     \

