Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.6304.1622029980669625662
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HQ/DosZi;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so186952pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Kx2hhyBUKL8sH0BBfFm0JosxarFiHdhzI8LQ70hpIBY=;
        b=HQ/DosZim81q+MEuEnnIiHVoN6qH91jeAiVzXgR2UXAISo+p5vkzmKhKc7/eKA7lpS
         vsqPDJpjxjcLkTIwCmEm2asPTCLCYC5EGk2B6O5Zk6ov6L2Lx1+hMRPC/ZW97/0uhSPk
         bEDxOtL/DuRrGuAu5a7EbogYzSajX9d4ffFRTNb3NvCCldn6uC69oi0Ht/URf2LoxMR4
         SjJ4Qrwzk+2VloxHzG8bCd92rXKP/7bxiIbzalVt95h2yhzDCYz+LG9vSlgN1N3THFuL
         ek9nFZ39RBbN2jeNdwwik33vHY9fPS3zKiCMsW22UC/6YY0fJhMYMAzkAbctrD+kEmTI
         ufog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Kx2hhyBUKL8sH0BBfFm0JosxarFiHdhzI8LQ70hpIBY=;
        b=kDmC2dAKC9GKj519lPMACl5WxyzC0EWEnDF2lRJOLEpPgjQ3KCXIv+w6XY9xxzh3Bi
         ue8xkY1/Tgto0YNOrbdj9EHro6PodCZZmguozX+cgzGla/5UX9Vwlun40w4B7DEhpd31
         vkxAYaBXKdPPp+L36xCp5VyxAL24UNLVM+JXN2XnrFzaklQ8DXXFQUi350obVZMRG6uk
         xj34JP0g74TpiQS8sKnjifcAh852DwK6Hyc0vvZxuuC43yb6aXFpWdHelnSmUilq4iCp
         0iPsjVOHSW7DPsPm2lTh8tRYxbsLs8Zdm4/lOkSCmocjW9g9LR9S0W+p2NWszyUqLq2W
         YhgA==
X-Gm-Message-State: AOAM531t2+z8EUsk5rXrFF5ThClCAWLmSB5rdDOStQwgf75EdO+nFx2f
	TXoZCqmobva+Uhcksksh8wS2dcZJxMfe9g==
X-Google-Smtp-Source: ABdhPJzkvzufWGxYaO6PNhST+YJN6U/Vgg6cMij9PZHMnoQOUP1bb7WC3fc4Osr1EB/lsj/ApmEJNw==
X-Received: by 2002:a17:90b:344:: with SMTP id fh4mr35985215pjb.119.1622029980063;
        Wed, 26 May 2021 04:53:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:59 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 13/23] exiv2: Fix CVE-2021-29470
Date: Wed, 26 May 2021 04:52:28 -0700
Message-Id: <ce025415dd0158d57cb418e86c05c4624dbc3988.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29470

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1581/commits/6628a69c036df2aa036290e6cd71767c159c79ed]
      CVE: CVE-2021-29470

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb1400efda77a7289ca20782172bfbe1f457f161)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29470.patch          | 32 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
new file mode 100644
index 0000000000..eedf9d79aa
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
@@ -0,0 +1,32 @@
+From 6628a69c036df2aa036290e6cd71767c159c79ed Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Wed, 21 Apr 2021 12:06:04 +0100
+Subject: [PATCH] Add more bounds checks in Jp2Image::encodeJp2Header
+---
+ src/jp2image.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index b424225..349a9f0 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -645,13 +645,16 @@ static void boxes_check(size_t b,size_t m)
+         DataBuf output(boxBuf.size_ + iccProfile_.size_ + 100); // allocate sufficient space
+         long    outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
+         long    inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
++        enforce(sizeof(Jp2BoxHeader) <= static_cast<size_t>(output.size_), Exiv2::kerCorruptedMetadata);
+         Jp2BoxHeader* pBox   = (Jp2BoxHeader*) boxBuf.pData_;
+         uint32_t      length = getLong((byte*)&pBox->length, bigEndian);
++        enforce(length <= static_cast<size_t>(output.size_), Exiv2::kerCorruptedMetadata);
+         uint32_t      count  = sizeof (Jp2BoxHeader);
+         char*         p      = (char*) boxBuf.pData_;
+         bool          bWroteColor = false ;
+ 
+         while ( count < length || !bWroteColor ) {
++            enforce(sizeof(Jp2BoxHeader) <= length - count, Exiv2::kerCorruptedMetadata);
+             Jp2BoxHeader* pSubBox = (Jp2BoxHeader*) (p+count) ;
+ 
+             // copy data.  pointer could be into a memory mapped file which we will decode!
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 024f4c794a..2419bab352 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.pat
             file://CVE-2021-29458.patch \
             file://CVE-2021-29463.patch \
             file://CVE-2021-29464.patch \
+            file://CVE-2021-29470.patch \
             file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
-- 
2.17.1

