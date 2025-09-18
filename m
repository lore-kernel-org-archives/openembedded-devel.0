Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18EBCAC5A9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:13:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.11271.1758194003781722144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUfQ9j9/;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7728815e639so583964b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194003; x=1758798803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsylM9gZXoVQn5JETdg59ncizLKpXtUHyfJXo41J/AM=;
        b=fUfQ9j9/AwGa4fxOa2yArhd6KyVMPUUdq+kVwRTLfFKTzz9igSJbnFd10nI5IHhV9W
         EoGF192AOEzh4Cen2/uEEoyZACuHABdRLtZ13UWfU6ETBuqS/lWbUrc8vGJInipGyNXH
         Zsnobrtk3DKNQeN5Z0QqCMQlJ2l+ZjbOLfylHm/uuK83aLbWJFzWJ9YR4Q5m+UotE7LR
         ATr75Df0mBc/rYgSkgL6dDINgRJbWQmu586oaOLKKYqoZ+Ov+zw1Ep+V6i/6hchDQoax
         eGElaU5pzdYXY2+KRtqgMNGShXwB89SBMLgZoucc/CK3PhdJjnw/tyDlPH7CDZcDfdKv
         PviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194003; x=1758798803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsylM9gZXoVQn5JETdg59ncizLKpXtUHyfJXo41J/AM=;
        b=IdKu4OY6f0/2z7qYhSNZb8tmJVOtVX+r5wURayNNY3rfASFHviWqNbDMiOZ0E7FtZU
         ZSbyGWtBPdpfDVQMA/kryh4Gwsa/WxM64UO5W7RaLZgGhyUqB5hZTktFKKqfkmDOZELE
         cGIaYj71sWDaWQSdbnOGl0BVdb0CHAATVTz4oeK3+bxX782xCBPyYs7FEP/Js95ZbPBt
         PesY/RESebzD4dWdRGlAElHtDK8h7nQR/tuG45kFnvqVb6yycoadIbFXFpsiwaTDZssP
         +uqNnsjAcb92s/lQEtTP4KPVURbBLxAsTSX8iyoPhwAIqDjef12NchZi2PrhMqt9NZCl
         fNMQ==
X-Gm-Message-State: AOJu0YxWToH6yEmO3ZJXTHw0Os5XIF46URtjbsUaoefxMW/O9dEEzI/k
	wcG+Xv9/jEeIZqY9NrCnEJFpeVvPU6thFyrbxRRtoHwuQJ1vwLCN6qkYimUq0w==
X-Gm-Gg: ASbGncu8Y92gQQArvtSu+gNvtoWmjDLVxP1Jv7qlWCbDJKwVVgg5Uu0lSSRs/gEs0Jt
	XBGWft4gO3h86vaH0itENHTS/3hDrMYoZJqx1cJ1+nCErEi6GhnT7ARzOKZ1wXqfE/Nsltd4yjx
	ipM4ra6bLhsOoHRDkBhI/WsGfLgqYfMEYZp0goI6pjomwf3SaIAWAfuruDPwJPbxgS7u7xFnmGR
	iZPlkZ7/Vw0WRp/Y4Kt6ZSQ1GBgoB5NDY68P6FNnU28BM6LEqCbziZ/01Wiq3L3jkNnLZMDVbv5
	Ajj6PPO0zSQQ6WSVrWI+hBkV+8Hh/ur07uXGNqC1fkZUxoAdbjJ3k10jBkaft+8yH1eW6k/KXpm
	5SV+WQvmdpqfHJVo2eQI8LWzc2m6UvAQdXwn/4ASEPpuXojT8rFez0lGK2gS/iiE=
X-Google-Smtp-Source: AGHT+IFwnUac0mNTnv5VZSQtdWG6Okk3hFKBo6EmQ3XEnN4Z33p1hHu+663c47rH9uwu/ftg6reo1Q==
X-Received: by 2002:a17:903:1a2d:b0:267:b6f9:2ce with SMTP id d9443c01a7336-268138fe357mr66442215ad.41.1758194002668;
        Thu, 18 Sep 2025 04:13:22 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698035cd39sm22766475ad.146.2025.09.18.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:13:22 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] gutenprint: fix a build race-condition
Date: Thu, 18 Sep 2025 13:13:11 +0200
Message-ID: <20250918111312.716726-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119556

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
-- 
2.51.0


