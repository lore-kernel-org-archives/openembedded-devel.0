Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.1455.1597342376289194834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 11:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XOIYRWCr;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id h12so3210090pgm.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=brgNO9uDZDr0Zhxbw7GWbEn4NwvWnN/4qDVXzi80Fr4=;
        b=XOIYRWCr4taeU7g1+GzgU6sUGGSopnFDHp+Gel5RIs0EbIcgc5OsSDaZaR0TZFysKx
         4RIbr4NlL9yG1pdX7Lw0iEjHPDy8GCHspzKTUkLmBjz4m0veHbfZj1Cdh5cSNwgEejUr
         U/UtceyYOMbJ8j4tjPEfmQzZ4rO6rRhLuFx8/Df6CtPbHYmyieP2IuFVuo4tDVd2bqwb
         VI9+ISTkgxchk9RvEWiAPfAVXDOdmNjBmHQkkj6JvMWTYnsWvlMW6czUQcMhyg6C6n+B
         TZB2zqdjSZlZNyOZeu4BoMEBJyKnoHSGy0JRhh0uTW90kVYUD2PAjtgykBdpp6aoL300
         y3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=brgNO9uDZDr0Zhxbw7GWbEn4NwvWnN/4qDVXzi80Fr4=;
        b=t/x4PhFJTiqv2UxBibvxWqkcp51B2yiFkb8fxI4v6JL2zWp9VyrQktXG74YHyrebaQ
         PQuWiINdzcx7Abkeh/A9tjjwRHKWPVnlDu974Ydfms0VotpjO6N0pRBxpaeZwoLkichw
         ZJ0cJ4i3v/B+gnz6ZWb2OGLyE1rjzb5+8v82GpTJK2i1fozbzkk85ApmrQDLKNDNypUA
         WCGFYykDYWC2eaydTaEWlgQ73MRV5Nsl34PrAtHbHfNGNLiIIMML6+OwClTUgu3A/ZQF
         j7DtxD+rObhgnH+rrXQT8z4uHECKOwjafEZfwfoUh8bllrMygBVR6PDpQxPuLHEhP5bx
         2xAg==
X-Gm-Message-State: AOAM533TYCzboz5vxrw4NMvJSCuwIkuTHAsOqzb2iGPXR48LbTbR6Lup
	mJRwgt9kL2i2BrsAw0gQazJo12gmK4E=
X-Google-Smtp-Source: ABdhPJzFROW2HAnx5+/+99Kbziv8HWvV65VrKKsyK4S7xuGvHInTGxdeLNJem90JPqsrgrhvV+RYTg==
X-Received: by 2002:aa7:9f10:: with SMTP id g16mr5427100pfr.148.1597342375453;
        Thu, 13 Aug 2020 11:12:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id h12sm6719678pfr.143.2020.08.13.11.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 11:12:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] read-edid: Fix build with gcc-10+
Date: Thu, 13 Aug 2020 11:12:51 -0700
Message-Id: <20200813181252.805078-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813181252.805078-1-raj.khem@gmail.com>
References: <20200813181252.805078-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-get-edid-define-quiet-once.patch     | 44 +++++++++++++++++++
 .../read-edid/read-edid_3.0.2.bb              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/read-edid/read-edid/0001-get-edid-define-quiet-once.patch

diff --git a/meta-oe/recipes-support/read-edid/read-edid/0001-get-edid-define-quiet-once.patch b/meta-oe/recipes-support/read-edid/read-edid/0001-get-edid-define-quiet-once.patch
new file mode 100644
index 0000000000..5147f17c3a
--- /dev/null
+++ b/meta-oe/recipes-support/read-edid/read-edid/0001-get-edid-define-quiet-once.patch
@@ -0,0 +1,44 @@
+From 9da8eb6663d0ba046bc0570172c549d421de043a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 23:39:32 -0700
+Subject: [PATCH] get-edid: define quiet once
+
+Fixes build with gcc 10
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ get-edid/classic.c | 2 +-
+ get-edid/i2c.c     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/get-edid/classic.c b/get-edid/classic.c
+index 9cc8ee3..b13f5f0 100644
+--- a/get-edid/classic.c
++++ b/get-edid/classic.c
+@@ -26,7 +26,7 @@ typedef byte* real_ptr;
+ #define dosmemput(buffer,length,offset) memcpy(offset,buffer,length)
+ 
+ #define display(...) if (quiet == 0) { fprintf(stderr, __VA_ARGS__); }
+-int quiet;
++extern int quiet;
+ 
+ real_ptr far_ptr_to_real_ptr( uint32 farptr )
+ {
+diff --git a/get-edid/i2c.c b/get-edid/i2c.c
+index 625d7cb..0929e98 100644
+--- a/get-edid/i2c.c
++++ b/get-edid/i2c.c
+@@ -15,7 +15,7 @@
+ 
+ //Ideas (but not too much actual code) taken from i2c-tools. Thanks guys.
+ 
+-int quiet;
++extern int quiet;
+ 
+ #define display(...) if (quiet == 0) { fprintf(stderr, __VA_ARGS__); }
+ 
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
index e4c2cadc2d..1aa492c31b 100644
--- a/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
+++ b/meta-oe/recipes-support/read-edid/read-edid_3.0.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=292c42e2aedc4af636636bf7af0e2b26"
 
 SRC_URI = "http://polypux.org/projects/read-edid/read-edid-${PV}.tar.gz \
            file://0001-Do-not-install-license-file.patch \
+           file://0001-get-edid-define-quiet-once.patch \
 	   "
 SRC_URI[md5sum] = "016546e438bf6c98739ff74061df9854"
 SRC_URI[sha256sum] = "c7c6d8440f5b90f98e276829271ccea5b2ff5a3413df8a0f87ec09f834af186f"
-- 
2.28.0

