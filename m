Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397B1E91286
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15341.1770274801095477391
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dlEqSFnQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso5740575e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274799; x=1770879599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubf1g0s1shXON5Zc/9m0PRLJ+QurfFGUztZuSy9lDhU=;
        b=dlEqSFnQezqW6YMSOva8sh9lJMIT+ZGr7ZkBH/JKZe929+m6662x1C8FgEBaVUQZBo
         Qc5bW02cSHI+XqGtdB7oezsA4L/NGFuCTur7d4tk7zoCZI4LRNqeqru/Uxq9sU8N9Dd2
         r8z+98wgjOSEGVdvgKubb9AFkaiRmKahOl8sRG/w6u28f79eSlrY4ncjkXmuFE0+6ZTI
         QXMnSKVEl4dA8l82lkRsCBylxT9Q/BaYfPdt3V9l7nwCu4DOwWDfBOl3p8hT5Bb4iIDu
         ssLEJuecMfac4JcHbGc+YlZNdctOTiQR4dqACFWo0r4kAVONCgbYmw6QznWG3FTjqVSE
         LLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274799; x=1770879599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubf1g0s1shXON5Zc/9m0PRLJ+QurfFGUztZuSy9lDhU=;
        b=fdzzjYpS+bpvXQJeHeWrYqXXlIQNrmpBXxiC8+gu92FCvr06vObcqhD01DJ7hdEEtL
         7Ga3sXVzCRT91mr2pDp5oscqqVpnS4gwALbp4BvBQp+j1qhIcsugomiYgmNsa8RoJu8n
         tEyWIdSz7d772YC1FEesQBDsbeVuLkhMrkx2i7f1W0EtJSHyeius7tEPX2/jHAcuJ84N
         UNxwS1lD6zUD0DzyY93oy/QAxcZl1SZBIFsAO4uE2fTKK9uE0/oi14Z7C0oBCvy/HhYL
         bKaIH0aQ+t5vftiyuU3TfoOihAOMr8qFmJF/u2Y631VNwleYrHwXRIXY8ff5jJvt0/oY
         Sl7Q==
X-Gm-Message-State: AOJu0YxRbdeL2NBc5D5qniNcuMo/QZck+not8wrOPAXFndQkvoo003oS
	aTo92rPJUK7QFbTPnLgk2wZMP+ya4XjEuKzyCLSj+C4PX6sUZzRQqyoYWDw0yQ==
X-Gm-Gg: AZuq6aJmP1iS9wJuKXO7yymMh1eBQLB8xz4HIiNg2IcyD4VBDhjbH1q4GwTv1ssNLa2
	jT0lURnSQpBDRPvN0FSirckyoLdKpOJqupJJ+Ae8N3rZddoZMpEspD93CBM7NrmOaQyAHc3DarY
	pWkUxVVkEHw3zZ/1o1ooUSP8tmVTjAKky06RkJ7epCz3iqilxIH+Mz6reYxFETXCK7JqHv/obNA
	esFBc2JgtxSPEIV2SqOzA0hKAbXVfgJu+e5H8nPxkn6TErzsiEeD0EYBrudmBg3OFz3vGcmcM/s
	f6qVQxqAIk/Nh//iKSQtdAwt8K4XzkOXYWhFq169F47l/D9+9hDTFH0rtpN3UjNOyS8nnwCE4L2
	1ePtEQCx34BSKs9ctQv57mXbxYE9tjDIvw7F/JEubqS+xl37owc6xaGdFgJ0fVlO4PQdSyK1FiL
	YZmqgkQYTr
X-Received: by 2002:a05:600c:348b:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-483179a223fmr22473445e9.6.1770274799424;
        Wed, 04 Feb 2026 22:59:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.22.59.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 22:59:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 04/20] python3-lief: upgrade 0.17.1 -> 0.17.2
Date: Thu,  5 Feb 2026 07:59:39 +0100
Message-ID: <20260205065955.1267785-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124180

Contains fix for CVE-2025-15504

Changelog:
- Differentiate Mach-O FAT magic bytes and Java class
- Fix MinGW compilation for some configuration
- Fix alignment issue when rebuilding PE relocations
- Fix infinite loop when processing v2 dynamic relocation
- Ensure that added DYN ELF sections are properly aligned
- Fix GnuHash null dereference
- Fix strong performance issue when parsing certain Mach-O

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cc4aa9b9d0263de0ea172db4d97ea9f98ae022b3)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-lief_0.17.1.bb => python3-lief_0.17.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lief_0.17.1.bb => python3-lief_0.17.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb b/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
index de54d45ef2..208e81c39e 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.17.2.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9ab5db472ff936b441055522f5000547"
 SECTION = "libs"
 
-SRCREV = "fe54643fe3d7a699c68b164dae87afb1eb059342"
+SRCREV = "aa2b617f47c2f75fca9ff00b146dabbaf1b9f422"
 SRC_URI = " \
     git://github.com/lief-project/LIEF.git;protocol=https;branch=release/0.17.x;tag=${PV} \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \

