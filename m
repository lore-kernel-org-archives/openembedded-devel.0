Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C45C44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14739.1782634339108229460
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OZt/li5w;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-139b5e604b9so2761606c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634338; x=1783239138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xZsSSd9FUNpXlAHj6O3udbMPhfTfhJ6yDsKkXGcnOs=;
        b=OZt/li5w04uf1HG0OOYbYBGnH6CDjTiR2/efHhibggtuQerRl23P/wIosMvxYauRar
         KyldRZUw2S1co87wrrjz/GowiHmGs9wnfLnwbEqbs7BAbmyQR+SVz3V9pa1wQ+t163a7
         2bBYUt9gKTJopq80uAAPKhOajy22TSyeGDaEJfyFUPsIBuWxLaG19YRErp/sSle41YxQ
         0fsP78/J90f9seBtM0RPjUw1dnGJojotqJXRt+DZ78W+mhPokoJCnEHs4PM2pUUIpNkD
         s3GUU9a1+4GhdHWpG8tAti3Pdx3L+UVqwaE75lHxJsOkwBSkbnAM915lo8AmnwCw+6oa
         cwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634338; x=1783239138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xZsSSd9FUNpXlAHj6O3udbMPhfTfhJ6yDsKkXGcnOs=;
        b=JZnkO3qeIdVC1o8askuBU8AcErpHbJlcXctLO2uvGZ9hhGug91RgCZgHHPtP9KzjDw
         LXr5L6Bq6P22j8D3SZIBRTiv9jv8LrOuQ35nU6dzt8HYhQ3KtmKqAyAHE4OY78HBynOs
         GLhr3a5OJ4c5g9u8r/qN6C1zOqNpMWGy0EL2haGd60qvPuktCcjc8EJwKu7G7hjDkdg2
         BAFjCdZMxwQ69sWZghXss5gZQ/oqkUu5WhbeXNwFppp7m7Vh07Lkr5Wz2DFdYRBIcZ2N
         /HYmrhgZk8j1qHkbA1qG0zgF9jzbThJ4ryX+TlDftOzIAZLJP8cZKaSv9PcQII0hIMOk
         svvg==
X-Gm-Message-State: AOJu0YzWAhSZSYg1FzZWooFQ1ZAHQ7Uxy1lxjBUwi99Ry+xMhZqXqiI+
	GSaem9DyaLHRas33umG0A+hNvHBGzeD9aYaorpx0SiuZu8hk8/sS71ZdZ0LB8leOmMuNjA==
X-Gm-Gg: AfdE7cmyjqcOvSd031d4SgZJiy1qL+eYl5/ZX6ZZaH7L6WTJcDnf2cBqJ+3vTiLvKCu
	1oxRHiSd4Btr3/ybkB52paUj+pep5p2//Ukk/yqGNvi4DkzrWFQAmgTRIc0H+U1Y80nFtwn3dkf
	0CUZBGX9/3KXajUrWBpMqhI5kqviu9/2OtxRF0Z+uX9Ei1ulYvZoG2nV0z9T68WXzmbes69QiBh
	/UWuYzrktzfjODtJeI038Z1ELucv6X4Td5aiLFVYwZZ5Zne5duL45bIgWRJirnyyN2K8hz4U3Kr
	QTCS6yIaGYGsgnEfSe5+W7TFNw30AzIqOzgtw0llb4kQCKSvfvEc711ScprzE2SZKTSpt0ai7Xd
	8Xhp3KUDn2Tl8Y4CZqOKPJxxDDFCU+gYDJEJPKMjcD0pte+qhW3DrBs3iXc+6H6dHADgMibaZ+u
	VhLflT7g/B5vy5xpY17dj4eCrfCO6QC8oW9J3GD1rInw2hEjnuOafvnZaO9HjpL78VK/vMMB1yv
	6pCB0ppcb79ZMTPp4er1Kz5UekNVmYH+UQ46QOYhWGt54pZFKjR4EgGOUqAhZbP/Sn2/Lx8Gj99
	R3j748CKvEJHAEis0XeSj5WixiWCw9LxRdJIFq0U
