Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.11295.1600215075991822629
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 17:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fdYBVd9u;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id z18so370987pfg.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 17:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zzu5vILSK+7fHtDt6ounX3Wig0Iz01SXJhaNTRRkSpU=;
        b=fdYBVd9uzvK8+25MZsv5zZjrPQxlYRPmnZKbGq5t09n3KcMWGYfCavNP19ID/atV37
         hT+KSsXnv/o4qvRiwRDZUFo9JiwSXu7j/AX7Av5fcZ0WqVEyXLCJH8lIMFr9gKzFUHfy
         q17e6GPtndYDcwNt51TSsTADRDJcyjiWj5yEVhg3B7FkrkUzVyxpGqObUabBhvAiMN4q
         Br+L7b1SQhf+QINviKzXDyYKg4zH1PvHwq8FZLHp8xBuAOkZU/UwxpmSnEXJ+ScK3j9I
         j9etyXnM/GuuWgxywWln3iSu8ChYY3E8FeIC9eYpUJKKC63ViwqDCLu1Gu2Uu8FF5hwj
         l8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zzu5vILSK+7fHtDt6ounX3Wig0Iz01SXJhaNTRRkSpU=;
        b=stiAJx2WwMne7YN4NXjEBRzoejQkgyb2yUssKNUcFbu1QhfBTgHFDJCILqR305Tjji
         jxFZU133Y616sz3JaabzPX7EwNj7FdfQv9lYd0wh8upHQgRQgdu0lfbJ5IVCa5fjDrVo
         AZ6JfDKiejEro1E1TP1c7Gu3k2jRmN7gP4drGD42lIMUedWhOB01iI+HCVTAdX1unqMB
         aQv8/+7QXVGydOIhLvneMdRnIxP274mJoLxL5ZDK/u94bH3Mt9pCXKArB5JkQ69Kgfn8
         ePBbkXO8kJO8Mzr0tOevg94urc7iNfs+WhCtFhyj8qba2R7n1jKwVvFkJfC7/fKy3E5S
         i0tQ==
X-Gm-Message-State: AOAM530DVrIKsLax9X25N+GMepnW1jmYtqUbSv6OqFY1cFBu4CV2/kxi
	9jLMcg9ma+H9CGwh+07edEmEORZ4dJMK1A==
X-Google-Smtp-Source: ABdhPJxauW1XEEpYYuHZljiPKc+bqFzVsScJvtvs5I1eVL9ujxH1tEty5PlxCHzO4U8kQ8CQGGw1+Q==
X-Received: by 2002:a65:4505:: with SMTP id n5mr16211435pgq.229.1600215074866;
        Tue, 15 Sep 2020 17:11:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id u4sm15090042pfk.166.2020.09.15.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 17:11:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tesseract: update to 4.1.1
Date: Tue, 15 Sep 2020 17:11:12 -0700
Message-Id: <20200916001112.83283-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

License-Update: file that mentioned licencing information was replaced
with an actual license file

Add patch to fix build with musl

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tesseract/0001-include-sys-time.h.patch   | 34 +++++++++++++++++++
 .../{tesseract_git.bb => tesseract_4.1.1.bb}  | 15 ++++----
 2 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/0001-include-sys-time.h.patch
 rename meta-oe/recipes-graphics/tesseract/{tesseract_git.bb => tesseract_4.1.1.bb} (51%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/0001-include-sys-time.h.patch b/meta-oe/recipes-graphics/tesseract/tesseract/0001-include-sys-time.h.patch
new file mode 100644
index 0000000000..de1fa75b7c
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/0001-include-sys-time.h.patch
@@ -0,0 +1,34 @@
+From b47fa9532a7090d76521603dbc818bdec100085f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Sep 2020 17:04:27 -0700
+Subject: [PATCH] include sys/time.h
+
+This provides missing definitions of timeval stuct
+
+Fixes
+| ../../../git/src/ccutil/ocrclass.h:154:7: error: member access into
+incomplete type 'struct timeval'
+|     tv->tv_usec = (millisecs.count() % 1000) * 1000;
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ccutil/ocrclass.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/ccutil/ocrclass.h b/src/ccutil/ocrclass.h
+index d39a6dd6..96395c9b 100644
+--- a/src/ccutil/ocrclass.h
++++ b/src/ccutil/ocrclass.h
+@@ -28,6 +28,8 @@
+ 
+ #include <chrono>
+ #include <ctime>
++#include <sys/time.h>
++
+ #ifdef _WIN32
+ #include <winsock2.h> // for timeval
+ #endif
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.1.bb
similarity index 51%
rename from meta-oe/recipes-graphics/tesseract/tesseract_git.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_4.1.1.bb
index 89d09a0f55..3b5032f06d 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.1.bb
@@ -1,19 +1,22 @@
 SUMMARY = "A commercial quality OCR engine "
+HOMEPAGE = "https://github.com/tesseract-ocr/tesseract"
+BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7ea4f9a43aba9d3c849fe5c203a0ed40"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+BRANCH = "4.1"
+SRCREV = "f4ef2f2050f4c25b28bdbf0063b7d2eb30f41cf7"
+SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH} \
+           file://0001-include-sys-time.h.patch \
+          "
 
-BRANCH = "3.05"
-PV = "${BRANCH}.01+git${SRCPV}"
-SRCREV = "215866151e774972c9502282111b998d7a053562"
-SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
 DEPENDS = "leptonica"
 
 EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
 
-
 inherit autotools pkgconfig
 
 FILES_${PN} += "${datadir}/tessdata"
-- 
2.28.0

