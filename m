Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36995C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:57:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.24183.1647248225983400747
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=W+HhVV8r;
 spf=pass (domain: qtec.com, ip: 209.85.167.53, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f53.google.com with SMTP id bu29so25936381lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJNRVVHJc8LSdWl6sNF5zcRvXNUxc9yMuGqq2XSJEaM=;
        b=W+HhVV8rm6vLPNb09N/WDwOnPWmWwqf0hnuiQQCm+bwaog5TXodMc4W3WhThRNjYpN
         7yqnpW6SvFlM54R5mnFoxGSS6K31fw1FhbQzXk6FDEvsdbgSXeyCkDqunjs85FNOxs1t
         Mdim2WfFrRsjuaCAYGaaG1zj8PqFrVZmqyNFXk8y/CLpMbvloD7vvfYMvPw4lmbFoXYb
         CGEk4tcVAAY7WM33nC2xFMKQUYY/bgsmnPRVQglT1qU/MjgZkvcJeqVzJ3uEI3lA31Tj
         eUNbAqxkL2u2Q75djWx/5bt+frP57s6dovDXslCDRaCCCEF4iOow7i54ojcJMgYvRIZE
         jluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJNRVVHJc8LSdWl6sNF5zcRvXNUxc9yMuGqq2XSJEaM=;
        b=g/FIlG/WQiPlU2sVXBN/P/UPcjTk+PUSfXJgavtuqTY+Fn4GpTLeiktqnhkRQfZmOq
         RQkYVjrENdV+Dw5QQLrN10M2xEOgFrobttqftuQE3LanM0FyOXcz0Bnw/6cYGRmBHCjg
         9Uolwdkcdwqy1iRBcclV2Git10KjcbCARF+3kNmzLWmDbA70TetESBpHhg+n3x/MAYnz
         dGjSMrBYPQulchD2/gblFMGBcZTjrf+1LV4JYCMa0ZqH5dK6WE5hr/V1QLNreZyQC6aj
         C/aGcCx4xtTD+RgR04/czZ/AjvyWW08bJ0GiH4qUHSEZMViMOnonPvTMzPDa2asn22e2
         7MeA==
X-Gm-Message-State: AOAM533+bRhWV/IKEW1nF9axjmsq1kAg08qdj8Q9/27mc7vx+lk66UPz
	XHPeYNjceqrAAhdPTL7yJaKsxcA0d+eoVKecpaZRKdSZFSGi09hK+JvJWRZs+gBU2C4hPtEU8/b
	7hAqp8ii+nAc7Qvvby1iPA6HmbCkUp7H2mdbXv+wrrFLPUDmo6ol7GoKp2SAy8krsjkg1DFRHFv
	vF2FjEVbh0ngfUbQ==
X-Google-Smtp-Source: 
 ABdhPJxj9adSx2Y5Wmxm3GCQUl0oQG82CFodgsNaEAHsKztzZv66LETGgo9vyXVrib2ytkTagJplCw==
X-Received: by 2002:ac2:5082:0:b0:448:35ad:23b7 with SMTP id
 f2-20020ac25082000000b0044835ad23b7mr13183487lfm.509.1647248223154;
        Mon, 14 Mar 2022 01:57:03 -0700 (PDT)
Received: from localhost.localdomain
 (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 h3-20020a2e9003000000b00249278d3bd7sm1751237ljg.77.2022.03.14.01.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 01:57:02 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [meta-oe][PATCH 1/6] zbar: Update 1.23.1 -> 1.23.92+4e0f618
Date: Mon, 14 Mar 2022 09:56:41 +0100
Message-Id: <20220314085646.38283-1-daniel@qtec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 08:57:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95972

- Drop patches already upstream.
- Remove duplicated PACKAGECONFIG variable.
- Update to master: Version 1.23.92+4e0f618.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 .../0001-qt-Create-subdir-in-Makefile.patch   | 35 ----------------
 ...02-zbarcam-Create-subdir-in-Makefile.patch | 40 -------------------
 meta-oe/recipes-support/zbar/zbar_git.bb      | 12 ++----
 3 files changed, 4 insertions(+), 83 deletions(-)
 delete mode 100644 meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
 delete mode 100644 meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch

diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
deleted file mode 100644
index d7ca15207..000000000
--- a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9c67f377477a07495a712f478eabfa8d33164c45 Mon Sep 17 00:00:00 2001
-From: Daniel Gomez <dagmcr@gmail.com>
-Date: Sun, 17 Jan 2021 23:32:51 +0100
-Subject: [PATCH 1/2] qt: Create subdir in Makefile
-
-Create builddir/qt subdir when --with-qt5 is enabled.
-
-Fixes the following error:
-
-moc -Iqt -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
--I../git/include ../git/include/zbar/QZBar.h -o qt/moc_QZBar.cpp
-moc: Cannot create qt/moc_QZBar.cpp
-make: *** [Makefile:2459: qt/moc_QZBar.cpp] Error 1
-
-Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
----
- qt/Makefile.am.inc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/qt/Makefile.am.inc b/qt/Makefile.am.inc
-index b099c2b..c98fbeb 100644
---- a/qt/Makefile.am.inc
-+++ b/qt/Makefile.am.inc
-@@ -15,4 +15,5 @@ qt/moc_%.cpp: qt/%.h
- 	$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
-
- qt/moc_%.cpp: include/zbar/%.h
-+	@$(mkdir_p) qt 2>/dev/null
- 	$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
---
-2.29.2
-
diff --git a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
deleted file mode 100644
index a1c27b8b4..000000000
--- a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fe751929ccc8fd75e350ed6db9d28d04bd31fc79 Mon Sep 17 00:00:00 2001
-From: Daniel Gomez <dagmcr@gmail.com>
-Date: Sun, 17 Jan 2021 23:33:19 +0100
-Subject: [PATCH 2/2] zbarcam: Create subdir in Makefile
-
-Create builddir/zbarcam when --with-qt5 is enabled.
-
-Fixes the following error:
-
-moc -i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB
--DQT_CORE_LIB
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtX11Extras
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
--I../git/include ../git/zbarcam/zbarcam-qt.cpp -o
-zbarcam/moc_zbarcam_qt.h
-moc: Cannot create zbarcam/moc_zbarcam_qt.h
-make: *** [Makefile:2438: zbarcam/moc_zbarcam_qt.h] Error 1
-
-Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
----
- zbarcam/Makefile.am.inc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/zbarcam/Makefile.am.inc b/zbarcam/Makefile.am.inc
-index b6de82c..e90c50c 100644
---- a/zbarcam/Makefile.am.inc
-+++ b/zbarcam/Makefile.am.inc
-@@ -28,6 +28,7 @@ DISTCLEANFILES += $(nodist_zbarcam_zbarcam_qt_SOURCES) zbarcam/moc_zbarcam_qt.h
-
-
- zbarcam/moc_zbarcam_qt.h: zbarcam/zbarcam-qt.cpp
-+	@$(mkdir_p) zbarcam 2>/dev/null
- 	$(MOC) -i $(zbarcam_zbarcam_qt_CPPFLAGS) $< -o $@
- endif
-
---
-2.29.2
-
diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
index 17084f830..5d7d7e173 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_git.bb
@@ -9,23 +9,19 @@ SECTION = "graphics"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"

-SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https \
-    file://0001-qt-Create-subdir-in-Makefile.patch \
-    file://0002-zbarcam-Create-subdir-in-Makefile.patch \
-"
-SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
+SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https"
+SRCREV = "4e0f618b54af060fc3516acfb34b6023ed064620"

 S = "${WORKDIR}/git"
-PV = "0.23.1+git${SRCPV}"
+PV = "0.23.92+git${SRCPV}"

 DEPENDS += "xmlto-native"

 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    video python3 \
 "

-PACKAGECONFIG ??= "video python3"
-
 inherit autotools pkgconfig gettext \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gtk3', 'gobject-introspection',	'', d)} \
--
2.34.1


