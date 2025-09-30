Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF9DCAC5BD
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:29 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.21005.1759223965045779338
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hyuuvWnL;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-42861442e8eso15942425ab.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223964; x=1759828764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58JSmOiFh3qJhvBQypw/LZ5y23yY0eyqO/40nEdR1/c=;
        b=hyuuvWnLIQBKqyw3jGdCo3dfThhPAIQoH9EfaNYPN6l+dJwzyNhFtbCQHIpSb+OnUS
         Kv2F3LHfd6FCNacAvdKkk+Jv7tSWzzqlR2BSaq5BhxCBNl+5r+MJ0VxOKoer7MEsHZkG
         3825uMUKrQy34QiM2USepkKCMrQ0pJxS+vu/Uosn2PKbkJsvFQJy8y6kKSsxIyG65u4P
         Nrflq0TRLR16YJigScy2a8gbMnU9ZVBs0CgiGS80DLNhV1OJ3qNmwR0BkXbY28tw++0X
         Im7Sy4iR98z8xxC5lXWXJ6UdVAJjghILhueZMLsQL58M3RkEwdLULI0omDxCw8nKW71n
         dTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223964; x=1759828764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58JSmOiFh3qJhvBQypw/LZ5y23yY0eyqO/40nEdR1/c=;
        b=QkvdiMcjlaMlvV9+XZEaE24YUaxRgXf9cqd2Y4H6+YRmXv1qyQpxu1GrVK24FMXWRe
         gQ3oVT6QYt+OYZu1KR2VXz34Vfry9LnfY7dx13mjbB4urDEMWyhvgwfZN+B3zUs4+VJp
         fMHf+wCJWfe47LmvUbAnDGdx5s8mDsmOFjZU1nNxs9lxKSAXluzpyq9/RxwatgHk71Nt
         AlvavLAe0dhv0zXkncabT3qFOXpK1ZHz9iZR+Qcct8cl7dUFsWo9/bizX0buaOboBZJl
         KrrKXHRV2N7P5LuhMoaFEkD6iknouoeShItRMRfQzqCh1t3ndVxvyTkPb7JzFHbDBihB
         WzXw==
X-Gm-Message-State: AOJu0Yz2jPhnWFttLtV7TsPdh4pApO6nhbwUyTL9NHLOTxC6sWBBk8Zh
	WhJ3Y5nZ05XOpxp3EfbnQXd0PUYO1XWQvEts6T7NGuHo5yZ6TFwQmfY9wiSAfpGR
X-Gm-Gg: ASbGncuJeEeE2XvNAHelFYAwNufQwZqyjQr86AOVmfcRz5ibHJ9o08MOO9JVZ6JLohH
	wFgbhu3YLlZwy7aATAVlKn4iaTznl/vKS5QyFuYp/fD48QzO99Y53V66uA6CX4p9NzNPnazMBFq
	1mlljqN+caiLeLM/VoqgTUg7r3ulVX3z/9zqIVO8+H/NVwnTH+GuL1mtxpg/NPzgAtp00Qphjy4
	hAUHHVQ8Xqx6TvJfxqgCWHNVx5Tk6Gxz8DaFcqVSR4bT3xmY2llI3zpUu8T7vZvGi/wDSTqRkVd
	3b4meSfBC4Dmp1KaeTCYZ/dpSn5767s6GIaI2VqjeWwJxHxIcV9QHITUlcvvTc7yLpeAKcr3//d
	myOANDTlCfAKL35t7G4n02Sla9MTL+cq3zsdL/JD5KgjnLUZBQrwK2pS4keKZSthJzAA0Gm0zpZ
	k=
X-Google-Smtp-Source: AGHT+IFyK7YMagrblBsRJxXy/qHM3ZJE90O8NUdSx0i+acQVDiln3EKYMKhi3nHlQnLMQ1ujRDUsXw==
X-Received: by 2002:a05:6e02:1fc3:b0:413:d5e2:b751 with SMTP id e9e14a558f8ab-425955fcbb6mr285401965ab.6.1759223964069;
        Tue, 30 Sep 2025 02:19:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:23 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 14/22] gutenprint: fix a build race-condition
Date: Tue, 30 Sep 2025 22:18:33 +1300
Message-ID: <20250930091841.1693131-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120066

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
(cherry picked from commit 1c3a75acc03aa31ca013e5e3f4341ddd9ee9e667)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

