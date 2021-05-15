Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.594.1621121957563543457
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c62Oy64G;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r11so2585680edt.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kpIslyrjDdkc4jAiDU69sZh1antRHQByik9F7zSonOc=;
        b=c62Oy64GYDUtfQAcmqDARFZlrfp0QKFaSxjSAm9sZ6bCdtRSTjXN+R/RemFvkoa7iI
         rv2itqnu6bH8pvB3qZQPV6K4YHe6FMqElIuCeaqWYEcUJxi/AOiBWFQXsRpqqWUa9Phf
         9roiPAXW0RDcUhqtze945Tcw1shQl5smT1JizJqMVwFvYGTE8SwtxSTEyetuFsukRD3r
         jlf+wkle4kZV4mXjDN8Et4I2d2XrhZsYzwPA7wRpKhc3xA1tycWr5Wwj3cNC2aF1Gf0k
         uEi1IydkHLUG7CvikTJ7i7imHu77fVPV+9Def3m5Suhi2Iafon1cf7tiUPTFFJ5Qkowl
         WHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kpIslyrjDdkc4jAiDU69sZh1antRHQByik9F7zSonOc=;
        b=ReFhxeUgSuO1OtA5uZGjWnkoBttv8zM/81kF54gMncVprPLQ1pVwEM9rxSr/gXKPxf
         z/RM3dOLplQOnd3g6HXuXr4x6H5ZEtaC6CFAf/HdRQDAQ+5gV91l7Yaz0BHzAKYlaZme
         KrfGlz6Jf3PuycwyGjSQnwYHUOT3ZYTfxDiaUNo2wqYj4CKIwPtfs0eajSbSl2hJS6u/
         FU0cwt9z38KODlDgc5CV6rFeqT0SKDiifxJIhzSPhGZ7EUAMDrlkzKkjgmMJ9Z26gZrK
         4+l2KsWykKGePnraxZ424JAXsdJWIYD/buZAWebbqQaoaGlvdthr3s35j9jQz84XF0kT
         07xg==
X-Gm-Message-State: AOAM531RcMzJq8V3Se+1+UkZt1tjbdjZovcfi9QcFybOtAd9AcqiZ8DA
	n5VcDCf6tTD5npQZMbVZVhHy1TxgKqU=
X-Google-Smtp-Source: ABdhPJzRX+VbRjzKlL0+dhqRFnnExO2JgtrDyjdNUG3gSDfl0HCq0Px4onsRW0FmBdDEBXvm4wsM4g==
X-Received: by 2002:a05:6402:4314:: with SMTP id m20mr64047026edc.387.1621121956148;
        Sat, 15 May 2021 16:39:16 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:15 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/20] gimp: upgrade 2.10.22 -> 2.10.24
Date: Sun, 16 May 2021 01:38:47 +0200
Message-Id: <20210515233853.583490-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backported patch can go

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-with-linux-input-handling-with-upco.patch | 58 -------------------
 .../gimp/{gimp_2.10.22.bb => gimp_2.10.24.bb} |  6 +-
 2 files changed, 2 insertions(+), 62 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-configure.ac-fix-with-linux-input-handling-with-upco.patch
 rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.22.bb => gimp_2.10.24.bb} (90%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure.ac-fix-with-linux-input-handling-with-upco.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure.ac-fix-with-linux-input-handling-with-upco.patch
deleted file mode 100644
index 7e12487c7..000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure.ac-fix-with-linux-input-handling-with-upco.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 1b66e4cca6d95f4607599bcbdd4afeb601aee84e Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Sun, 25 Oct 2020 18:09:21 +0000
-Subject: [PATCH] configure.ac: fix `--with-linux-input` handling with upcoming autoconf-2.70
-
-Upcoming autoconf-2.70 exposes deficiency in configure.ac:
-
-```
-$ autoconf-2.70_beta2 && ./configure --host=x86_64-pc-linux-gnu
-./configure: line 1430: 5: Bad file descriptor
-checking whether  is declared... ./configure: line 1432: ${+y}: bad
-```
-
-It happens because macros are called with parameters using insufficient quoting.
-
-More details at https://lists.gnu.org/archive/html/bug-autoconf/2020-10/msg00027.html
-
-The fix only amends `--with-linux-input`. Other cases of underquoting
-will need to be handled separately.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/cebeb90a87105cd6e35bcb357d53cc04c828ca21]
-Fix-by: Zack Weinberg
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
----
- configure.ac | 17 ++++++++---------
- 1 file changed, 8 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6e2c193..afbcdd8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2138,15 +2138,14 @@ fi
- AC_ARG_WITH(linux-input, [  --without-linux-input   don't build linux input event controller module])
- 
- have_linux_input="no (linux input support disabled)"
--if test "x$with_linux_input" != "xno"; then
--  AC_CHECK_HEADER(linux/input.h,
--	AC_CHECK_DECL(KEY_OK,
--		have_linux_input=yes,
--		have_linux_input="no (needs Linux 2.6)",
--		[#include <linux/input.h>]))
--fi
--
--AM_CONDITIONAL(HAVE_LINUX_INPUT, test "x$have_linux_input" = xyes)
-+AS_IF([test "x$with_linux_input" != "xno"],
-+  [AC_CHECK_HEADER([linux/input.h],
-+    [AC_CHECK_DECL([KEY_OK],
-+                   [have_linux_input=yes],
-+                   [have_linux_input="no (needs Linux 2.6)"],
-+                   [#include <linux/input.h>])])])
-+
-+AM_CONDITIONAL([HAVE_LINUX_INPUT], [test "x$have_linux_input" = xyes])
- 
- 
- ###############################
--- 
-2.30.0
-
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
similarity index 90%
rename from meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
index 717716e1f..237d08a09 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.24.bb
@@ -43,10 +43,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SHPV = "${@gnome_verdir("${PV}")}"
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
-           file://0001-configure.ac-fix-with-linux-input-handling-with-upco.patch \
-          "
-SRC_URI[sha256sum] = "2db84b57f3778d80b3466d7c21a21d22e315c7b062de2883cbaaeda9a0f618bb"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "bd1bb762368c0dd3175cf05006812dd676949c3707e21f4e6857435cb435989e"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.31.1

