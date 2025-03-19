Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D13C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:04:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.6235.1742418266356676446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JWIwTKIY;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2241053582dso329775ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742418265; x=1743023065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlwRkKRIXFHXC5fVJhXslIz1tjXBwJ/39qjZWQjT9GE=;
        b=JWIwTKIY+jHalnigwHGXGbfSESDh65gF7dTbpJI0/KrMWCY5z9oYJQ0quFCIYRvtH2
         0f0uikN6C6d2SGt2r1tbfCQj14oC40EaQ2SgN30TQxbNe1YWljc5x4k9ioX5AmGPRHs3
         v9e1qqN3Sd8GERgZI3WKQhhtNZUGJolq57xa4rAjC0epIY72Ev7qouiRmYHDz7II3ljf
         fYcLBknkXK2WiL17FzFkh2guHVoKXmMSwRtDEb7U5KbDaodODf+LqKo/h+MOb4Q18V0V
         EVXZiWnUJKh7PUv/KpfansM1GEiskPoxifi35bCucOgYZlYjfcQySAp7QVkd27IVZZ6C
         jQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742418265; x=1743023065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlwRkKRIXFHXC5fVJhXslIz1tjXBwJ/39qjZWQjT9GE=;
        b=mRVvnbFkGQGmWsZ3LFTyCwCH8KYicSIpLGzE0IZxrurOyv33SMS2/uODOd7MiucSat
         58LuDv1AIihAoqzCyChq7/gy/3TzI8K3OEBUWQ1t8Efsd+Iq0vQxm4+WRNBo65vSzJQc
         KtUABsc7Ks5j1ZIrSsgoWO0LmwzQQF39HYtCnp/E8T0wn3dMJJs9t1bEUCnQQlGlR2r6
         S4TSzOns9Bf7x/vtMgYyOXXbqVv3dWxS92A73TUIuJs7wqLM9o3JIrEfCmdZ5uk/EHmq
         hrmsinlFM2C/emKTZKRWbAS6td46TA8Y0tw10OmMGMlCgRL/2tj0yRCa/0g6zJA7aFzC
         nQ2w==
X-Gm-Message-State: AOJu0YxE0fj40M9SUXdafLqtMUzS6vbDJDiOpH3IuMBC8ManJR9p8Gur
	qQwBwhHH0KaZTdRJmWffKrAyUNpVZ9f/VZIAyv1YeuTmQcF16EhLXUD9xKLx
X-Gm-Gg: ASbGncu83YaGsKnbULqqjSzxgtCtCyQ2j73Emq+nlRKerDTC7MhfykzxKTgA9ETKdBP
	MRz4AW5PuqnP9u5zrbJkl0B3HpJX084Es1L1gv/PhJM7GLtWkiuZ7M+cxMwWT0qP7Vyx7UbGVhS
	OFQkxHFdK9YJaBaSfBZwfei0datE4/yPvTStmg97kg6pcaYhN4rlBsj0IkC9LqFON82ySC7cpj7
	kjlLBSbue+GIQCN3D05n4fURY9RqPTNPOoVQz1yQKGmDyy8F0psmVCr0K6EuIVnKE8KIKNYzsSR
	ciMKutpE/fqWsVh/bbw2/JcySkR7Ai8428nC
X-Google-Smtp-Source: AGHT+IFEkfDWVZj9BDRXyeHgHIYvsuUX1pgLspL9eS51S1TP4U9tremlxuNpdmpAEFnp5PaIpiSImg==
X-Received: by 2002:a05:6a00:3984:b0:736:3be3:3d76 with SMTP id d2e1a72fcca58-7376d6d2206mr5042942b3a.17.1742418265461;
        Wed, 19 Mar 2025 14:04:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152938csm12511767b3a.12.2025.03.19.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:04:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] yaml-cpp: Upgrade to tip of trunk
Date: Wed, 19 Mar 2025 14:04:20 -0700
Message-ID: <20250319210421.2454856-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319210421.2454856-1-raj.khem@gmail.com>
References: <20250319210421.2454856-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116112

Fixes build with gcc-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
index 44ac0687a7..29e53fcf04 100644
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
 # yaml-cpp releases are stored as archive files in github.
 # download the exact revision of release
 SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
-SRCREV = "f7320141120f720aecc4c32be25586e7da9eb978"
+SRCREV = "28f93bdec6387d42332220afa9558060c8016795"
+PV .= "+git"
 
 S = "${WORKDIR}/git"
 

