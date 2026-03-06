Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FAFFCB60E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70988.1772809568168463445
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YdDzWj+n;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483703e4b08so91181865e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809566; x=1773414366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlAzP83lFvnTjIL3oyhm728i5veiLXvOesiH7QUFkJY=;
        b=YdDzWj+ngctYbiNktW2XKxR4dAZxBIo15+FEmadkieSzhdNoQr13lfi/Xb379+fx1k
         7fhFFe8wfdJQQ8+n3cbCvJDQwckEgXgRnROD+ed0730RbCLPvViprfq6GKpCLj9MHEgU
         tLtG/nUHcoPieI3tH9US2Cf1UeXQay2e7p6M8KXRX/DNLatVO577Q3VEmygZNkMzHKWl
         yajzSTGildegiFPwsV2cqv/9vEZuFbzcZxXUxn4UgsOimRaIuttKWJiFPXXgbr4yNaR9
         jjn4RJZU3ZAmH8hAa4+0kttgUOHOkuRB2oBlTUoUTjpoIqPLtK5lx8cSb+KVOb0KFsZf
         P1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809566; x=1773414366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qlAzP83lFvnTjIL3oyhm728i5veiLXvOesiH7QUFkJY=;
        b=tzX6UGBwO2KEDskQA+m7Dh8cuDJCL8jKtaagz+AVUSvQZ9vEBUDbyr0lnscsVrZIrY
         8ZfdLJKaYplAdBRIk6HsoR6KLrRZPVM+vTd+mYwpeQxSBAxb9jA+ch8+sIYTNz1ZUQil
         mOT2N/FZ0u7i4G7//h++I1yGwzUP4wgcdZPHrFvGmb6fr18yGrqyhBmZCK+yNw0oGnhO
         mjy6/Mb2e2ricnEVSyyRjJUNbzCRbdSsWIW0sA40m3ZZtwmaA97qUEy19x/eRSchJ07D
         hTfvYGVMRGoUT0b0WdH+M4IVqMmJ5DNcnW4I58/Uj2JUh3CHRlvM/WB68AWBafVkjT69
         vnFA==
X-Gm-Message-State: AOJu0YwsmhGJ5nCaDODQKxB6z8naft7F/gsXptUjDlv0K3XTwRwJKUDH
	ifoGBlbL1wLudTZGrn6EcybYBxD58KqH7K27Nwd4u5xLXzD1N4fD7qW7GuvGDw==
X-Gm-Gg: ATEYQzzvt0UcjIMej+LPcM6XHaePCvZT6Q6H+yC54z824dHIMIR4tsJ3zHyeT2mkfDm
	kkCG5xYWz8Zc8sGlQSiyQj4/wnKii47TjfCkU/eD8/ZV0G6A9BnE1BJJ1tAHn6CkrsBeB+p9H2t
	6iHglbPod0zOUHJxiTISq9Od1Ix2kLCg+XhUFz8bkhPsOnBLhoVKUnZA+A9ks314Jn1p6jWKmeX
	9/IYTi9ZdC/PlynJh8Eb7NIM+GChRzuS8gs9bjRH6oreHCbRbhU2jYUf2D6F4P+/B5VnyMEackq
	NP/xuJyZ31AyyhItyynehI+7ijPB7DT0sSi9DVRMNl1aNp+0T6k/MvSu++tOeuo35xQKkk5+eJt
	MmPNKvVNO3BMsDlOV555x9Gdd9VRDEgNf2/25Vnbng/r+zeoxXph0Xnh1pjX9yfu+9hEd6bbGzw
	G4DYel2CuzqFj1UzrE0kwT
X-Received: by 2002:a05:600c:8b2b:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-48526715213mr35768285e9.3.1772809566104;
        Fri, 06 Mar 2026 07:06:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 04/11] imagemagick: patch CVE-2026-25576
Date: Fri,  6 Mar 2026 16:05:55 +0100
Message-ID: <20260306150602.616834-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124908

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25576

Backport the patch that is referenced by he NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-25576.patch          | 604 ++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |   1 +
 2 files changed, 605 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25576.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25576.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25576.patch
