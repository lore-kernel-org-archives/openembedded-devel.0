Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57856C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 13:41:18 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.14214.1752241271589223504
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 06:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=E+6Rza+u;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so4659919a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752241269; x=1752846069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPYZl+HGbZbX9mmfPQ/0JHMDT53CL8Gj1zHfdA2FqAs=;
        b=E+6Rza+ua54g9/jy7rXItBt+vyLSRuFXg5oIG7kM+8N7XvPtkiW7UNYk2c/c0tCC8o
         yu64Vj8ISIOrL8d+XwtpFX4AvLUukt8Bd/yrrg0lQmHQA6kKvChQRi75L0xsKs2J4DZj
         NxeW6+G8bhyRwCstnt6YuEqWwvYOtofFsL+rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752241269; x=1752846069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPYZl+HGbZbX9mmfPQ/0JHMDT53CL8Gj1zHfdA2FqAs=;
        b=olzeviCJSpa/rWZG5LDEcLYtdja8vkTPdwjmv7MxTYcmHuzg/0sBSKOWwgaPlZEhCr
         dr2bcbnj397VzAgBLQcPAgxz0mQYO1lLMcpEoJR6m9nSUbnqTYmyKxUhFo1zNJuoDejz
         Z4oRkKwbLIlHY22SxCgCQW2VWAco0VJP6lfyFn2M8GyMRiGUkUPvPfOWYoioTyVnoIuc
         iCbwhNVNh5VCM9ECFDmDRGQ+c9mKHyIg61q0MkQooW7pN7+nNm1ehaBCzBQcHHbeUzBs
         haHAq+ZHMUtI/pU2kYg8xsB7Z0Rr1dGVjFrtpCYTpv00V2MQM4/b3t8m7F06lWxtxBLA
         ityA==
X-Gm-Message-State: AOJu0YwbjrQpkEe5hDGb3drHid/GULad0/fdYetxcJB5MDS6XCxT54eo
	zB8zmgj9P6+vTMFmNQ6p3zzkqxocWlMAf71bMrHo9FplbMsBu3YzKjpFZculi9cQcIHZVI348z3
	Ljpig
X-Gm-Gg: ASbGnct/wryvQQ0uexyno00m1lxVfuOSya//qrPsq+nApsHXjtw4MdojG0NEwiqs6Rn
	/h8pnWTUa5qoWHtbaX2ipPPX/RE3Vay7wyZ8/oHlLkJ2yKC9vdsUyoElEERtOHn2okTZnOl4qJG
	pmwhdbZpYGjd1EDQsTrzopH7D3LXRz7nGI/S4AdxH6OnC5qvD5/KNqS6GvL/42C24bjov25Mxr0
	F9tr+m0xOTxIjZqPC6cQEVwEH716SuWUPFb+UMW0KfoZkKtf/obF4FqtypzuSXR34eivkrXVTLJ
	PdOUSwie8ud0iT8n9q30aWbw69UuAk97+E8itEnc4nBYRvDqv2ZIYULkL8Cnu9L8gwOlm4mcNr4
	odXpLSyVe92T/zrTmMlkXtgtDpuAVBG1/IdfT
X-Google-Smtp-Source: AGHT+IGnFb/wS6OMn3L1XGTjrwr9qpbVStA/XnlxA56GdosMxH8vpsvRIu3tIOPGEUUzfLAQ2ydwDg==
X-Received: by 2002:a05:6402:4410:b0:610:4546:2809 with SMTP id 4fb4d7f45d1cf-611ed101d5bmr2248640a12.23.1752241269320;
        Fri, 11 Jul 2025 06:41:09 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9528ae0sm2209793a12.29.2025.07.11.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 06:41:09 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-asgiref: Upgrade 3.9.0 -> 3.9.1
Date: Fri, 11 Jul 2025 16:41:06 +0300
Message-Id: <20250711134106.4117273-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711134106.4117273-1-leon.anavi@konsulko.com>
References: <20250711134106.4117273-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 13:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118454

Upgrade to release 3.9.1:

- Fixed deletion of Local values affecting other contexts
- Skip CPython specific garbage collection test on pypy

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-asgiref_3.9.0.bb => python3-asgiref_3.9.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.9.0.bb => python3-asgiref_3.9.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.9.0.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.9.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.9.1.bb
index 5befa43ae7..0af6eec5ce 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.9.1.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-
-SRC_URI[sha256sum] = "3dd2556d0f08c4fab8a010d9ab05ef8c34565f6bf32381d17505f7ca5b273767"
+SRC_URI[sha256sum] = "a5ab6582236218e5ef1648f242fd9f10626cfd4de8dc377db215d5d5098e3142"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.39.5


