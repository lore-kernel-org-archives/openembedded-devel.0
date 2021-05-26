Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.6307.1622029982281239633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uKzlhDZW;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so186994pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kgXfEorCBwb2TlT0KonoGNkVqG1nuTicxr251Mr5RwE=;
        b=uKzlhDZWQStejBeSjI1/ct2HObF1AMOJiYNrAFu9JmOL/29a0pQT1newJ89EDOcdQW
         Ma/o2aL4/IGwqmlLPhFPvlru4NeY5kHiRK9PxEgSS97IJquBCOakWLwWcxgX19NLP5GG
         d+Oz3nJyW4CNprxncY8LrFYx4mYo+XYw0UW9AazEJetFhl1oBRwrgCx02oeEly86Q/Ew
         59ZUcgG0qhwkd541pwlLTldjFD+o3cw24+wXvDlpMJTUlM3m5TwydcZWAZf4HelR9MR1
         X/4+y8wKwTlrR80euldLn9hPvRIbgmBNJEGqgt3CqcqU2CU3rUiu1QNtbWOLspQJo3c+
         DSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kgXfEorCBwb2TlT0KonoGNkVqG1nuTicxr251Mr5RwE=;
        b=T8e8aCBifyvDpgySY0o6C5Pwius+9cEqDv7uKtMDZzfIw1LHqAgDG+qrW8L1z2DtdS
         22i72WBepxNM7ETzD+9Lqi+d830Czil4veq7QtRgxCEtc/Gxa/H3He2hCWQHE2r9/UZq
         nhmEoVCM+SGrcp6QM8nzvIJj8Mx95Z7PzSZc76gNOAv/nwsuHgF/WWUvi8YVRK9Nebl0
         moa6e+KmRmU05eiogB7p3sDoqatIZsmp7Ai87q2I+yiuDoSZsDZo1ZP8jVRIXkAB3TgR
         V5cwF4wOE9JyeO9gN+5NnesDsNipVofssoTY7mJyKXgt1QJYwOwILAaVggPgaNFGgZZm
         PXSA==
X-Gm-Message-State: AOAM5333wH2C11gUORjDGphUQK0dTvAb5JWoGEn+Ax0XkGBxFuGLpKcb
	tXSmtnK3yNqAS3OPADoOfuuPWWWNMVpT/w==
X-Google-Smtp-Source: ABdhPJx3IDGiugBmVUwlo99Ps0tk14EeudFbJuZQG09twwgcBRCHPvW0c+azBH81o//O9NbnwqptuA==
X-Received: by 2002:a17:902:7b85:b029:fb:c187:2bed with SMTP id w5-20020a1709027b85b02900fbc1872bedmr9687071pll.67.1622029981737;
        Wed, 26 May 2021 04:53:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:01 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 15/23] libsdl: Fix CVE-2019-13616
Date: Wed, 26 May 2021 04:52:30 -0700
Message-Id: <4210e9cb2abfdfc80b8ea045d269df425bef535f.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

  References
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-13616

  SDL (Simple DirectMedia Layer) through 1.2.15 and 2.x through 2.0.9 has a heap-based buffer over-read
  in BlitNtoN in video/SDL_blit_N.c when called from SDL_SoftBlit in video/SDL_blit.c.

  Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/97fefd050976bbbfca9608499f6a7d9fb86e70db]
  CVE: CVE-2019-13616

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 57ae91d2914de96b1de69bfcb089a427ee3cb0ed)
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

