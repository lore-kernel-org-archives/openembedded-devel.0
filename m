Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.34938.1622399680729462942
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tdSwJm0L;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id x188so7325336pfd.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KT8tvq4aXzY17zX4uAqgRNfUHPX/4ZjWo6opcQswXnA=;
        b=tdSwJm0Lc3A+AMn1+NE6yfjr5p7pxhjq0jhbjvXCGAialZiTYk32ytZM6+AMDIIBE8
         IKBRw6Nbc2iSYlRp8sup9bE4iA4PQlrJVevNhTD54f8Y5Obpi84DTXWjkqIpIUTKz+KE
         OGAQSu7hOR8jCuaTcRamoS4h2wfd6hxiZ+D4OYEiKjsD+hoWpdbzf/C22+J9SeZ3HonH
         ocVSZi+tdwlV4IkCJ442WEVI5sRkAxI7KpLIkXoEO0tV6LGeqwk8MHGf8ZzEtMylGh1d
         9bwzB/JZS9WiAX7rV78uXPMRxp/7qVZHbUEjB0KXwGJZ51lTZ+wsKbEAG0wFKHxywrkf
         vWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KT8tvq4aXzY17zX4uAqgRNfUHPX/4ZjWo6opcQswXnA=;
        b=QECx5q8H8JEiZkx25L1SP/3genNfWlj0tCLYtBkMg2CyBJXwWZm2oKDVXjHxkQaKvS
         eLZDxXLd1gKFQ4seiL1JKXZ92LF0oigKMjjUN7s0koGE+RcnPUYi9gNzGMBt+D24oaGW
         TWLztiOP5D43LZGLSAG6XwkPAPJAPF35MzVvIHiOFZkKX9Lo27tOs5JV7PwUernsgdHf
         CV25Fdqgfk4omFK0MYTB+Yf7ljr52lnw1UIpTleTbEjxDvBc9H+WSX5dM+AE9uQDV45n
         pCjJzo9B2bSkgHcBp3VDjem2WlDFzvnXfyBZrPIjHDwrvc5O4tLiDYKuwLdFNaQccF6J
         oYtw==
X-Gm-Message-State: AOAM533hHB3nkcI9Sc0HU6We0qaqlUifcZRNYbui8fD0/RXD4I8GKfS1
	Ldm7pHU2+dn8dTsYtBx24ans20bbtzU/WA==
X-Google-Smtp-Source: ABdhPJx9sonaic1qHCF9S8Q2XPiNRLaBK0L3REqZASQEW5eBZbiG1lZzWRbu92tJp8V4nzR2Dptwow==
X-Received: by 2002:a63:7945:: with SMTP id u66mr7318474pgc.200.1622399680133;
        Sun, 30 May 2021 11:34:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:39 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/12] libsdl: Fix CVE-2019-13616
Date: Sun, 30 May 2021 11:34:18 -0700
Message-Id: <9d50b9f99509147613bfcee420b1718cd856c390.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

  References
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13616

  SDL (Simple DirectMedia Layer) through 1.2.15 and 2.x through 2.0.9 has a heap-based buffer over-read
  in BlitNtoN in video/SDL_blit_N.c when called from SDL_SoftBlit in video/SDL_blit.c.

  Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/97fefd050976bbbfca9608499f6a7d9fb86e70db]
  CVE: CVE-2019-13616

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libsdl/libsdl-1.2.15/CVE-2019-13616.patch | 27 +++++++++++++++++++
 .../recipes-graphics/libsdl/libsdl_1.2.15.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
new file mode 100644
index 0000000000..2db67966cf
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-13616.patch
@@ -0,0 +1,27 @@
+From 97fefd050976bbbfca9608499f6a7d9fb86e70db Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Tue, 30 Jul 2019 11:00:00 -0700
+Subject: [PATCH] Fixed bug 4538 - validate image size when loading BMP files
+---
+ src/video/SDL_bmp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/video/SDL_bmp.c b/src/video/SDL_bmp.c
+index 8eadc5f..5b5e12c 100644
+--- a/src/video/SDL_bmp.c
++++ b/src/video/SDL_bmp.c
+@@ -143,6 +143,11 @@ SDL_Surface * SDL_LoadBMP_RW (SDL_RWops *src, int freesrc)
+ 	(void) biYPelsPerMeter;
+ 	(void) biClrImportant;
+ 
++        if (biWidth <= 0 || biHeight == 0) {
++            SDL_SetError("BMP file with bad dimensions (%dx%d)", biWidth, biHeight);
++            was_error = SDL_TRUE;
++            goto done;
++        }
+ 	if (biHeight < 0) {
+ 		topDown = SDL_TRUE;
+ 		biHeight = -biHeight;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 7a01908322..d91a1856b4 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://CVE-2019-7637.patch \
            file://CVE-2019-7638.patch \
            file://CVE-2019-7576.patch \
+           file://CVE-2019-13616.patch \
           "
 
 UPSTREAM_CHECK_REGEX = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.1

