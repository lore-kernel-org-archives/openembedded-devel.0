Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.28203.1624148847937703587
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Jun 2021 17:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gKqEjWH+;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id w31so11036368pga.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Jun 2021 17:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13LTcv1YigsMwpa50L9r8MB1O/bb3U+ekgVzEL3ZEXU=;
        b=gKqEjWH+ki9HY13N2D82BUDQXM1HgeGD/h/X9F+wKE6Pe71XqH/I3u35yt9nGyS7p2
         50IagBzRe4IbIS9YV7nWg9HJLt/50ORdXFIAvFGdTDfOl6Oi1+EbknqQzrCJAL1p+BLi
         TfhwbwnUGEOjnaqTeUD5kJ9l+h3HkcLeqIwwaRtQCr8qT9FRbWl6FpR6oHWixAjphUh+
         AWohlS62awWcjyYRo4QHcxt/yGLA+AXyEhhEsU/lg+4aAOfHEntiNpLBRVIjdiQT0bFS
         ffpGnsojcFIPqShaBZiBD5pueriyZ39E9ahQ8/cUYcGXrTA6FkToQGIHncfTE8WYHQk9
         JNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13LTcv1YigsMwpa50L9r8MB1O/bb3U+ekgVzEL3ZEXU=;
        b=jlztr8FvSCtK2Q5rJHkcs6F8wRM97pFbKsmgnIC0Y4kaJtmsFEUxZxKaesXo9JQW1t
         bmTtIUWz07PrRLh3Z4ppJ6RfvUpDGbf7f8Gyz0Vhf4NkkgwQ7J6gwNGOl33cWAHmhmsW
         Zox/Vq99edKZBoWF1cEr+YopLhKR7qh+Vl7o9DDDgccDUeRfDQLpmEn4V9NtQqjfEDVJ
         RpWOeam4MiH2qOI6Tsie6R11kjXNSHO4+TuX+YvDZ/0WoXsGC0ufjO1AC5jfR1bmicC9
         8NAvXIHHTJFLJOM0+FaKp2jMZZUEqREBFsFGiH7u3SNFs+z0xOAM+ydAMzQmCDEkb1rg
         mUzQ==
X-Gm-Message-State: AOAM531PtQdQmbYOhN3zgzRluWmgjlNLbCPbk+PPMfd7Cm42neJrTd3D
	BqCqt7wVr9z2iAx+mlYlm2lIMY9A8xKtmw==
X-Google-Smtp-Source: ABdhPJz1TQ9vvI33rqMwrRapy9wNyltbGWabdqihhToYs0lxNo+zRta8R0dWZrq9BPl9PpXVQ1f16A==
X-Received: by 2002:aa7:810b:0:b029:2fe:decd:c044 with SMTP id b11-20020aa7810b0000b02902fedecdc044mr12187196pfi.15.1624148847101;
        Sat, 19 Jun 2021 17:27:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5cd3])
        by smtp.gmail.com with ESMTPSA id b1sm2923628pjk.51.2021.06.19.17.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 17:27:26 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] libzip: Upgrade to 1.8.0
Date: Sat, 19 Jun 2021 17:27:20 -0700
Message-Id: <20210620002724.3894951-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add packageconfigs for various features keep them disabled except ssl lzma tools examples

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/libzip/libzip_1.7.3.bb   | 18 --------------
 .../recipes-extended/libzip/libzip_1.8.0.bb   | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libzip/libzip_1.7.3.bb
 create mode 100644 meta-oe/recipes-extended/libzip/libzip_1.8.0.bb

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.7.3.bb b/meta-oe/recipes-extended/libzip/libzip_1.7.3.bb
deleted file mode 100644
index e903de3da3..0000000000
--- a/meta-oe/recipes-extended/libzip/libzip_1.7.3.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "libzip is a C library for reading, creating, and modifying zip archives."
-HOMEPAGE = "https://libzip.org/"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=067e9870bba57e1ce20695c4d5672f30"
-
-DEPENDS = "zlib bzip2"
-
-PACKAGECONFIG[ssl] = "-DENABLE_OPENSSL=ON,-DENABLE_OPENSSL=OFF,openssl"
-PACKAGECONFIG[lzma] = "-DENABLE_LZMA=ON,-DENABLE_LZMA=OFF,xz"
-
-PACKAGECONFIG ?= "ssl lzma"
-
-inherit cmake
-
-SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
-
-SRC_URI[sha256sum] = "a60473ffdb7b4260c08bfa19c2ccea0438edac11193c3afbbb1f17fbcf6c6132"
diff --git a/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb b/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb
new file mode 100644
index 0000000000..23ac76a2d2
--- /dev/null
+++ b/meta-oe/recipes-extended/libzip/libzip_1.8.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "libzip is a C library for reading, creating, and modifying zip archives."
+HOMEPAGE = "https://libzip.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=067e9870bba57e1ce20695c4d5672f30"
+
+DEPENDS = "zlib bzip2"
+
+PACKAGECONFIG[ssl] = "-DENABLE_OPENSSL=ON,-DENABLE_OPENSSL=OFF,openssl"
+PACKAGECONFIG[lzma] = "-DENABLE_LZMA=ON,-DENABLE_LZMA=OFF,xz"
+PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF,gnutls nettle"
+PACKAGECONFIG[zstd] = "-DENABLE_ZSTD=ON,-DENABLE_ZSTD=OFF,zstd"
+PACKAGECONFIG[mbedtls] = "-DENABLE_MBEDTLS=ON,-DENABLE_MBEDTLS=OFF,mbedtls"
+PACKAGECONFIG[examples] = "-DENABLE_EXAMPLES=ON,-DENABLE_EXAMPLES=OFF,"
+PACKAGECONFIG[tools] = "-DENABLE_TOOLS=ON,-DENABLE_TOOLS=OFF,"
+PACKAGECONFIG[tests] = "-DBUILD_REGRESS=ON,-DBUILD_REGRESS=OFF,"
+
+PACKAGECONFIG ?= "ssl lzma tools examples"
+
+inherit cmake
+
+SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
+
+SRC_URI[sha256sum] = "f0763bda24ba947e80430be787c4b068d8b6aa6027a26a19923f0acfa3dac97e"
-- 
2.32.0

