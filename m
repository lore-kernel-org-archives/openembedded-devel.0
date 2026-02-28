Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF441FEE4EE
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 20:24:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126389.1772310272400770759
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 12:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X1R7mQkn;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso26548845e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 12:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310271; x=1772915071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WzBHHcYmS3yvDT9pjiofg5qOgm+8C5Kpul0Ful7C/ac=;
        b=X1R7mQknuZKmo2Y8CaSsbw2aBw2ol+AxkCXb/3EWTUMvShJmhSO+VMSMitTbXPLgsH
         ejqY74MsQu2nAIp2k8b6uQlpN1kNG0NOE/Ge8DwEymh+GiBCngRZlvTfFreDZFxx/X/I
         NbVpFrL/BiOMz+2GaVg0Qq9p6b/aqh5QQi18pV+xHjRXVtQiYZNa0RINlAhoEHWbvgHl
         OYlicv4YNAQRNmaK2MWHX4Kat9immTQgurOBx/cakzZLh7WT/SpSkWv2wmEeCEUMJJEb
         g+qdb/CZUqn20cvXEyOt4x3JUF/WnZ45mCFCPrn8fJmu9ahwA6LwMCkeeKKimvvx99MQ
         8aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310271; x=1772915071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzBHHcYmS3yvDT9pjiofg5qOgm+8C5Kpul0Ful7C/ac=;
        b=HscGTkeNROd2KTh0MEVgx4PGHUWZQteh28liMbt+pp+DqWO2kYiJ04fW0ZecyKnZ9o
         +YhHptltwkym42mc7n3l0Dq4G+kq/usio1PbU1rbNnRxCpDp5kdKx61wq7N2Z5LftmpU
         B7P3av4VqOAfwvmny+9F6vxxqKABKN/pARNI+JCQRbkUZI9klecgPcrIIYnpYoDlwcNK
         pDGcI0pBP4Ky/P91+ls5K/qSq500tlwCaf5tPjjACi3ihcfGxtjRnj0jLSA1OMvMK2dU
         lXYeirDF6Z2wk6ytDBuJ5YNyl9e66SOwKdbSrPG0wQ97tqSwggkEHjYon/elfU0oIySd
         1A+Q==
X-Gm-Message-State: AOJu0YyMYanLcxGS4LOZtDYnlwxpp0TsoCtINsW/MxQHkjBneiiiF3Cd
	Ywt4j+QE3eDJkSd2QUQ0sAabtjGPKvSDK+fBpVOXVXdwUcDRhHN7dZP3GI31RA==
X-Gm-Gg: ATEYQzwbZku+sbZGRyn7fzAu1zb1zf9bMie/tR6QoxOTMkQWG150swdvZVURQoVkGzM
	UM3YFZ5bVcIv1QFtXoytpBJrEcZq238CE8H4duMul+23WW898Ovg57qKQV2/iwwXpUsnmVCb4rV
	Z5tZPttgSHJ9XTnkAIIQ4OB/Ldnodv7rNhY3L1fkmkPvFMe35964hhBwBcGfRH7vot7t07SThV0
	jQMsbnjYMPKa+xYVRnL7OQ8r+e/SkMMuwqHQZyFXVJPawTtfLDKpoItzej1Vb87nhUjJpmhULl+
	2zdapbUIj9UeepR7bNO4LL25+z/H0OvtqKcMlUT7UW2G7dwKCU9StX9l3peVuUC+617xijSxuEh
	KlaWrrUj7quEFjAxiPpSm7/1BA4yGr3y03q6Wrz2v2GTevLIqgdYvH559kCR0sP4qLkUTvsT9p1
	p/qRq4NnGz3g+SnMWou0bS
X-Received: by 2002:a05:600c:4e05:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-483c9c0b940mr106962775e9.32.1772310270268;
        Sat, 28 Feb 2026 12:24:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776b0sm94889995e9.1.2026.02.28.12.24.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:24:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] exiv2: patch CVE-2021-37615 and CVE-2021-37616
