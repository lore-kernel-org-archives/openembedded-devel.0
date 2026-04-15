Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EFCF419A2
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:28:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17689.1776256118153170606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aE43frRS;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so4348250f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1776256116; x=1776860916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kotTaqrlL4ooKN/+Yw4ShSaYyf06wR2vrkU6SqC0hrA=;
        b=aE43frRSnsCsMyKAT+VhmLiicpDqKMOPVHx+0XFobtP51t8ybFexz8LplkQFFn9RhI
         9ZvwOyEVYsflD3Y7+gH/RYaHiMMlzd8XvK9iuMXdR8WfapsQqFMLtgI2NRTRWdmw7RtY
         J9NbUokR6K+tgSCMiwtEek4JNaqP0rPCZiLAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256116; x=1776860916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kotTaqrlL4ooKN/+Yw4ShSaYyf06wR2vrkU6SqC0hrA=;
        b=Ia6VWojrjdZ/ZcRgtHVwtG1BKS2gPG9XObDjuD2F/BsZHfMV0eD7U/ZiGixLMJYfdc
         drOhKwwOFf7STYBmogiuTI4qiuR/4QehMeDIyX4qhijsOPjpBP7wRr564ENYelXT0fhp
         N5vv+0sdWcVoLTXs0uTRsw4DuiVOSyki1RVvxSgqHJHRjs4KB4Q5Y80L2Pk+GWDBngKb
         LWDsgq3JKTAWvH90ViLmD4v8ED2r+RWEid7OboGd4t5J7MCEGoqHe4WIL/YAP7/slVwA
         rg6jbfKJ2eE5QnLAKY1+Asc332RylIcDx6Z8D/S5p6YpIQfAkYNtQgqbGRRjnWr1rTXU
         dtug==
X-Gm-Message-State: AOJu0YyuV65Ldh1vc4gNydb1U+K5FSBUYVTYPTvwOvqYBrBzb9WswwAW
	1c/Ft//fGcLYLjVDc63xPQdsiDk5UDl7nw+WgdkbZ8shj96+qZIgBhB7B8DmPLXBWTliGYyJj6y
	F+qNs
X-Gm-Gg: AeBDievA2d7uL3lw6jNwfQ6bUAKclVxtEySEWvdToYCM7SSYUC/CUmb9ykcT3tMKZCU
	DyvTD6JNWDWo/erH/Zy8Gu4jTRYorvY0JO6xNfmKjZWEI/YmjgHWcCBrCVfix5xUgBdC9VVKx3Y
	UwCypeBJdxK6W430GRW0zQ4bEBX66YWwZE/9cTzlomQbkhAIfiRjpT8YSg675XT9R4nDEYZAhX6
	r5a2A2idpK3b2RdYgVFjSk3SdQ6CB9enN+ld0DK+cVa9a78S2KCv4I37KgWEss94bvukn/TIeMx
	env3PzGjFKEfCw6olJI3Y79iH8lWtAYrt5k3FmVHBQFbDJdsU1qa4k5rdw4Ca6lLpStmxx+eEsu
	i7E/TN84IVPuDNp19srTKv2Uzbrt9fBKleLI6iWVLR+9fSjND3YSwxoDc6cTJQcNSRkC6wI6GMu
	qYJLgal+2aWsgAzP++AWqccVbjGikLWXWXvT6S
X-Received: by 2002:a05:6000:e08:b0:43d:7b7b:ab77 with SMTP id ffacd0b85a97d-43d7b7badbemr11563639f8f.11.1776256116102;
        Wed, 15 Apr 2026 05:28:36 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5c8fsm5135031f8f.19.2026.04.15.05.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:28:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-soupsieve: Upgrade 2.8.2 -> 2.8.3
Date: Wed, 15 Apr 2026 15:28:30 +0300
Message-ID: <20260415122831.955529-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415122831.955529-1-leon.anavi@konsulko.com>
References: <20260415122831.955529-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 12:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126357

Upgrade to release 2.8.3:

- FIX: Fix inefficient attribute pattern.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_2.8.2.bb => python3-soupsieve_2.8.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.8.2.bb => python3-soupsieve_2.8.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
index 63b5d3b2e7..11a2b5e103 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "78a66b0fdee2ab40b7199dc3e747ee6c6e231899feeaae0b9b98a353afd48fd8"
+SRC_URI[sha256sum] = "3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3


