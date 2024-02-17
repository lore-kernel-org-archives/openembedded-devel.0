Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CB9C48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:33 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.579.1708128984655921995
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1ECEHYw;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cedfc32250so2078635a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128984; x=1708733784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7d09qwsenzHa1KXceE99asXmILkJn7EnvJZWChRc24=;
        b=Z1ECEHYwHazkv0SwLGI5avYJaLCE683ZjfQwWlQFzZVHKxXDZrfayFfEBUkC8Mp9rq
         4nr3LIWJQz4S8svABLBhxxTwecZJLs9dtUGK7Ze37qDzsH95BT0nL0nArOTa9W7I0Gqe
         SnmBb9qAVkgjF86KDOzD/X2p+5LlFYoDSVL+wwgUfDNNTcUGehDbDvtTTo31Vm53Fxi9
         35kbrc1ix+4Td2IjcqzdoT1d+LBUIH5f2f7WcXkCXRj7Ug3aY7573eo4fb7UOhU6+751
         4yexvwMUmmrKgMqPsfsaLXJEXDAEOiJfXlZ4d23Esap44pycpwHjAgv3rkUShxP2OYKn
         EWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128984; x=1708733784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7d09qwsenzHa1KXceE99asXmILkJn7EnvJZWChRc24=;
        b=tiigqMrefGrbPTfhyTfa3LATD6esfQg0A8viWMsn1Qad10g09joWyr3Oqh8DLv/Ali
         egNa5PauuztpGShkxCoOVmOY+MtOu+d+ejlAy+xknln4vJbWpZ/vGxdWuU8YCrOfVjrY
         xpecJsCcMlVfIzEb8rjApiMRO0W5b2ceTfY7pZUTl8l5jguElTY87FDdVqOZpS/GnzOb
         eiL8O+STNQdPCeYHMay2RbzyHmDK4G7lX8TfiTrDD8dqhK5w9WfVQ4P+aJWHCLpuHqhi
         HafweJg49ldScjnBMQFn9MpEhWZ6JlweXPaWOaq9bB4wsv2+Pa4F5aqqir/b4WakvpXP
         JeCQ==
X-Gm-Message-State: AOJu0Ywznx+kh0rXWXVqyAJ+WaushH/IVE4cPIJxWzWRovAqfYe50GJ5
	gLpHI/QVurnHZbvVwb5/3B/TjcJ8yqwU5kwUpeEFPTa876TOBmCgIJaBfpIY
X-Google-Smtp-Source: AGHT+IGReg1ZX0FymPzG6chkLgpisGq0sF+IQKWl9CNzFPjXj2uDxUbeDAtRCvNKMnle7UPc4T0Vfw==
X-Received: by 2002:a05:6a21:1507:b0:19e:b15c:c8d0 with SMTP id nq7-20020a056a21150700b0019eb15cc8d0mr6984588pzb.18.1708128983770;
        Fri, 16 Feb 2024 16:16:23 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 15/60] python3-asgiref: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:06 -0800
Message-Id: <183b5b931de8e8a484593568395d1238b661b5e8.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108785

* Also replace ${PYTHON_PN} with python3
* Sort RDEPENDS for ptest alphabetically

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-asgiref/run-ptest    | 2 +-
 .../recipes-devtools/python/python3-asgiref_3.7.2.bb     | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref/run-ptest b/meta-python/recipes-devtools/python/python3-asgiref/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-asgiref/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb
index c9081c8cbb..b7fa9f0360 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb
@@ -15,10 +15,11 @@ export HOST_SYS
 inherit pypi ptest setuptools3
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-asyncio \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-multiprocessing \
+    python3-asyncio \
+    python3-io \
+    python3-multiprocessing \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


