Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F55AF4199E
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:28:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17668.1776256116457144519
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mL4wbMf+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd832155so4657151f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1776256114; x=1776860914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZG8LmoA5ashNVHdSmlclCHbKU8xFNzX/qjLROPTxtA=;
        b=mL4wbMf+pJzybTZUAzwhyKEiMbY7w7+abwMgagSivrWaFsuzzQlJY+0kEWEswHA1Ct
         n+QoB2q2XonITF+vsKQFR8t8wTU39bd7MEyrP2mWsNH/ZLPvqLLF3zebgxGrSfeGUAOX
         KmNWE8d6CXbCBuB7yBnLYm6sxlWvySnm8sBYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256114; x=1776860914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZG8LmoA5ashNVHdSmlclCHbKU8xFNzX/qjLROPTxtA=;
        b=Jek1kl2i49ySiQOfPNxrY/mooFYGPs9R+GjAE0Akybf8t5UD1q82bUkoN8L8p2jOh0
         fXQrR02d5Hw0yfRDDLXulTNe8c+6fmcq1zh5F+g7fhiiTivpX2JS+Pg/uGvpyJAk9otL
         dxJd8+guFT9CPS8wVR2Zr6gQh5LbUvZJ9VQyyxZQxT8vkvmVvBMON4Gpg4P6qTMEJ7BT
         xouOx3rRbDmEEXBgw0xrMkIsH0xxNeQNTJpRvh4WMbnddK+QfuAEQFGLYhjUuQRdRFiI
         yGBLrJcEQOgV11XzEK63W34t93M3kr5EFof7ATUHQYH8aiIASX6EpCnrpYmopCz3Md6E
         OG2g==
X-Gm-Message-State: AOJu0YzZFIruwkR2928sx7Uyw4tfmCJujf394ViNgbxOz+gyrP8Sg1ut
	P47hMe2Dn47NjLuh9zUOKUuQfm98ICrxEr/oVzLKo91hWXqetWCr7wg3qAaLR7mHgIhV568jwm0
	/K+iX
X-Gm-Gg: AeBDiev6VHDT/WX2Fq0ckUYlcEJszOlZkt4uv7pUP1dc/1z8vDz0/M2qlgOqhoIQkFR
	6haZBnfX0id4omsBklkVbuMQv2symxplbV/3Zcu1dchO62NBEN5p8v7fVAHgWifZSgwsf2/a6DD
	dTEP9iphAw00ACbR+mwpJqx+PMNGkRYxfCmtbsCEHFRwjOfK5Ba+4HqFFr5Jz2h/rYAGgC/26Lv
	cXbgsjT9t3brvtPn16ngKP3MMS8/yc5YsDoQ8BMLBj5FTWH8vuIRCyBDZtoosUGGY0g4pT3XZDw
	jOzx3qQ6iTIYy/JsZQHg06zvA5WD8DoIFYj/RpXqXtSdJole9c44EX2QejSz3eqJOl0tbifRZyQ
	7952LQrtrjC+smWfOpbb5LEQdWU0lRbkigyrJAIRRjA/w/DGg5w2qq5MfWinhGBOgP3ax+H/DS7
	rXs+nVqXnzAPuQj03kpZ8DDjpicJdUtWhXf6/V
X-Received: by 2002:a05:6000:2c06:b0:43c:f0c0:c571 with SMTP id ffacd0b85a97d-43d642c9401mr30430289f8f.47.1776256114266;
        Wed, 15 Apr 2026 05:28:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5c8fsm5135031f8f.19.2026.04.15.05.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:28:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-uvicorn: Upgrade 0.42.0 -> 0.44.0
Date: Wed, 15 Apr 2026 15:28:28 +0300
Message-ID: <20260415122831.955529-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 12:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126355

Upgrade to release 0.44.0:

- Implement websocket keepalive pings for websockets-sansio

From 0.43.0:

- Emit http.disconnect ASGI receive() event on server shutting down
  for streaming responses
- Use native context parameter for create_task on Python 3.11+
- Drop cast in ASGI types

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-uvicorn_0.42.0.bb => python3-uvicorn_0.44.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uvicorn_0.42.0.bb => python3-uvicorn_0.44.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.42.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.44.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-uvicorn_0.42.0.bb
rename to meta-python/recipes-devtools/python/python3-uvicorn_0.44.0.bb
index f14ba46dc6..ce92c96d8d 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.42.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.44.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "9b1f190ce15a2dd22e7758651d9b6d12df09a13d51ba5bf4fc33c383a48e1775"
+SRC_URI[sha256sum] = "6c942071b68f07e178264b9152f1f16dfac5da85880c4ce06366a96d70d4f31e"
 
 SRC_URI += "file://0001-ptest-disable-failing-tests.patch"
 
-- 
2.47.3


