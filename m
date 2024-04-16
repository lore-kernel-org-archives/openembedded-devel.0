Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157EEC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 20:05:56 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.31293.1713297954245348561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 13:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DiluphYf;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516d6c1e238so5752634e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 13:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713297952; x=1713902752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U75bz2RIBgJIIMys9GZlw84DyZli70djbVm3wj95gbI=;
        b=DiluphYfktDkE3OrvxLwm8u5nLYFTFgUAHpBESHIzYbn10V9QESf4nrHlBE8r6Omym
         RCk9nG0Gaao43YVdMSFZsx2QUI/JTAacZtT5vCyp3EdjToaWBsY4VHYw72mh25ja3gi9
         GumT/e+8lKHXDEpYfqcaDWq/FIrgqTvIcK2TaCXez2ZDYedGxmhXdDdj+Y74g4FWKUEW
         5TYoPZ5aPlJzY5vH4vm9be53/JTpwJmC5jgOgmEiEq0GluFturQpjsXS9KLMjE2hSUjM
         GisQxC9WgFbjex8PRjGmuSJz/Y6haPo1k840WxOU6g/8njX0yzALaH7c4CADIuyOfd0F
         /0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713297952; x=1713902752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U75bz2RIBgJIIMys9GZlw84DyZli70djbVm3wj95gbI=;
        b=jnbm2pybisy9HDbUr2DL5a23cUR4Fl6gK13QACUaXH/og/lTxsGJ4TQq/eCgIN2M7k
         uuFF3/bQ/T7noTza+9sY4wRMGmQKbvohw/MNL9C25RHJHK6siJhUO6FQfq9ryKzIcGlj
         FPKNKZoJpM7cp2AzGP8XWH3cMZFf3glbwYQUcE1DPdlfgI0HwDtx8XkNzKQoRtdzVqMy
         l1cVsxr4UGlyFULuxLSxv2zrIICa77TfuC3fg3aYKhuUc4WnJs/f3mfWBnJ/wC9Y6Tfo
         T4QCTaDBiUPZrj9Tpbd/51yxYiJW0GH8/sRGr5xbtWyG9s0md2VcBXtHDaaD7/fNS8vy
         0NyQ==
X-Gm-Message-State: AOJu0YwetYwZcA5fOv7brqRwvD2EkWK/MOrSapHVc3BG/8EzQ27mhMav
	ZtL/TXSKr8uUeoerJjm9FOj9EAD9AvRLHlN0dkW3BCLwVVlv5ItF/boMpg==
X-Google-Smtp-Source: AGHT+IEAYAXyt8hJE9LZwPrQ0eZSBB8CdV83SVjh8E3iMX4kvJAr+rWXY623AJMeXwc7BaL4zkaeUQ==
X-Received: by 2002:a05:6512:4023:b0:515:cb94:af57 with SMTP id br35-20020a056512402300b00515cb94af57mr11507150lfb.57.1713297951768;
        Tue, 16 Apr 2024 13:05:51 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id g22-20020a1709063b1600b00a4e533085aesm7205104ejf.129.2024.04.16.13.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 13:05:51 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-scrypt: Move from PTESTS_PROBLEMS_META_PYTHON to PTESTS_SLOW_META_PYTHON
Date: Tue, 16 Apr 2024 23:05:46 +0300
Message-Id: <20240416200546.54158-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 20:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109985

There are no test failures when the image is created with "bitbake meta-python-image-ptest-python3-scrypt".

qemux86-64:

Testsuite summary
TOTAL: 45
PASS: 45
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 55
END: /usr/lib/python3-scrypt/ptest
2024-04-16T19:15
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 45
PASS: 45
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 41
END: /usr/lib/python3-scrypt/ptest
2024-04-16T19:20
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index c54df5090..e07aaf3c0 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -93,6 +93,7 @@ PTESTS_SLOW_META_PYTHON = "\
     python3-marshmallow \
     python3-pillow \
     python3-pytest-localserver \
+    python3-scrypt \
     python3-traitlets \
     python3-yappi \
 "
@@ -103,6 +104,5 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-fastjsonschema \
     python3-pint \
     python3-pyzmq \
-    python3-scrypt \
     python3-whoosh \
 "
-- 
2.25.1


