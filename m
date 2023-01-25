Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3958C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 16:54:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.50532.1674665645383394533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 08:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KVdgP/5b;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so2702603pjq.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 08:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MuYyJeYrdMy8DbwqjJwG6E3Bywmyg3kvWolu2qjUJJw=;
        b=KVdgP/5bavIFk0hXcFIHW8iuEXjfCc43AHkGBC+w3//Xn29272aJTpDykIqNF11a0u
         m0pZrFNM+w/X+GTghHX4/eAuyVqqp1GVX+nUyaRZXZPVz2FhQiiszUlpINM2w26AwG/N
         sADp+mfSmbZnZenC1wGbkq7tphkTx+rYVAaO75l+6gdZW/vrvHpDxfFK+uKYZ/0265oB
         y+lFqM2l4Mc2iUDbOnPhDK8qt8Snp0UFcAJ5oNzNWbPNWoVqj+Dw+8ZSvvROARdH3Y0X
         3lduon/MGdhcF1j8m+uERqyadGLgSbhWPPCxI9hMrYCWJPHVHtHn+xonHTnioHL7lcs9
         E1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuYyJeYrdMy8DbwqjJwG6E3Bywmyg3kvWolu2qjUJJw=;
        b=KCXy6ucXyuhhf1Zyj6ombYUOy6LZBHG0l+UGMANooUexE3s88lGLPxQ5VERYiPEWVj
         hCqExbsIZKIZyhf52RxHNDd6trWR7H8pf1xveO4V+xoOMtnA4hoCMP7J80Rt4owcsn07
         +H6mauITX1Tq0JFOPEE1jgtXRWb7DFCv588sPCg1OrEZPYDcgkIOICeV915OaPLxdW42
         fowdzJt0zeu8Oit4bk3GzQnKVlxOOI8ufW+DsZgQsVI2oTmhrY8ET/7S/2bR5wO2HqKZ
         LKuSdCblVbIfCEj7nHJ8lHDxrt1bxaReBZnjXg4jS2aW/RapCgay1NrCaj3ZJqZA3LOV
         Yc2Q==
X-Gm-Message-State: AFqh2kpkZEL4c/J0NrCheVS1IaQxFBBBvbKlxt4GJ25SGm74GfoIbYuC
	xJQ8lu4zPDNiTEdAcE/Yyk3+6COeH/TAKQ==
X-Google-Smtp-Source: AMrXdXtq6LZlqfbHSW6Ld0U1xN4Zc/W7EYN03ZUKEGECx8zXKlSy6sjUtpJ/yIcNh0LugdTqQHI1zw==
X-Received: by 2002:a17:903:22c9:b0:191:e0b0:f8df with SMTP id y9-20020a17090322c900b00191e0b0f8dfmr44473736plg.58.1674665644125;
        Wed, 25 Jan 2023 08:54:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709029a4500b00192a04bc620sm3824023plv.295.2023.01.25.08.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 08:54:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] libcamera: Fix build with gcc-13
Date: Wed, 25 Jan 2023 08:54:00 -0800
Message-Id: <20230125165401.1151126-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 16:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100778

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...le_sink.cpp-Avoid-dangling-reference.patch | 46 +++++++++++++++++++
 .../libcamera/libcamera_0.0.1.bb              |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch
new file mode 100644
index 0000000000..5aa6ee8d3c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch
@@ -0,0 +1,46 @@
+From 0e97896e6a09957f27125957d00b5150ec90b2e9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jan 2023 01:18:25 -0800
+Subject: [PATCH] file_sink.cpp: Avoid dangling-reference
+
+Fixes following errors with gcc-13
+
+../git/src/cam/file_sink.cpp:92:45: error: possibly dangling reference to a temporary [-Werror=dangling-reference]
+   92 |                 const FrameMetadata::Plane &meta = buffer->metadata().planes()[i];
+      |                                             ^~~~
+../git/src/cam/file_sink.cpp:92:81: note: the temporary was destroyed at the end of the full expression '(& buffer->libcamera::FrameBuffer::metadata())->libcamera::FrameMetadata::planes().libcamera::Span<const libcamera::FrameMetadata::Plane>::operator[](i)'
+   92 |                 const FrameMetadata::Plane &meta = buffer->metadata().planes()[i];
+      |                                                                                 ^
+cc1plus: all warnings being treated as errors
+
+Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2023-January/036575.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cam/file_sink.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/cam/file_sink.cpp b/src/cam/file_sink.cpp
+index 45213d4a..897c4b37 100644
+--- a/src/cam/file_sink.cpp
++++ b/src/cam/file_sink.cpp
+@@ -89,13 +89,13 @@ void FileSink::writeBuffer(const Stream *stream, FrameBuffer *buffer)
+ 	Image *image = mappedBuffers_[buffer].get();
+ 
+ 	for (unsigned int i = 0; i < buffer->planes().size(); ++i) {
+-		const FrameMetadata::Plane &meta = buffer->metadata().planes()[i];
++		unsigned int bytesused = buffer->metadata().planes()[i].bytesused;
+ 
+ 		Span<uint8_t> data = image->data(i);
+-		unsigned int length = std::min<unsigned int>(meta.bytesused, data.size());
++		unsigned int length = std::min<unsigned int>(bytesused, data.size());
+ 
+-		if (meta.bytesused > data.size())
+-			std::cerr << "payload size " << meta.bytesused
++		if (bytesused > data.size())
++			std::cerr << "payload size " << bytesused
+ 				  << " larger than plane size " << data.size()
+ 				  << std::endl;
+ 
+-- 
+2.39.1
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
index 483fe1507e..46f058f2ea 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
+        file://0001-file_sink.cpp-Avoid-dangling-reference.patch \
 "
 
 SRCREV = "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
-- 
2.39.1


