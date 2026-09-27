Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E02C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:24 +0000 (UTC)
Received: from mail-pz2-f16.google.com (mail-pz2-f16.google.com [74.125.228.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34525.1790506275280257606
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f12bxS7G;
 spf=pass (domain: gmail.com, ip: 74.125.228.16, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f16.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so707530a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506275; x=1791111075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpUVc7kkwVnTZofXcKoZSt0Y9VhWezbjqCkdnZNbZ4g=;
        b=f12bxS7Gc7oKMy2lP/j7YYobCcVG5/zEhzNSTx7QtfJDmVAM94SlCu07nJrJEfHjj+
         vrMAUqFSrXdyjjtS81MFTVGtKUgJCVYa38kErwt4hufwe+IH9DnvPrBI4TRvpudWpAM9
         /6ZTm35fPNAGs7kqUZk6qeE42Z+V7M2CxBBHSw7lXXN6GOwAz3yiVXKQ/aTjOSI7eGxc
         miCSuTS3bpD6x0AjoeShHNP4gtjGrCOkmPYRnmLRF/Fk5rBi/WV3WKna2wFoQrE/EB4C
         +yWkTyT94P6m5RLPJcYtiv5BfpzvHaHuIY0LI4QLeotbUY8cpMcEFvIpSW6wAkjquh9N
         bTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506275; x=1791111075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TpUVc7kkwVnTZofXcKoZSt0Y9VhWezbjqCkdnZNbZ4g=;
        b=r52g2LtYUqupIP1YflynnSum0cYz2ObEFGPU7Kx/aEH0jLmYPZ/9pFvJ5fl05VKuH+
         j7gAuX7EGF3npwxNbQlSfCouQfpe/8LYPcKpTBSHg+Xf3aYfQOlxSJruuSP64lKn0U5x
         Kd8dP44UMQQdLz+i0KYMhAaOX7yTq50iaXQ8tDLQmAvnGC/prJC0FfLdv12uqhweWM/g
         G3PR4AP6W8SP53tLXN+XFiLV6JaBABdVlhHsPIdMKWJZx4JbvcbTj485SLxZu9gU/qQu
         hqnWYjb6TL3LzT0liIjXETz3Lc8P82Yc40/cT7jlT8iMg1A2Iwaonxev3wk4ljDD8aNf
         MGjA==
X-Gm-Message-State: AFuF++nBe0n6QiD/vjWfIr4BHiuND6lAZv4jvvPiqfF+mP9oU+dvwhJO
	7Txkjjzprj2q8PxbKOfw0mdtQXOr4HRN9V7F0XxWTQox9Ab5Rw38qAIjg5AXOQ==
X-Gm-Gg: AYBFou1AInj8eWqIlhr8sUj39pBy9gssFB6Z/YJa8cuxZrzBxn9r2bpI0FP+bjdVKTu
	qzmllOA0luNxtKBvanx5xo0UbzQEU0XvBYVXAjrvVDGvVaZEXFtTTpnFYzkDHmhNcNddF05Wf8Z
	SbuaXbcrMagLjmdJwOJQoA4L7DqDAFVMsdRqJyLLYtuH5TqIvwbSMCRTtQA2A82tWu/G7Yn4JL6
	ZKvzIAkCgzGx4qcHZ1Ycx7mYeATjaunQP/+xCBTxpv9HyJyn4yUCuK4kR0u2JUxSrcIWkpUwyoE
	V9shmMvaHqDTLEyjpHOhUReGOO+7iB/WlbmXTwBugICEO8Epvbc3VBvA0acrD371KloFktyvGKv
	ECQmOQeOTfZ3k2tdVpy3+C1uunxLlAc5cMKS2+4DjTjyVZ6LAbYNE1Dr9eXzjyCyZrCNokmX/WR
	SHduF4Y43Wf46qeXmJavb85XZ0/R52rhBmAPkGHWhif8PlH/+G8v2hO7zYpgzFaRrfSTkhvZ0cK
	95UYJSfzuTsgm7HMfEmtGI=
X-Received: by 2002:a05:6a00:1585:b0:880:4b56:dc28 with SMTP id d2e1a72fcca58-8804b56e3cdmr4338204b3a.15.1790506274634;
        Sun, 27 Sep 2026 03:51:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 24/35] cryptsetup: upgrade 2.8.7 -> 2.8.8
Date: Sun, 27 Sep 2026 23:49:51 +1300
Message-ID: <20260927105002.1832451-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130358

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://cdn.kernel.org/pub/linux/utils/cryptsetup/v2.8/v2.8.8-ReleaseNotes

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.8.7.bb => cryptsetup_2.8.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.7.bb => cryptsetup_2.8.8.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb
index c481c5cc7b..5400e63c87 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb
@@ -24,7 +24,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da"
+SRC_URI[sha256sum] = "3acfa685f2dd7fcc832e0b77bc7093aa7da554a51ce8dafbb4138eaa854eee35"
 
 inherit autotools gettext pkgconfig
 

