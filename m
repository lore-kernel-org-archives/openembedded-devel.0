Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A790DC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 09:52:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9090.1751622725626962250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jul 2025 02:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=D8wyFxJv;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ce671a08so3985815e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 02:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1751622724; x=1752227524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0lsDxrPm2EhM0YJqx2DGyYoTiTMfu61v5JubyVy2n+I=;
        b=D8wyFxJv3dalpbT1pfjAKSeyD1sCXjYrnWcAGVlqnan4OEMn/mpN4IaTQwRZd4FnxU
         XSZwYpDwKOy4P/HHGyCcOz+WJ1Ru34g3uPpHje/GQXnw2GdYW6TQHRkfqTFcSzCFfooe
         6kYzM4Ad/AYm3yZNTZyxB7oVE1bUe36sEu0Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751622724; x=1752227524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lsDxrPm2EhM0YJqx2DGyYoTiTMfu61v5JubyVy2n+I=;
        b=JInYsY5jcvKlFkf+Zd/1m+qgtgjzdLBhzMS5j5GLYqAwq/8sl8g09D7ET1dO1AvIRB
         92M3q5IhbwHxsyNSPY+awmnwJDZN5NFyiNV4T7kKF6qi0GMe5S1/V7lMvUWkxOOxifFd
         0cC6p6KSXehOcdCiOZvcsxc1Wh4kagZCnDRlqhOzZG8rZ/H0lA7yVxvIZaqwgAV7p8HQ
         iPEn54mE4dyWQ4FuMF9WGPVJKnrJwR7/fCz52HpjzwqjCxZCW0Q7q/LVjUGLRKD3HxTA
         XmG5E0pX1TQcyM4+sXcYgdWCZNW9x74l1RywOC85JyVAXnF7P2VETp2IqfkQzGObI9Ao
         N8oA==
X-Gm-Message-State: AOJu0YwJpQ1Xrwp2qWv5xfbeG6QIFj/a/AtXjPb4wpSjkLCRtvNpa8CN
	48H3hQk15+90XEU+aQ3IvEMKgEUeAvWL+cccCACMR0UWdFpivRt44dz0JYaxYU73djzp+zq9F7U
	SAOlb
X-Gm-Gg: ASbGncu3nMNNUoUwbCFMAwvW4r4vdqet6OkDpEOkXmYIdOW/bqR4EPHkAxaJmnY9amF
	V2v1g7gRMCB6RdQxgV0CS6UywG7xQkyTodLygwsd+pIoX8RO+u+R6FqG8VOa24r46Q+8x75NQM9
	CVkxrm0LJ8D/4sVTzYPgeKOMWTmASK5qZ27E7hA6CT9CdwSlt+KYkb94hD7LB0/zpl3qhSP4B4I
	hHK4Pls+lRjEflinYcu63gIXcPRzjUepwRn+Hijpj0EwNgS2aucl9S8Ez5ZPJTNtM8NXOctZjwa
	IMqcLUVZ9c71RCSgBUye5K1/o/DGx7hbCebiZ7CqEzRnn8oSvFGPZrHrN6kn9Cn+7VgtP6tWEFo
	hcHtOfaBWdhT8qmorIaA6DlzadBOnCF3qYH++eNL3yJ9yx+oc4abtId/JHeLZVEvddzRZcw==
X-Google-Smtp-Source: AGHT+IH+mMwmBrDUcOz5Z0ji7s37KRPv0dnjeevXyOLE+5oOen0XBkhKlbZodKsdPahxoNZTceA1wg==
X-Received: by 2002:a05:6000:2509:b0:3a4:f786:4fa1 with SMTP id ffacd0b85a97d-3b4970118aemr1257243f8f.2.1751622723624;
        Fri, 04 Jul 2025 02:52:03 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa00788749b97a915cbc.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7887:49b9:7a91:5cbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97382sm2065127f8f.56.2025.07.04.02.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:52:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] gutenprint: fix a build race-condition
Date: Fri,  4 Jul 2025 11:51:43 +0200
Message-Id: <20250704095143.1972932-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 09:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118232

From: Yoann Congal <yoann.congal@smile.fr>

