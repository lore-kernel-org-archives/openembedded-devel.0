Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BB3CCD186
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.18457.1759326772527504349
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f58KcDX9;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so6733214a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326771; x=1759931571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FPs5MKlLZk+Awr50UJ64Lk/F8/chwz7eoAhqOD9c8A=;
        b=f58KcDX94XwSF6FqSyhEXfCj93lYtpz90YKVouXB95F5IuXQh3w5m0XJSb3evhxDYd
         DMqX0blykA8jNcAPaHuEQXhJH5M2inMyAuzHB3RaSS6CtjrOHCLT+x3fyttEkzs2ZrQW
         Ps8r6ezcq/khUisJl98nsNcTkRu3nKyqzgEeLnQedsNZWLuY8JMcAjDmZPyyB2sNniuA
         zT2FP7hpdM0jrD4bV1ib0PDnPDfNpEYrdJ/NntDmqcC5vBJhO8fD09+QS+1PVNH3DWBq
         PvhI+eGMq8l60Rhhrnk93nwIwQ6G5ih8/grYKHoq7jiAhj3cgtl+WIe2LkZEoqPeleLl
         xnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326771; x=1759931571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FPs5MKlLZk+Awr50UJ64Lk/F8/chwz7eoAhqOD9c8A=;
        b=f+mwTApuyUJCwUvAtJjeJhMkNHAsq3a/dwaqhOWyVyeZGvHZnYl5LrZvZt5MAZR6G0
         nPQLmaaGT8pTJYqvFcFDmTKG6RjY2vtcKrRlo8pFkR/hwi0oWlEZv7oOySbHumj95M8e
         6BItveZ1ZviY8YpLQuuogSuAtgez7G+Kukd6+UYo+Ih1hGvyRHWy+LkQhfP0PSkqfv9Q
         PaNpOjCLe95mEqxEz1s2aZK0bwk0HsrGrzCFdH+zT2wz6Xo10FAK70reDSDoIZpYOuXv
         o6jTRl/3JNRgrTtGG0UTNldKGhssNtyT/VhDlNDBslpNpMvwzHT8Y40zLTWI9lW8ltcv
         n/Eg==
X-Gm-Message-State: AOJu0YztfL0cjIjsNLrCXLCnzo744YL6uWJMVLTNKlBOurq7ewTyvJSK
	FmnV0ojoeAvncMYCpF396F/mqDTetz+pSJWFAANyGOdmzMIXVLuRKkj6nIpNow==
X-Gm-Gg: ASbGncu+nYQzcPb5uVKCLpYZNXInWPNr7gBxT1Xlh0U9WRgvajr5fk+EpF/eYUQD9QD
	pc0xuxdONP9CBg/+4t7EZWqPz5HNUMFFXQGZ/ViHkCdsmDcC60ut385rafMUvyqK5GsxD8TdwY5
	c8E1fsM4PNaR2K9E966jyFQ8abT24F0ShOo+NvS1VwIt3hPU+yFdya0JwJBJKYn36xoViw5Xjue
	2M8ydAr3Y5G/KG39Kdkm3275q2dIEWgxtD2zJ/AVi7RHoB7uTtG78ohB89Z9yjvgMXWjiHGKmN8
	2UAakK44bPIyrQ75i3IBE/YOtUh+oNCPAjpaVxupdAfcHAj1C8H5YW5QldYU0DywEBRtNK7e+Nn
	6Ny0xPcaOr4OivIgIDbgd0pwbM/38O4cLohZfBdW/Lezs
X-Google-Smtp-Source: AGHT+IG+JMj6bZXDgzue+e/NHoLkKZf8GxMD9+AGWrjElQO9rOq8bGHW1r0fRIWFo8CJVeIwCnDM1A==
X-Received: by 2002:a05:6402:2106:b0:636:6489:4db3 with SMTP id 4fb4d7f45d1cf-63678c0e08emr4195986a12.1.1759326770758;
        Wed, 01 Oct 2025 06:52:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/25] dialog: Update the SRC_URI
Date: Wed,  1 Oct 2025 15:52:26 +0200
Message-ID: <20251001135243.1490753-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120123

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI to fix the do_fetch error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6d1b7df8c0f751777625ecbae3a5505087788b81)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
index 0b1e7e6088..d67156e1fd 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20210509.bb
@@ -8,7 +8,7 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz"
+SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 SRC_URI[sha256sum] = "ae478fe7d5fca82bcf4b51684641e07d2ee68489d319710fe1e81f41a197bd66"
 
 # hardcoded here for use in dialog-static recipe

