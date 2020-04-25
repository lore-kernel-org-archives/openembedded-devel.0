Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.603.1587839539209133240
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 11:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pCVbZbzV;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id q18so6303330pgm.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 11:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uWGSXlYYrB5u6vsb40lYecW56JjW86ZXRL9c3OWJBI0=;
        b=pCVbZbzVKRVZeINcUwTM8BP1HJJ53Of0g8C5wTVoBH268WJrEa6KIszRohXzMd/XTK
         ti3RlvQyQs5wyjCZSvC6XbZMV14ylBx1K7ReV+7/K1ZBzJbBnsbKgYHvoSb0mQaAp4cR
         fM8qccmOHWzvypWeb390COwRWsD+NtnWXmL2kMaEpUemZdD89HcwBVXLAQNDy6MBqJ6A
         JExAevd8ua3gEKsTyTztjZ4+bxt9AnmMbnkchO3oKpZT8lKskVyyL8u5XUxIq6MSjpln
         iJ38uMiZCegMG+2wPyc2h4T5KOSZLv2qGEnWcAlU7t4Ehp+wIzFTrMp4/1boLQTjQiaO
         Wm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uWGSXlYYrB5u6vsb40lYecW56JjW86ZXRL9c3OWJBI0=;
        b=dEkIKR0pQvYtXYTwd8T6PXZeojBA/kBm3ZPHcxxIUjX52sRqI2n2E/yMAjjM2f2Q8i
         6SNpOyiRge6uZ6kAf5pQiuQ3l66f0BLF22F1W3+yjo7uzdLoLUQWSJj1VR+SrRnWmnLf
         BM15+ALlyMG7v4G+eAITfbADDnppzbscbZ+5CFRc+tk+8tsZLIXA+nNxGI1iDNZ2dtSn
         mD+RHeuRlT0DU3Vja/v7ND5Ls+1DrpJo0WP6xLzkfcw/YSDEiWvk+3F9faEVD5N4OKwi
         vqR84TbJXmIKmcNPWe5NVLiQU4WZCwdZaDTVIAyJUkyc7YuIFfHLNWZJm/2kwZ/nTJNS
         YmAw==
X-Gm-Message-State: AGi0Pubu/rNPa0aRi3Yb/hXBSR4/Vj2NRlAVj+zN1mGwq77wSGm4pKvL
	rWWi52erD0Z3QDM2dg/CXf69Bo5uQCM=
X-Google-Smtp-Source: APiQypIBOXO7Zj4TOZDikaWZc8MsY+AVH3EKuKRCr6tMxt4pki5WK/op+TPCBtccVHbv7bEFhrl2mg==
X-Received: by 2002:a62:1a53:: with SMTP id a80mr848617pfa.157.1587839538068;
        Sat, 25 Apr 2020 11:32:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id q64sm8474801pfc.112.2020.04.25.11.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 11:32:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tslib: Fix build with 4.x kernel headers
Date: Sat, 25 Apr 2020 11:32:15 -0700
Message-Id: <20200425183215.1084813-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
    | ../../tslib-1.21/tools/ts_uinput.c:337:15: error: 'struct input_event' has no member named 'input_event_usec'
    |   337 |    data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
    |       |               ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-with-input_event_sec-for-old-kernel.patch | 30 +++++++++++++++++++
 meta-oe/recipes-graphics/tslib/tslib_1.21.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch

diff --git a/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch b/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch
new file mode 100644
index 0000000000..ea8a9e5651
--- /dev/null
+++ b/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch
@@ -0,0 +1,30 @@
+From 050bf24c16e95f63a76e13156346a072035d45b4 Mon Sep 17 00:00:00 2001
+From: Evan Harvey <evanwork1234@gmail.com>
+Date: Thu, 19 Mar 2020 01:32:03 -0700
+Subject: [PATCH] Fix build error with input_event_sec for old kernel
+
+Upstream-Status: Backport [https://github.com/libts/tslib/commit/050bf24c16e95f63a76e13156346a072035d45b4]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/ts_uinput.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tools/ts_uinput.c b/tools/ts_uinput.c
+index 1832a07..9c40bb3 100644
+--- a/tools/ts_uinput.c
++++ b/tools/ts_uinput.c
+@@ -51,6 +51,11 @@
+ #include <linux/fb.h>
+ #endif
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #define RESET   "\033[0m"
+ #define RED     "\033[31m"
+ #define GREEN   "\033[32m"
+-- 
+2.26.2
+
diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.21.bb b/meta-oe/recipes-graphics/tslib/tslib_1.21.bb
index bb28ee410c..76c4231441 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.21.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.21.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.xz;downloadfilename=tslib-${PV}.tar.xz \
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           file://0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch \
            file://ts.conf \
            file://tslib.sh \
 "
-- 
2.26.2

