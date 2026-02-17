Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FEAE8385C
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 06:52:24 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6935.1771311139637855862
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 22:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSV88Sn+;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso3220056b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 22:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771311139; x=1771915939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/HX91UWFyGzU15GDcamJ8bHbbw0Kmxu6jtwy1NiRvQ=;
        b=KSV88Sn+x8DZURNMk3h2kiqVXT62vT1T3khfxJrawaVTll1lvQexjUENX+2oWE65RW
         kfOv6elD7gn7PLcfWwqtcAybrCyxR8sohMbPovZLOedC1rRddeGLiD7JoJv25VTtXBte
         Viw8BsNfxG6thM+qB4Lxmb2KAvPSqgGT120+C0eA6CvUVHyXfvi/8iw3+7T0JtpIM13A
         mXzixsuaX1Y7uIQ9b9I8zPxwi0zPRU32vTa3Qa6ysO86WQI0hgcqkAbVb+Afo+z5r6OL
         li4B/drnL9j9vED9R4tSNY48HJd/s6vBduv73yqaj1XcrO1mlNZ8WUXIELvrKMA7KeMM
         klHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771311139; x=1771915939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/HX91UWFyGzU15GDcamJ8bHbbw0Kmxu6jtwy1NiRvQ=;
        b=f78igIkOt2M0wRp/3CXo+RwF8QGmstZpMEgNxMup7HT1Ut6Ffwh9IR88kFInhDtGOH
         HLrVyXrVISc8ILlggdX6tquAjFntSgmnUm+RwVKroGwIoNAgvyTW55I2OjqGRqUP4Amn
         3J8zygcWyIk4oBOeOAejewVx7v9RYpZXt7ClZuWH+ypeIjP14DxTPIThIAVQnaAFNWlw
         LwABz8hIQZbv+9ycG8AifH6rTmt9S2tV7pOMM78BB+L4+5X1VaUqkYmbVYMmnJNhuRU4
         8MrYCq7LjZUW26z9UfRcgaJXsp2dkFECRpqvsIb+ZuqSipdYS6C4+yBokolfx+EC2iT0
         doPA==
X-Gm-Message-State: AOJu0Yx0+F0ng0HZ06h1oTWcEGvOR06QBegZcdrIdkBUI7Df/Fi+fcBg
	ac8pXexTAQF3jfWq/vzTkHzidrJqFsfmOWx0Pemvr7rkRKw86lipqaKe88eNqA==
X-Gm-Gg: AZuq6aJG9dYw0jNa5vqvjG6g0LbiAvOePj+9Ejn53GYGkL7peywNZEjri1ZD3z60egG
	ZUcMNWXM6CSxWS59QPzBRTzAEMIE6qutuvG0MrfOYZePyGYv6E3Dfk8MuVWctZh62bOlpsxsQWl
	KG2L/i/rLhWWq8J8lKlT0fNgFYppfKlrDSoFcJGvq2f6JK7k2GMr73y57xrN1KRsthqzdHd737E
	P120rkuo9Eb6FtWptWBSx7sJpTt4pE0q/REOpnUQzKKzbglMdikaMHBA4gxQZG6P5vTnsZBJxM+
	yKOppfeQIiG4qwpUqPnHyVJRG46aQP1Bpv0QmqwEWrxGH/Oko03n306rcANab2uTtnUIK8QPiZ0
	MoOTLUtzuQnrletECK6go8wJ72Opagm0dMJgVHm7A2mCJek7VF6IBKPd/ld6tI020VbTLMewtKD
	Ds6wEFw9yXLfX1UVuubRafbsP1Lhag4A==
X-Received: by 2002:a05:6a20:cf8d:b0:38e:9c64:bd39 with SMTP id adf61e73a8af0-394672ce209mr13309325637.44.1771311138700;
        Mon, 16 Feb 2026 22:52:18 -0800 (PST)
Received: from L-12443L.kpit.com ([106.51.47.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a61cf8asm131561585ad.0.2026.02.16.22.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:52:18 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [OE-core][scartgap][PATCH 1/4] imagemagick: Fix CVE-2026-22770
Date: Tue, 17 Feb 2026 12:21:20 +0530
Message-Id: <20260217065123.1001038-1-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 06:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124435

Fix CVE-2026-22770 with patch provided by NVD advisory.

Link: https://nvd.nist.gov/vuln/detail/CVE-2026-22770

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../imagemagick/CVE-2026-22770.patch          | 41 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-22770.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-22770.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-22770.patch
new file mode 100644
index 0000000000..a89a8b9d3c
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-22770.patch
@@ -0,0 +1,41 @@
+From 3e0330721020e0c5bb52e4b77c347527dd71658e Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 4 Jan 2026 15:26:48 +0100
+Subject: [PATCH] Correct memset initialization and add an overflow check
+ (GHSA-39h3-g67r-7g3c)
+
+CVE: CVE-2026-22770
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/3e0330721020e0c5bb52e4b77c347527dd71658e]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ MagickCore/effect.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/MagickCore/effect.c b/MagickCore/effect.c
+index a343e42259d..b2fdf626cb1 100644
+--- a/MagickCore/effect.c
++++ b/MagickCore/effect.c
+@@ -876,16 +876,21 @@ static double **AcquireBilateralTLS(const size_t number_threads,
+   double
+     **weights;
+ 
++  size_t
++    count;
++
+   ssize_t
+     i;
+ 
++  if (HeapOverflowSanityCheckGetSize(height,sizeof(**weights),&count) != MagickFalse)
++    return((double **) NULL);
+   weights=(double **) AcquireQuantumMemory(number_threads+1,sizeof(*weights));
+   if (weights == (double **) NULL)
+     return((double **) NULL);
+-  (void) memset(weights,0,number_threads*sizeof(*weights));
++  (void) memset(weights,0,(number_threads+1)*sizeof(*weights));
+   for (i=0; i <= (ssize_t) number_threads; i++)
+   {
+-    weights[i]=(double *) AcquireQuantumMemory(width,height*sizeof(**weights));
++    weights[i]=(double *) AcquireQuantumMemory(width,count);
+     if (weights[i] == (double *) NULL)
+       return(DestroyBilateralTLS(number_threads,weights));
+   }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 99632967c2..94b2df10a2 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-57807.patch \
            file://CVE-2025-62171.patch \
            file://CVE-2025-65955.patch \
+           file://CVE-2026-22770.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


