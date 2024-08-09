Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AFEC52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.88278.1723221135045177556
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EMnGdB4Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-36bd70f6522so1193915f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221133; x=1723825933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFiSQMJHI43oqNyM1bAf/PL4uDDcDnsyq+Tkj0NRVrc=;
        b=EMnGdB4QKnafuu/GvzPbeNTEJQ8mnFiManICEQF+/JSzWpR2jLsAgna1OSlgXEHjv3
         558KYLTkgGKDgSGo78aeJb3MG9tRRIWa0F9AmPapDTN2kAVsskpBH2LsqZphOKqAp6TH
         Fq7S+YeSAbYvIlqe0cMcDwIu8fAK0V+BMOKHY7OY3SxxZUz3/G19ggkXXBdx3ELtQKEl
         zK9CpQ0njFn3sdIBFWiJkme+t4kKuK1kh4W4POAk6RazZGqAsTF3cmxoJbtcwecHh0bE
         v4K1IjZqjUzUfe8H91nSRt3Z4KAJwji08YozXnEIhwDEOwOT2dNVqrAHReaJigrDWMKr
         GcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221133; x=1723825933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFiSQMJHI43oqNyM1bAf/PL4uDDcDnsyq+Tkj0NRVrc=;
        b=tj0GxK7nzrFf6Qxz0Ez0rASQ+BKB5Xka/RLptOascChaThewgMBqZfsDfpu0gh651D
         p+Zy32UR2CKZ5ZXvmEp9LhZAkxt+wOh40mtMO8v8pYmaI103n+5M+KWAJPGJBIPI0k0u
         Bj1Insfg6seqQFrmUxaIWts6W/8UwDV+9vjHmmFBy9uuVtZibOKR79Bt/CFrUEyYyawa
         +NAC6QNObB79hdeA3Aea1dWZBsStIb7wRU/I7zPpJPobOU/ovY5y/vtT7QpnJ4uY81SF
         5XsyYxpeSSJuiqVegtbuOK4HCDTadp2do6N5dXhjaZieHpVZugo/mf12QroU/4aepQqH
         Ii/Q==
X-Gm-Message-State: AOJu0YxMBJWIomJvaE+/iwgfsO5eM70WXm3WRgjeZAAg9+41ll5jfsTZ
	8/N/fLovY0aBtNujqSVi1B/GaDgazJcrzBH2TBE/RomcptujCtAS/Gyh1nen
X-Google-Smtp-Source: AGHT+IFbAPdHL9r6pxq1QXHbwPwSSieLqBZ1vIWLUdhA7ESB+7mUAeaNRGU+pW3/Gr+OuE07Nyy9GA==
X-Received: by 2002:adf:eaca:0:b0:368:4e38:8a0e with SMTP id ffacd0b85a97d-36d5ede922amr1491814f8f.36.1723221132971;
        Fri, 09 Aug 2024 09:32:12 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:12 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 01/12] python3-service-identity: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:50 +0300
Message-Id: <20240809163101.8416-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111712

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-service-identity-21.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-service-identity_21.1.0.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index 006fae290..267bbea13 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
 SRC_URI[md5sum] = "5e5c195d8fcedc72f9068be2ad9b5a13"
 SRC_URI[sha256sum] = "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.25.1


