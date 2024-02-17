Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9CDC48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:14 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.619.1708129033296312250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a8PVd+jK;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e1358dd3a1so1471899b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129032; x=1708733832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8skdxBKhfc4+LxwG5BxuxIjRoWZnhOukAERz75NSwlM=;
        b=a8PVd+jKioijRBkDf9dYuny+I9Ccm+lRkvYsvn75pKedJ+gP5oYTL+Ht6z+asSydJM
         ve6k/kmO9Gauh4XtilmEfBgBhqJlJiLh3EjuTDsZlvByHZ3KBxV5nlub8lzdYo2tJuGw
         pLvK2RqhmgWi5W67UJ40ZCAeW4yPwFBa3hf1gGRH7vIryXrV4djHcd7jLipWHL1+8MfI
         so+JQ14TzVRk3cZ3UXwrHxSxdOfj/FWsBVh1yD4OwzrqZm2o1kQJkRjfnZx+f/gt93o5
         /4A8HWj/oHV5YW+p7B4Q5A+Uj48LH2WzH+VYSJnBwHs6ucxuEfx98N2tQ5C4OeTZk25d
         MnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129032; x=1708733832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8skdxBKhfc4+LxwG5BxuxIjRoWZnhOukAERz75NSwlM=;
        b=dNjsf6Uvc+/yBByufXOTb9qWjq/MNMnfeAZ6BWaUCpP5J4u15FiNZ7aIxlbUMlU8jJ
         3jPSbMjoIcRVr47HJQha0pIbT3pyt4XFcuNsr40R0IL+SxneYefOC64B2mRBVIO0xli7
         Ddo/L1Bg4WE5ac1ud/93zw3TbhyWSyY9TdigWoVffHMrghZUKKNRU5V8cKtc/fqrC/PR
         4kgg+GC1Vp9lpjxSOuRax7SVvDrAzlMAVQv8349ZDJ8hkCfnDNK9VSqGVffS9AM71/MZ
         22O4347UDMBXAVuO0DLcA1CVhitSC3bPCffwtJmHUdJfN0aMFopAhlVcq5io3g/Ju9Fg
         sDqA==
X-Gm-Message-State: AOJu0YxG3Oj91YK6bqNt9LPlFom+kEl+9EgABJCMGav8XN7tzUnov0iF
	awihk+8jxM/N0nXLG1t4EKDLUWdNZG8F8xq3GXOCP2q7bgkNVMPlZjK6QvdG
X-Google-Smtp-Source: AGHT+IG3xk9QcORAWPYjIsQLaaYicVIAjdr4d22odQkKq+sK0uWrqa0aM9GT//F9NX3FzwMYSrNjaQ==
X-Received: by 2002:a05:6a00:4fd1:b0:6e0:41fa:7a15 with SMTP id le17-20020a056a004fd100b006e041fa7a15mr8038448pfb.22.1708129032563;
        Fri, 16 Feb 2024 16:17:12 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 48/60] python3-appdirs: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:39 -0800
Message-Id: <6ac17ac76b343c634a936a868b68e78afab53135.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108818

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-appdirs/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-appdirs/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
index 95d1ac05ac..ad07b3b082 100644
--- a/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.4.bb
@@ -12,7 +12,8 @@ SRC_URI[sha256sum] = "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27
 inherit pypi setuptools3 ptest
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


