Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FABCFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 15:48:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19749.1763999288197341617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 07:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EcZ+1ygs;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so42925005e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 07:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763999284; x=1764604084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BD6rmbvdcm9LaDwTXF5eZW+PomtQ8Ccyj5HJ7gjuNO4=;
        b=EcZ+1ygsxP5JUojLjbM8P25PstG9xVs3/dYEDsMneA/7Xban/yFj5CjAIJyb7yHNHB
         CjbwfbS1DN4nql+qS1YJnjNWp0d9T3XE2sLehNfYIEh31Fvv4CnLgYWwkOQ0QBkirQlm
         Qbayc4Z2BlHvMsJmyT66vMT5a9xDus1WgSCOPcRTnErNZ7qh6RfMF2hlL8jz4ocEBGZc
         K7SIEM22cHmcNduhLawBcMH+0xf8/Wmex3muWGcIe+Yc+OXUztsl1P18odOuWc1XH68K
         TF34Pxgskh+rJVID41nQGuodndMwDDVBVyEGT1v58YraLCxxoa+04HBn/jK5JTZFUsJ9
         10nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763999284; x=1764604084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BD6rmbvdcm9LaDwTXF5eZW+PomtQ8Ccyj5HJ7gjuNO4=;
        b=KhDnPg2Dm8Kwa3OaikiWh1Ze2ImPazF/1/W9qDiTHnCA9tqZowR0u4vBgWepV/JZbW
         EpbCI2Q+pXeczNz6NYvHZZhlMezkrEqbVh6XjpXYVXcfqcG3uXrftKuTLQYPByoJ4LqR
         eQfYS+lnDsDIxlat87975K0YhQTa5FvXAiVIsxkeF1xPHuIucNnMGUW/wfjOIOoMK+QD
         Kj0eK895EwkwIFAbh7O4p72mjKJj4wCrHSVeRWt1n8qgiwiYW7ugvITRmfBZuLpuPoJH
         w8puwY6Y2rnSYsTdRodMrEbVDrWIua2Uvo7hbOSa1dZalAhsOgkc+2qHpuPH6aJorHCH
         5zmg==
X-Gm-Message-State: AOJu0YzdUhkrbyXmeamMMTYE/97Ys6j57xGPCAkz0EvLCH6ehXaIUqIO
	VOm6Yv0JXyD4fnPAQsW9v/TFsa7m4sNeX2EjQxM1op+G4nx1c7JGv6YlaSXd9K1A
X-Gm-Gg: ASbGnctyBaqJytJYapyU5e7PS0nvfT2v+oGVj4QvWj4YREj3f2wF9xz/W5ZYkUaaNGD
	e8OQPPFZxMLOePKccCw+ZNAIiS5LU+wxgwB78BmINGP/Cxwn+Zt4Q3nRJ1YKdtQqsO0JynxPUZs
	dG65Ykh4BJOQy7TueFHLXT1Nz71Yl7G6M9sEr112nlkhW8wJXcf32l50Vg3Pz56Yib/C07beXxP
	UzNj+7+9kUNnEiNuEJcKneL+2Bi6y8HLjE06h5UHQDpNDTedBk7MN3/Z61NZcJ3XHa9H4oBiU/D
	vZz8nw88cpw+Pa7Zwk7TQ9RVetpPcVs3FShllQuBZkjcKpEuA/43wdUDOfEJpezq/61BMyaX63w
	8Gbz0u7hFix3tJEK6igSfIgrVOk4FcZBP5yBF+fqDPB6wtw2PFbdQRElwcCNW8PF69kUXWOqfO0
	rruGys1gBf
X-Google-Smtp-Source: AGHT+IEGJHENTQ4CRVTZkecp15yGqQ6tftU7DnH/NjZD1Yi3nP9E0/fA5dc9NQ1ePG2us0ZycwQZbg==
X-Received: by 2002:a05:600c:3543:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-477c1143046mr105406375e9.21.1763999283666;
        Mon, 24 Nov 2025 07:48:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm30584286f8f.29.2025.11.24.07.48.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:48:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] links: set CVE_PRODUCT
Date: Mon, 24 Nov 2025 16:48:02 +0100
Message-ID: <20251124154802.392729-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 15:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122016

There are some unrelated software called "links", which cases
false-positive CVEs to be reported by the CVE checker.

Set the vendor/product pairs that were historically used with
CVEs for this software.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62a53097324ace9161d8fdcfbc533baac9ee6309)
---
 meta-oe/recipes-support/links/links.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
index d772d54aff..a255f0ba6b 100644
--- a/meta-oe/recipes-support/links/links.inc
+++ b/meta-oe/recipes-support/links/links.inc
@@ -14,4 +14,6 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
 
+CVE_PRODUCT = "twibright_labs:links twibright:links links:links"
+
 inherit autotools pkgconfig

