Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B477C61DE5
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:41 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.995.1788051033737094501
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dGesbfO4;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso37579a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051033; x=1788655833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGIt7kQEIyV/KXabGM8qzyvbWBY8kpexK3HPqtITL3c=;
        b=dGesbfO4Ra/+PEzw+0bx0Wy0BCTnpuaHUb5SL3OuZ0YC1+J9F1zrShtWsEvnGwsvET
         tnyi6zYL4FkSW9cPE/2SJ05V9BRLC89gRRpAARp5Mmu49kAqRwdsEARNXSdstxUv5uj3
         r+wh/hUHEySfmKMBDply4+OtGy2yZho0W/wtZoHxZMLLAEONtQDhoWxPbRUYl90ZlN/1
         g35kWCHqLONy8UPWDCF8JNzN4/YAzvJoOoNfp+fmfbGuSz4UNxuZM3rmaGzXT59MR2iC
         kdsXgx9xLjGUTv22aVqvE0nziiXLZEITAXoFhFU6J5cNK3WuQBBC8DBD2lKbDX4afQFS
         1z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051033; x=1788655833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGIt7kQEIyV/KXabGM8qzyvbWBY8kpexK3HPqtITL3c=;
        b=cFqx0YMmopSaAhpXJgujPCSz9toag3eOZmS3SWw9AkV7PGsnUeDuJEtdk3ict4eh+I
         nYv3KMKrJQhXzbgiM0UYfZ22xvN7DLLPzh9nggWHgYrQF2xF6VmDbFX3qdjDlRv4gstF
         r8V94wdlqW5TQT5xpB44qX4rwMHpvR7Z+ugc+NVbVftgxFVivqaPtaHXNJw9tgeHt7Y4
         tBpYdtRpE9ZEQ6j/F7jZqSX45IhAMUhI0UnISXdoGcSsLwSeRUekrnT5w240m0MVWexK
         Hek+Ja3ntGvbVjzFAYHH6MLga9BKyL1qJucQzwLWNKHeSVljmJCPJRmCcy59NDYn7ena
         m3Lg==
X-Gm-Message-State: AFuF++nklua1C335+SdlMplx1iLv7h7XqLQC4xdLYpluufTFc8+EEmye
	hrzHZbQeb6z8V9z/ENwiQXzbTl6vnytfsD5xSuPXwiWtGTHZK1BafZj+2VbiNmys
X-Gm-Gg: AYBFou3cKn1w7ZqMBsce079cw9aNxY91SFneWXpgcziQDAu2i2QMNWQ6xN6K1jXyCDz
	DAWrIS98tvEm3zu728bTqvUK62LiEJaCZUAFxB2dACz1jv+rCq96kca9j38c6YbgV9ZuXUBDFpj
	YkLWMyNpGWH67A3U/S7qqeV5ODWqyeO5iMF8ivzmEcPZT4e2UF+p5brmH2d+zquMqEEcEydF8GG
	hQ0Z3kddGAxgBlyq1GCI4zZUXEhRdTme89Sztb4HCk/s9zA7IQBvnFSS/9OY09M3UlXQ4rjZy13
	gNJZOBNvH/HODyF8XLbcwCtjjjO+KaH8H/r9xa/rUdwGi09mVaXQZ+hFohSMvBWe8ZUaYdLkgwU
	wDIjWDm9LV1tsd/hiZaNU+YmrvNfR14K5IjdF8fXuj8hoQVJojUr+6nZYxJX6TvFfp6jZ39lw63
	EapqHpTZYZfQHt6HyAv3dXTQ8/PfvdFJw40BhlHL7UNc5TOVoGpYBrAA4VHWx4q+H4OvoaPwmn
X-Received: by 2002:a17:90b:50cf:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-396d0ed78e5mr28905958a91.8.1788051033037;
        Sat, 29 Aug 2026 17:50:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 5/11] python3-virtualenv: upgrade 21.7.4 -> 21.7.7
Date: Sun, 30 Aug 2026 12:50:09 +1200
Message-ID: <20260830005015.2555347-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129586

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pypa/virtualenv/releases/tag/21.7.5
https://github.com/pypa/virtualenv/releases/tag/21.7.6
https://github.com/pypa/virtualenv/releases/tag/21.7.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ython3-virtualenv_21.7.4.bb => python3-virtualenv_21.7.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.7.4.bb => python3-virtualenv_21.7.7.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.4.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.7.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.7.4.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.7.7.bb
index 6ee0b921e6..036ad8bde8 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.7.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "c9d960c95fa458171e58222a5ccab7465298e4b6559977865e627c4719f1e825"
+SRC_URI[sha256sum] = "6874376f99ba6b8d4e3ee8bde67f9285412400c7d5b29ba41ee6daa5e0221bdc"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling

