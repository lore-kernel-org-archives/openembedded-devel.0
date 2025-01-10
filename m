Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C83E7719D
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 14:20:10 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.19497.1736518804632480704
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 06:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kf0GkasY;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e479e529ebcso2993717276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 06:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736518804; x=1737123604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLoP8I6e/KgSiNBDg1FMR+DlVp66AChRe0rRXj5axg8=;
        b=kf0GkasY+xGYUIxkibamcmGNto7xg7ZJtVMuNaKMJYmS3GBXfgXy7VynTOwc5Fmu5P
         ToIC2tIJ4LBoCz9T3TYuuw+OWR/qH4+ie/iL8EAMXge+Fii7a1XdP4Etoljn4bYSVQuJ
         CtPz35c0BOvIHtQ2N+5c/QpiyEepRCLwyEPhkOOuwUB4xeGl/SHuSDaVgsIBKmGaXC8Z
         zjwWTCSp8wjdnOo4Hhz9WyKBsd9Q0rLUGPhrKpnN+6j+ZX0wCDYQgCqikzCoch5GwJ4W
         8TLByK3oiuB9WebLNB1vfzyNiHUqElGEfGDSK3ijX0prKLsABW9tWvK3C+mCi5rGjelq
         9rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518804; x=1737123604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLoP8I6e/KgSiNBDg1FMR+DlVp66AChRe0rRXj5axg8=;
        b=PKJUlAtTdXRdjIjgp+uEFLTydPA8UM08HAPIHgGndmPr8I2bn7jJOTzkbSvd4JY9e2
         udPQK1VAQva1AkMbQcUeLcdb/gQBiyF1tJ2ZYX8gOh95EE8V8nUDSp6ZR8Fd0V33gvbj
         i3VEuYFjT/ztyvr0i7q8A0IV2SoPu6LY9kdZVDuXYCmPjELNJueEX5pLXolEFTlMV1fh
         pwCp3EK1d+deE5tr5LM/8h6T8XthIvq7Amb5TanxB1hVt0DbjRaq/ihoK2PnEGOabfKo
         OhrzBc58CDNLlvp7KSOd7rK37nVqZl2qaS8kejv9lGiuiB/5tIdErW7Wv9AxfLVtRy2t
         aHsA==
X-Gm-Message-State: AOJu0YyJMib4D6VCt0LZQe3wn1zhz1kB8dKGAEO5ZlDSPylGzW/Nfbyt
	WV3mmiu7mQHDZE46vz1mpK7RB9HW/kd8pv79vkYzQyt8OtBV8frd2PhG+HVV
X-Gm-Gg: ASbGncsVkuUm7EgwN1sM6iy/o/AadifQra9aytd53Fn/5ESq+1Zvut4m0HEmBKBsv04
	az3+CiW5nnx0HH6T3EIzwFnyJgfKhWI8kyd5oI80CNMAbddSapXBFEV2u0L5QQ3qnvXun9Ht2gZ
	LJjk3i/vjMrQ9Fq0yh4WWHCc70AK3LhQ7BWTGqfQ3qCfIsJ+hqHuzwKPIbyaxUVyoOaL4kfhpuv
	ejYrgY5C8tZeGjZeipqpI7Z2IpdCjOgbNYiKTy0fxckIg2UAb18vDujsB++8GpdF8cOfiU=
X-Google-Smtp-Source: AGHT+IGK3MkQQAl4E/gdWyOmlV3kskYHiMVBaBqGLi1JPO5oKVz5Tc3FyTQRtvVgydLe57691u8h4w==
X-Received: by 2002:a05:690c:6582:b0:6f4:38f5:73f with SMTP id 00721157ae682-6f5312d3bf7mr59939347b3.30.1736518803601;
        Fri, 10 Jan 2025 06:20:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:152e:c23f:add0:82a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546c47200sm6373247b3.53.2025.01.10.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 06:20:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 1/5] gimp: fix gimptool buildpaths errors
Date: Fri, 10 Jan 2025 09:19:58 -0500
Message-ID: <20250110142002.370956-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114777

From: Yoann Congal <yoann.congal@smile.fr>

gimptool is used in GIMP plugin compilation. It does need a CC
definition, provide it as the current CC with "--sysroot=..." removed.