Date: Sat, 28 Feb 2026 21:24:25 +0100
Message-ID: <20260228202429.2424513-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 20:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124784

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-37615
https://nvd.nist.gov/vuln/detail/CVE-2021-37616

Backport the patches from the PR that is referenced by the NVD advisory.
Both CVEs are fixed by the same PR.

Note that the patch that added a regression test is not included. This
is because it contains a binary patch, which seems to be impossible
to apply with all patchtools during do_patch. Though it is not included
in this patch, it was applied manually during prepration, and all ptests
(including the new regression test) passed successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-37615-1.patch        |  80 ++++++++++
 .../exiv2/exiv2/CVE-2021-37615-2.patch        | 142 ++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   4 +
 3 files changed, 226 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-1.patch
new file mode 100644
index 0000000000..ce5b4543e1
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-1.patch
@@ -0,0 +1,80 @@
+From 8e7363ed17e9c3377e7cec1b3d05841e339fc555 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 2 Jul 2021 17:19:58 +0100
+Subject: [PATCH] Throw exception if lens info wasn't found.
+
+CVE: CVE-2021-37615 CVE-2021-37616
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/98fb218475948cbaef9549f7de3e9bbe9cc80e16]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/pentaxmn_int.cpp | 36 ++++++++++++++++++++++--------------
+ 1 file changed, 22 insertions(+), 14 deletions(-)
+
+diff --git a/src/pentaxmn_int.cpp b/src/pentaxmn_int.cpp
+index de1ba75..3dac885 100644
+--- a/src/pentaxmn_int.cpp
++++ b/src/pentaxmn_int.cpp
+@@ -1216,6 +1216,25 @@ namespace Exiv2 {
+         return result;
+     }
+ 
++    // Exception thrown by findLensInfo when the lens info can't be found.
++    class LensInfoNotFound : public std::exception {
++    public:
++      LensInfoNotFound() {}
++    };
++
++    // Throws std::exception if the LensInfo can't be found.
++    static ExifData::const_iterator findLensInfo(const ExifData* metadata) {
++      const ExifData::const_iterator dngLensInfo = metadata->findKey(ExifKey("Exif.PentaxDng.LensInfo"));
++      if (dngLensInfo != metadata->end()) {
++        return dngLensInfo;
++      }
++      const ExifData::const_iterator lensInfo = metadata->findKey(ExifKey("Exif.Pentax.LensInfo"));
++      if (lensInfo != metadata->end()) {
++        return lensInfo;
++      }
++      throw LensInfoNotFound();
++    }
++
+     //! resolveLens0x32c print lens in human format
+     std::ostream& resolveLens0x32c(std::ostream& os, const Value& value,
+                                                  const ExifData* metadata)
+@@ -1251,12 +1270,7 @@ namespace Exiv2 {
+         try {
+             unsigned long index  = 0;
+ 
+-            // http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/Pentax.html#LensData
+-            const ExifData::const_iterator lensInfo = metadata->findKey(ExifKey("Exif.PentaxDng.LensInfo")) != metadata->end()
+-                                                    ? metadata->findKey(ExifKey("Exif.PentaxDng.LensInfo"))
+-                                                    : metadata->findKey(ExifKey("Exif.Pentax.LensInfo"))
+-                                                    ;
+-            if ( lensInfo == metadata->end() ) return EXV_PRINT_COMBITAG_MULTI(pentaxLensType, 2, 1, 2)(os, value, metadata);
++            const ExifData::const_iterator lensInfo = findLensInfo(metadata);
+             if ( lensInfo->count() < 5       ) return EXV_PRINT_COMBITAG_MULTI(pentaxLensType, 2, 1, 2)(os, value, metadata);
+ 
+             if ( value.count() == 2 ) {
+@@ -1310,10 +1324,7 @@ namespace Exiv2 {
+         try {
+             unsigned long index  = 0;
+ 
+-            const ExifData::const_iterator lensInfo = metadata->findKey(ExifKey("Exif.PentaxDng.LensInfo")) != metadata->end()
+-                                                    ? metadata->findKey(ExifKey("Exif.PentaxDng.LensInfo"))
+-                                                    : metadata->findKey(ExifKey("Exif.Pentax.LensInfo"))
+-                                                    ;
++            const ExifData::const_iterator lensInfo = findLensInfo(metadata);
+             if ( value.count() == 4 ) {
+                 std::string model       = getKeyString("Exif.Image.Model"      ,metadata);
+                 if ( model.find("PENTAX K-3")==0 && lensInfo->count() == 128 && lensInfo->toLong(1) == 168 && lensInfo->toLong(2) == 144 ) index = 7;
+@@ -1338,10 +1349,7 @@ namespace Exiv2 {
+         try {
+             unsigned long index  = 0;
+ 
+-            const ExifData::const_iterator lensInfo = metadata->findKey(ExifKey("Exif.PentaxDng.LensInfo")) != metadata->end()
+-                                                    ? metadata->findKey(ExifKey("Exif.PentaxDng.LensInfo"))
+-                                                    : metadata->findKey(ExifKey("Exif.Pentax.LensInfo"))
+-                                                    ;
++            const ExifData::const_iterator lensInfo = findLensInfo(metadata);
+             if ( value.count() == 4 ) {
+                 std::string model       = getKeyString("Exif.Image.Model"      ,metadata);
+                 if ( model.find("PENTAX K-3")==0 && lensInfo->count() == 128 && lensInfo->toLong(1) == 131 && lensInfo->toLong(2) == 128 )
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-2.patch
new file mode 100644
index 0000000000..6432252b29
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-37615-2.patch
@@ -0,0 +1,142 @@
+From 93f866b969b4e998b43839119ae6c912ddc6e901 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Sat, 3 Jul 2021 22:36:53 +0100
+Subject: [PATCH] Check that findKey didn't return end().
+
+CVE: CVE-2021-37615 CVE-2021-37616
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/c2b52119d4f8d9ecb02056698fc8f6afd793db5e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/convert.cpp      | 33 ++++++++++++++++++---------------
+ src/crwimage_int.cpp | 12 ++++++++++--
+ src/exif.cpp         |  4 ++--
+ src/iptc.cpp         |  4 ++--
+ src/xmp.cpp          |  4 ++--
+ 5 files changed, 34 insertions(+), 23 deletions(-)
+
+diff --git a/src/convert.cpp b/src/convert.cpp
+index 25fb587..63fa4ea 100644
+--- a/src/convert.cpp
++++ b/src/convert.cpp
+@@ -665,16 +665,17 @@ namespace Exiv2 {
+ 
+         if (subsecTag) {
+             ExifData::iterator subsec_pos = exifData_->findKey(ExifKey(subsecTag));
+-            if (   subsec_pos != exifData_->end()
+-                && subsec_pos->typeId() == asciiString) {
+-                std::string ss = subsec_pos->toString();
+-                if (!ss.empty()) {
+-                    bool ok = false;
+-                    stringTo<long>(ss, ok);
+-                    if (ok) subsec = std::string(".") + ss;
++            if (subsec_pos != exifData_->end()) {
++                if (subsec_pos->typeId() == asciiString) {
++                    std::string ss = subsec_pos->toString();
++                    if (!ss.empty()) {
++                        bool ok = false;
++                        stringTo<long>(ss, ok);
++                        if (ok) subsec = std::string(".") + ss;
++                    }
+                 }
++                if (erase_) exifData_->erase(subsec_pos);
+             }
+-            if (erase_) exifData_->erase(subsec_pos);
+         }
+ 
+         if (subsec.size() > 10) subsec = subsec.substr(0, 10);
+@@ -1027,18 +1028,20 @@ namespace Exiv2 {
+ #endif
+         }
+         pos = xmpData_->findKey(XmpKey(std::string(from) + "/exif:RedEyeMode"));
+-        if (pos != xmpData_->end() && pos->count() > 0) {
+-            int red = pos->toLong();
+-            if (pos->value().ok())
+-                value |= (red & 1) << 6;
++        if (pos != xmpData_->end()) {
++            if (pos->count() > 0) {
++                int red = pos->toLong();
++                if (pos->value().ok())
++                    value |= (red & 1) << 6;
+ #ifndef SUPPRESS_WARNINGS
+-            else
+-                EXV_WARNING << "Failed to convert " << std::string(from) + "/exif:RedEyeMode" << " to " << to << "\n";
++                else
++                    EXV_WARNING << "Failed to convert " << std::string(from) + "/exif:RedEyeMode" << " to " << to << "\n";
+ #endif
++            }
++            if (erase_) xmpData_->erase(pos);
+         }
+ 
+         (*exifData_)[to] = value;
+-        if (erase_) xmpData_->erase(pos);
+     }
+ 
+     void Converter::cnvXmpGPSCoord(const char* from, const char* to)
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index 4ccea63..570de75 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -1084,8 +1084,16 @@ namespace Exiv2 {
+         if (ed2 != edEnd) size += ed2->size();
+         if (size != 0) {
+             DataBuf buf(size);
+-            if (ed1 != edEnd) ed1->copy(buf.pData_, pHead->byteOrder());
+-            if (ed2 != edEnd) ed2->copy(buf.pData_ + ed1->size(), pHead->byteOrder());
++            long pos = 0;
++            if (ed1 != edEnd) {
++                ed1->copy(buf.pData_, pHead->byteOrder());
++                pos += ed1->size();
++            }
++            if (ed2 != edEnd) {
++                ed2->copy(buf.pData_ + pos, pHead->byteOrder());
++                pos += ed2->size();
++            }
++            assert(pos == size);
+             pHead->add(pCrwMapping->crwTagId_, pCrwMapping->crwDir_, buf);
+         }
+         else {
+diff --git a/src/exif.cpp b/src/exif.cpp
+index de93980..d312292 100644
+--- a/src/exif.cpp
++++ b/src/exif.cpp
+@@ -564,8 +564,8 @@ namespace Exiv2 {
+         ExifKey exifKey(key);
+         iterator pos = findKey(exifKey);
+         if (pos == end()) {
+-            add(Exifdatum(exifKey));
+-            pos = findKey(exifKey);
++            exifMetadata_.push_back(Exifdatum(exifKey));
++            return exifMetadata_.back();
+         }
+         return *pos;
+     }
+diff --git a/src/iptc.cpp b/src/iptc.cpp
+index 8e54b9c..c710f0f 100644
+--- a/src/iptc.cpp
++++ b/src/iptc.cpp
+@@ -269,8 +269,8 @@ namespace Exiv2 {
+         IptcKey iptcKey(key);
+         iterator pos = findKey(iptcKey);
+         if (pos == end()) {
+-            add(Iptcdatum(iptcKey));
+-            pos = findKey(iptcKey);
++            iptcMetadata_.push_back(Iptcdatum(iptcKey));
++            return iptcMetadata_.back();
+         }
+         return *pos;
+     }
+diff --git a/src/xmp.cpp b/src/xmp.cpp
+index 0b7ade0..03ce7e0 100644
+--- a/src/xmp.cpp
++++ b/src/xmp.cpp
+@@ -313,8 +313,8 @@ namespace Exiv2 {
+         XmpKey xmpKey(key);
+         iterator pos = findKey(xmpKey);
+         if (pos == end()) {
+-            add(Xmpdatum(xmpKey));
+-            pos = findKey(xmpKey);
++            xmpMetadata_.push_back(Xmpdatum(xmpKey));
++            return xmpMetadata_.back();
+         }
+         return *pos;
+     }
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 1c1c05dfaa..83110b1e0e 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -22,6 +22,8 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-34334-4.patch \
            file://CVE-2021-34335-1.patch \
            file://CVE-2021-34335-2.patch \
+           file://CVE-2021-37615-1.patch \
+           file://CVE-2021-37615-2.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

