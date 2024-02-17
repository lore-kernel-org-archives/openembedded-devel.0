Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2081C54766
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:53 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.604.1708129007356539470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=izallsKN;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: ticotimo@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e125818649so1272590a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129006; x=1708733806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUSNfmERJDEjnSu1IZD2CtDCTMnOF7FITersdp67Hac=;
        b=izallsKNL5BEZqaksaxcRTeez4JmnMeUWkdonWt7/88LerkAD258HKxMjjLqbxS/u4
         JEgUBzRpqgOI8jD65ma3pcqF6+N/fG/IFMKNEvdiyozLfTZAH0Jrrzf6c0iQImnY5giN
         UC5kYvnT3dtrJX1Ckem0OoMaaK3uEg5U7heXiQZwHvnOGiDh4fzrJ0Y36hzD2VtwZIX8
         5krxETPgG0fQMydyBjcxPXf/lkAAUXzAAULqqiZ2+8m1zXcPrDw2+i2GcXEiF+wALLm5
         xcP7d8xdLfvymgqQestXNwEL4DWUGs9dTBaeA5UTlsc7usUW/3RzN/4yTnatvCmV7LjK
         z7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129006; x=1708733806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUSNfmERJDEjnSu1IZD2CtDCTMnOF7FITersdp67Hac=;
        b=NzsiKV6voL5tLRJxEmAta8SAbYCtP32eooj5BbPyCj37f0vgL6lv8yUiaken1mT7di
         I5LXzTORphJTCsluVct/Js0+OVhR2vMb7vePkLOm4JwgHEVK+00blVlJ/GWgbbmBMl69
         dX2ZXCcrkSLEznIJcZ6q30Dx40Ndw9wD5IuSUGobtOKreXcbcXCFdwBj4o7+VdNsSPcI
         0ZQ+wuaBi3RP36P8OgBZ7oUUPcyiQaJwVubYoF6jmdPG+VJBWWJ3angK+z8cYCzTdBbC
         yPnZd1ONVAWddoXosbgeWL9pt+Tmm/W9ad0AAUmjvUWhoWrwW/am+ZIeJj5p6ORYp2aB
         Z/6A==
X-Gm-Message-State: AOJu0YxoBaACrZfv8s82HUIOr9ueN3KZhknGE1ezR9t7J8ZZQewsX2PO
	jZYFmVkgL2+ufMD+yrAtpS4rfgYnaJ0nT8BFG1rzkLIgZs4NaaDugF65AajQ
X-Google-Smtp-Source: AGHT+IGSrDE5usdOC0AXreYWjI7gY7OA1zv3YLCWT82nRUdGx8YhnLb8ukSlnuyDBhvv1UG9+LKHjQ==
X-Received: by 2002:a05:6359:c8c:b0:178:fe3e:1e35 with SMTP id go12-20020a0563590c8c00b00178fe3e1e35mr7215571rwb.13.1708129006413;
        Fri, 16 Feb 2024 16:16:46 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:46 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 30/60] python3-pyzmq: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:21 -0800
Message-Id: <e60fa46e32426498b6917ac82c84932d7fed7a35.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108800

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-pyzmq/run-ptest      | 2 +-
 .../recipes-devtools/python/python3-pyzmq_25.1.2.bb      | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyzmq/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
index 658dbe6e25..5793db55f6 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
@@ -26,13 +26,14 @@ FILES:${PN}-test += "\
 "
 
 RDEPENDS:${PN} += "\
-        ${PYTHON_PN}-json \
-        ${PYTHON_PN}-multiprocessing \
+        python3-json \
+        python3-multiprocessing \
 "
 
 RDEPENDS:${PN}-ptest += "\
-        ${PN}-test \
-        ${PYTHON_PN}-pytest \
+    ${PN}-test \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_compile:prepend() {
-- 
2.34.1


