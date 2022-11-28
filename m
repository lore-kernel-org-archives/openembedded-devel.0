Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB462C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:00:30 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.119922.1669647622995809832
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H8tnjyrR;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id z18so15763022edb.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTfFz/dYD0Zp3C9fowOjw/1dTd7ukZVu/4bH9l95nn4=;
        b=H8tnjyrRTyzDFvmblqnkIJ3uA/am5eapIrd+s0WFbInKGQOxSS2dyPrRQq/F33mnuk
         EePIlTttYdn3435VJWo+FmJ3OzNwXdChMmtM4VOEUcIoycA8Rr9xzxLtRPZQ3rp6v5Hw
         ZE3chINIiCycM0GD+Lg80BhIQgI0X0/Qyfgq3c4OnOQzO1K3uBf2ZV2woJFWFu8nNw0L
         Vz7FtvGy7jSfGcRPpSF4BABxeMX5oN7mMCYjaIFgPPW7J08GN8YVLjqKMZzNMr3cke8U
         qBK3oSJIPAD2LuTSglsSVGs4uyWR6sGgeEsJSnxNsXrcZj5QtrO10BWmQMY62E0KLz5x
         4SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTfFz/dYD0Zp3C9fowOjw/1dTd7ukZVu/4bH9l95nn4=;
        b=Xao3XLoe/gbeRLCVb98VAXV0DhhBtEwMZXVwrwlzV4Wq0gUAv5qgcizaADzCF2Pxfq
         JQqUXOCX88oIieFBhPM6d34bFE2HQjnt5ZtMij66cxrEEkIxHEnmDXT1JtdKL8jl8IT3
         OQkBaQ7JH6NazvXNOk9Nt5u5Crk2s+LyTtbVY3H/6seQy6bUY4C/JBssQzQsfHcFO8Qs
         nzU5qr4oqkXQyDlZV/5RBg0WYlJuXPV3295L0cRe1pFY4+FEDgt7b9arHQBbZa7IPDVy
         essuO1afiu9dg4RSnzU4D75fwflubR7EfgUeO9h45ksGsi2gpW0Ezpl+ro83TPz9L7ks
         u7gA==
X-Gm-Message-State: ANoB5pnhltgkzd1OvwCvoOM4c3ZalDdHhcpMd/vzazcydJ7b1IFs+OIj
	Q+DRAHAZ6UHGzYT7qY8HYbFuYstHV2o=
X-Google-Smtp-Source: AA0mqf5hB1xiYvCL9xBQFT8RqPJ4+oVanbgeNjcaPzmv7rYz8p/KNE6W2JxM6YkkQgKq9vmFP9LIXA==
X-Received: by 2002:a05:6402:1814:b0:46a:b1ba:22b8 with SMTP id g20-20020a056402181400b0046ab1ba22b8mr15768290edy.316.1669647620960;
        Mon, 28 Nov 2022 07:00:20 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id i10-20020a05640242ca00b00467c3cbab6fsm5264261edc.77.2022.11.28.07.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 07:00:20 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] opencv: follow changed name license_flags_accepted
Date: Mon, 28 Nov 2022 16:00:17 +0100
Message-Id: <20221128150017.3760740-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 15:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99825

From: Max Krummenacher <max.krummenacher@toradex.com>

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-support/opencv/opencv_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
index da1e659a4..158cb6342 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.6.0.bb
@@ -109,7 +109,7 @@ EXTRA_OECMAKE:remove:x86 = " -DENABLE_SSE41=1 -DENABLE_SSE42=1"
 
 PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
+    ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libav", "", d)}"
 
 # TBB does not build for powerpc so disable that package config
 PACKAGECONFIG:remove:powerpc = "tbb"
-- 
2.35.3


