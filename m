Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF517C531DC
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:26 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.88284.1723221140695633200
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DbPIkwvw;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso1308195f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221139; x=1723825939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPjTnORbWOYiR+Xb8UpEmc5Eujq9cMkhcvMD6aGOFaQ=;
        b=DbPIkwvwm5bYwMlhKieVywbJX8cQ7xK9uT8oqOWbNlKgs/bAQyTcF02a7rMb79Qw2r
         oDp4kXV4h9tWerrvg70ZUoaIkA4/X6x3jrroZfnVV2aPEnasww76i7c1eNSnvzG0s2g6
         HUnb8xMygkOv7mnwR9zeQZDJf5I5JoKROxIhVU6nA6WWS3I1a7iX8Vc1CbmAoSkc0Dxv
         lkOvV2RS2hd7AA/e+I0osmnCKdfrj+2H6PpM2SRJsZqgB7Mf23yO6+w8hwL9vy3bSWRS
         EucHjECZPnOdbTjDKuCRwJ+scXr00CtZ8+Yzp6bmxxPoLt967+H5IUkkSTENuWPiFl+/
         pbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221139; x=1723825939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPjTnORbWOYiR+Xb8UpEmc5Eujq9cMkhcvMD6aGOFaQ=;
        b=J7wdk6RqTQVfY+fn/XqkqJRsM/j/TfGhE80aOW9W5/PxilbPbp/dwSr6aiZpid/EON
         efRf+GLsqdEiGcttmR1vzK07xtq7uJsJrrVp25LHfs1791Iy8s+cRpQVpf/lIEHgdir9
         DlYhZ6WHypB1KgaoZ/R94eUYSJ5VY8BWtm2yLoX7RqsC765f7qHlTRDNh25uWIBcJcmH
         bilaPjHc6CFEx/dZ9MEJzOochqjKwNyAPRY0Uphk6IxbnXexd5hzOJWi2Y6C8XTpSnBH
         tFrdcD3evlR5YGwDrMjY31BitADRNyGlHrVI4GCZ8pxNsKprc5Mza6kHcoS4UPdC6EJI
         Kbug==
X-Gm-Message-State: AOJu0YznBeh84bT61MUbXAM6QK8sG0kvC3AYz3eSFuSvlHIzxbTLnnnm
	F6EsakxCrhnl8QHZoh1avQoNLWO/esvSTBVW2Z7uFJeOYVOJYFua5vRNGtd+
X-Google-Smtp-Source: AGHT+IHG1B00x3Z4p96G2GUn6kKPHnuvRphe/gj/pzMKaWpGEqxDo4YWRZLoBl6Pfl+WrncvKCtCTA==
X-Received: by 2002:adf:cd06:0:b0:367:98e6:362b with SMTP id ffacd0b85a97d-36d616e2635mr1462422f8f.42.1723221138752;
        Fri, 09 Aug 2024 09:32:18 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:18 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 06/12] python3-pyroute: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:55 +0300
Message-Id: <20240809163101.8416-6-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111717

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyroute2-0.7.12-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
index 3ea980f44..cf9885df7 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.12.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
 
 SRC_URI[sha256sum] = "54d226fc3ff2732f49bac9b26853c50c9d05be05a4d9daf09c7cf6d77301eff3"
 
-inherit setuptools3 pypi ptest
+inherit python_setuptools_build_meta pypi ptest
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
-- 
2.25.1