Gutenprint install hooks run in parallel but depend on each other. This
is a race condition and might trigger a build failure (e.g on AB [0]):
| chmod 700 $WORKDIR/image/usr/libexec/cups/backend/backend_gutenprint
| chmod: cannot access '$WORKDIR/image/usr/libexec/cups/backend/backend_gutenprint': Not a directory
| make[5]: *** [Makefile:2166: install-exec-hook] Error 1

Fixes this by adding an explicit dependency between the dependent
targets.

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/steps/33/logs/stdio
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-race-condition-around-empty-directo.patch | 60 +++++++++++++++++++
 .../gutenprint/gutenprint_5.3.4.bb            |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch b/meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch
new file mode 100644
index 0000000000..758acfe6be
--- /dev/null
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch
@@ -0,0 +1,60 @@
+From e3b0952fe936f90cfda9cbed368fae2143b72089 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Thu, 3 Jul 2025 15:27:04 +0200
+Subject: [PATCH] cups: fix a build race-condition around empty directories
+ removal
+
+In automake, install-exec and install-data happen in parallel.
+install-exec installs executables and install-data finishes with
+install-data-hook that removes empty directories. If install-data-hook
+happen before install-exec finishes, it might remove a directory while
+it is used by the install process and make it fail.
+
+Fix this by adding an explicit dependency between install-data-hook and
+install-exec.
+
+For example, here is the log of such a failure:
+| make  install-data-hook
+|  hosttools/mkdir -p 'image/usr/libexec/cups/backend'
+| make[5]: Entering directory '$WORKDIR/build/src/cups'
+| Expect a number of "rmdir: Directory not empty" warnings
+|   /bin/bash ../../libtool   --mode=install $HOSTTOOLS/install -c backend_gutenprint '$WORKDIR/image/usr/libexec/cups/backend'
+ # Start of the install process (from install-exec)
+| These messages are harmless and should be ignored.
+...
+| rmdir $WORKDIR/image/usr/libexec/cups/backend
+ # empty /usr/libexec/cups/backend is removed (from install-data-hook)
+...
+| libtool: install: $HOSTTOOLS/install -c backend_gutenprint $WORKDIR/image/usr/libexec/cups/backend
+ # install in a non-existing directory: backend_gutenprint is installed
+ # as /usr/libexec/cups/backend (this is now a file instead of a
+ # directory)
+| make  install-exec-hook
+| make[5]: Entering directory '$WORKDIR/build/src/cups'
+| chmod 700 $WORKDIR/image/usr/libexec/cups/backend/backend_gutenprint
+| chmod: cannot access '$WORKDIR/image/usr/libexec/cups/backend/backend_gutenprint': Not a directory
+ # chmod fails because /usr/libexec/cups/backend is a file and not a
+ # directory
+| make[5]: *** [Makefile:2166: install-exec-hook] Error 1
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Upstream-Status: Submitted [https://sourceforge.net/p/gimp-print/mailman/gimp-print-devel/thread/20250703164244.1120340-1-yoann.congal%40smile.fr/#msg59202153]
+---
+ src/cups/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/cups/Makefile.am b/src/cups/Makefile.am
+index 7928ee3..fe45c92 100644
+--- a/src/cups/Makefile.am
++++ b/src/cups/Makefile.am
+@@ -206,8 +206,9 @@ uninstall-local: $(INSTALL_DATA_LOCAL_DEPS) $(INSTALL_BLACKLIST)
+ 	$(RM) -f "$(DESTDIR)$(cupsdata_blacklistdir)/net.sf.gimp-print.usb-quirks"
+ 	$(RM) -f "$(DESTDIR)$(pkglibdir)/backend/gutenprint$(GUTENPRINT_MAJOR_VERSION)$(GUTENPRINT_MINOR_VERSION)+usb"
+ 
+-install-data-hook:
++install-data-hook: install-exec
+ # Remove unused directories in install tree
++# Note: it removes "exec" directories, so it must happen after install-exec.
+ 	-@echo 'Expect a number of "rmdir: Directory not empty" warnings'
+ 	-@echo 'These messages are harmless and should be ignored.'
+ 	-rmdir $(DESTDIR)$(cups_modeldir)
diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
index 5263890239..f90a123293 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
@@ -14,7 +14,9 @@ HOMEPAGE = "http://gimp-print.sourceforge.net/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz"
+SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
+           file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
+           "
 SRC_URI[sha256sum] = "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
 
 inherit autotools gettext pkgconfig

