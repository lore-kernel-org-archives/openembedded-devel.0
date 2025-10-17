Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE1ACCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:57:10 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.13425.1760702224240680873
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKcCybGf;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b554bb615dcso1302217a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760702223; x=1761307023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yupbZoE9Tttsj53K7qGm790BHRBY7DC+Y8HsxukJhbU=;
        b=nKcCybGfX41g/DVCruSWc4vzl/9AIWpIwkuTJZhYkJ6BSVsszrv6Ui7MhE4+Yi4Vfq
         LKUsiNKXsuuB4YaJl97gJ1oGMSjX3o4/gyNa8k0inKYYhrKG7ix7zWZhfz1AYLUs1qIQ
         EtC6wQxy86fR3wqg2Rof4fKIFKmOhTHk3MMoHp+nGqTHc40DsBV5sO1FRkIk50OMSHlW
         3O7uG40UE5VYf4uCcmHcQGLjYso8FVUHk+6Ft86TOweEGzLe7wZB18ELGWK6jsGj/pHa
         bo2+nquEuzvvLdjmS3/Axkgf+QyhdTUW87ctlxhB8LvYY3EUAbVSO/uuTYyPgz7EK0M0
         hvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760702223; x=1761307023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yupbZoE9Tttsj53K7qGm790BHRBY7DC+Y8HsxukJhbU=;
        b=O3ieslKig224y4LXjbXgKI7psbQ2Y2f23FG2EtKEeknVfWin3sEfWJY7Kfowp/SMVB
         4uhuq3bzm3l8eDn4rXt+DJOcvdxUUnuLD9vD348y4DbpDWAfKVqIyHktjb+cvJecOUsD
         0rsuB6p/TQTS9XzCbxk6piqeLLNQlONUGxxWS/do03zBFyOGSGpyMBWrRB7xmUvuW6eH
         9yN8piE1jlz53mqhSWEbsxIZmriDMVhoOWVm68FdH2B3bidAeXlm43m4oK+AvFJSerjm
         vgKSncFXUA0/+XUWU1LVhh0AnZ+Uq6qh4sZkv/VaMzAU4V6HN0PuEkMKvNERPWaT9LL/
         YjGw==
X-Gm-Message-State: AOJu0YycYWiF8SYSUkaXMinBrL3k/XSMUCgZ730fc+jFng1cIrSRPXcP
	Gd0DbqIDYcULNSNM6HG/q0RMt1Sa93l91jW3Xhlhk/HGpHTB6SH+1e4TIka2kw==
X-Gm-Gg: ASbGncvJdhIvFtdO8xUHvl5UWj7Vv5V25KCcEQ/Rm/GXTEEHljJPL3vHQnRM+18GSjJ
	l+MyYI2vWwfSj1L6qcnjYfqlZXSJ7Lo2w1wSRAjILNhQLzF+GetORxQDYwIIID2bPpgId9Qu7pd
	aTnQ4oM+2FmSEFRF+Ga3bW1i2kwjMmh86bYq6DY0I+K/63CK/Sjtr0EWzh6A//tI//nX8TzOVOq
	GpUgqIZXI/9g35d+0ZwmEaWcOgvqPvU1Oy4eYrpqUx+Np+BM2XB3LR4/SkaoPBrqeM1G9fdJksF
	S8CJk+MFGRfSP831wGaZniqOjJExp3hW+IyEniNNRXcQOOBN9TG8nwmPiiMlBWe39+ZmoZIX+3x
	qlLfv3AuZz7A3HMYmdMF/89PGCGTpyf5MbtGGEx71fKu9poRSZoQcTuy/cSL8vJK7sxGNT+0N0L
	FGNBd7PHZCg87ru/ZOujttQe5Z
X-Google-Smtp-Source: AGHT+IEnWT6IxFBNMEMcmvLlf3CCevztq4lWvZoyQNblOBbZVndjBdeZOMpyW/CFdZgU8z6G5H6RJQ==
X-Received: by 2002:a17:903:3d0d:b0:24f:8286:9e5d with SMTP id d9443c01a7336-290d14e83ddmr30896335ad.26.1760702223178;
        Fri, 17 Oct 2025 04:57:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7d19dsm62169055ad.71.2025.10.17.04.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:57:02 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH] ndpi: ignore CVE-2025-25066
Date: Sat, 18 Oct 2025 00:56:51 +1300
Message-ID: <20251017115651.1509368-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 11:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120759

Details https://nvd.nist.gov/vuln/detail/CVE-2025-25066

CVE was fixed by [1] but the change [2] which introduced CVE was not present this version (4.2).

$ git tag --no-contains b9348e9 | grep 4.2
4.2

[1] https://github.com/ntop/nDPI/commit/678697b5eb6c3caa5dd5f8cccfe9eed8d13b94bb
[2] https://github.com/ntop/nDPI/commit/b9348e9d6e0e754c4b17661c643ca258f1540ca1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
index 13c3398c2b..d768f85d31 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -26,3 +26,5 @@ do_configure:prepend() {
 EXTRA_OEMAKE = " \
     libdir=${libdir} \
 "
+
+CVE_STATUS[CVE-2025-25066] = "cpe-incorrect: Current version (4.2) is not affected."

