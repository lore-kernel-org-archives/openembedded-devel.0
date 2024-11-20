Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00191D743F6
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 23:42:12 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.2236.1732146130997196111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 15:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SE+jZrFo;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so283151a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 15:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732146130; x=1732750930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVQ4kYX5O1M5arRSEp7x5fsNOYhdxYWA1i8OM75Zh9Y=;
        b=SE+jZrFoCCV7asgnVBY2yjlwWoAOtpHgMS/xaqtOtvNub1gWaJGho5LiasLfKTAYRn
         voRm0uncgrkvo52Mfg8m7V3AbeUvmPEp3LkconySfivJ/smBR1pjg8sp5aAmHES8xNm7
         qtmTQzg1X8VPna+VaY2kg+0+QPpTKcy1bqplwjQcnxEAagVAesVVbLTmXSlGBSBB/paa
         9CNs0fy+sUUs0o5fqqZcOboAQXWKoYnvAoWK57bDciZRqzH9/iRyBlygVMkPH9NfPccy
         diGJhIYi2PYUa2VsC88b5zLseG3kMBtnSqYd0Qcgvr9nibSKQU40Cf6wdAhtlN9Y3Jl2
         mibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732146130; x=1732750930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVQ4kYX5O1M5arRSEp7x5fsNOYhdxYWA1i8OM75Zh9Y=;
        b=ghpOL0PstatyMnz2TtPphR1jWq3jhGb1A0Xqx5qpaVgxULFujP9jMZ2U6Gup1mbXiC
         4fj9J4+xYyLgdCekxpa4dvAmeKnhMC2c0g3M1wWNtrE9YdunmFW27lPlxhPbTFzhOSZ5
         Ov7zRIH6Q95BQWaTU0i3LTi4vYrxg5WItAFKwiWksjM2fNYZbwgoDfm0tKaIMlAVcNVU
         y8mYVS6QMcCsVTYoUecp3MiO1JdlFtsKRGHw7RPFF70DYAPVRrPvOoeaTU1dz4smKCRf
         wvyl0AaL6SyYJwAnsHCLDsCKKN4+pTIJ4cNL9PXcZa0Dr2y0AK46JCLtSAV5PZOaldGy
         +VFg==
X-Gm-Message-State: AOJu0Yw5FZwaNQ1MD/EF2y9bBkcQ572wiPH+BTmxcx6BeNWCacafkImv
	WLAlgh/HldFBi4BWZ7HOgvxMiW6vKzbJg3IeO4SVFKHIbLEoh8ytgSrwpw==
X-Gm-Gg: ASbGncv3b3UQJJsqYr9BwEZ+Ed/EU+O4BEUxiwKxNGjgna46YLGvoAcONGVB/U6Sh1I
	V0epofHBPLWrkRfWwt0mavMGXxJixTpMj+wbJytr6FoY5r+oBjxSYSzGLsh1oIV9CKo0xUzVMKY
	D4xImEWPYZC2celurOB9lE7kAX+iBSAvdSfhm5aOZ/4vCRGsmB17USKs5vOdgLJPz9d9kTpcP2J
	xmH9jB8vKn6qxO06ZSE29gVCtHyN7A0PvIYYZt9vvfmLgGnaftR
X-Google-Smtp-Source: AGHT+IGQrO0dQk0gYe8eFjviZoz5v+dCSC+fw0FXDjY5UFgWs8z7XsrDHNw8Qk/mrHENbG+THrLM8w==
X-Received: by 2002:a05:6a20:9149:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1ddaebcddc4mr7160891637.23.1732146130143;
        Wed, 20 Nov 2024 15:42:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb6581098sm97163a12.67.2024.11.20.15.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 15:42:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-marshmallow: Add missing ptest rdep on python3-zoneinfo
Date: Wed, 20 Nov 2024 15:42:06 -0800
Message-ID: <20241120234207.753368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 23:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113943

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-marshmallow_3.23.1.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
index 715439588a..0ea6424f34 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
@@ -19,6 +19,7 @@ RDEPENDS:${PN}-ptest += " \
         python3-pytz \
         python3-simplejson \
         python3-unittest-automake-output \
+        python3-zoneinfo \
 "
 
 do_install_ptest() {

