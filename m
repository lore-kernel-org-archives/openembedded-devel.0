Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.6271.1622029978905733273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QTt2/BXx;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id ml1-20020a17090b3601b029015f9b1ebce0so174879pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zNTmYzy+nPZ8bg167rd7kVXuTitj8suJe+IMmewpP2M=;
        b=QTt2/BXxFarIJPd+IeKYpnpSPBxCGOcBzN9f5MjQF352xcbpiZqHj744fKuXdBmQmT
         gJcArIirUhwti2GwOTBMzVgwRUFr/x83TFf4kA+IsriofZrDPT6IEXbUvjtGBz6uy4YF
         ydYQjj4THrVxKCrDezdVzGVAT+Ch/ttLvlZjbVOEbOvcRYn1ui3462uqLpSYrmUacN/S
         G9E0k5IOH8o4vtP/g/3tqvkh/GaYTGjFk0BAyMOJ1r6XhZj2mHuZz0w5j6qInEnghMfS
         2r8wcEx86CZ1M10FCAv+sFxcOcbJZXBVLqfTyRHV9K1Aj+0v0Ms4kI9RgZ7DTnX0c4Zg
         41dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zNTmYzy+nPZ8bg167rd7kVXuTitj8suJe+IMmewpP2M=;
        b=YESkpwuJRqVtzpOQEIOhr+NB6TiSE3PH/Knk+CAdxU6+0c1s78WxOJdMw5+u9kvFd/
         vSmV9wUH5YEevazbu7b073YvoWV2bVzsLwScO05caLBj290vtnvAzM/wvCt82r2iu+Vo
         O58wHEwi1q8uwWwhPThcAKc+G7irVT0F3v1iB/48cjPp640tHj/yPLHVruGDeMClCeTQ
         bTSsy/kYXblJMaTG1bZTNX2tx8CX/d6Qc6T6UPh75XMGxVOYsaASZj5mJ2cH1fMZv60j
         Tg4LJVBUqYqg6I3/lNNlY2Nu2UraH2JG1PQafVHN70R4wXK2dbdQQnjVRKt/zxz/GxfI
         S2DQ==
X-Gm-Message-State: AOAM532mfH/vg/8+LoTofd0F5udjwW9Tr0XOLTsReT5jyq/xFUc03JmS
	00KK442mmtyrMUgP7GTuBI0RX4IjPlzl2A==
X-Google-Smtp-Source: ABdhPJxpUmy64s3gBVhLmZE03pbE/YTvryjqTBDJk0qntuEycqMz4uACjQPF0ZEPObbAxW2QkQ2lyA==
X-Received: by 2002:a17:90a:aa12:: with SMTP id k18mr3548029pjq.232.1622029978350;
        Wed, 26 May 2021 04:52:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:58 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 11/23] exiv2: Fix CVE-2021-3482
Date: Wed, 26 May 2021 04:52:26 -0700
Message-Id: <d3f0f8957f7ab59375f25d504fa233d71b1871c6.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-3482

      Improper input validation of the rawData.size property in Jp2Image::readMetadata() in jp2image.cpp
      can lead to a heap-based buffer overflow via a crafted JPG image containing malicious EXIF data.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1523/commits/22ea582c6b74ada30bec3a6b15de3c3e52f2b4da]
      CVE: CVE-2021-3482

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9e7c2c9713dc2824af2a33b0a3feb4f29e7f0269)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-3482.patch           | 54 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
new file mode 100644
index 0000000000..e7c5e1b656
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
@@ -0,0 +1,54 @@
+From 22ea582c6b74ada30bec3a6b15de3c3e52f2b4da Mon Sep 17 00:00:00 2001
+From: Robin Mills <robin@clanmills.com>
+Date: Mon, 5 Apr 2021 20:33:25 +0100
+Subject: [PATCH] fix_1522_jp2image_exif_asan
+
+---
+ src/jp2image.cpp | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index eb31cea4a..88ab9b2d6 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -28,6 +28,7 @@
+ #include "image.hpp"
+ #include "image_int.hpp"
+ #include "basicio.hpp"
++#include "enforce.hpp"
+ #include "error.hpp"
+ #include "futils.hpp"
+ #include "types.hpp"
+@@ -353,7 +354,7 @@ static void boxes_check(size_t b,size_t m)
+                             if (io_->error()) throw Error(kerFailedToReadImageData);
+                             if (bufRead != rawData.size_) throw Error(kerInputDataReadFailed);
+ 
+-                            if (rawData.size_ > 0)
++                            if (rawData.size_ > 8) // "II*\0long"
+                             {
+                                 // Find the position of Exif header in bytes array.
+                                 long pos = (     (rawData.pData_[0]      == rawData.pData_[1])
+@@ -497,6 +498,7 @@ static void boxes_check(size_t b,size_t m)
+                 position   = io_->tell();
+                 box.length = getLong((byte*)&box.length, bigEndian);
+                 box.type = getLong((byte*)&box.type, bigEndian);
++                enforce(box.length <= io_->size()-io_->tell() , Exiv2::kerCorruptedMetadata);
+ 
+                 if (bPrint) {
+                     out << Internal::stringFormat("%8ld | %8ld | ", (size_t)(position - sizeof(box)),
+@@ -581,12 +583,13 @@ static void boxes_check(size_t b,size_t m)
+                                 throw Error(kerInputDataReadFailed);
+ 
+                             if (bPrint) {
+-                                out << Internal::binaryToString(makeSlice(rawData, 0, 40));
++                                out << Internal::binaryToString(
++                                        makeSlice(rawData, 0, rawData.size_>40?40:rawData.size_));
+                                 out.flush();
+                             }
+                             lf(out, bLF);
+ 
+-                            if (bIsExif && bRecursive && rawData.size_ > 0) {
++                            if (bIsExif && bRecursive && rawData.size_ > 8) { // "II*\0long"
+                                 if ((rawData.pData_[0] == rawData.pData_[1]) &&
+                                     (rawData.pData_[0] == 'I' || rawData.pData_[0] == 'M')) {
+                                     BasicIo::AutoPtr p = BasicIo::AutoPtr(new MemIo(rawData.pData_, rawData.size_));
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index fb8d126198..8c4c81799b 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -12,7 +12,8 @@ inherit dos2unix
 SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
             file://CVE-2021-29457.patch \
             file://CVE-2021-29458.patch \
-            file://CVE-2021-29463.patch"
+            file://CVE-2021-29463.patch \
+            file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.17.1

