Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.34859.1622399678347338556
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I4CQBcSg;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id k15so1021878pfp.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oIPHsZCVOxC2Ne8LeS58XcGG8AZ6gtk+Av7avh1rAL0=;
        b=I4CQBcSgnAKL8C1uslb/jYE7dhMJqQACNSWDKXhaqxle0UDWuwMKLuqJD/FEzADp9h
         bwMXG6ORY85URWLWCZillN8HxBKlEw+0wNYGvLAm/qa8i3bC1v5QeePsHREGfJXXJNWa
         rRdw/7VHKuwgUEFLIwjxr0FPpKm0CkXkP6Z9J2a4jrIhyh7Xg8Prs/XstSIPRsRZWbBE
         GBEQw7xG7CNkdxvAJsuGlApJGKKfRm+pnFCq4hP1Is7a3D/26ueRHooLQSXlE6L+lqYK
         lM2T7Mi1H+0OpYehteeR9zkv3HUHhrLw0dVTZ7qo2XNL1GNNrsq5gSPfFGNKouFrtAqR
         CQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oIPHsZCVOxC2Ne8LeS58XcGG8AZ6gtk+Av7avh1rAL0=;
        b=V85HTr6WoVlt79aqatNI/wI8F5sv7m6/cBaK7aFIC5e8Yvhk04VaWd/DCMD4iHJ8Aa
         8BP2FFSmOEshxvQCgmXQp0w/D05TwBYEasfJrdz8jKoMy78ZBejuYKvq01m9yZdcOdVK
         yE4ARApD4CBeFhcyou4IsHsomFczsp+K3kGc0NR+p1RU6h4qb3GkEFEqAKTPbWyxK9FO
         Qh1HBnn0Ju5MAyf0XbS5Y1G+I9E5Aab+OJnfw38Mmq/A3xrnLcfLh/WPEr+mexqZLLn3
         hb1ky9SzisxUP10/MZwYGNuOoFKTlkpA88vxrTDpp/8GXTDIKI0y227ZURPEX2b36yq5
         sL1Q==
X-Gm-Message-State: AOAM53271FWIv68x+Jqzk+HKwEW0bIZ3g3KMAcrac4ixGRhJh8SIuHIq
	ptogwC6qo9OZlue76Ps5LJjl1MD09l/WGw==
X-Google-Smtp-Source: ABdhPJxDTmuKUhfKRnn2oHzFwGarNyrdAw3tUgFHzSU9+mjWgv2VirJX7LxyGl5+5Qi70pG5H2AwVw==
X-Received: by 2002:a63:3c0c:: with SMTP id j12mr3229266pga.377.1622399677792;
        Sun, 30 May 2021 11:34:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:37 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/12] exiv2: Fix CVE-2021-29464
Date: Sun, 30 May 2021 11:34:15 -0700
Message-Id: <29953069d9d9c2868d831492ccec7b171403ac04.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

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

