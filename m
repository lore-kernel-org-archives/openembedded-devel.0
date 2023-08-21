Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA93EE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:09:24 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.9317.1692619762170488520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Enm8Oxc1;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a5ad44dc5aso2472456b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692619761; x=1693224561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49oBqJvEgqIH0Dsd4D7FxNzjvrBcVtY7j+J25qeQlfE=;
        b=Enm8Oxc1Dz0wy/TPPoGHoejfwVFfjjaFAQaEn2QGCg+ksZWDjddLV0mvhw8HAk+ru5
         oa1Ki77bnS2uoU88VbCNLmGCQUYBo0Rgukp4IsvbEjoMF1VbJKpGDl8w4ZFeXGHzcVWH
         2voLSjSu8ZDMzB/9nwahAn1TipjHL22b31EMLW3FYAWO95g4d6Jx8xQbUgmcukVqtdUu
         XvSekNJP2rrOJAyT4wTV0dQY5R66UxlnkZEcp+yq8W8SO2Att+X0Keujydcz9ndvlKu8
         CPY02rzy4MyH0WBy02U3+t7NDnohbJDuCrH6MBr4/MAP0FjviESPAHFvczVpX8NaiQ42
         8iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692619761; x=1693224561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49oBqJvEgqIH0Dsd4D7FxNzjvrBcVtY7j+J25qeQlfE=;
        b=D233znw2st+uZ8ltrLZikaw3ZTZRp9vUC0AwA190DGx9u3Akv53gTnJ2qmBjOZWPjv
         3qydpjr3YmVD7K511+Bsh9IQRAJM27blBb4F7VTPUJsygxctvd/0x+Lexk1JXTdsoUC7
         zB6d45hUhLDOo9j+eEYekKxQOwmGU491b1nIPjnRKavcfWvta2ixMu964ZdtRb5+1uWk
         foU4OO3GFfZjr1mJAy5hmMnrmpq+C+ck/rXCI9qxDdOr7uV3PtuUKrjiAbVN+FefCH+D
         UJG8V/3xeiMPJSnI4xnU8AT4NmITrY4lYgZhb/sdcCJKJQVEUxrrPfONgcBduqDC1lLx
         U9kg==
X-Gm-Message-State: AOJu0YymBJiWfRy/JXbSjvaEvB1CcHNzQvSK0JrXCD4JliiM3eMqmQQg
	Cfnbyk3bB5rLMUiEi6eIiX/hmCgSm24lkQ==
X-Google-Smtp-Source: AGHT+IFgFXCv10NBiU3SgT3/DvpveYsbwYPYaf0y8p/z+QBd0XohLcSE8wyqKRg6insnBXFhxO1mMw==
X-Received: by 2002:a05:6808:1508:b0:3a7:f650:af9b with SMTP id u8-20020a056808150800b003a7f650af9bmr9003318oiw.55.1692619761243;
        Mon, 21 Aug 2023 05:09:21 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:bdd8:21f7:9051:f166:1be5])
        by smtp.gmail.com with ESMTPSA id ff18-20020a056a002f5200b0068703879d3esm5990961pfb.113.2023.08.21.05.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:09:20 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [meta-oe][master][PATCH] rapidjson: Avoid usage of nobranch=1
Date: Mon, 21 Aug 2023 17:38:56 +0530
Message-Id: <20230821120856.75750-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104511

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index b6ff62b91..65294fafa 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1;protocol=https"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https"
 
 SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
-- 
2.25.1


