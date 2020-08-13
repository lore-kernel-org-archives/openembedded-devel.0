Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.1420.1597342375372890720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 11:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KwQC3gwv;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 128so3215235pgd.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 11:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vuv5+bJ840Gqc5oTAfX6NYz9ih8Qr+1+LuoAAqLq72Q=;
        b=KwQC3gwv+W/Vsfsh6DUz38yqWeiuTJQ/jGxaWxSUpjMuszF7pvHGpJOOXqCrVCN4/0
         B6tbUilgGJ0Y7xpvaTT0GKJmeAHlSnoh1n3HkqF5zxlye2ouAlLYGi3/StEhRA9d4goh
         Np5MJaYo/Uf2Yw+OfGE21M+KxhwV1HWk3fB2vPplniz0f+8EAfT8SwZWM5fAF1vanMaE
         TsanZuW1rluI+rJYOs7WmJzDUcYn+37qXkKiXn14GXpqnqO7612Dxlly4qcxeyricFi3
         T2Ekz0phEHZpws0i/I/+FHOsEFq2IO1/1G8y1jJ9fs4WkQmGO7sIzQGgk5nnm/a3MFsl
         jtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vuv5+bJ840Gqc5oTAfX6NYz9ih8Qr+1+LuoAAqLq72Q=;
        b=CrYIZzTzdoSJEhrKLslJndm8N1IY4vD73sZpJbSGT8dDSMtOAwuM95pv66X+nYbcUE
         emgkpewNUKxjki/jmGtkkp6rJhG66V+kDrF6RkN91TTmIRQKsApOgY1BT3WAAn+sj0zH
         e9cfRXsx2EdzYf1G9bAVe8/NPnU4tqx4rzCCPc5dCzLC495hSoWVFsIjk+fMwn9WXDYh
         oIxq4qn8Cm7XyFWUyTrbwtYHUT/5H+vIyaLziHiR9p6ToECYKfUqDsX30jgGLqBNJ8xM
         r6cv61w5UmkfZKeoseNoO8zQoKvXS++NH60DCJH/7iGbVz2ZYehCV3D7iVkT6mkUvmAj
         D7EQ==
X-Gm-Message-State: AOAM533VnQDAL2f6kqjC8ufDIY0OEjDuM8OTbHGwqogLRyFlKjPzq3nS
	v58iwd7KHlotHnUGst4ee3W26s6jfyE=
X-Google-Smtp-Source: ABdhPJzqwG+5WR0DEAXbiK8l9fHd8KTWv1mHOg4TQQkBDiOe9iZDRfXqYtNIzgpS+6QxaW2mUpza5g==
X-Received: by 2002:a05:6a00:14c4:: with SMTP id w4mr5829957pfu.20.1597342374399;
        Thu, 13 Aug 2020 11:12:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id h12sm6719678pfr.143.2020.08.13.11.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 11:12:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] memtester: Fix build with -fno-common
Date: Thu, 13 Aug 2020 11:12:50 -0700
Message-Id: <20200813181252.805078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Define-mword16-and-mword8-once.patch | 57 +++++++++++++++++++
 .../memtester/memtester_4.3.0.bb              |  7 ++-
 2 files changed, 61 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/memtester/files/0001-Define-mword16-and-mword8-once.patch

diff --git a/meta-oe/recipes-benchmark/memtester/files/0001-Define-mword16-and-mword8-once.patch b/meta-oe/recipes-benchmark/memtester/files/0001-Define-mword16-and-mword8-once.patch
new file mode 100644
index 0000000000..ffd9b9f266
--- /dev/null
+++ b/meta-oe/recipes-benchmark/memtester/files/0001-Define-mword16-and-mword8-once.patch
@@ -0,0 +1,57 @@
+From 01f1c05702eb534271777648c976ab6402a5145b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 23:18:30 -0700
+Subject: [PATCH] Define mword16 and mword8 once
+
+Defining them in .h meant they are defined in all .c files including
+this .h file
+
+Fixes build with gcc 10+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests.c | 9 +++++++++
+ types.h | 9 ---------
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/tests.c b/tests.c
+index be1b350..4305bed 100644
+--- a/tests.c
++++ b/tests.c
+@@ -27,6 +27,15 @@ char progress[] = "-\\|/";
+ #define PROGRESSOFTEN 2500
+ #define ONE 0x00000001L
+ 
++union {
++    unsigned char bytes[UL_LEN/8];
++    ul val;
++} mword8;
++
++union {
++    unsigned short u16s[UL_LEN/16];
++    ul val;
++} mword16;
+ /* Function definitions. */
+ 
+ int compare_regions(ulv *bufa, ulv *bufb, size_t count) {
+diff --git a/types.h b/types.h
+index ad7ce73..e14ea32 100644
+--- a/types.h
++++ b/types.h
+@@ -25,12 +25,3 @@ struct test {
+     int (*fp)();
+ };
+ 
+-union {
+-    unsigned char bytes[UL_LEN/8];
+-    ul val;
+-} mword8;
+-
+-union {
+-    unsigned short u16s[UL_LEN/16];
+-    ul val;
+-} mword16;
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.3.0.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.3.0.bb
index 0964c04874..3d29055781 100644
--- a/meta-oe/recipes-benchmark/memtester/memtester_4.3.0.bb
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.3.0.bb
@@ -5,9 +5,10 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz"
-SRC_URI += "file://Makefile.patch"
-
+SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz \
+           file://Makefile.patch \
+           file://0001-Define-mword16-and-mword8-once.patch \
+           "
 SRC_URI[md5sum] = "598f41b7308e1f736164bca3ab84ddbe"
 SRC_URI[sha256sum] = "f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88"
 
-- 
2.28.0

