Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3C2D743FD
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 02:08:39 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1559.1732154914149369122
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 18:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UtLslFY8;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e5130832aso365376b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 18:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154913; x=1732759713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hoiOeyk4Fx7OYm3gGBV5JTtXlaPKPqGxWTnrkhf3BAA=;
        b=UtLslFY8N/WsBo8nTU3kw2mSL1NIYDH4/UMbA7gP+UibYdobNk8+KYF1jCcrAgMhXQ
         IzSnGnkDHQGp7lj/H+Si6Kcwz5Kc7ofR8DZT8YwwxfOWDSpMPnmlJK6iU6SuEqbkNrUz
         FB3NB8nCAskIWRnnD2BBAPKxDnqzgxzcQvH6L1t9mbimj6FEg2Qo83KHGSl+m4t5H50h
         m+acuM0f/AkSM7XGPJlZmuvTEWiWw5rq+7cYk/bFv6fSLGPLNwEEn9MGj5XFWoK6VOmf
         R9qPR97rgLeSNK2w90IFK5KWqXSqwFEk+MQMce7AqInILS9I9uncabcgCqgKQgRW6bdk
         3AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154913; x=1732759713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoiOeyk4Fx7OYm3gGBV5JTtXlaPKPqGxWTnrkhf3BAA=;
        b=fcv3oiasOKRMJchHssBVQvecVRy9+P7anuw1zPRfsDU0saAPS6mjfI6w0GoV762GOk
         hQwnvjQLkK2S3WVhm9/EMyS2nnzAgDrjOpKS4Mqox6vkPq5ozbDLNXEt0+lZPuhoa69y
         NHB/TaF/f4KhsK6Y0FOuZcbiNXSMqlGVHveD6ebe6M2oq6pDp6iEiVmmt/KhbtbKhNfP
         HLh2toPRvhnrMy+R7vA3uhxkFhs7a8Ho26ppUv37Done6631kce8UDVO8/H98z7nAv4M
         i2CGNcm9cW9hpWBGuAo7oqNWtHSnqqzxj6ir0HLHYgMj1t+ZIQ9TrI8DBd9l0VAvKFT+
         AKSQ==
X-Gm-Message-State: AOJu0YxjVPKTDb/UmHhYvFv9pJgr3njyPxMGJaL4QCusIX4FXJ52YzAJ
	Z9UapN7F2mbPARFWVqWa2uG1w76QoAq/ql3F5ta1vdS/0WhZbKAAU+lB7w==
X-Google-Smtp-Source: AGHT+IEkqWl7WX7O+jSrV5jHYGQ0ADYzM73nsWnoQnGOdYyIDA6svIuVNveiZniS8zzm01pwAEmVCg==
X-Received: by 2002:a05:6a00:4608:b0:70d:2a88:a483 with SMTP id d2e1a72fcca58-724be97ac99mr6420571b3a.0.1732154913326;
        Wed, 20 Nov 2024 18:08:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beef75e1sm2397550b3a.41.2024.11.20.18.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:08:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/5] python3-blinker: Upgrade to 1.9.0
Date: Wed, 20 Nov 2024 18:08:27 -0800
Message-ID: <20241121020831.884684-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 02:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113945

Changes are here
https://blinker.readthedocs.io/en/stable/#version-1-9-0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-blinker_1.7.0.bb => python3-blinker_1.9.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-blinker_1.7.0.bb => python3-blinker_1.9.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb b/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
index 8f2cf4883d..33263ce6b3 100644
--- a/meta-python/recipes-devtools/python/python3-blinker_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-blinker_1.9.0.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Fast, simple object-to-object and broadcast signaling."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=42cd19c88fc13d1307a4efd64ee90e4e"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=42cd19c88fc13d1307a4efd64ee90e4e"
 
-SRC_URI[sha256sum] = "e6820ff6fa4e4d1d8e2747c2283749c3f547e4fee112b98555cdcdae32996182"
+SRC_URI[sha256sum] = "b4ce2265a7abece45e7cc896e98dbebe6cead56bcf805a3d23136d145f5445bf"
 
 inherit pypi python_setuptools_build_meta ptest
 

