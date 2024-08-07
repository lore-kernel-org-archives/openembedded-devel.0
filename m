Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B7EC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:44:28 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.31468.1723031061058329334
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ds2UHtZU;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f189a2a7f8so19559951fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723031059; x=1723635859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=itbaNVdcgaLWioG0WGj9DCIfAN+FrhmW0wB6vdn1gF4=;
        b=ds2UHtZUC4hmtWJFzTI9nqcZ+EwQAiq+Yh1z3uFrFqpXHA0bZIKc9pFJG5qWtauf+B
         Tom5Lcinf9eJORJBp7rfwrhRRQCPuDa1ZMUFrWoof6Z65JBc3tGaEYxZmWXdt9ZI9MtA
         vRYP7oendeVHH2IH3cI+hp/LjiL8dlA9muyDpelbUjRxO0GCzilon/AqRdxCXLAl77aX
         bBbJhR5O/7sCV9BCxv8MQw8n4KiKawMdK8U35u2eyJVEICNEAd5QzS7NzEyZaG8eqfoK
         MvXf9liRLygpk5J1LNTyjLJb7OiGk7Ng+xiZRxHwS6xX5fJjO3991Di2hVK1r17h59ds
         Ym9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723031059; x=1723635859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itbaNVdcgaLWioG0WGj9DCIfAN+FrhmW0wB6vdn1gF4=;
        b=Z36MOhLTReZpcoo90yMRfysOSRsXBtTX7cNRQHCvyZ/H2GHa1D236uuMybmzCYYCrc
         XGrkeIMk9SQiCo3RwZNY/HSJJhZ2dNSbp+DaYtMWWr4sOc9Zu6IW4IHM+XQgRzBhq3kX
         C0VJmXnRoWTxEQXTid3+B2EFlRkN4zAAh34HC1riMOkQQt3CPsUaMupAPit0ZIOMUySg
         v2svCWnoGxbiDdJUsJlGJolMAzl5Uif7Xy3nOiF//Jb78yGiddsZ9tvRtMJPOdPlETmf
         qUgnpCEtOMblAxs/0LLipvYH89TS/V/k1uIaYsyDKTYaNRzFw3Nx43vrDgkvo40xTizL
         uGZg==
X-Gm-Message-State: AOJu0YxECkQOKHVu5TRRbaYfr9h+WBnHWcT/UY7fyLflpM0q9P5uzDLc
	rRJAhIBswCUZA0lxVWwJx1EOlP9GR74TNErAEcLag2dFY9mnBy7W3XdiP2N8
X-Google-Smtp-Source: AGHT+IEf5PYfxbUO0Cn5zFg7VCk1EOlPBAedro6FeASn5Qhq9JeVgePpOkzu+TdJe8rMZq0LlYG6YA==
X-Received: by 2002:a2e:94cf:0:b0:2f0:1fb6:3444 with SMTP id 38308e7fff4ca-2f15ab0c219mr114631741fa.36.1723031058278;
        Wed, 07 Aug 2024 04:44:18 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905801d08sm25068845e9.30.2024.08.07.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:44:17 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-click-repl: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:44:14 +0300
Message-Id: <20240807114414.85173-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111619

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-click-repl-0.3.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-click-repl_0.3.0.bb    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
index b773ed6b8..46cf1b378 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=580facc4832cac548fad94845542da44"
 
 SRC_URI[sha256sum] = "17849c23dba3d667247dc4defe1757fff98694e90fe37474f3feebb69ced26a9"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} = "python3-click python3-prompt-toolkit"
+RDEPENDS:${PN} += " \
+	python3-click \
+	python3-prompt-toolkit \
+	"
-- 
2.25.1


