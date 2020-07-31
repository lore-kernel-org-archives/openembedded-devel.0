Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.7929.1596153624605589216
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 17:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J7HVFfZE;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id o23so2252914ejr.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 17:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0HXH6lAfTEI/qNMaILmzziNQBGtWmyZ0U//tDyzluJc=;
        b=J7HVFfZETWypQXf4vT1VZHylAi8PSNYnImYbRrSCRojx2NMhlA3XvAzsdMxjeUAF8s
         aVV0n2O4MBd39UazngolqqNTEumQzTIgrEnDWJnqB2CAPeReQYLXkg4euoM2L76Q2kjQ
         h6Bl2Z/lIjoxeYL7Z6IAfthwCdRA6vG9JGwx/AEeMGGrJiRWOVWvAuX5wEXknNgN9E/R
         FdgKfWTEZprAnFw3YzVIoxM4A+TlYdj+xhNXNFL9KUIaucCXHV4OE2vOM2ZYrQbNh0w9
         S+gS6pNYu/ksjubZXSrXpndnl031IeNGxLzb7uJnBoC3gXqJhqlKr8as7gW4PCtFcNOd
         ONGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HXH6lAfTEI/qNMaILmzziNQBGtWmyZ0U//tDyzluJc=;
        b=nzjtQY5I2T6lfcsRmUspmKTrXEgp3ol943ENuud19K+fR5LILP8qgW9rSSL09Zw8x2
         LGHy0JJlYsqR3Z229RaD4k2L9/QtYwNVlrLFGMjBjQoH2vS89EIXdEc+x1yiC3820WF3
         HKkxFb32WNbsAQ6RzBwWWYpuZzPKh/CZvAw3xL24OIR8+SrLhxQfzOQftbLg8c9yu8ZQ
         sr1wVuP87dl1scABOOZFcxfgOnQcdAKpDl63onkRKdlrCkM9Rj3ZINrJAkvU8QQrqKe0
         ekqvgFPLgMmW4ZReEGwYPABCoTe7hNXS+U6UiFG0A4EvyCnnvay8U4BxcZZShwWtveI/
         9IMQ==
X-Gm-Message-State: AOAM531LBx5qgR8zX4Ll7MeJsCVWbryq0iIUBPKWH7k1EaW3Vb+jGdc5
	6r11k3t2AEDJDYk5X2TTGYjIo1bs
X-Google-Smtp-Source: ABdhPJyb6ptsRo6ndudIShPgxMufaGxk8U9VEoEO6YWOBpDQtuY2OXRyyoH5uw02Jdwj67ouLXbu0w==
X-Received: by 2002:a17:906:7f05:: with SMTP id d5mr1531290ejr.122.1596153622728;
        Thu, 30 Jul 2020 17:00:22 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f120620ff8937d1a8714aa4.dip0.t-ipconnect.de. [2003:f0:7f12:620:ff89:37d1:a871:4aa4])
        by smtp.gmail.com with ESMTPSA id a19sm7687997ejg.116.2020.07.30.17.00.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 17:00:22 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] poppler: upgrade 0.89.0 -> 0.90.1
Date: Fri, 31 Jul 2020 02:00:05 +0200
Message-Id: <20200731000007.452878-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200731000007.452878-1-schnitzeltony@gmail.com>
References: <20200731000007.452878-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release 0.90.1:
core:
 * Fix regression on PS conversion.
   Regression only happened on applications that are locale enabled
   i.e. Okular but not pdftops, when using a quite new lcms and
   the user locale uses , as decimal separator instead of .
 * Add UTF16LE support to TextStringToUCS4.
   Even if the standard clearly says it should be UTF16BE

Release 0.90.0:
core:
 * Color profile tweaks
 * Small signature improvements
 * BBoxOutputDev: Fix calculation when type3 fonts are involved
 * Fix potential crash when reading Forms
 * Fix infinite loop in broken file

glib:
 * Fix adding annots in rotated pages
 * Add ability to reset forms
 * Several fixes to the documentation

qt5:
 * Make it clear we require Qt 5.5
 * demo: Fix crash on broken files
 * Small documentation improvements

utils:
 * pdftoppm: Add option to set display profile
 * pdftops: Add a -rasterize option with values always, never, or whenneeded

build system:
 * Require cmake 3.5
 * More modern cmake way to link against curl

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../poppler/poppler/basename-include.patch               | 9 ++++++---
 .../poppler/{poppler_0.89.0.bb => poppler_0.90.1.bb}     | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.89.0.bb => poppler_0.90.1.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler/basename-include.patch b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
index 3d6d7a8f1..4a18ba350 100644
--- a/meta-oe/recipes-support/poppler/poppler/basename-include.patch
+++ b/meta-oe/recipes-support/poppler/poppler/basename-include.patch
@@ -5,6 +5,9 @@ Subject: [PATCH 3/3] Minic GNU basename() API for non-glibc library e.g. musl
 
 Upstream-Status: Pending
 
+Rework for poppler 0.90.1
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
 ---
@@ -12,7 +15,7 @@ Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/goo/gbasename.cc b/goo/gbasename.cc
-index 830c1c80..e93eb368 100644
+index 69236d8..3858415 100644
 --- a/goo/gbasename.cc
 +++ b/goo/gbasename.cc
 @@ -46,6 +46,10 @@
@@ -23,9 +26,9 @@ index 830c1c80..e93eb368 100644
 +#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
 +#endif
 +
- std::string gbasename(const char* filename)
+ std::string gbasename(const char *filename)
  {
  #ifdef _MSC_VER
 -- 
-2.17.0
+2.21.3
 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.89.0.bb b/meta-oe/recipes-support/poppler/poppler_0.90.1.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.89.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.90.1.bb
index f8b7c075a..bb5a782ae 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.89.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.90.1.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "92ac57f60ae8c3a1f8bfe01c9530b7b5"
-SRC_URI[sha256sum] = "fba230364537782cc5d43b08d693ef69c36586286349683c7b127156a8ef9b5c"
+SRC_URI[md5sum] = "b80a82f14459d31d929db421b0e8cf05"
+SRC_URI[sha256sum] = "984d82e72e91418d280885298c8bdc855a2fd92665fd52a1345b27235e0c71c4"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.26.2

