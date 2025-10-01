Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28595CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.18464.1759326779592845383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FjEEHUa0;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6364eb32535so5749512a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326778; x=1759931578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utPQeCHpSqKcUaVB3LTX5z7111i+tmUGFopqi221CoY=;
        b=FjEEHUa00yQzUuiO72JS1OkvIjJIhnIskT0mXDLNqXcFsesQo5n8Q6elY/ctbUn5ib
         BfhIkbK6ER9irXE0Yn/m/Fgv84qO2r7JcYjWcED0lmqsgSNeDE/AtNK1If8Xn+VqXq3m
         bCz0zESipTWh2fIL0mQnZY8Pf3Km+i/dhoD3HHCxDjESL98YBYIqX9H8FBMZi4WxiNnJ
         7AuEgOySJ0JNYZxPwv9VEeMYQfVZw4zB7E94TWMXYsQNE7GK97gGD024F2oCXBAd8rwC
         DCQdnrGLe1/QSNGiInRxFQxLnPCq5O46v/msz6XDUpxIZvR8LpJj8F3UpS5nt6AomMnH
         LnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326778; x=1759931578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utPQeCHpSqKcUaVB3LTX5z7111i+tmUGFopqi221CoY=;
        b=T3yKp/QMSrVB8fZ6++L8Arivg7VUWVL4G2w3+JsUP17ZkrwivwLxyvVRIzq2xdOIMz
         4QlnXVEeVxdeYlygQ61l8vpCSsKREUoT8DdxmCdzy43hGYpP4Oc9ZtQZRT5ehM2+Befl
         5WeYeLDc/Yc6omCY1WLb4KIrCU5voWGCaXblQ0te+N31L39sRsDqxREYVPvP15+a+2TV
         mtEMjP06RToZCgZ9WEhjNzEnKSju3hbBLueSuP1YFj6vp3J5qGpubd7Gee5D04cXg207
         WLG2g4tdeXAmbbL61C/yPi72fRz6SZBEw16ejpI6gY2aBCQh1LFG++Z0Z628pbOWNnIH
         +tFw==
X-Gm-Message-State: AOJu0Yy43epVEsj9l+UqO7ZTNp1wMx8VM4XBFs2vZPKE75OVRgMKOo9+
	fi7UfaBcZHZVQg9orieyVsCry8Py2TtzlsQ85VIRIUxVklAL+WoQ6q7dGQoSAw==
X-Gm-Gg: ASbGncuR6FZf83KcSsuycVGu14jZCDqakgUl0x8i91xxjIrqTx0qwHB4G9gpTiLBp3c
	wczRXsfli2EUMTe/7UGixO5t6QRkfhy2lc4ya6JRik+iS7z1u6xP/oKcbOCsdnJdC8F3jbi3ytR
	vqoABA+jZj+/KFUZZ8iSz0CtYman2p0xtyQPvR9bXc3C+sOL8yUXpTYktMbYrJirjHVZicOV1b3
	g4pjlwxa1zCL7nQb015ayT5n2tJt8qcds7gAMl+mW+LPzO1kELDkNUcTP13qko1FWNbwf7SfpP/
	cnwAwaZVsrvqVsRrUhCAVqe9+1uecUk/i6PgY79O0GrFFYRay2PVMWSlOEOejECeU6oQMo8zZYN
	gnx13A5Uj+xDpvB9zlbfAEgyMqM4dLcL+6DGygeHfvlZf
X-Google-Smtp-Source: AGHT+IEdoEEFfNr9hfIc+t3qshGTng04ZfLKvFCrHNcbfemjoVno/sluS+XJWRkoO4HvjLqaT2U4dw==
X-Received: by 2002:a05:6402:348b:b0:62e:de67:6543 with SMTP id 4fb4d7f45d1cf-63678bcb5d7mr3663293a12.4.1759326777889;
        Wed, 01 Oct 2025 06:52:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 16/25] audiofile: fix multiple CVEs
Date: Wed,  1 Oct 2025 15:52:34 +0200
Message-ID: <20251001135243.1490753-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120131

From: Peter Marko <peter.marko@siemens.com>

CVE-2017-6830 / CVE-2017-6834 / CVE-2017-6836 / CVE-2017-6838

Use patch from buildroot:
https://github.com/buildroot/buildroot/commit/4a1a8277bba490d227f413e218138e39f1fe1203

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75f2bd2b3b145d8282db9926d8212c6d81bde99e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../audiofile/audiofile_0.3.6.bb              |  1 +
 ...multiplication-overflow-in-sfconvert.patch | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/0006-Check-for-multiplication-overflow-in-sfconvert.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index ec162154b6..0ed3853553 100644
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

