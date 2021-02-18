Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.2128.1613618683173405651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JvKBMCUg;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id z15so352805pfc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 19:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rNUUVJYESYjgiN2Ib88lBaUkUgkfIf9ikrhb1H+aPfU=;
        b=JvKBMCUgFU62vqhRLxIynooYyrxf5u5IWfk+WumhwbvVSxNPfJ1KmWCk+GORLb6+En
         ZkDFuqaywzxpx6xPlEp4av57mUSpzq0ZIUwTl3pciVILvurCNzIHlkHN0N7lEIAnTay1
         7ajCLfH4O9Zwmr97xAdKJnOpZ+ABMT9T0FpI7LOwcBfLDB0TJTlIqMJMUQSf73oBkJxN
         IcOi/yPwkJWmKEZSMFy6rltdYU1vATzcWR95JRQ26WIQnRUlQ0dmQs7Plhm74gZDFo+6
         y9nPeNFXckytQNCDjoa1WMg45rPlnhqUvPIxfbq1iJXDDvgCGI4hg3GbgROZKdCDoytH
         /4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rNUUVJYESYjgiN2Ib88lBaUkUgkfIf9ikrhb1H+aPfU=;
        b=m8KS8kQwOG+zrfsn6AkEi1PbVEwAZdyxMYi5fyRjq4AX4JDjGUuXrlxO0AmGBpJWaA
         iJ4pTK++9klMHnBJPvmhTcV5cYV42IVzBsPIl6owICqhG/xwOi+s5Uq5QvIGPo8bDp7x
         ng8bFvQR8y8+DgTRnyOZi+yi1rSMBsvNJPnVA9ym3CW93kK+O3xG7aPUB6EchU5+hDIu
         5oa/JRpi7G4jA9Npj5Ke1YWKNY6WBZIp/BfLbsDFMmkpdegobJOcGQYmHyIC681ZCnn2
         sxKoGqJol+i6uGq2Vg2i/0EHo5bUWREauSvJ4ldG9XVYaQg0n/aeVNpHPuIiPcw0TH6j
         L6Ag==
X-Gm-Message-State: AOAM530ixEXJZoJAcX9quTHo1aqQsfDG9GE68Uw6IvbgAE7ypGQejfau
	QVKl8vjfVrOxDv1FItWY9DwKi7JoumxYMg==
X-Google-Smtp-Source: ABdhPJyUK6Op0M4IcvVxw6lbK3eJuwodJyqYsTDjNEZQKdWXyjxMMxIqCP4Z0IX7EjYq26II5rwKkw==
X-Received: by 2002:aa7:8d0d:0:b029:1d7:3c52:e1f6 with SMTP id j13-20020aa78d0d0000b02901d73c52e1f6mr2338870pfe.39.1613618682264;
        Wed, 17 Feb 2021 19:24:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id m15sm3943834pfh.94.2021.02.17.19.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 19:24:41 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] liburing: Do not build examples on risc/musl
Date: Wed, 17 Feb 2021 19:24:39 -0800
Message-Id: <20210218032439.3806260-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it needs ucontext for building examples and its not implemented yet for
riscv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../liburing/0001-do-not-build-examples.patch | 30 +++++++++++++++++++
 .../recipes-support/liburing/liburing_0.7.bb  |  7 ++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch b/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch
new file mode 100644
index 0000000000..19bf14708b
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0001-do-not-build-examples.patch
@@ -0,0 +1,30 @@
+From 3ee2f1e231bde18a99f86da747a9b8feca3c179d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 17 Feb 2021 19:18:16 -0800
+Subject: [PATCH] do not build examples
+
+examples need ucontext and some architectures on musl do not have it
+implemented e.g. riscv
+
+Upstream-Status: Inappropriate [Arch-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 948e004..8b63024 100644
+--- a/Makefile
++++ b/Makefile
+@@ -11,7 +11,6 @@ default: all
+ all:
+ 	@$(MAKE) -C src
+ 	@$(MAKE) -C test
+-	@$(MAKE) -C examples
+ 
+ partcheck: all
+ 	@echo "make partcheck => TODO add tests with out kernel support"
+-- 
+2.30.1
+
diff --git a/meta-oe/recipes-support/liburing/liburing_0.7.bb b/meta-oe/recipes-support/liburing/liburing_0.7.bb
index e122a907cd..d79389a696 100644
--- a/meta-oe/recipes-support/liburing/liburing_0.7.bb
+++ b/meta-oe/recipes-support/liburing/liburing_0.7.bb
@@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e
 SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
            file://0001-test-Fix-build-on-32bit-architectures-with-6bit-time.patch \
            "
+SRC_URI_append_libc-musl_riscv64 = " file://0001-do-not-build-examples.patch "
+SRC_URI_append_libc-musl_riscv32 = " file://0001-do-not-build-examples.patch "
+
 SRCREV = "45f0735219a615ae848033c47c7e2d85d101d43e"
 S = "${WORKDIR}/git"
 
@@ -20,7 +23,9 @@ XCFLAGS = "-pthread"
 XCFLAGS_append_libc-musl = " -lucontext"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'LDFLAGS=${LDFLAGS}' 'XCFLAGS=${XCFLAGS}' 'BUILDDIR=${S}'"
-
+do_configure() {
+    ${S}/configure --prefix=${prefix}
+}
 do_install () {
     oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
 }
-- 
2.30.1