gimptool also need the gimp .pc file which is in gimp-dev. Split
gimptool in its own package to avoid circular dependencies.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 061f5c7f82b905f3a75183852b3a8fbff7e50e17)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-gimptool-allow-default-CC-override.patch | 85 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  | 21 +++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
new file mode 100644
index 0000000000..b04a16cec7
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-override.patch
@@ -0,0 +1,85 @@
+From 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Sun, 13 Oct 2024 01:00:10 +0200
+Subject: [PATCH] gimptool: allow default CC override
+
+From: Yoann Congal <yoann.congal@smile.fr>
+
+In OE, CC contains sysroot path. Storing CC in binary then leads to
+non-reproducibility.
+
+This commit add a new configure option "--with-default-cc='cmd'" for
+force the CC stored in gimptool to a reproducible value.
+
+Upstream-Status: Inappropriate [does not apply on master (upstream has moved to meson)]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ app-tools/Makefile.am |  2 +-
+ configure.ac          | 13 +++++++++++++
+ tools/Makefile.am     |  2 +-
+ tools/gimptool.c      |  2 +-
+ 4 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/app-tools/Makefile.am b/app-tools/Makefile.am
+index a7cd4ce..81a3a00 100644
+--- a/app-tools/Makefile.am
++++ b/app-tools/Makefile.am
+@@ -67,7 +67,7 @@ AM_CPPFLAGS = \
+ 	-DMANDIR=\""$(mandir)"\"				\
+ 	-DGIMPPLUGINDIR=\""$(gimpplugindir)"\"			\
+ 	-DGIMPDATADIR=\""$(gimpdatadir)"\"			\
+-	-DCC=\""$(CC)"\"					\
++	-DDEFAULT_CC=\""@DEFAULT_CC@"\"				\
+ 	-DGIMPDIR=\""$(gimpdir)"\"				\
+ 	-DGIMP_PLUGIN_VERSION=\""$(GIMP_PLUGIN_VERSION)"\"	\
+ 	-I$(top_srcdir)						\
+diff --git a/configure.ac b/configure.ac
+index a88b7cc..d90b6db 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2457,6 +2457,19 @@ fi
+ AM_CONDITIONAL(DESKTOP_DATADIR, test "x$with_desktop_dir" != xno)
+ AC_SUBST(DESKTOP_DATADIR)
+ 
++######################
++# Determine default CC
++######################
++
++AC_ARG_WITH(default-cc, [ --with-default-cc="cmd" default CC to print in gimptool (default=CC)])
++
++if test "x$with_default_cc" != x; then
++  DEFAULT_CC=$with_default_cc
++else
++  DEFAULT_CC=CC
++fi
++
++AC_SUBST(DEFAULT_CC)
+ 
+ #####################
+ # Check for XML tools
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 420b9b1..ccabde8 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -87,7 +87,7 @@ AM_CPPFLAGS = \
+ 	-DMANDIR=\""$(mandir)"\"				\
+ 	-DGIMPPLUGINDIR=\""$(gimpplugindir)"\"			\
+ 	-DGIMPDATADIR=\""$(gimpdatadir)"\"			\
+-	-DCC=\""$(CC)"\"					\
++	-DDEFAULT_CC=\""@DEFAULT_CC@"\"				\
+ 	-DGIMPDIR=\""$(gimpdir)"\"				\
+ 	-DGIMP_PLUGIN_VERSION=\""$(GIMP_PLUGIN_VERSION)"\"	\
+ 	-I$(top_srcdir)						\
+diff --git a/tools/gimptool.c b/tools/gimptool.c
+index 21fc043..bbf3fa5 100644
+--- a/tools/gimptool.c
++++ b/tools/gimptool.c
+@@ -280,7 +280,7 @@ find_out_env_flags (void)
+   else if (msvc_syntax)
+     env_cc = "cl -MD";
+   else
+-    env_cc = CC;
++    env_cc = DEFAULT_CC;
+ 
+   if (g_ascii_strncasecmp (env_cc, "cl", 2)    == 0 &&
+       g_ascii_strncasecmp (env_cc, "clang", 5) != 0)
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index a17e03b103..0272e05e96 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch \
            file://0001-file-tiff-load-fix-mismatching-variable-type.patch \
            file://0001-metadata-shut-up-a-weird-warning.patch \
+           file://0001-gimptool-allow-default-CC-override.patch \
            "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 
@@ -74,6 +75,26 @@ FILES:${PN}  += "${datadir}/metainfo"
 
 RDEPENDS:${PN} += "mypaint-brushes-1.0"
 
+
+# gimptool
+
+# gimptool needs a CC definition, use current CC without sysroot
+python __anonymous() {
+    import shlex
+    CC_WITHOUT_SYSROOT = shlex.join(filter(lambda x: not x.startswith("--sysroot="), shlex.split(d.getVar("CC"))))
+    d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT)
+}
+EXTRA_OECONF += "--with-default-cc='${CC_WITHOUT_SYSROOT}'"
+
+# Split gimptool in its own package
+PACKAGE_BEFORE_PN += "${PN}-gimptool"
+FILES:${PN}-gimptool += "${bindir}/gimptool-2.0"
+
+# gimptool depends on gimp .pc file being installed and tools to build the plugin.
+RDEPENDS:${PN}-gimptool += "${PN}-dev packagegroup-core-buildessential"
+INSANE_SKIP:${PN}-gimptool += "dev-deps"
+
+
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2009-0581] = "cpe-incorrect: The current version (2.10.38) is not affected."
 CVE_STATUS[CVE-2009-0723] = "cpe-incorrect: The current version (2.10.38) is not affected."
-- 
2.43.0


