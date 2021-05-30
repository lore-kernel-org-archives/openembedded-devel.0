Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.34851.1622399679118784437
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kh2dHCVx;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id x73so107677pfc.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Kx2hhyBUKL8sH0BBfFm0JosxarFiHdhzI8LQ70hpIBY=;
        b=Kh2dHCVxEzVGrAZatg8W2Bxv7A1nfmD4KUUXtX6iPQr+biDxYETJk3PRwNZk3zakFz
         NVfPLOoNfV7MLcrn06GN9k+Gwd2h2Pujo2KQrbwAu/PHI9iwIapgaUWcIIn/uNlfleqH
         FP+vZQ08hjXp4mBj8cUEtT4qvkI6NY0YZtV6RuU877V9k+Saf3rupQtTExWpkENxRVLC
         TWvOuIIvHIy0cUSO1cTL6Om1vAvCvU3ZqgORn14T5J4NMCh13wSxc+6yniXqdkztcJ3G
         i+VqiZuOjKZ/chEzSiUHxa4CWOFX1Swl7OHNw0R+9bI8zzOv+Xy3RJ9c0w2efOhXsQtY
         fYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Kx2hhyBUKL8sH0BBfFm0JosxarFiHdhzI8LQ70hpIBY=;
        b=LsBuPYBXiV5NT4exj2fkSzLNhgfSA9va6HAORaj6BUBCjNl68gD2GLEtBHCkNvhyzH
         wrCvD946AAq/7vQSn1BqCyrIKV7ZTurhOcfbzBM+FMUbe9vE0e4q9QjitLYsLJxxGmIj
         KD6YzJph5+1/wSVy+QuoqKs+6RZSlUzNguUFGgvR3AH7321+diPdyzkGHJBwLr93A2vg
         ofKIc7z+VpkjVm6vCj3TPq16Jm9L8RdKjt/Li7Y+Wtt28NZPiqbw560pfhalF/IZX5yz
         Oi8lwPWgNSEkXcahQwTfRf4v0swkFRGTjiLbAzV3nxryTLfexrPfAlNMISZ9BsursT18
         MHvA==
X-Gm-Message-State: AOAM5305xmDxT/gaReADSYQlBujZGO+JAm2JJZ7uEdo9gsDErMuB2Lpy
	KkNZapHLru0kNPZkhyElz5auE4BEzMVa/Q==
X-Google-Smtp-Source: ABdhPJynxedF4UTlcNzuuQaFUXTN7jPH1iDOIjYeKBk1TiMhGEfcyT55ibkFw4lDbFOoeHzrySCN1Q==
X-Received: by 2002:a63:63c5:: with SMTP id x188mr5625553pgb.46.1622399678524;
        Sun, 30 May 2021 11:34:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:38 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/12] exiv2: Fix CVE-2021-29470
Date: Sun, 30 May 2021 11:34:16 -0700
Message-Id: <8ac16502753b72fd1df1d88d5773ab5077d868b8.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

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

