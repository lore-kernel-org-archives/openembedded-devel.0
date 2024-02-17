Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3C7C48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.611.1708129035445234908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uphq1kSh;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e104a8e3f7so2192470b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129035; x=1708733835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKXG8Aw3++uLLQ+8bEthuVenQegAWHnkMNzZCdg3a0I=;
        b=Uphq1kShVUf8jxi1cxpYpg8FLo2ozF+deHJGugbNAcm1sR8Z32fDo7LZ7GOMAKe5vk
         5eOGgZUNE3Rly2C/q1Id2BFOg+fisXSnV/zRwMPoBu39zWtYgBA/NDTY3/bEmlBfJPnr
         u+PcLWJfscufoajL1fJtgHW7eXvjX118MPQdC1MVly0p4BfrPZynHKy01U/QQOXDhP0p
         K9Wsapqc1w4rxroljqB32HVUqTR2fwk3FrPSgABcg2lEBWOpLwqHDzluAeSl1gF/sJZX
         UX4YzZZLxkcaKRwx5X8d6F3QXFx36qqV6wjHWEYNu2iwqhHy8S+laCtA/oIHgQNqFiXH
         sG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129035; x=1708733835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKXG8Aw3++uLLQ+8bEthuVenQegAWHnkMNzZCdg3a0I=;
        b=t2L6CE+hWqFYcORmb6Jh7j7KYD//4MzhBDTJ2oPgo3aOBJ6gfhIUzBfK6HJtIsQ3Ij
         57XrHirptIi494KAtzCpnJSCkSLwZ0sBiACUFFgq3HpprXAepYvIB8r1q9Hi0xSoll4I
         V+rrOK0TuRlAsmKn09wzNTSiH+OUFOagxy27+OsQ9K8qUJVEXcNgoJydLhq//l1IsfHm
         90flX5lDikO5gjAxWbvzCRffakek3jtFKguMgUTRo3uShdCGGfGLbFcRuGue544m/J0P
         EBd4f9IgyMmUTBeiNMWQSVeS2nrkAuPiIj1AWLBlA5v6kgWYt7cozlc5oCQht15hSuZj
         JLOg==
X-Gm-Message-State: AOJu0YwBBNtwi58yMpRNcIjEziM0Ub9M611V9NoRgRRT57xL9o/68kvA
	/COSbRdANekS1IBkQdPrVV+u6Aq4YZOFKFpxnh5AytdnM0zB3hKfqaAEQ1z+
X-Google-Smtp-Source: AGHT+IFYvjK7pw9Ocmaslof2h9VSdxA2D0KnhA7qSiYB7lJ2s9NOavfR3qLrUGwdsPRTcnivZZ64IQ==
X-Received: by 2002:a05:6a00:2d03:b0:6e0:e235:e2ca with SMTP id fa3-20020a056a002d0300b006e0e235e2camr7443742pfb.9.1708129034413;
        Fri, 16 Feb 2024 16:17:14 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:14 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 49/60] python3-pillow: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:40 -0800
Message-Id: <84b33710f30c3f853442971d891d0963774214c7.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108819

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pillow/run-ptest           |  2 +-
 .../python/python3-pillow_10.1.0.bb           | 21 ++++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/run-ptest b/meta-python/recipes-devtools/python/python3-pillow/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pillow/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
index 1cc833e1ba..91b02ea017 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
@@ -27,9 +27,9 @@ DEPENDS += " \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-misc \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-numbers \
+    python3-misc \
+    python3-logging \
+    python3-numbers \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcb', '', d)} \
 "
 
@@ -38,13 +38,14 @@ RDEPENDS:${PN}-ptest += " \
     ghostscript \
     jpeg-tools \
     libwebp \
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-image \
-    ${PYTHON_PN}-mmap \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytest-timeout \
-    ${PYTHON_PN}-resource \
-    ${PYTHON_PN}-unixadmin\
+    python3-core \
+    python3-image \
+    python3-mmap \
+    python3-pytest \
+    python3-pytest-timeout \
+    python3-resource \
+    python3-unittest-automake-output \
+    python3-unixadmin\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'tk', '', d)} \
 "
 
-- 
2.34.1


