Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A655EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:14:24 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.9472.1692620062154204639
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WJHOeaOM;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1cc61f514baso845193fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692620061; x=1693224861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=990fWioqhUR7I0soCwuACYi53Cqq48fMIU4JKQl8f0k=;
        b=WJHOeaOMnzCZ+2B9hGo+auSaygXBj04lIAQYmUZrskhySNDYull45ubfuFEr5RM18S
         PuPxCLZkxmPlzyfgF0/q89y7j87npWXUq8w+VjjGaYJNcIyUdL8gCKmr15vOWfmrMbW7
         O2wq0s3eCs4ZllIpgFJb8P8UKnNzwwm9GZHK1+Siy0liGMZo3MNgJuK7sVByG5ythZRl
         0rXYesFH07cCEN2oNTsuHCvpcekd7aQxbLLV+yvIh2ZysdO6UwgpcHt9HpCC2s2YfDWJ
         KDizKHRgJtXJtaDraJMZLvXpQA0I0orDnKPyAnrnWnzd78J62K/PPMVtai63HqEp8IZ/
         5/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692620061; x=1693224861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=990fWioqhUR7I0soCwuACYi53Cqq48fMIU4JKQl8f0k=;
        b=iChZ00rPCPgiHVHDv5xe8079G8VvJmCN39sI3YtrJi1oLOgfNIeYYWweMgC/2lJDNb
         AyMjt9m9nYzdaKKjXdtCwXiY62eA2QwhahrN/h9jaXTN7bee9h1HhQdMkZw1IwWxXqHe
         lgeFlKEoWPaZyJIocISOimuce3VutmY10GBx6HAYpuf8KkeWeHx/61FJo5oc8bib0Yls
         FD5SNJtge144R1XIQoxZEsZE6ocBqQOzvYkFrEtGF6x69ZuMeYu6hWUzUtlzk9P6cmRt
         2RkRs/pSLKrNBwDiLLxUZojr2bVhbwNWrPEt/T9fTxFLI6Q3kzIF+rjA5zchvKiQ47cC
         wK0A==
X-Gm-Message-State: AOJu0YzE8OFm6ujdFwsKWQOaKox2r8qclO7lfaPC62GV8RLZ96n+GrxZ
	5Xd09HMYjGOOKnfgDWDF7rTaQLK/r5LQqA==
X-Google-Smtp-Source: AGHT+IHXwoieACZqP5KyZMoTJplwr8hFcFVIvX1Gy8+5sYciWDT3QGwkOw5cZrl3Rr3fRU3V0RBOZg==
X-Received: by 2002:a05:6870:b526:b0:1bf:fd8a:826e with SMTP id v38-20020a056870b52600b001bffd8a826emr6863430oap.55.1692620061228;
        Mon, 21 Aug 2023 05:14:21 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:bdd8:21f7:9051:f166:1be5])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a031b00b00264040322desm6500288pje.40.2023.08.21.05.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:14:20 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [meta-oe][master][PATCH] nlohmann-json: Avoid usage of nobranch=1
Date: Mon, 21 Aug 2023 17:43:54 +0530
Message-Id: <20230821121354.76475-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 12:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104512

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
index 6cf27755e..74e40942a 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
 
 CVE_PRODUCT = "json-for-modern-cpp"
 
-SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1;protocol=https \
+SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
            "
 
 SRCREV = "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
-- 
2.25.1


