Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9CBC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:06:38 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.30732.1723028797036943339
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SPN6XMZ8;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso19521651fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723028795; x=1723633595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vhh+RyHj7vmdz4FUXmn0NR09u/ZUS+nHC4CA/uDZBw=;
        b=SPN6XMZ8pM9g4hrZx+/cL8IlevdHG7Ld+hKdNz7EAI2MT10T1pasM+dZ6fbKQgZa0C
         fkquhRu7t18twxgMCAkTM+ktoJ9T/ihchNhagZR8UsWoM/CFpT7/Uhjkqkk5DT71VxaE
         XTSv0bRCRe1s/t+OxX+7tODldjpxQO9aIM4823qSardl9N/90BANs3n27FYXH0oLZv/J
         Z5AXzIAPIzR5uvb1q9GySvHmJeKMFrgBj2+ayfL340qIA7PGax68tViEHJyeaPQn3+FU
         5679HTbGHEofwM056Zb2sC9BiFct8ZLWasZpx+yeEPbgfRHRdB0pLq17uXoKxXCaj1LZ
         HDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723028795; x=1723633595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Vhh+RyHj7vmdz4FUXmn0NR09u/ZUS+nHC4CA/uDZBw=;
        b=MFXQFAOdNyfay+qIenzK57UUX+KMXn3S0+o1fGGBuKX5DIBbE0aQXsjRbmsncLkEgU
         eAll6rWSy3iA8kwlOEOtFS2HuplNRXk9C2KVMLV8SDZxVq5eLDVR8q26Cad6gvUo8SmM
         UTMaPveEJuovpoY/n5oEMJJTxFUCmkbPyJ43SAfHD7k74RGdbIjZHEtwsHbRFwk0rZPm
         0qP6cFC74sCeA+6WBtVRrF+PnAB1WFsJVmRg7hKmOK8m5bkFDHUIuJLBtEJM+HdF5463
         hWFQ3wiea8nGQG52xZun868TyEjYOJb4c9hknGwAVY6L7Hrck/UvB6CQmXPQr2J9k2p8
         Hv/A==
X-Gm-Message-State: AOJu0YzS3aEKHyKoipa2K1jVTACXc649OLFN7ge8SGhisrlTvQj3PDyt
	IVrRTvSmIP3hWEEaZb5oBlf3QtE4xk+ckH0lWvaew42BRsCBHQH8KtJ/29ek
X-Google-Smtp-Source: AGHT+IH63dhjexXISvLQtbAZHtotjPR28Dufp2hltF6AXkFsD1AwHsQcuz++Ys3Sxg+iZTIjZLq7og==
X-Received: by 2002:a2e:9cd6:0:b0:2ef:2f4b:deeb with SMTP id 38308e7fff4ca-2f15aab03d1mr128047601fa.23.1723028793765;
        Wed, 07 Aug 2024 04:06:33 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579693dsm24142385e9.5.2024.08.07.04.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:06:33 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-bitstruct: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:06:28 +0300
Message-Id: <20240807110628.51884-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111610

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-bitstruct-8.19.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-bitstruct_8.19.0.bb       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb
index 6401322e2..bdf77c7d0 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.19.0.bb
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
 SRC_URI[sha256sum] = "d75ba9dded85c17e885a209a00eb8e248ee40762149f2f2a79360ca857467dac"
 
-PYPI_PACKAGE = "bitstruct"
-
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
 
-- 
2.25.1


