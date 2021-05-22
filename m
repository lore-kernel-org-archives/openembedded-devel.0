Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.1840.1621647337385939425
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FZ8swzjG;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id a25so25256263edr.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uWqx70jcniqXpo/semQbYSNKKFA8meIz+pEf+qxm7gg=;
        b=FZ8swzjGtrnjfS37YmvKXkfwQR6Tkpe5N9s03SpVM/7AtV+vRCH1iA9Q46uBR7QiTo
         K3SyFjAFHjZ5vjq33Em/3UhHnv5aw00RGgcYwjYxOUugkgyNaseauu/VDYUY3QxT45r+
         FTGpX0S6J50QQMeIZ52JsxGN5OPsYUbVmgLXy03Utb5yExsvs1LJHJg8aWKFtP7g4BXZ
         83B6cV0CE3CFR8w6QoAbE6koM+sfCO/rqfNOQex7nxwELOnUJUWUFjirIbiZRLce+fWm
         1mNU4EiaxgMiVQePYVQWffIqGIuBBsGVtkW+buEdVdUE/rqVE4mns3JILBnTqiCnQy4Z
         QAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uWqx70jcniqXpo/semQbYSNKKFA8meIz+pEf+qxm7gg=;
        b=HEGbwiFefR5bgUCabL17AUkXNcaa/CTWOD/HGxHO849hr/Rfi31CF85CmPyzQ6+bkL
         6lF/QEFpiz/7K2wHhfZkbLDUD56dYXWSY5kJRuQ85x0WBodhi1IYaoA6WSTzbOcnK2wD
         6sGR4Wx7gqh+dlc+Fr1Zn9TfcEG7tyf3F/SGGatqZJgEtly2plo8IdrqgE+3qbOIhiAc
         SVfzkcf/S3JwQXm3lRe1fFhAmKgI8HjVT2ZHoLGK5JuMrNPyq3+MYglmlOKIoH4vK5AD
         cuGW0Omw/Rni6mAt4l/Qv2crYPEd1mcNxOyB1G2aBdSTX8us7fEUJ0iENlBC4EMyaAhb
         2ajA==
X-Gm-Message-State: AOAM531piMZ59oqVXGcecGjA0P6WePo3noSQ5/e62Pu4icQbxyIc5S6Q
	n84tExdYfXO87F2C/2++O1B95QHFFH0=
X-Google-Smtp-Source: ABdhPJxuAO4ZW1c2MAmp8LN4NHew/9fnzO60yz1HtvOrwXat4fqebl9lQamFsU4RcnncVoHDX8RC8g==
X-Received: by 2002:a05:6402:b8c:: with SMTP id cf12mr8963764edb.61.1621647335969;
        Fri, 21 May 2021 18:35:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:35 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/17] redis: upgrade 6.2.2 -> 6.2.3
Date: Sat, 22 May 2021 03:35:11 +0200
Message-Id: <20210522013521.588774-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch | 10 ++++------
 .../redis/{redis_6.2.2.bb => redis_6.2.3.bb}           |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.2.bb => redis_6.2.3.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
index b5c4133e3..66ab0ee33 100644
--- a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
@@ -10,15 +10,16 @@ e.g. -latomic is needed on clang/x86 to provide for 64bit atomics
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 7f7c625..c71dd3b 100644
+index 5564351..83ccd76 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -75,7 +75,7 @@ endif
+@@ -91,7 +91,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
@@ -26,7 +27,4 @@ index 7f7c625..c71dd3b 100644
 +FINAL_LIBS+=-lm
  DEBUG=-g -ggdb
  
- # Linux ARM needs -latomic at linking time
--- 
-2.23.0
-
+ # Linux ARM32 needs -latomic at linking time
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.2.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.3.bb
index 65b525709..67ac974de 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
+SRC_URI[sha256sum] = "98ed7d532b5e9671f5df0825bb71f0f37483a16546364049384c63db8764512b"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.31.1

