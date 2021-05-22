Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.1841.1621647339093505069
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lm2tanaU;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id b17so25316066ede.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S0Q4hKAcOuT+mjYi9s1Y34Aerg0DUnbqooz1Aj69mFg=;
        b=Lm2tanaULFwqqkkn8gtz246uGZMsNY5hF/uR6uo0Y8dw84XDKi5JWYJF6wZtkM029T
         KxK9HbPvcb22UdpNIg+j7PaLmjG5C3b1ub1gIjsFqybY696GwfQ5K6Qc/BiGOcq3YYvO
         OH/2B2W58KGeykdfZGV9f+qXK/H38q9WqK8bEyCiING2uSwkVzFQDeS1YY+OhkoFGHy4
         vZGVjx1T6aTjAxiw/cQbj9PORe8kYSJ5N5Elb612ylHszkbuLJ7ERRxGR5TyOOFxE8jJ
         ly/v8S+wlNeXJ1kz9g/JEmF4mFYgbIauD17sHNA6QgXz+doCYP1teJQhoZbdr/sJjJTk
         B5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S0Q4hKAcOuT+mjYi9s1Y34Aerg0DUnbqooz1Aj69mFg=;
        b=EH8cZ8VBa3gUkGXvZh1eimuotueaTCNvFlGjisOqKRyF3v1SN8Wanr0232Lv54RUCp
         r4BjXOCNMWN1HWdEs5vJu/PqzoPdD+Q+fM7y0UduLh1PGUDTu0CCRArMQ8kPljgABBSa
         zOZNzpg8kDfCrbQGd1Xr0rVaDyF9hcUpbXgC4PND2qFRnwKetATJegfcmYTRrMNxH+FZ
         qNH3KnKlamXGwBhtKG8R2L0h9vjTFG99KXAhW/uLKt7jnH2kaHX+c4dXfP82kLnerKSn
         qi7JQAEkDyD1J6fhDYeh3lhKP+YjhcqBcoVvAstIKs3+XnjaMu1FaAwyJB8gumz2puO8
         rXoQ==
X-Gm-Message-State: AOAM531t3JB+A0DPqnOEKYrLp8GtQrajwR24cO+gUHMYIQDD1IPRDhlq
	datM12EenfA5RwwS8/w7p+0UjKZDCjU=
X-Google-Smtp-Source: ABdhPJzUSgbFjeT9FoHjwbRsYzU4c342/zqo8ZyIGQObiM+U1e/npLxw3rkJpaiwwK1ltOoM0EptBA==
X-Received: by 2002:a05:6402:896:: with SMTP id e22mr14088103edy.256.1621647337736;
        Fri, 21 May 2021 18:35:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:37 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/17] libpeas: upgrade 1.26.0 -> 1.30.0
Date: Sat, 22 May 2021 03:35:13 +0200
Message-Id: <20210522013521.588774-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(Identical) patches have been applied upstream

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ts-when-introspection-is-disabled-mi.patch | 36 -------------------
 .../libpeas/add_missing_locale_include.patch  | 21 -----------
 .../{libpeas_1.26.0.bb => libpeas_1.30.0.bb}  |  8 +----
 3 files changed, 1 insertion(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch
 delete mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/add_missing_locale_include.patch
 rename meta-oe/recipes-gnome/libpeas/{libpeas_1.26.0.bb => libpeas_1.30.0.bb} (70%)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch b/meta-oe/recipes-gnome/libpeas/libpeas/0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch
deleted file mode 100644
index 86586fe71..000000000
--- a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 53a4f19887d9ae4e77f32dd6d71c8a7b516b4d5d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 10 Aug 2020 21:53:33 +0200
-Subject: [PATCH] Do not build tests when introspection is disabled/missing
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-| ../libpeas-1.26.0/tests/libpeas/introspection/meson.build:47:0: ERROR: Unknown variable "libpeas_gir".
-
-Upstrem-Status: Submitted[https://gitlab.gnome.org/GNOME/libpeas/-/merge_requests/28]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- meson.build | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 8322fea..43fb062 100644
---- a/meson.build
-+++ b/meson.build
-@@ -254,7 +254,9 @@ subdir('loaders')
- if build_demos == true
-   subdir('peas-demo')
- endif
--subdir('tests')
-+if generate_gir == true
-+  subdir('tests')
-+endif
- 
- summary = [
-   '',
--- 
-2.26.2
-
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/add_missing_locale_include.patch b/meta-oe/recipes-gnome/libpeas/libpeas/add_missing_locale_include.patch
deleted file mode 100644
index 664693128..000000000
--- a/meta-oe/recipes-gnome/libpeas/libpeas/add_missing_locale_include.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From 3cc69f1eaa86163c3816265fa64cb660f4def364 Mon Sep 17 00:00:00 2001
-From: Christian Hergert <chergert@redhat.com>
-Date: Fri, 13 Mar 2020 10:32:21 -0700
-Subject: [PATCH] demo: add missing locale.h include
-
-Fixes #39
-
-Upstream-Status: backport
-
-diff --git a/peas-demo/peas-demo.c b/peas-demo/peas-demo.c
-index 47ac005..466a392 100644
---- a/peas-demo/peas-demo.c
-+++ b/peas-demo/peas-demo.c
-@@ -26,6 +26,7 @@
- #include <girepository.h>
- #include <glib/gi18n.h>
- #include <gtk/gtk.h>
-+#include <locale.h>
- 
- #include <libpeas/peas.h>
- #include <libpeas-gtk/peas-gtk.h>
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb
similarity index 70%
rename from meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
rename to meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb
index fd4ce7de5..316a92784 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.30.0.bb
@@ -12,13 +12,7 @@ inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI += " \
-    file://add_missing_locale_include.patch \
-    file://0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch \
-"
-
-SRC_URI[archive.md5sum] = "f7723bf8433b7984121157e1e9a629b5"
-SRC_URI[archive.sha256sum] = "a976d77e20496479a8e955e6a38fb0e5c5de89cf64d9f44e75c2213ee14f7376"
+SRC_URI[archive.sha256sum] = "0bf5562e9bfc0382a9dcb81f64340787542568762a3a367d9d90f6185898b9a3"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
 
-- 
2.31.1

