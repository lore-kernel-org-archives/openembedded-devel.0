Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB96EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 11:48:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.8980.1692618502983173409
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 04:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nJAiVA3D;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bc3d94d40fso24867115ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692618502; x=1693223302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LsiYrqKy1oE0LQXcpDjuMIfbAgR8CUCww6aqau/H5g=;
        b=nJAiVA3Di9sTkmI2JS7EzgqjwH6zNS2BQTsVQLxGXVZL3z5C4GqrFnYMT0rqXtJUar
         +2NQ2/kKLyCqwQGT66m1C7eavPJ5KF8zBJSUrhgZfnVsOT2Mzhvw4At+qK+xH3d9u/Ap
         qJQ18cVLQxjvo8HxQ+FRzTAKKpIGE7Hl5c8qJ81iHHprvEGiyFhG9LXfBej2LLwDhKSL
         FIqR/uZt3jl2r8aqPMJrKHoxQeiaaaogehYAhrDHmgc7w7sxly8pWHUvqlh7fHegqgFV
         E+QJVMKnubvS7oJWpwkJa84IjlBNvAk/q8btH+gbLXFJCjUW5kYHcABL557t7Fz6hKz1
         RoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692618502; x=1693223302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LsiYrqKy1oE0LQXcpDjuMIfbAgR8CUCww6aqau/H5g=;
        b=ls0jNCRGsA255ctJ6GIRAIFsvIcS/gqvVBRkeOpPcCgxuJ3M01aRztiwAonoU7kffi
         oysghCBk0jzIo01xognvf6V23E7r4wk5j+RtOsjfH2vWwWzDCMpIx+3kOY8Vxb6+3liz
         8U18wdqnSXMPUq62mct+grlmXuk/qwsBmiWPBJUhsHoyGrIb6juLeE1gdOvQm1wUK5bJ
         m31jGoUWfmMgGIZG1PLqRPf/jOk8TOl3kj/m0WeBx75EpNKFKMk5VjBuYjfTBSobzCe2
         Lfodkn5P1YwyeAqjMLuRgKYGc7iRczJRvldumGbwBKttkH0mZS+QC7FGByuJPVUQR8+3
         U5Gg==
X-Gm-Message-State: AOJu0YxmMK13u/aNrjlJUAgKjclkH2/fHuIk7J6MjpTsFjEf6z2Kri+C
	+dyuRtBIQZ+BJ8ahBNV2idjplh/McKaw1A==
X-Google-Smtp-Source: AGHT+IFc7c99w6iSdlwHmMh2PS2OGY8yPtqB+OdGy/LO97J+2a7WggJdKAi1mAERjYWyvekG84UqZQ==
X-Received: by 2002:a17:902:684c:b0:1bd:c6ca:e0db with SMTP id f12-20020a170902684c00b001bdc6cae0dbmr6939272pln.37.1692618502255;
        Mon, 21 Aug 2023 04:48:22 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:bdd8:21f7:9051:f166:1be5])
        by smtp.gmail.com with ESMTPSA id ja1-20020a170902efc100b001b8c6662094sm6833267plb.188.2023.08.21.04.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 04:48:21 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [meta-oe][dunfell][PATCH] rapidjson: Avoid usage of nobranch=1
Date: Mon, 21 Aug 2023 17:17:45 +0530
Message-Id: <20230821114745.71668-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 11:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104507

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 04ac93e92..bc90bffe5 100644
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


