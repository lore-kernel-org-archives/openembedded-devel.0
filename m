Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.34935.1622399677569330350
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LQgtM2Ow;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 29so6661190pgu.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zNTmYzy+nPZ8bg167rd7kVXuTitj8suJe+IMmewpP2M=;
        b=LQgtM2OwAEkmtICrXbdekJhprPhdgdOneDA5MoOj2mUXfZPPaibGHJI/+g5Pcc94DE
         5rgQnsty+2oqnxi/b/YfTvBa5HKGeZqTA+PoL+mu8vAPfBW89AzQpHe5tRlRPdbDbXkY
         AsSMHCfs9GL8OrcmO7Jy49YodHQ8YxGUJ001IpfSmwVHh91u5kldJpCSfcZBfixlgOdd
         yt+wxPeKjKPAbLAPin2484QDKGUWlA96FvKaMxHjYgFzT3r0NIx6Xu0TryWOXIjK4Bk6
         1MrsO1wf2fKBqULhFv7TGrYcu7Eb8+tHeb/lkKy6nZ5Ns9Toc0KdqVFGmtw/iTNbc+II
         MEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zNTmYzy+nPZ8bg167rd7kVXuTitj8suJe+IMmewpP2M=;
        b=DcaWSpwX/vFiemsxkhA41aETxd3gWnrTLgnHz+Kpwyat4BHE70tDhB6cm8Ne7vTtg7
         hMseQkiTaPMaTZx57Jjb6qh8VbYeeY9W89cB06YHOpNiBPT/JbgD3vjamOucACFbaQ94
         P3FVtiO1JP51phVZ2tWW79cvp2OCm4a5HeRYjYW0FoUtWrPXQuwshNEtJvndOICxGNSJ
         gI+ELMzgtVKYczxl7/i3tiyskPVsC4FEQiPE7mrfuh136FhK8skBKLYgcbMYk0KUuTMY
         ys1+9m5iocLbDqQTiXUNhcCoofeRa43aq2YsngxaNbGwNrnyCtT3oIm8AE6hMACpkDr1
         Yrpw==
X-Gm-Message-State: AOAM532uJNKjDOE0rtTM8hqeea1BvyHm3S4y1az+n2pY37L4YRTa3+5j
	BnPsfWbwKRQ2ukUOCOylm2YDr0O3pf9ULQ==
X-Google-Smtp-Source: ABdhPJyjLe2F1xminsqipSubxJokXeg8f6ERLkUAt/iGJKqhWxdb2tqDvJ41CGeYQ5uLyODQXEQhYQ==
X-Received: by 2002:a63:e709:: with SMTP id b9mr19135401pgi.153.1622399677018;
        Sun, 30 May 2021 11:34:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:36 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/12] exiv2: Fix CVE-2021-3482
Date: Sun, 30 May 2021 11:34:14 -0700
Message-Id: <be0cc5e79b98a9c47f5bb8915f6c411484d0d6f2.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

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

