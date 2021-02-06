Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.1930.1612579621988733865
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 18:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rM1tc+Bp;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id m6so5583667pfk.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Feb 2021 18:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbl8h+e8yKGH3bsvaAeqB5isRHGF7I7Cgr1k8/HcKWM=;
        b=rM1tc+Bplp5MNMmRn8ZB70fGDpPvBPrz1EqZT//VuwpQCt7AHARUBFYSDjcZaL5/hK
         a1Qfw+I6FBoCHphStcH6RStoSne8RLyJZAfBwiX+9/taCNzcc+zS94WFhTYCjh8nVlD2
         E4Y1hvcis2JfE/IMxcKFikvCB8KJ0OMjlbUI4NSBdQP8wipjPFFxWCJCnxdhdIH65yPY
         as2y4RO2WKHFlRUd7ZnSujn6+CUZQ9FJ1bT8QhD2bRhty4mr7ssSB8D59LVj0V6K50FP
         tRriVLxUoBZa+1/cgnU30YrQ2U1eLwxPSeGVEWAXs7ADNNj3mjcszJCFvBzi4I8/nVuK
         sRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbl8h+e8yKGH3bsvaAeqB5isRHGF7I7Cgr1k8/HcKWM=;
        b=KJgYDGahAvTo2eI5Br1VOpu+0j7BM6cnvLv3tECTuRU4qJCjP+1F9WJ72cK+3/Ygxf
         fxWsV0aBG+fI5nzctNh0M3++ZYg6U4EILewY/5MGup0Y06yM4qxxFZpLTjShkqxYR5xQ
         RNx3mlJ507KaRBLdkqwflNvcYB+vmvCIiG5ruUttYgbOkzSsl2tRXf8CF6W9nMZG3R5M
         Cb3Uz8WQt+jdj3AeaYZKbcjFBCEXV+IZNbYe42cCEBx+IiZH8qojBjANs/HIZJtpiH2X
         0J3VN34KjaGIZycAIONfYNS97vtI0+aBcdTZcW7bH9e3/BRbpea67x3PP5eczfH7b3jW
         Unpw==
X-Gm-Message-State: AOAM531qRQC7ODG7iS/Iz8TSHqqVCjXE1v+IHO18tDL//tDUG6xjWiuW
	MReGr+wOyFh1HZHhB149mbb45qZsfYasNQ==
X-Google-Smtp-Source: ABdhPJyiKIpIueHCeN3P9tLrBgL8p+ZUo6GORjkV8B67YZWb+qNLxb00PfZEUmREzkSY8vo5EWy+ug==
X-Received: by 2002:a65:6405:: with SMTP id a5mr889271pgv.274.1612579621061;
        Fri, 05 Feb 2021 18:47:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id x4sm3104174pfm.64.2021.02.05.18.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 18:47:00 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] libmypaint: Fix build with autotools 2.70+
Date: Fri,  5 Feb 2021 18:46:58 -0800
Message-Id: <20210206024658.883850-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ake-build-compatible-w.-autoconf-2.7.patch | 32 +++++++++++++++++++
 .../recipes-gimp/mypaint/libmypaint_git.bb    |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gimp/mypaint/libmypaint/0001-make-build-compatible-w.-autoconf-2.7.patch

diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint/0001-make-build-compatible-w.-autoconf-2.7.patch b/meta-gnome/recipes-gimp/mypaint/libmypaint/0001-make-build-compatible-w.-autoconf-2.7.patch
new file mode 100644
index 0000000000..28e279438a
--- /dev/null
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint/0001-make-build-compatible-w.-autoconf-2.7.patch
@@ -0,0 +1,32 @@
+From 712a101c9aa2eb8548e4d0100a4a2eaf76fad164 Mon Sep 17 00:00:00 2001
+From: Jesper Lloyd <jpl.lloyd@gmail.com>
+Date: Wed, 20 Jan 2021 20:21:53 +0100
+Subject: [PATCH] make build compatible w. autoconf 2.7
+
+Workaround for stricter behaviour (due to a bugfix) in 2.7,
+which makes a failing intltoolize macro check fail the build.
+
+Fix provided by hosiet.
+
+Upstream-Status: Backport [https://github.com/mypaint/libmypaint/commit/a6bac154db018e1f1cc4dbddc34f6c8422c891fb]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 416d9fe..48b9d02 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -248,7 +248,7 @@ if test "x$enable_i18n" != "xno"; then
+   AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE",
+                      [The prefix for our gettext translation domains.])
+   AC_SUBST(GETTEXT_PACKAGE)
+-  IT_PROG_INTLTOOL
++IT_PROG_INTLTOOL
+   AM_GLIB_GNU_GETTEXT
+ 
+   dnl Debian: stdlib
+-- 
+2.30.0
+
diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
index 37d41780d2..e711a2a7fa 100644
--- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -12,7 +12,9 @@ DEPENDS = " \
 
 inherit autotools gobject-introspection gettext python3native
 
-SRC_URI = "git://github.com/mypaint/libmypaint.git;protocol=https;branch=libmypaint-v1"
+SRC_URI = "git://github.com/mypaint/libmypaint.git;protocol=https;branch=libmypaint-v1 \
+           file://0001-make-build-compatible-w.-autoconf-2.7.patch \
+          "
 SRCREV = "2768251dacce3939136c839aeca413f4aa4241d0"
 PV = "1.6.1"
 S = "${WORKDIR}/git"
-- 
2.30.0

