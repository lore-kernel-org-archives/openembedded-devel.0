Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC9CCCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 12:54:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.10882.1761656088945671682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 05:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAOCmg8K;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: marc.ferland@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so3056013f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761656087; x=1762260887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSxQa/bvokjtn8xP5j+lGyDYc7QcO3B4YfJ+BQKNYGs=;
        b=DAOCmg8KqekPdUm6xkwE7TUnVlQRU/S1SwoeaT0ecTNDgWJtdnsBJsd9ZXx/VQXNQ6
         DYdLGWSsz6H/ZquL2nL/gr84xOOpKVOSjAd9hwEmfQ7ZpfjNABRwIQWcfT1/8lwcrwBY
         rtvRAlx3WqKH4WZct1HmhHU1TVUwKGG1R1vW8omOZVleWkQ0/f7fFX9b+7/e25SZxJmF
         2Yzc2QZPtgbSIP5XZToAuVhHGSzeIM7SxyDW62nqDRqYL/xV12M6Wn/k1tSKXgIOqD6O
         wIb+A/y0k3WhXHMIASiot+iXnYac6eM4SD85UpLq5/bpqWSGdt2K4padbO+edM9vLBJm
         jElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761656087; x=1762260887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSxQa/bvokjtn8xP5j+lGyDYc7QcO3B4YfJ+BQKNYGs=;
        b=BX5GDP56JJkcdYASWhBUEq2PhBJX2AzIoERyzCZRNN2ZKOjIA1T0DDaCB179Ua5/fj
         hITsAugGjK+s6nup2oZv9/IF9H4BSsqOSmkA5e15l8gKmnxZ53kZ1hJPjzGSVYxhnxvp
         A+Rj9yjCqqLm4SIo0aSvoeEYzg+7bm3iZI+a6xmkod9Q7jvNGmLGbFLrR7WIwS3wFSma
         vmSayOhIgRQl73IfQEs7AKSUWYoPfVSPyE9Hff3FDa/lVLHswwWnkoLrg8kvoot44jEK
         yuAoD8a5THPUxbYLUN5UhE9UYFGOHgo2eWVlheHYFTnQtVQrXHRK+bf/HLS1BZBnB4za
         h3ow==
X-Gm-Message-State: AOJu0YyZ93HUUvFOflaaLNYENT/Joj9W5LS4pHVbKMxXg6/mFhOQ0loe
	uNlGYXReEGB9bkZDdxPP2ewhQTUcWnC6wGkKOYYwrGfutLUqghF/r8ChGg7Nxw==
X-Gm-Gg: ASbGnctTs1/du0ncnjhQVEVqYnoU7DFGwD0mYgxhcMjaJvc2vyON0ah4vSq3scyPW1C
	BNrW/S351cGzATeQaoAKe4Kho1KkW5INg2K2apSdZosYGMRR652uT1mPIXM3Z3vzJaJELX/5w0G
	OxN2DJaWzwfrQtx+WwiqmSFDpO3vgdvnf0wYrsKk8QBzhOihPH7bzUnlzrPo5ROAD+ElBMfC7NM
	7rpIQg17Ccbis/NcQV+ecPrMLaLoujhfZtqmqPhwqufQyWpkZe1w7FunXvn/+fA/ck37HaJyx4l
	RfC4rwJqOcRFOIGyjv8/SboSf08EKtxjcTeDjFcrIPKEKgTqWiBpKi6hn5TiUJrHe5h6Wp+1sIs
	xkG632JmatBq6qDyV0WbOc3I5Bmc2QaOfO5uXlkMj9dRnD6hUyuuJQwKR2BfYAAj5JYyFnar+bk
	EeFf69ZviRCOeOCWbkZqPnWUGFxvUjTK0o6t1cb3TZ4f/Y69qGIEWKU+C2/SUz4mnTiPCPC7Idg
	uBLyrXHhqvTHU+ahLHklPMQE3Y=
X-Google-Smtp-Source: AGHT+IGEJPIE/M/peNwjI1dQvudmeuSNORbjhYG6k6BYrqidPD1XCtcS8TXLq1UhnoBkQEnp+xlXYg==
X-Received: by 2002:a5d:5d10:0:b0:427:6a3:e72f with SMTP id ffacd0b85a97d-429a7e7c0c8mr2634627f8f.34.1761656086804;
        Tue, 28 Oct 2025 05:54:46 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952db839sm21015305f8f.34.2025.10.28.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 05:54:46 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCHv2 3/3] freerdp3: fix configure warning about image scaling
Date: Tue, 28 Oct 2025 08:54:36 -0400
Message-Id: <20251028125436.2426288-3-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028125436.2426288-1-marc.ferland@sonatest.com>
References: <20251028125436.2426288-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 12:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121090

From: Marc Ferland <marc.ferland@sonatest.com>

Adding WITH_CAIRO=ON to fix this warning:

CMake Warning at libfreerdp/CMakeLists.txt:193 (message):
  -DWITH_SWSCALE=OFF and -DWITH_CAIRO=OFF, compiling without image scaling
  support!

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
index ae87bd0925..7a95f5399e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
@@ -34,6 +34,7 @@ EXTRA_OECMAKE = " \
     -DWITH_ALSA=OFF \
     -DWITH_CLIENT_SDL=OFF \
     -DWITH_SAMPLE=OFF \
+    -DWITH_CAIRO=ON \
  "
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
-- 
2.34.1


