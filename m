Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6FCD61000
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:17:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12773.1769685430124671539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e8XyXF5q;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4359249bbacso1292993f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 03:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769685428; x=1770290228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWceHEVzA/eOXOy4NyrrG0an9uvi7lzjkqrWR6l2uM4=;
        b=e8XyXF5qW8XO7JRZ0EKbO8tjDFZta6gVvWUTaa31fpP8RFMTWscD2V30EUZsq88QOi
         u9LcntMQeOmRUnyAHVHW7gd2YnS1n11lMx30scqEKya8aqXMPBdXXA6ziw8+8XgZfKt7
         wkHz5IuYYzMnPFvRuzX3fdG1y/f94i+aQnvsKANZ3eXQaYtfCpHr3xGVz3iXovc4v5/c
         tR/PzlelMLteFkLkzdqnODeEW9J4Fdwu8eM/1zJqcSmZG5ozukNkP6PGoh1M0gMSak2T
         s98Y7b4QBG2jrNjsihMEt/kf0/6gGJuzA5TBqMyhyjl+QrakeQAZYJBaMNlrejG+hjfu
         Fc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685428; x=1770290228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWceHEVzA/eOXOy4NyrrG0an9uvi7lzjkqrWR6l2uM4=;
        b=VEcOGfw1cwZob0bSVOmLFhWkAKOIS3UFvsgbMKtRwpJpJuznOp3IcT5PTeZAC31sh/
         /Ui9+B35w9KTyO+vUTL3vMbwCK8J7lCv+Lf6nQbncdN0c/i71+WQG1PoOQswr/RIzFA5
         SeIY3yNWLqfS6hM38Q7BT/f6iiRb9oG6O4A/57BaFSNDu6kCjZJ8KFHxnDCIh8ScjlAR
         a1Yae60oZ8OnyuQz3L16FwRRBgxEiFAliG/kXFhOElYOXNwav765xTei6BcquFivG73t
         Qe2ZNW3rjWpuhu0j+WZpFX3vmpi8sQiWs6wEY6fj+ys9ue3vUv13JjSrgWrH57oMX5CG
         vdRA==
X-Gm-Message-State: AOJu0Yz5fD+P2XTt7QcO4oNfhetYRC/B4+ROJmgWSfCTqO9+8+hGK03G
	ZWSMEsCmNxnjsReMmJH5Gn3eej7hwX6A4foPC5r4hzSrk9PxzNvdXzjF2PuJEg==
X-Gm-Gg: AZuq6aJm4jAj5DjDCBjzEGtEbZiZ1V6m+r6hfSehEq15RMUlD7KdHLi8Kk3kapWhRpx
	HH5uX7fMPiX5JfHEGoG/KKGw9gMINb23ATG4HaKQSbyXEQRiaOlep1V0doES0G8EDkxfN1Z3ydK
	AXtABJNaOOAFK8AEC8a2Zr1oyV8IKQr1Fq0zEDKF03s5s6wg3pF5tWHQMN8O3OA4HEGwOJgaIOy
	iNjsBPEKpKumAlk11GBtDy3ki5x8AaszqE8hC7fAE62BF7NJC5XyAIBdZd9oz2YNhnJoaWYZR4m
	k+xmmIJMb/HUSFRG5lggi0WcxlIlkA34mmgsceCJyOWkMBAcpDUYb50qqkGQp2OkwRJbD2CLqY7
	QNG/HpXbovqLP+k2OwXQtvo7AegsfnWVBC4zF7a/0Y7HdUMZEdX1Bj1EmjQLE5F/08TMDqsNJ/Y
	Wli76oPbB1F6+eLVNcv8Q=
X-Received: by 2002:a05:6000:26cb:b0:435:96a1:ee4d with SMTP id ffacd0b85a97d-435ea0ab775mr3796846f8f.14.1769685428350;
        Thu, 29 Jan 2026 03:17:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4824sm14718443f8f.1.2026.01.29.03.17.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:17:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/6] edac-utils: bump to latest revision
Date: Thu, 29 Jan 2026 12:17:02 +0100
Message-ID: <20260129111706.903623-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129111706.903623-1-skandigraun@gmail.com>
References: <20260129111706.903623-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123989

Changelog:
Add loongarch64 support

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
index 0d8f3c8a6b..9ea4d719e3 100644
--- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = " sysfsutils"
 
-SRCREV = "1c57818ecee186aa47af0342149577df5302c022"
+SRCREV = "8fdc1d40e30f65737fef6c3ddcd1d2cd769f6277"
 PV = "0.18+git"
 
 

