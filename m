Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B07BC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 05:28:05 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.15590.1702531680476825798
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 21:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35f761ef078so4663325ab.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 21:28:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702531679; x=1703136479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdv0haqZGYVB9PYGqRMZdzcArxxx7mwCvIWk3mWVpqU=;
        b=Av29rwv5LxSOJ83NLMpRw5glrSJDVDy/diRsA8p898pVX8y/z48w/NAMJNvFb58HrU
         VufY3XZVTqugPY13Y/oBD2kfirVgACz3pwwPVXSR50I7dDiVc+Iu+TsfbUqhhRhceIen
         nRMTrhVtjO/Od0OKom/3JstCiaAEt1kIJFJbEqJvl92FTOu6hfpTHM61omDB33K0XWsG
         TTVR0nLRXbYQ8GMRsYrzzhPnB/24TMiCbGA2bk86DNwNZyuzySFvauc7VvpfiazyFuDB
         cGXCP1NzY2m6aNZIF3ngtf2NNFqZkU28Jl7O+H2D6W8R3m7a+WuQE7KPMQUV6gbT3ptr
         ybPg==
X-Gm-Message-State: AOJu0YxloWYYHFNhEGljDEabwKNFqYgMHXvJzHJvS8NvcdyPSyejjb6A
	zqqciV2HKWUnnQfBdERm4M/9sP1aR/XBPw==
X-Google-Smtp-Source: AGHT+IEldHIWO8LtXB8qXPNiyYLb/pNsCF4Hu/9lo/q7hS1nOictsmFIHRBq8Lc8lYmTDqUcgeNRsA==
X-Received: by 2002:a92:d309:0:b0:35f:7892:10fa with SMTP id x9-20020a92d309000000b0035f789210famr1292624ila.64.1702531678896;
        Wed, 13 Dec 2023 21:27:58 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id r6-20020a92d986000000b0035f76aac36csm607934iln.21.2023.12.13.21.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 21:27:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-prompt-toolkit: update to version 3.0.43
Date: Thu, 14 Dec 2023 05:27:50 +0000
Message-Id: <20231214052750.1212151-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 05:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107418

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...rompt-toolkit_3.0.41.bb => python3-prompt-toolkit_3.0.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.41.bb => python3-prompt-toolkit_3.0.43.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.41.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.41.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb
index aa19116e8..9f7802b53 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.41.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.43.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "941367d97fc815548822aa26c2a269fdc4eb21e9ec05fc5d447cf09bad5d75f0"
+SRC_URI[sha256sum] = "3527b7af26106cbc65a040bcc84839a3566ec1b051bb0bfe953631e704b0ff7d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


