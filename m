Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4005DF588F9
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22603.1776700165455011631
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lwl1Gjxz;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48909558b3aso22707005e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700164; x=1777304964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swHWLrRZCSQ5UYkLnqbWvlV9ulK5l7Mduwx3XAZEuJw=;
        b=lwl1GjxzsHS+qMcmckiVns2C27XhA2fpnCLZc5FmwMEVqjKfVztbJuQPIhP88G3qnx
         +6Nc5T9H8Kk9mFX+aEjiWh23NKZOJrCRGpgaid3kfxtwPdp7i6OfFJE2sfXYbdk/zkh6
         ql5LgmpRwJM1NCaoic12U2dtZBmdS3zz4213QhofRFzmP/ce24z6I8Sx/cYHgNzoY3VP
         /3fdxFu9oAF2ez2KjWo7BqsexI2mSD6CvepJ6nouNQ0TWOZJJ384nutpCeh5GozY7lQB
         NR+4TBVPqxqpsvx+mDPLh+xREA673owIrpeF7YHUjP6soudO9BqhApJ0s6b0k9yd+lR8
         4aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700164; x=1777304964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swHWLrRZCSQ5UYkLnqbWvlV9ulK5l7Mduwx3XAZEuJw=;
        b=A1HkyRUh2asBiF3FJserEfQvDwBH5HPXTwVL01oCUw90PPdBO09c5Yoa5b6MayGXgs
         Po1J1kpigobzqoPib9oTm61ivtU6Va479OAz8pfI1jFHGG5vJRNeia4ZMhjZP+9lu2Yw
         aIWGYLLWnG4hdDTkyoqwe2c1H52eFllx8GVFrLSteVc+rhAyztxEBdI26DHSVFzFCePF
         CO1o5LAU9FTNw4WP5ucLwYQqGo3JEGK788nQzYCigjhyBbzqFZLU3O1G/DVJuZG5PYrh
         JmDEZ/LLFCYfhT4Z8bEjOk5A4wYaQ0wzl/fDm0XGAqYqTeYezwTy2WPkXZdLXkTjNXAq
         N+kw==
X-Gm-Message-State: AOJu0YxlJfBlXluy9uEGU45/X6qckJZcGsmBsLoUzFCC28DyMHG6x2NQ
	MJUDptcMOeGUYDtUBdQVG4U+pvTmtpXVHgauxwnVl8HEky0BptJjwA1USAiyMQ==
X-Gm-Gg: AeBDieuusH7iF4/JtY060QYQ0ekZe/IOzWYRu48PwtuUO7dP4FI/yJcugoB0WyOXk6R
	2Z1ofpYfVl3Sm3YlopBrNg8VvxUFzP1qTSvsonnygrl4ygAz0G/C2FbBvbUdvCK5tWz3wjJeo8p
	Omtcer3GzPSGtSRFSVrqSru3C24/reRgh1VM5szfobv/GLip7Wap2tNTMOWXJVCVWddOkIfGLXw
	pZMZ3Nlw5aCoZ9L1uxpLzpmpG/X/jmoMD7KjMf9ey/ooLWdOZAFdOCJ0iG/xMdDcOqcyukRhbrY
	iV28J13V9K5MIru9WzNZFDmdavLA1H6EYq9jwRCGrxlV+TEQyrtnSU/FJvn98C/q2ymFzi+336k
	hTCvaeL+SHpKFB0OTzusdNuP412fD36xPEVX+8Df2jZKQNFvCo9caLc1HJ0m5t/ZneKkryuqw79
	w34roOHqaICedfAkVQ2D+nEO8eLwkC574=
X-Received: by 2002:a05:600c:8488:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-488fb77b575mr199965465e9.25.1776700163799;
        Mon, 20 Apr 2026 08:49:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/12] ttf-sazanami: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:12 +0200
Message-ID: <20260420154915.952359-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126512

The previous one stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 945a5f3a85..e5f241ebd3 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -11,7 +11,7 @@ SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES:${PN} = "virtual-japanese-font"
 PR = "r9"
 
-SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
+SRC_URI = "https://src.fedoraproject.org/repo/pkgs/sazanami-fonts/sazanami-20040629.tar.bz2/ceef10579a75c92483171f3bd7f77df2/sazanami-20040629.tar.bz2"
 S = "${WORKDIR}/sazanami-20040629"
 
 PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"

