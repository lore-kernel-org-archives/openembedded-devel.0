Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.7665.1604186354707492573
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Oct 2020 16:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cw5akUUb;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id w65so8015701pfd.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2020 16:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SzE0m9xNGakZ+KMN0lmdghPHdsMGiqHGPHckTMVOhes=;
        b=cw5akUUb2iNNfA6zhuy+n5WLLmW2IiERkZaObGspW/W9BQXO+2UgISdojrQdYQkJdf
         K7zS+lSlGwVKHIBHndzHTTmH9ULHnpxmzzY/pX0VGXrL/rCCA67zegujwekQYrzvsCTf
         nhkrLvyfx5nDxl7WoVkpcYG9KeC6l74HzNHGHg63T7aXq9OguMBJK314USuKpeKd6hhO
         2tKraY6UdsQc/mcvCkdMdjTK6YgRv0QNeEtwoEkp7R4selfZ0Q9twun+/U88wTkDxeQH
         f2ra6e+1Syi/jBPrW7BM/h1FKM941D6c6DarlvDHbncMJEgMZBLfi5TuYWdgb2wHdmYq
         LQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SzE0m9xNGakZ+KMN0lmdghPHdsMGiqHGPHckTMVOhes=;
        b=HG2bQbP38igKFN/fTArsdFsTlUwZub+cVyHYZRaWIFxYyJX/NsfXXRTzLE1SM8BQvo
         xjhmX3xcv0lNJP5V/x7dY2p4aVPyYyWoA15gam/XSt6Lp+SuZQd3B0XVJJeXutKDAc25
         H/0R7XGTVVaDetFjhE6b7Oz4tmnjqxffycjMW1gM0BEgIC7ttuzk/BoUcUEas8MdWlPk
         H93Z1903Gp9MbKSAAER9M5OxNNPJ6psGYwxQvryXP+SZFkIiqv5Z8hpGwcbJS0cRMjqP
         0sRVflNVlRrOegAIzfb4p6vB0ne9EWS8gzfvOlv9gkyp911X+gvTEZyidjzwZ3KHXRah
         02Kw==
X-Gm-Message-State: AOAM5318qG0UhpwJ8bFP7dCtl6sBrVVetlG9Dxw+oAVAemeDDiKEPhP5
	al7c+ss4GTklAK7Kdp9JCBaDK0YTvd9WIA==
X-Google-Smtp-Source: ABdhPJyfcSQ+zpfD4SAlxEWqp1gjF3LUPQJhKta89angZGH95/BgshLWE1RxBRUFnpMENM5ITkp0eA==
X-Received: by 2002:a62:768e:0:b029:18a:d54d:3921 with SMTP id r136-20020a62768e0000b029018ad54d3921mr1923230pfc.31.1604186353857;
        Sat, 31 Oct 2020 16:19:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id e15sm9465369pff.121.2020.10.31.16.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 16:19:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gperftools: Fix build with new musl updates
Date: Sat, 31 Oct 2020 16:19:10 -0700
Message-Id: <20201031231910.3407505-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Latest musl shows build failures e.g.
../git/src/profile-handler.cc:275:8: error: no member named '_sigev_un' in 'sigevent'
  sevp._sigev_un._tid = sys_gettid();
  ~~~~ ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dler-Specify-libc-specific-thread_id.patch | 38 +++++++++++++++++++
 .../gperftools/gperftools_2.8.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-profile-handler-Specify-libc-specific-thread_id.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-profile-handler-Specify-libc-specific-thread_id.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-profile-handler-Specify-libc-specific-thread_id.patch
new file mode 100644
index 0000000000..4029a69c5c
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-profile-handler-Specify-libc-specific-thread_id.patch
@@ -0,0 +1,38 @@
+From 0a504852ed6e56620d1df26b503c4aa2b5b74760 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Oct 2020 16:12:36 -0700
+Subject: [PATCH] profile-handler: Specify libc specific thread_id
+
+We need to know internal _sigev_un is glibc specific, add an else for
+musl case
+
+Fixes build issue
+../git/src/profile-handler.cc:275:8: error: no member named '_sigev_un' in 'sigevent'
+  sevp._sigev_un._tid = sys_gettid();
+  ~~~~ ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/profile-handler.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/profile-handler.cc b/src/profile-handler.cc
+index 7fdcb69..5867118 100644
+--- a/src/profile-handler.cc
++++ b/src/profile-handler.cc
+@@ -272,7 +272,11 @@ static void StartLinuxThreadTimer(int timer_type, int signal_number,
+   struct itimerspec its;
+   memset(&sevp, 0, sizeof(sevp));
+   sevp.sigev_notify = SIGEV_THREAD_ID;
++#ifdef __GLIBC__
+   sevp._sigev_un._tid = sys_gettid();
++#else
++  sevp.sigev_notify_thread_id = sys_gettid();
++#endif
+   sevp.sigev_signo = signal_number;
+   clockid_t clock = CLOCK_THREAD_CPUTIME_ID;
+   if (timer_type == ITIMER_REAL) {
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.8.bb b/meta-oe/recipes-support/gperftools/gperftools_2.8.bb
index 662777b473..d9b310bceb 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.8.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.8.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch \
            file://disable_libunwind_aarch64.patch \
            file://sgidef.patch \
+           file://0001-profile-handler-Specify-libc-specific-thread_id.patch \
            "
 
 inherit autotools
-- 
2.29.2

