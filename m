Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.6272.1622029979886143819
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HS9WohVS;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id ml1-20020a17090b3601b029015f9b1ebce0so174924pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oIPHsZCVOxC2Ne8LeS58XcGG8AZ6gtk+Av7avh1rAL0=;
        b=HS9WohVSLiSuNctvWOp5FMNa9ehL7MjfQUgIo5HNM/r54POwn5FpmW5JdmpkK1iNIP
         l5A1vGiMZSJCSrIA+gU1zAal8l/9hw/4r0iwj0SweafDLpWEFCThKQvxeTVaWRkAP5B/
         jsDOqOTplh/n52aOQBD33F6W7AiOO9V4yIF+DORc5SqXlS0OvITTIOg0+cHlytAjg+GZ
         WuU9C13d/1G7WteQt4VfF6ux+D0eq1Rh3r1B3sCzT3xyIriny6t78bm8KjV6clchIzVL
         7IFmaqjVC/4G5QlrCc6tHpmSXoC5TRVjhBkgXXMSQ5nL0G/MtdBN3+0hDNjmH3Nd8APv
         nvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oIPHsZCVOxC2Ne8LeS58XcGG8AZ6gtk+Av7avh1rAL0=;
        b=HEEXa9NQ4hjID08X7rLxHX36TqqUPE606KjF+SvvTmaCqRUGBFm/bGGA6KmKwtjnry
         JTfyw2siUZ7QdYiHiBAFZhXpUwcHuP0KefsiH+qFa2YimV8y8pxvXYvL5WdtCldrWRJ3
         g05R7TI6eCpSzb2ricoWPDFrojIq3WfjKPo0DWMDOmTdFEY++CFXArAq+YuAZIk/Q+8S
         Qrj9RMWQW0wHj3Gm2t7tymSpDoNsz7fOBrspTyEwnYbOrGZCpQ1PrJpq+hwAM0dVH6Sf
         A5DRPEb0H1R0B6cy+YmOtCtz0pX5I6AbI2J5Ui8pM8yuII+hcN35oBPBRy9B6WllRb4D
         SD9A==
X-Gm-Message-State: AOAM533sJNpZguJZRB+c1TvCd4yy3eBTPeZ5VcgKUOfJ449KJvyDhVBp
	xFp6WqmVakU1DqzVH2/dt8CRl5V8hzic5g==
X-Google-Smtp-Source: ABdhPJy+ilHlrW4xEdFhPVmeegA3ILyvRSMGYw3qCCo1jffzm+dZN8byOcfXnJ/6LtUzHQo8ZPKAwg==
X-Received: by 2002:a17:90a:a013:: with SMTP id q19mr3542526pjp.29.1622029979270;
        Wed, 26 May 2021 04:52:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:58 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 12/23] exiv2: Fix CVE-2021-29464
Date: Wed, 26 May 2021 04:52:27 -0700
Message-Id: <11ef1c6cb586449c9dbe4de96e094ac2796a9947.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

          References
          https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29464

          The heap overflow is triggered when Exiv2 is used to write metadata into a crafted image file.
          An attacker could potentially exploit the vulnerability to gain code execution, if they can
          trick the victim into running Exiv2 on a crafted image file.

          Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/commit/f9308839198aca5e68a65194f151a1de92398f54]
          CVE: CVE-2021-29464

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8c9470bdfaa1d33347ffaf25b3e18d2163667e18)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29464.patch          | 72 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
new file mode 100644
index 0000000000..f0c482450c
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
@@ -0,0 +1,72 @@
+From 61734d8842cb9cc59437463e3bac54d6231d9487 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Tue, 18 May 2021 10:52:54 +0900
+Subject: [PATCH] modify
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/jp2image.cpp | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 52723a4..0ac4f50 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -643,11 +643,11 @@ static void boxes_check(size_t b,size_t m)
+     void Jp2Image::encodeJp2Header(const DataBuf& boxBuf,DataBuf& outBuf)
+     {
+         DataBuf output(boxBuf.size_ + iccProfile_.size_ + 100); // allocate sufficient space
+-        int     outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
+-        int      inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
++        long    outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
++        long    inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
+         Jp2BoxHeader* pBox   = (Jp2BoxHeader*) boxBuf.pData_;
+-        int32_t       length = getLong((byte*)&pBox->length, bigEndian);
+-        int32_t       count  = sizeof (Jp2BoxHeader);
++        uint32_t      length = getLong((byte*)&pBox->length, bigEndian);
++        uint32_t      count  = sizeof (Jp2BoxHeader);
+         char*         p      = (char*) boxBuf.pData_;
+         bool          bWroteColor = false ;
+ 
+@@ -664,6 +664,7 @@ static void boxes_check(size_t b,size_t m)
+ #ifdef EXIV2_DEBUG_MESSAGES
+                 std::cout << "Jp2Image::encodeJp2Header subbox: "<< toAscii(subBox.type) << " length = " << subBox.length << std::endl;
+ #endif
++                enforce(subBox.length <= length - count, Exiv2::kerCorruptedMetadata);
+                 count        += subBox.length;
+                 newBox.type   = subBox.type;
+             } else {
+@@ -672,12 +673,13 @@ static void boxes_check(size_t b,size_t m)
+                 count = length;
+             }
+ 
+-            int32_t newlen = subBox.length;
++            uint32_t newlen = subBox.length;
+             if ( newBox.type == kJp2BoxTypeColorHeader ) {
+                 bWroteColor = true ;
+                 if ( ! iccProfileDefined() ) {
+                     const char* pad   = "\x01\x00\x00\x00\x00\x00\x10\x00\x00\x05\x1cuuid";
+                     uint32_t    psize = 15;
++                    enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
+                     ul2Data((byte*)&newBox.length,psize      ,bigEndian);
+                     ul2Data((byte*)&newBox.type  ,newBox.type,bigEndian);
+                     ::memcpy(output.pData_+outlen                     ,&newBox            ,sizeof(newBox));
+@@ -686,6 +688,7 @@ static void boxes_check(size_t b,size_t m)
+                 } else {
+                     const char* pad   = "\0x02\x00\x00";
+                     uint32_t    psize = 3;
++                    enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
+                     ul2Data((byte*)&newBox.length,psize+iccProfile_.size_,bigEndian);
+                     ul2Data((byte*)&newBox.type,newBox.type,bigEndian);
+                     ::memcpy(output.pData_+outlen                     ,&newBox            ,sizeof(newBox)  );
+@@ -694,6 +697,7 @@ static void boxes_check(size_t b,size_t m)
+                     newlen = psize + iccProfile_.size_;
+                 }
+             } else {
++                enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
+                 ::memcpy(output.pData_+outlen,boxBuf.pData_+inlen,subBox.length);
+             }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 8c4c81799b..024f4c794a 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.pat
             file://CVE-2021-29457.patch \
             file://CVE-2021-29458.patch \
             file://CVE-2021-29463.patch \
+            file://CVE-2021-29464.patch \
             file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
-- 
2.17.1

