Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E058EC47072
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 12:29:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.5431.1703334548317805932
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Dec 2023 04:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fX5v4it2;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d2376db79so21437605e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 04:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703334546; x=1703939346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87ZwQKJ5+9Htx/d8zWtutjeqBhR3NIyO9rlNd6Iv9Hc=;
        b=fX5v4it26Kkmy+kRQVks3oh/NH8YBqvMgzdvkg1Xzoz8yMeNStOmpvECh5lRe8mQ4+
         o9rj4kZlUpYnkkMViF5A+5bEPHf/pYt1+ndXcUj79c8JUx3wPa1fKNStf2rdVHoN5oaY
         o+3houL8+8NTlNlRY6KMdn2WDMS1nRD2TaEq6HR7rJvEq688DzgCHKSjxjRqR35wsMzj
         EnQuyrloTLQhDmS/BtkZVbC/B3lrE3C4A7PSFS9M2QJP6OLnnAjmA+2pbKOPBBs5Wjnt
         t9+fUGdN8LfGwgoCMXmCh7bKQbefyBQith0vDmoM7MRS2ei86aP4MyVtRIoC+FopMkki
         OV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703334546; x=1703939346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87ZwQKJ5+9Htx/d8zWtutjeqBhR3NIyO9rlNd6Iv9Hc=;
        b=Z9v1x6y7Lq/jlNMOCRgHwF27sT4z+8l1ktfAzoDL2N33bNxLynDTyBdqivMT7do3n/
         SjKLxLibwhfUQqCcYLepSmrrrXyUKdOL/c55EKTOc0c0r0d12OjkkV1/LRNBQhQX1StL
         m/mtQCTjL+IIgBr9Fs8znsksdGBWjAhrFjLsiqPMfIjKYHnsDn6jb8Y1GUoPaSIzsqAT
         72RgcqIx0MglPRbkPaT5QiI5mEVZzdX/rwUswxNy/P/vTMy9zuBRvEMC1r8FkjwwrtyP
         6uaAmt2NNZYhkQF7/cHLl+5pZjsq3wqgBwWg6ktsyNjlR/yz+5w9BtjQtcOVBdfYx/9+
         bEyA==
X-Gm-Message-State: AOJu0YxalL2fisDacq1oW3z1OwLwKqy30C1BIzeRr5RD+XU/hh7aa8E7
	Hozvde70hzEVqTSbjzCs1VxPfhIo1E0=
X-Google-Smtp-Source: AGHT+IEZ2PdScqa7V6Iob1tZQIzuvGpscM0WWrWnNOGugv+KXq47XD9XebA/MJ9kirK2tc/ZprdncA==
X-Received: by 2002:a05:600c:3596:b0:40d:5122:d7ef with SMTP id p22-20020a05600c359600b0040d5122d7efmr420811wmq.112.1703334545693;
        Sat, 23 Dec 2023 04:29:05 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d9e2:102b:56b1:9620])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b0040d2e37c06dsm10198199wmq.20.2023.12.23.04.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 04:29:04 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v3 2/2] ptest-packagelists-meta-oe.inc Add c-ares to PTESTS_SLOW_META_OE
Date: Sat, 23 Dec 2023 12:29:00 +0000
Message-Id: <20231223122900.20077-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231223122900.20077-1-alex.kiernan@gmail.com>
References: <20231223122900.20077-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 12:29:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107771

These take around 60s to run.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 9182acf44915..06c7de3f8b33 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -46,6 +46,7 @@ PTESTS_FAST_META_OE:remove:riscv64 = "nodejs"
 PTESTS_FAST_META_OE:remove:riscv32 = "nodejs"
 
 PTESTS_SLOW_META_OE = "\
+    c-ares \
     fftw \
     libusb-compat \
     rsyslog \
-- 
2.39.0


