Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BEFF588F7
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22605.1776700166261399122
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TFxNJb6N;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891b0786beso11225505e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700165; x=1777304965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7QiPGykj/HZKABLvgRqGYEAcoRgkA4BVojSPXYIfQg=;
        b=TFxNJb6NuSMa+LtXEgMhfr3yT/mWkq2nZ3syfmDjofbHRsejrtoAi1k6GIQxahLJ3g
         c19Kmm0IuMjVS4KEzcWyhArwhZXnpWZ4DXkJupKJjQ8vzS35D8qaALOnQRWbdcKAAULn
         dm5uG3n9+Vs4ht8rDYYhXP+GALPZ9oXRbfsMhjzuVOKEz3ZtRCvzG29bht7jnbU/FpjH
         C8WtdySHh4sX3+fh/wu1uJRa/ehiUM4qmMRxuIyiWviizZckNY7iql22WtzANsdK3Y0r
         pPjpYyU06LxTzv4t5mTTwjqmPObwMm94Oz9N5T4dBABiSkYgYLGFMPEcVPEe7bV0xlTA
         nzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700165; x=1777304965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T7QiPGykj/HZKABLvgRqGYEAcoRgkA4BVojSPXYIfQg=;
        b=QOtD2mUXtQFf1xm/tZuZMLZTmsSkBipPtS/JIDGwvBFnf9y9qW4RwebO6W5dTRUfxo
         pRIJXgdXfF8ywp/UtHFubhldoQigU/WfGhYCh4NkbnV4uVTlqrY1ZK31CzPziqctxoqn
         WAjMpjJkOsW/KzbvTtyz1P3q3gVyntE1wS3chqfgJX3JLDBd0WODGHLgPug79gNvjXBR
         8zrIkrGDKLXDRMC1dG5mttmNk8JDFe50z1f3FsDa6XjFJzfEKqBP+2yKcBzZwCh3YBQy
         jGzaPgIDjXGYv3kldKD6LDXi818FVg6yJa89sfr4SYbCYQJb4NbVP6IH11fECOvuiE2O
         cFcQ==
X-Gm-Message-State: AOJu0YxEIye4Uri5X3ktimQ/TfZXe5hRvr3m/5a5i8VqdxlI19U4IAEy
	9elicwCkzOPayawaTIgO3jRQBwn0CWykWbOGemTgU/+eNU1/Rkm4I34QAd7H8Q==
X-Gm-Gg: AeBDieumCxtK9rQhv9zpvKPuRz4yaxxe+2ZQQaJtZkB1TgPGAv80Cw75j55MTOjCEXo
	+TzVN8VwWGhftpSL+YrT/aFhklUUqOUnq9k8vlpbIwMnGbVBYDSLsNk316PqCjP9ZZJjTU7JCJB
	THjkCy1Y0kAAFuI2LyoRVN1otzzObUd2qwlTZdAJvFeMZVkV4OUqEycXRfeVE1NWZecCKul6AVO
	gRo5PLqAbAFJe5WDQBeYIm2UNjapjuCWzKrJxrn3X9nvpxTucUb6jbP/cFPkEY/uLTZcf0i8hci
	X1/5ceWBFYXxSfXqjLcokO2UVFG2i4mRPegE67OpBMSTsBNxIzx5PXtKV0+O+WARa1pWd9t47mv
	pgwAIQy7z1eRqD4wry5R0fMxofzpSS4+qaXn5HXDgesP8GoJX/JnIGVlqLIuZzwV76KmRpQu1LW
	pZQmzITECVTRMH6LYg/UKqodH3pdcvhyA=
X-Received: by 2002:a05:600c:350e:b0:488:a82f:bb95 with SMTP id 5b1f17b1804b1-488fb7861c0mr200882035e9.29.1776700164445;
        Mon, 20 Apr 2026 08:49:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/12] libubox: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:13 +0200
Message-ID: <20260420154915.952359-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126513

It seems the project's git repo doesn't allow anonymous ssh fetch anymore.

Switch to https.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/libubox/libubox_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index b2898c9c7f..d7744aa963 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "\
-    git://git.openwrt.org/project/libubox.git;branch=master \
+    git://git.openwrt.org/project/libubox.git;protocol=https;branch=master \
     file://0001-version-libraries.patch \
     file://fix-libdir.patch \
     file://0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch \

