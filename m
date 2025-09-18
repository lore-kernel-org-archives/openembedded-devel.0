Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB3CCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:16:02 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.11516.1758194153046985304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bp0n6SyX;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: zboszor@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24cde6c65d1so7831025ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194152; x=1758798952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsylM9gZXoVQn5JETdg59ncizLKpXtUHyfJXo41J/AM=;
        b=bp0n6SyXyxYJWoTBl7bq5IwF+t72kRmIIWCKpgLFTzeWlfqDaxAMrLFD9NG2AroBdB
         +ME0Kv+aTwkGmF5QRD7MQ3pHO89RuvkA8g06Qeqwhy2ShXxNF1MATuUQLhoNTZ/DL6Ju
         9/4rCr06PktgfgMTH3eRYQF4Kp9OhhwNWrIDK8NQ8fK22O38wFg76XGsXOGVZeR3xJH1
         H1lq3Q8ZP0dbGbu9NEgM7R1ex2/tXTz7dsKpvnflroWOVfTjw7UcBnmTbIQ0OBmGZITu
         4Kx0LpGIK7tuI+SO6XK9to4g18ES3PqbTvAaxCON21tWRsr24CzQ2GnkJN7NNBmQw+QX
         TW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194152; x=1758798952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsylM9gZXoVQn5JETdg59ncizLKpXtUHyfJXo41J/AM=;
        b=neKw/zd13sQW8YuZR6Z2VYSS/grSmC9xj01zeQsfmDojYTn/6tuUt/j3h0x0tW17cb
         ETTJgl1miriCG+sw0Z2H3uIJPybGVx6azuuag5UGQOAQk6EftKA2pi9Ys0E5kBoUv2Ea
         /yRElqYn8G9qYB5pfZl3wY3GRoUAA2hQIANtrn56BqlIimhhcBRxBpacQmUqEJ7FD+C2
         U6lDzGaxZuCeueQ4YB43KM5Iknx9hbaeYxDL5dgd0B2GTAPKCopCYQ43fi6LgIV9Xno1
         vHzJip4fP5OmZ+jarmRoitBO0XK10a1/oSC3cwAotcDko+Ons2k6tZbxI9fk+2ZdqMBO
         Xeag==
X-Gm-Message-State: AOJu0YyF0VWlvmFmV+74fRjZsv/pMk8tgPw+RZ8CFc/+9Uz2R8H0plmF
	/HYrqHZHB9Qvyua0E/RhT91fMULyo3bPx79ylyWQGeHSzzKD7zDSff2Znp0R+g==
X-Gm-Gg: ASbGncuKCARWiiBfThVpg4ZRTVBoaxyhN9NR+HrYk2QuN+mHPkz8PEO/XwpG98wAJO7
	9cMl+yZmt3Y1WSHb0iBE7yIuRl497ZuCigQ8nX3FkKUS6lhBWKdaeX1zM8I710PzsXSSh+VKZrq
	wlaOsEEZVK5HxBkv6fXzj9I0hrQqGaWPW0LPtvxWumdkRKcdnlwPJvobe4UmCOlocugTkHavS1E
	VuBrZusAhPwSqO778JSfqG2kopzXE9ypcRzWCZsdH11JH+5GUTFkTzb1VNmLiuLr6YsZ0cEo0CN
	5iy9sEZ9r5KjcBk8QOt0XmXLBz+2Ul+Zs1QOUogSXaEN8NiFD/urvWN5vaXhZAoyfsg2/Mn3Sn1
	zlauntXzU8P15btkenJKPKkG7yPQya3LuHT7BJURIRmFaLoimJ2OP5IZlB0v6xYc=
X-Google-Smtp-Source: AGHT+IEj1WX0j+vmAfm9mL2Mur6FVmhlTscTKnVBPVzeIGICQcM3NXc8nW8IRf6XolwlvDQc6xzkRg==
X-Received: by 2002:a17:902:eccf:b0:24e:81d2:cfda with SMTP id d9443c01a7336-26810ddadc0mr76827695ad.0.1758194152011;
        Thu, 18 Sep 2025 04:15:52 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3303ffe611csm4070220a91.9.2025.09.18.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:15:51 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 1/2] gutenprint: fix a build race-condition
Date: Thu, 18 Sep 2025 13:15:41 +0200
Message-ID: <20250918111542.717014-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119558

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