X-Received: by 2002:a05:7300:6d2b:b0:30e:4ede:1ba0 with SMTP id 5a478bee46e88-30e4ede2164mr3347751eec.16.1782634338400;
        Sun, 28 Jun 2026 01:12:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 058/128] icewm: upgrade 3.8.2 -> 4.0.0
Date: Sun, 28 Jun 2026 01:10:09 -0700
Message-ID: <20260628081122.178348-58-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127868

Refresh the cross-compile configure.ac patch for 4.0.0. Its configure.ac
now requires the xcursor pkg-config module in the core PKG_CHECK_MODULES,
which the recipe never depended on, so do_configure fails:

  checking for fontconfig xrender xcomposite xcursor xdamage xfixes xext x11... no
  configure: error: Package requirements (...) were not met:
  Package 'xcursor' not found

Add libxcursor to DEPENDS.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...igure.ac-skip-running-test-program-when-cross-co.patch | 8 ++++----
 .../icewm/{icewm_3.8.2.bb => icewm_4.0.0.bb}              | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.8.2.bb => icewm_4.0.0.bb} (93%)

diff --git a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
index 0c04008b69..f713d7704e 100644
--- a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
+++ b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
@@ -1,4 +1,4 @@
-From bcf7da314d4cd1db1708d48c908ab7da797a733b Mon Sep 17 00:00:00 2001
+From d505f384aea5e565c4207e026b8c0dac485a741a Mon Sep 17 00:00:00 2001
 From: Naveen Saini <naveen.kumar.saini@intel.com>
 Date: Fri, 2 Aug 2019 10:41:26 +0800
 Subject: [PATCH] configure.ac: skip running test program when cross-compiling
@@ -11,7 +11,7 @@ Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
  1 file changed, 2 insertions(+), 17 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7d16afb..65cd194 100644
+index 8d3dfea..b21361e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -152,7 +152,7 @@ AC_CHECK_FUNCS([backtrace_symbols_fd memrchr sysctl sysctlbyname \
@@ -51,6 +51,6 @@ index 7d16afb..65cd194 100644
 -                             ])
 -              ])
 -
- PKG_CHECK_MODULES([CORE],[fontconfig xrender xcomposite xdamage xfixes xext x11])
+ PKG_CHECK_MODULES([CORE],[fontconfig xrender xcomposite
+                           xcursor xdamage xfixes xext x11])
  AC_SUBST([CORE_CFLAGS])
- AC_SUBST([CORE_LIBS])
diff --git a/meta-oe/recipes-extended/icewm/icewm_3.8.2.bb b/meta-oe/recipes-extended/icewm/icewm_4.0.0.bb
similarity index 93%
rename from meta-oe/recipes-extended/icewm/icewm_3.8.2.bb
rename to meta-oe/recipes-extended/icewm/icewm_4.0.0.bb
index ad92b7b294..89ae83098a 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.8.2.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_4.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "c64b1b7c8ee262a3c4796be57349a3198998564d70ed26f11e724e1b73d48394"
+SRC_URI[sha256sum] = "b8b22a2f0460c51f92ba785102bd122707966a618bb872c95fa6e6801d620cd1"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -21,7 +21,7 @@ EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
                 --enable-shape"
 
 DEPENDS = "asciidoc-native fontconfig fribidi gdk-pixbuf imlib2 libxft libxpm libxrandr \
-    libxinerama libice libsm libx11 libxext libxrender libxcomposite libxdamage \
+    libxinerama libice libsm libx11 libxext libxrender libxcomposite libxcursor libxdamage \
     libxfixes"
 DEPENDS:append = " qemu-native"
 RDEPENDS:${PN} = "perl fribidi imlib2 imlib2-loaders"

