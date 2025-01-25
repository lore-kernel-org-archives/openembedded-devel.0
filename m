Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3D8C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.14812.1737828202615181971
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ccg2YMxe;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165448243fso67878215ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828202; x=1738433002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKgG1FDEgD2CihaxzX9eZIeiEUVOrLgpSIqg5u0tk6E=;
        b=ccg2YMxeVqHPRhF2RpV0oXFRUTVd9HAwPLd3tX6OXE8lICKCfJrqVy+MWoY/AN6RQU
         BeDBG5D65gGnOUu1HALnEQvHutKqFLXvzBsj0fmrM/Ohv5pGSLf2Jz6+g3t5/ldJ7VNO
         w+20CIG6fGQWpxKaZDlHFCm0EnSr3P87vuMtH4nQ9/M5rglbUs+VLN7Alei5OUcsOqSf
         C5RRym6Oe9dapGIwlPQXT/6bhc2Hg7iJzmC5LiRegUC3tIxk+hYIPc/ngp8aQ+FE0Tds
         Y1lG/Vcoma1XA9tMVKKsOK4XihQzlL/lhKUxcRcAuNl5SH0Q5zEuHFMGi/hNbTsZUc8t
         hNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828202; x=1738433002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKgG1FDEgD2CihaxzX9eZIeiEUVOrLgpSIqg5u0tk6E=;
        b=XvGTeVqz7yR7ak8bIdFtsAWhUqgdfEGAQ5bFCVD/4j7Ke+RzJXduIbEAbLhjjylXi/
         ZXHecrSnWHsGwAXUXRdnAcATfHouCoguLfqhxQFms0lRLxovq+RA7C4pnt+LBfp+YE0E
         Ox/wDQ9XQ9BAaNom8SIdKc0jhEWlUYTUJmL/uoDFTg23c2oJFD1dJ0xEpzesM3Foo778
         6h7h6nndRFowk4JXLeV2SaN/06Si/g7YDq0mLOvy9P8AEmI/zR0GJLFDUsuOYbNPpFKe
         xgHTkPQxtur4wsAhMe8uBvfLSdwONCnn4coVc7Yha3Jv6E9m0PRY/UvnFffW+9rDPDVJ
         O6Jg==
X-Gm-Message-State: AOJu0Yy9lMTroWtxS1wFxL+hwdUc0PtBwXynuTv/CDsWV1jcwFQe9RPV
	hzQrd5s5OtNMNQ+OlxuGArjR4+dVepd4OEjCypoEGu/Au4Y7/1jK3ZCd8w==
X-Gm-Gg: ASbGncurcHKeGNrP6yhbvl8Kag1JMpwXIZR25OvLFaNWRb1VFlT9inPzSERhzWtkTBc
	7NEtrwYx5GDNuP45DZnzPcMq99b1iybWpk4s86GxwYVNMievdMifPVDufiBxW6Zxs7nNF2slx5d
	rkYgVxXx+UhQ+bLH/PLHRGw4op++i8l+zqdP8pMELHIFilRhSYVh/5g6HZHA+khu6Ob5r0Y0n32
	QjnE0z6/GPpyFNz65LogE+CWcule6vaVvS0IuV+DYWhgR5uEI3wojsTKLny/Ke/l0/Q82PCVA21
	BQUOFT8e0VYk5vdMKRPyJbBIXn8=
X-Google-Smtp-Source: AGHT+IEzJEV8o7VkYvTNhiIkEROxv3TuzN12xfClXuf0Y289X4fgTEQwv6WVaVvkjEbICVbDvg6uNQ==
X-Received: by 2002:a05:6a21:3285:b0:1e1:b1e4:e750 with SMTP id adf61e73a8af0-1eb214946aemr58921167637.18.1737828201794;
        Sat, 25 Jan 2025 10:03:21 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 12/14] audiofile: fix multiple CVEs
Date: Sat, 25 Jan 2025 10:03:06 -0800
Message-ID: <20250125180308.7856-12-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115095

From: Peter Marko <peter.marko@siemens.com>

CVE-2017-6830 / CVE-2017-6834 / CVE-2017-6836 / CVE-2017-6838

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/4a1a8277bba490d227f413e218138e39f1fe1203

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75f2bd2b3b145d8282db9926d8212c6d81bde99e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...multiplication-overflow-in-sfconvert.patch | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index a48bed2a3b..8aebe88f26 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://0003-fix-CVE-2015-7747.patch \
     file://0004-Always-check-the-number-of-coefficients.patch \
     file://0005-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch \
+    file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch b/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
new file mode 100644
index 0000000000..ec21b09f30
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch
@@ -0,0 +1,79 @@
+From 7d65f89defb092b63bcbc5d98349fb222ca73b3c Mon Sep 17 00:00:00 2001
+From: Antonio Larrosa <larrosa@kde.org>
+Date: Mon, 6 Mar 2017 13:54:52 +0100
+Subject: [PATCH] Check for multiplication overflow in sfconvert
+
+Checks that a multiplication doesn't overflow when
+calculating the buffer size, and if it overflows,
+reduce the buffer size instead of failing.
+
+This fixes the 00192-audiofile-signintoverflow-sfconvert case
+in #41
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+
+CVE: CVE-2017-6830
+CVE: CVE-2017-6834
+CVE: CVE-2017-6836
+CVE: CVE-2017-6838
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sfcommands/sfconvert.c | 34 ++++++++++++++++++++++++++++++++--
+ 1 file changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/sfcommands/sfconvert.c b/sfcommands/sfconvert.c
+index 80a1bc4..970a3e4 100644
+--- a/sfcommands/sfconvert.c
++++ b/sfcommands/sfconvert.c
+@@ -45,6 +45,33 @@ void printusage (void);
+ void usageerror (void);
+ bool copyaudiodata (AFfilehandle infile, AFfilehandle outfile, int trackid);
+ 
++int firstBitSet(int x)
++{
++        int position=0;
++        while (x!=0)
++        {
++                x>>=1;
++                ++position;
++        }
++        return position;
++}
++
++#ifndef __has_builtin
++#define __has_builtin(x) 0
++#endif
++
++int multiplyCheckOverflow(int a, int b, int *result)
++{
++#if (defined __GNUC__ && __GNUC__ >= 5) || ( __clang__ && __has_builtin(__builtin_mul_overflow))
++	return __builtin_mul_overflow(a, b, result);
++#else
++	if (firstBitSet(a)+firstBitSet(b)>31) // int is signed, so we can't use 32 bits
++		return true;
++	*result = a * b;
++	return false;
++#endif
++}
++
+ int main (int argc, char **argv)
+ {
+ 	if (argc == 2)
+@@ -323,8 +350,11 @@ bool copyaudiodata (AFfilehandle infile, AFfilehandle outfile, int trackid)
+ {
+ 	int frameSize = afGetVirtualFrameSize(infile, trackid, 1);
+ 
+-	const int kBufferFrameCount = 65536;
+-	void *buffer = malloc(kBufferFrameCount * frameSize);
++	int kBufferFrameCount = 65536;
++	int bufferSize;
++	while (multiplyCheckOverflow(kBufferFrameCount, frameSize, &bufferSize))
++		kBufferFrameCount /= 2;
++	void *buffer = malloc(bufferSize);
+ 
+ 	AFframecount totalFrames = afGetFrameCount(infile, AF_DEFAULT_TRACK);
+ 	AFframecount totalFramesWritten = 0;
+-- 
+2.11.0
+
-- 
2.43.0


