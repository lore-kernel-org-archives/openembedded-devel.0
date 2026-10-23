Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1653.1792738445907047929
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hqunQHq5;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89f639ba307so233584b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738445; x=1793343245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ETvMeuKEplFT0AcnMrDWFu/1GpAv92DVSv7ACKc8EM=;
        b=hqunQHq50gi2zTws45OUVOx4ZrRKufyWDr1/MLF99Vm9Cq7M24+PLfLxRnhSoktZs6
         tjXCY6I8SXpFWDjfVfnMlk5jjMKjY+VnwwmoyreKr7IdSroKBEt9zpa+gl15TN30Xw/i
         9Pn+ag2Er+m6yePgk0aVG+FpMs6hIcdwcGcwkDDQBkBdY3H3QsFSJJ+NtAPtCufIdmfN
         h2ajnY+nMa0kMBKCjEZgwAtTYS+nOFOubQQ/vGyVCvvXzKzN0i7ACzagwL6SchRv+JBe
         0+JGKi6SfLw8UVxNnrKQtXxCOi5TomWJBr6SDtIWXV8MKJ67mzhP/aTlgCCi5p5tz6Qw
         8qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738445; x=1793343245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ETvMeuKEplFT0AcnMrDWFu/1GpAv92DVSv7ACKc8EM=;
        b=SAkClH0vX724NHcgILa9YQI5N3Cna4WukfM6lTvJCNfJJbYdFfMHO7VTPJUhLpX9qI
         jFyb7UfP7O4Eui6u9NLtK6tPCRQAV7aQ5ubpK7PeRP2gxGl0fDrxkHGEM5Fshs2MfAF9
         pv5u1BgfmQc+uvpYftSd+41tzOLOJmhZ+LhuVx9MBsJS5UOm56fppsejoz03zs+VyFxk
         PxLoUCRLshqH4hYKJKzvBGuCNVdHotr+2UvPoi4VmgtQEYJv2kmVjX81rNsFaNKxp26G
         iIOkrNyhmCa6L30VafzOiMEoNEQ9UuM6EPAzIIa9WVB6SEMWvVY3/nKYvws4R0RtHjKN
         W/kA==
X-Gm-Message-State: AFq9FYLcIQ8fABoGW3lcJQzWatk1p/Tq75e8mZcqzmPbwuVtefBJWqyU
	ECDgQxKo1UJC3vltznmOmBIBPWIhQSy4ABmF9ICZl9CL0+XcfrCIsFmHY4V5tYRBCrI=
X-Gm-Gg: AYBFou0oNS1cllQ6g3+ixPWYWZpbb5xBlDuZcpop1n20dbPJHrer2iVEd47ZMws5TjS
	rskL6NG94b1FOZOMmqJov1wuhHR1oMbtvJx8fVI95WETuSUnY8Atwbfbronph7nYNtw+buyOsW4
	af3pdf9wryWX6atgDcl1PEGzMAbEexjiWutar8x7w0fFxsgtZzCxoWhMY5km+tSIZofW0H1xtqo
	vzG/SP2ZCg3VarLcWrfuQYrnlHaD9ztyHBPW3+YS44D629FWZDtgmyPNMrlCH6KGZ4RNtCwasCE
	Ptqyhoe+UlaDiXAnHBPdAszKwfYvzhtMRDc8FxQoxdhp/v5z2iqKNS6Yrw3iRczpC71MkfU/gA8
	OlO3KakNEGQ9VvLLMxllb34YbOcEn38uICYWJCeYnoT8t06IF3mtR+QmwNGcw0quce7eLsaFa7m
	U0EjADJPUhrTk4I6/qGj1AEMYqpGV1i5Tv+fN6MutfipFXRMG9IPXtJoWeTJguQDociOO5xyKAd
	a/8CcW4ukJZQ5Xnap47hw4F+fQ3WRsZ9OJNish4cWvfnulPc+1WkeDTYIrIXTZ0CwXHzH7FGbTM
	xdAD1Mydn6Bw2MTwz9zHEQLDmTn+4xapJOr36S03Fwn9vCqRq41tC4BRg7TwWywBFFLnUSh8OS8
	bk43Sy08kUnWBEJ/z2Py7WGA+r2LG4WXcq1O/sy+j1n1hYvDRp3I6IVdbz2XVglPWeZdEe6+jZo
	bNYos8ddKOticwyB9L5X+E1ezAw/QWAEg84ByrEXBK6OEnHEhp0FFrsv9IW1O2apGBCWAEc4zfp
	X1QCVaU7ZfXL88M0jlYFhkJy3GYpLV9
X-Received: by 2002:a05:6a00:1d91:b0:89e:8242:f35f with SMTP id d2e1a72fcca58-8a2c66a9bdamr1137595b3a.13.1792738445236;
        Thu, 22 Oct 2026 23:54:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/29] android-tools: Mark incompatible with riscv32
Date: Thu, 22 Oct 2026 23:53:31 -0700
Message-ID: <20261023065350.3228996-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131334
Content-Type: text/plain; charset="utf-8"

do_compile maps HOST_ARCH to the Android architecture and fails for
riscv32, which Android does not support:

  ERROR: Unsupported HOST_ARCH=riscv32

Mark the recipe incompatible with riscv32, as for powerpc, so it is
skipped instead of failing to build.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 65529c1b53..963e8a207c 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -78,6 +78,7 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 COMPATIBLE_HOST:powerpc = "(null)"
 COMPATIBLE_HOST:powerpc64 = "(null)"
 COMPATIBLE_HOST:powerpc64le = "(null)"
+COMPATIBLE_HOST:riscv32 = "(null)"
 
 inherit systemd
 
