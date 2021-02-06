Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.11774.1612643443512447583
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 12:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nrbontkE;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id x23so5225674pfn.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 12:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ePcA3dzvF4Ai0a5xvmQGl+AJ5fyo9uLizU2pDZja31k=;
        b=nrbontkEGwFDGfhrCaF7WmGDQOy6yTOQNGzs2NTMqKmekUctC/r8fCv2pblQh5Y0v9
         38aeBz/ErtZ2iEn5r2hE2CY/CP9n4wiVFWNEnuw84tTqlE0ioiW5jT5J2YwthJx/vp4T
         KydsAvy190ExP0A8t86NzNwEJFyenysZP8PbeTpN8/tntvUoQgjryvOFEeAmYBF3eDus
         8/3vVK9l1MIK0MiTJmkuOQJWkZLkpqiPONlAmIW5x1fKJp2Wp5qV+xg+tyeYgK5bZaoR
         JHoCIxsvM/d6mova5iytRJnGoywW6cIfYxpMSFw+vov3R2JeHNmRDDaBCEt43d675d53
         yW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ePcA3dzvF4Ai0a5xvmQGl+AJ5fyo9uLizU2pDZja31k=;
        b=OkHV6+EwkC1H+VDHi7QbJBnbYTVXukugadZiLE29EpPcDfaNq3PIMOFXY28euGNxml
         gTj2/EHcuz8xlUWWOyvdQFpHtgSHSkeXSpwpK2yqbeyaLmqR/ArMexvVH3U2YkfBnGtO
         phHoiJXWsaXfM1A9w2pIOBnTq4FDhLymfjwe8hBztDSDxafkIQxMqBocLa0d232yjUNz
         ePKjs8y/2zjNzkssjDPAX5dC2TB5CWMswe5BOWquKmd/2UpPo9Ew+XEGH/dYbT14qtVt
         ERIEA+YGjnyeCzIfYP9kudLLXocr5iiFKDP1Cr4HNDlkU8EcnvSLFRvKonumOOaIWlH6
         47eQ==
X-Gm-Message-State: AOAM533QMK4c3XRE3XP1rA782bYjcAzOG2PHpCB6GvVj7MSeh+EP6cmo
	YkPWgvZweSMYtKQYuvSc4LWJQbXroVgcyA==
X-Google-Smtp-Source: ABdhPJyamysHqYjm4y57M2QexMYTSXmmtj2IDtBCRhovxn11hT2tAC29GqVWT/zYFxmjL/KuL+DACQ==
X-Received: by 2002:aa7:8a99:0:b029:1a6:c8b8:1414 with SMTP id a25-20020aa78a990000b02901a6c8b81414mr10463829pfc.66.1612643442735;
        Sat, 06 Feb 2021 12:30:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id s1sm8731572pjz.42.2021.02.06.12.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 12:30:42 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Fix build with autoconf-2.70+
Date: Sat,  6 Feb 2021 12:30:40 -0800
Message-Id: <20210206203040.2058216-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-with-linux-input-handling-with-upco.patch | 58 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb  |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-configure.ac-fix-with-linux-input-handling-with-upco.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure.ac-fix-with-linux-input-handling-with-upco.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure.ac-fix-with-linux-input-handling-with-upco.patch
new file mode 100644
index 0000000000..7e12487c7b
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure.ac-fix-with-linux-input-handling-with-upco.patch
@@ -0,0 +1,58 @@
+From 1b66e4cca6d95f4607599bcbdd4afeb601aee84e Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Sun, 25 Oct 2020 18:09:21 +0000
+Subject: [PATCH] configure.ac: fix `--with-linux-input` handling with upcoming autoconf-2.70
+
+Upcoming autoconf-2.70 exposes deficiency in configure.ac:
+
+```
+$ autoconf-2.70_beta2 && ./configure --host=x86_64-pc-linux-gnu
+./configure: line 1430: 5: Bad file descriptor
+checking whether  is declared... ./configure: line 1432: ${+y}: bad
+```
+
+It happens because macros are called with parameters using insufficient quoting.
+
+More details at https://lists.gnu.org/archive/html/bug-autoconf/2020-10/msg00027.html
+
+The fix only amends `--with-linux-input`. Other cases of underquoting
+will need to be handled separately.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/cebeb90a87105cd6e35bcb357d53cc04c828ca21]
+Fix-by: Zack Weinberg
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+---
+ configure.ac | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6e2c193..afbcdd8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2138,15 +2138,14 @@ fi
+ AC_ARG_WITH(linux-input, [  --without-linux-input   don't build linux input event controller module])
+ 
+ have_linux_input="no (linux input support disabled)"
+-if test "x$with_linux_input" != "xno"; then
+-  AC_CHECK_HEADER(linux/input.h,
+-	AC_CHECK_DECL(KEY_OK,
+-		have_linux_input=yes,
+-		have_linux_input="no (needs Linux 2.6)",
+-		[#include <linux/input.h>]))
+-fi
+-
+-AM_CONDITIONAL(HAVE_LINUX_INPUT, test "x$have_linux_input" = xyes)
++AS_IF([test "x$with_linux_input" != "xno"],
++  [AC_CHECK_HEADER([linux/input.h],
++    [AC_CHECK_DECL([KEY_OK],
++                   [have_linux_input=yes],
++                   [have_linux_input="no (needs Linux 2.6)"],
++                   [#include <linux/input.h>])])])
++
++AM_CONDITIONAL([HAVE_LINUX_INPUT], [test "x$have_linux_input" = xyes])
+ 
+ 
+ ###############################
+-- 
+2.30.0
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
index aec1ebf7b2..070ed1904b 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
@@ -37,7 +37,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SHPV = "${@gnome_verdir("${PV}")}"
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
+           file://0001-configure.ac-fix-with-linux-input-handling-with-upco.patch \
+          "
 SRC_URI[sha256sum] = "2db84b57f3778d80b3466d7c21a21d22e315c7b062de2883cbaaeda9a0f618bb"
 
 EXTRA_OECONF = "--disable-python \
-- 
2.30.0

