Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AC5E6814B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:01:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8201.1771318889254037187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 01:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MICxQ2ub;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso2105065b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 01:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771318888; x=1771923688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/HX91UWFyGzU15GDcamJ8bHbbw0Kmxu6jtwy1NiRvQ=;
        b=MICxQ2ub7zBZewkBzzTLtAWE2F7yYgj+IZWdmYzLM73nUyz1qps61pYx9Ngyn7mH5n
         PE73pDPJ23GCtbtzHIUbTu6zcC4CWDUq0ng/Sc4/Ti5KPLHavUd9NfCZ/YKbEj0s4zcU
         i4m4nS3YVD5Lhj7gdxemoQJDHi0dLLsuGjcSX+mHwp8uQ/95c1W+Jip6Ed4w+Ht1xZ4N
         4gLdo7yFvvomvDRoI8PDG+gh0q+aEiuKb0Nx8e756KHfLzlag4pBdQNYe6p+t0Spx5s3
         g9TgHAWY1gGPXQV/1V+kfeDCNpyjEmGmajtz7TuMhc1I0XyG5hsuurmTUpjtsX7MyYlw
         Y1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771318888; x=1771923688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/HX91UWFyGzU15GDcamJ8bHbbw0Kmxu6jtwy1NiRvQ=;
        b=S16J49hrw/yLdfhie3TcXWYyCvd7RPKndui+BnyEHGNcgkZgc7dxWLJ+fbRob+UmAK
         pgXHME09yBjklmT0bFvr2CiomI1R8zxxjvwQlkzUjDkChWBqvXxEG2AjGbkYNu3RgZSe
         DFnfJI6jopXDUBuEY73XeR5Z3V1sGmCI4BCzjhKUzElpQomtzEmbU0a9//xE2rT5+BwL
         wjpMQkRiyA1t4vjzJ+nNXkm9HKhaAWq0Nc4bcazdD1Q/T3nTFg7yflFpalFxx5ZembQ9
         bD3Q+In2iFfLPUL27EEb9gZY9A7dErZ1C7DRXHVwlXKBvkbYRRoRqvh/z0TBugSgVgO1
         1Skw==
X-Gm-Message-State: AOJu0Yy431uSSJzYpqJs+7g5acn85Qu0UH4OrPo84pk7k42j5dAgPC7t
	sJLsuHQ1ckHjfPDXWlpXnsC0POUhJBXjCqKOxcGEr8XyQpxwZZUGx5lZdWF3OA==
X-Gm-Gg: AZuq6aLf1PGE2VHUi+0gL3JETehlmD2X/XxRzPKqbTPVhzm9V9GCNP7wG5BZtW295Lg
	shnXxVeijoWBzTcQSc860fZzXp+TJkgTFJXvA130spMkGxIVpWV1q40QnNJ2co2xLasubRdS6FR
	f8UktZUUWjxHq0NBNMiKUh60/1pYF+mkO+31i1ZeLNg316DFt+/03IQg2JYSIhyc2X/bw2CQAkZ
	oFsO1hxgPPixXj0110NiEYmW/aL6vlZ7XKOi+534qtOayaQ2FYTzbQvx1dedPUM0vtxC4HT81Mm
	FVI9QYJdh+/egVoSZ/Eh/KL1kQm7vwpM+S0wcz2UZj5D/TzcPWwjwPCGGz9tvJWTz2Lh+wgX2xr
	puw6e9PkN9Ct4cfXSpBRSD/CBKswh6S81VTNwVuo4W2b8XD6QPKiEiSnHKJ184l1t6JMS1EkTiH
	649fQmTp25YPlX7YpdW/FK+Ls9w/Jkag==
X-Received: by 2002:a05:6a20:748e:b0:35e:e604:f78b with SMTP id adf61e73a8af0-3946c79956fmr12928843637.3.1771318888324;
        Tue, 17 Feb 2026 01:01:28 -0800 (PST)
Received: from L-12443L.kpit.com ([106.51.47.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5332facfsm9171274a12.32.2026.02.17.01.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:01:28 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [meta-oe][scartgap][PATCH 1/4] imagemagick: Fix CVE-2026-22770
Date: Tue, 17 Feb 2026 14:30:16 +0530
Message-Id: <20260217090019.1076725-1-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 09:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124441

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