new file mode 100644
index 0000000000..87003f503e
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25576.patch
@@ -0,0 +1,604 @@
+From 5b9798eeef019d2f9c6f120fbc173ffd872a7cf7 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 25 Jan 2026 19:21:20 +0100
+Subject: [PATCH] Fixed out of bounds read in multiple coders that read raw
+ pixel data (GHSA-jv4p-gjwq-9r2j)
+
+CVE: CVE-2026-25576
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/077b42643212d7da8c1a4f6b2cd0067ebca8ec0f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/bgr.c   | 22 ++++++++++++----------
+ coders/cmyk.c  | 26 ++++++++++++++------------
+ coders/gray.c  | 14 ++++++++------
+ coders/raw.c   |  4 +++-
+ coders/rgb.c   | 26 +++++++++++++++-----------
+ coders/ycbcr.c | 22 ++++++++++++----------
+ 6 files changed, 64 insertions(+), 50 deletions(-)
+
+diff --git a/coders/bgr.c b/coders/bgr.c
+index 822653543..4b4939054 100644
+--- a/coders/bgr.c
++++ b/coders/bgr.c
+@@ -125,6 +125,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+     length;
+ 
+   ssize_t
++    columns,
+     count,
+     y;
+ 
+@@ -203,6 +204,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   scene=0;
+   status=MagickTrue;
+   stream=NULL;
++  columns=(ssize_t) MagickMin(image->columns,canvas_image->columns);
+   do
+   {
+     /*
+@@ -264,7 +266,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+@@ -347,7 +349,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 if ((p == (const Quantum *) NULL) ||
+                     (q == (Quantum *) NULL))
+                   break;
+-                for (x=0; x < (ssize_t) image->columns; x++)
++                for (x=0; x < columns; x++)
+                 {
+                   switch (quantum_type)
+                   {
+@@ -443,7 +445,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -496,7 +498,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -549,7 +551,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlue(image,GetPixelBlue(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -611,7 +613,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                   if ((p == (const Quantum *) NULL) ||
+                       (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -702,7 +704,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -774,7 +776,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -846,7 +848,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlue(image,GetPixelBlue(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -920,7 +922,7 @@ static Image *ReadBGRImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                   if ((p == (const Quantum *) NULL) ||
+                       (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+diff --git a/coders/cmyk.c b/coders/cmyk.c
+index 03f193ef4..3929bad95 100644
+--- a/coders/cmyk.c
++++ b/coders/cmyk.c
+@@ -125,6 +125,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+     length;
+ 
+   ssize_t
++    columns,
+     count,
+     y;
+ 
+@@ -202,6 +203,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+   scene=0;
+   status=MagickTrue;
+   stream=NULL;
++  columns=(ssize_t) MagickMin(image->columns,canvas_image->columns);
+   do
+   {
+     /*
+@@ -264,7 +266,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+@@ -348,7 +350,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                   image->columns,1,exception);
+                 if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                   break;
+-                for (x=0; x < (ssize_t) image->columns; x++)
++                for (x=0; x < columns; x++)
+                 {
+                   switch (quantum_type)
+                   {
+@@ -443,7 +445,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -495,7 +497,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -547,7 +549,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlue(image,GetPixelBlue(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -599,7 +601,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlack(image,GetPixelBlack(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -654,7 +656,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                     image->columns,1,exception);
+                   if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -744,7 +746,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -815,7 +817,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -887,7 +889,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlue(image,GetPixelBlue(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -959,7 +961,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+               if ((p == (const Quantum *) NULL) ||
+                   (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlack(image,GetPixelBlack(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -1033,7 +1035,7 @@ static Image *ReadCMYKImage(const ImageInfo *image_info,
+                   if ((p == (const Quantum *) NULL) ||
+                       (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+diff --git a/coders/gray.c b/coders/gray.c
+index 14bdaf034..fc06b77f2 100644
+--- a/coders/gray.c
++++ b/coders/gray.c
+@@ -126,6 +126,7 @@ static Image *ReadGRAYImage(const ImageInfo *image_info,
+     length;
+ 
+   ssize_t
++    columns,
+     count,
+     y;
+ 
+@@ -203,6 +204,7 @@ static Image *ReadGRAYImage(const ImageInfo *image_info,
+   scene=0;
+   status=MagickTrue;
+   stream=NULL;
++  columns=(ssize_t) MagickMin(image->columns,canvas_image->columns);
+   do
+   {
+     /*
+@@ -263,7 +265,7 @@ static Image *ReadGRAYImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+@@ -343,7 +345,7 @@ static Image *ReadGRAYImage(const ImageInfo *image_info,
+                   image->columns,1,exception);
+                 if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                   break;
+-                for (x=0; x < (ssize_t) image->columns; x++)
++                for (x=0; x < columns; x++)
+                 {
+                   switch (quantum_type)
+                   {
+@@ -423,7 +425,7 @@ static Image *ReadGRAYImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGray(image,GetPixelGray(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -478,7 +480,7 @@ static Image *ReadGRAYImage(const ImageInfo *image_info,
+                     image->columns,1,exception);
+                   if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -568,7 +570,7 @@ static Image *ReadGRAYImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -642,7 +644,7 @@ static Image *ReadGRAYImage(const ImageInfo *image_info,
+                     image->columns,1,exception);
+                   if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+diff --git a/coders/raw.c b/coders/raw.c
+index c7abd8798..ec3f6fb4b 100644
+--- a/coders/raw.c
++++ b/coders/raw.c
+@@ -119,6 +119,7 @@ static Image *ReadRAWImage(const ImageInfo *image_info,ExceptionInfo *exception)
+     length;
+ 
+   ssize_t
++    columns,
+     count,
+     y;
+ 
+@@ -187,6 +188,7 @@ static Image *ReadRAWImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   length=0;
+   status=MagickTrue;
+   stream=NULL;
++  columns=(ssize_t) MagickMin(image->columns,canvas_image->columns);
+   do
+   {
+     /*
+@@ -239,7 +241,7 @@ static Image *ReadRAWImage(const ImageInfo *image_info,ExceptionInfo *exception)
+             1,exception);
+           if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+             break;
+-          for (x=0; x < (ssize_t) image->columns; x++)
++          for (x=0; x < columns; x++)
+           {
+             SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+             SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+diff --git a/coders/rgb.c b/coders/rgb.c
+index 80b0f2d0f..a0c95fa2e 100644
+--- a/coders/rgb.c
++++ b/coders/rgb.c
+@@ -126,6 +126,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+ 
+   ssize_t
+     count,
++    columns,
+     y;
+ 
+   unsigned char
+@@ -206,6 +207,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   scene=0;
+   status=MagickTrue;
+   stream=NULL;
++  columns=(ssize_t) MagickMin(image->columns,canvas_image->columns);
+   do
+   {
+     /*
+@@ -266,7 +268,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+@@ -350,7 +352,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                   image->columns,1,exception);
+                 if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                   break;
+-                for (x=0; x < (ssize_t) image->columns; x++)
++                for (x=0; x < columns; x++)
+                 {
+                   switch (quantum_type)
+                   {
+@@ -445,7 +447,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -497,7 +499,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -549,7 +551,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlue(image,GetPixelBlue(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -603,7 +605,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                     image->columns,1,exception);
+                   if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -693,7 +695,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -764,7 +766,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -835,7 +837,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlue(image,GetPixelBlue(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -908,7 +910,7 @@ static Image *ReadRGBImage(const ImageInfo *image_info,ExceptionInfo *exception)
+                     image->columns,1,exception);
+                   if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -1025,6 +1027,7 @@ static Image *ReadRGB565Image(const ImageInfo *image_info,
+     length;
+ 
+   ssize_t
++    columns,
+     count,
+     y;
+ 
+@@ -1097,6 +1100,7 @@ static Image *ReadRGB565Image(const ImageInfo *image_info,
+   scene=0;
+   status=MagickTrue;
+   stream=NULL;
++  columns=(ssize_t) MagickMin(image->columns,canvas_image->columns);
+   do
+   {
+     /*
+@@ -1150,7 +1154,7 @@ static Image *ReadRGB565Image(const ImageInfo *image_info,
+             image->columns,1,exception);
+           if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+             break;
+-          for (x=0; x < (ssize_t) image->columns; x++)
++          for (x=0; x < columns; x++)
+           {
+             unsigned short
+               pixel;
+diff --git a/coders/ycbcr.c b/coders/ycbcr.c
+index 00caf73a3..7f5cee14d 100644
+--- a/coders/ycbcr.c
++++ b/coders/ycbcr.c
+@@ -125,6 +125,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+     length;
+ 
+   ssize_t
++    columns,
+     count,
+     y;
+ 
+@@ -202,6 +203,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+   scene=0;
+   status=MagickTrue;
+   stream=NULL;
++  columns=(ssize_t) MagickMin(image->columns,canvas_image->columns);
+   do
+   {
+     /*
+@@ -264,7 +266,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+@@ -346,7 +348,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                   image->columns,1,exception);
+                 if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                   break;
+-                for (x=0; x < (ssize_t) image->columns; x++)
++                for (x=0; x < columns; x++)
+                 {
+                   switch (quantum_type)
+                   {
+@@ -436,7 +438,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -488,7 +490,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -540,7 +542,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlue(image,GetPixelBlue(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -594,7 +596,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                     image->columns,1,exception);
+                   if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -684,7 +686,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelRed(image,GetPixelRed(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -755,7 +757,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelGreen(image,GetPixelGreen(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -826,7 +828,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                 image->columns,1,exception);
+               if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                 break;
+-              for (x=0; x < (ssize_t) image->columns; x++)
++              for (x=0; x < columns; x++)
+               {
+                 SetPixelBlue(image,GetPixelBlue(canvas_image,p),q);
+                 p+=(ptrdiff_t) GetPixelChannels(canvas_image);
+@@ -900,7 +902,7 @@ static Image *ReadYCBCRImage(const ImageInfo *image_info,
+                     image->columns,1,exception);
+                   if ((p == (const Quantum *) NULL) || (q == (Quantum *) NULL))
+                     break;
+-                  for (x=0; x < (ssize_t) image->columns; x++)
++                  for (x=0; x < columns; x++)
+                   {
+                     SetPixelAlpha(image,GetPixelAlpha(canvas_image,p),q);
+                     p+=(ptrdiff_t) GetPixelChannels(canvas_image);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index 3e2d3ab344..6e0b42cd2a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-24481.patch \
            file://CVE-2026-24484.patch \
            file://CVE-2026-24485.patch \
+           file://CVE-2026-25576.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

