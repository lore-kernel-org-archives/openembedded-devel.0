Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F97C48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:14 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.608.1708129030549837166
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHTvfiJY;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6da202aa138so1920095b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129030; x=1708733830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY4V8pKH5fCYDfU4xBwo3rYZPuvceDDHVVEKFd3rz7Q=;
        b=OHTvfiJYjB46AOsxKcrsqYSCvdzYAx6IODRwDL7tzCkVGMlRWSaA75+eSuGxBzUmns
         3KAMR9VH24c0S4WIHmxpfD1Rhny8THtxmUS29c7OM/QelLQJuGgOqJ8R9F+Pwq/nSGvQ
         9bgh90bQdJIN6uyvd2HhlkEKTVVUapols20i0SGXXX941FlgFtU5XbKOBDj5wRxj8SL/
         f1BxDGIsz4Dx8BFpSd0aJuYJYvdt8oBCC49fo2ezmo2TM/RI+EDktoFjj5IHqtyYH9Z7
         eGfMYU15AqqDk+CpSbm8pdpsabKZgcVU9v3sw54XEVKvPoDGOzlfCII0tRqERony+/d3
         4brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129030; x=1708733830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY4V8pKH5fCYDfU4xBwo3rYZPuvceDDHVVEKFd3rz7Q=;
        b=rpZxVeeD7Ge05NFknm1ZsDMPISiVqnIasmd8lGRTB8kLhqN8ip0mB7jpC0HV40VbPH
         gWLgnNDfwWBazjUByVRF2k0S6HRrVzE7qjdrOCx05TgPWVjBm2bHxwQeh+7yXCUReYua
         ffB0Uk0hD4Azx+Dx/6fuJ3qRxuIKXKkf3n4pd26AujGc6VPYCp4Tof9WybrAAgjH1arJ
         cXZx4sB7OD5REV07b2vX6JcOLPqvyrLC8fZJ+EOPNV0VI9ctwoyFNoJLoC2X65hezGz2
         XK5kPRKE7Y8iW13TdXJz+e6D8a5eVsCT9s7GeibOhBzUaw44ArNtRAJE/3/+um1syZlr
         DsMA==
X-Gm-Message-State: AOJu0YwUTBlM/X+6+JVUGMnBvwM8GunulZRniqoNRnyiaR2hjZaCnJHD
	Awh36iN90fuAYFUkd2sl+asazlYLtknrnDucS+zBLVrsohtrqFeHVR+qgI89
X-Google-Smtp-Source: AGHT+IGgdPxSSyKwve7JnOl3q1eAfKud/r3SUfo/PCCOs357PNralHDnC0qcoXYreGwxil1CQLmzyg==
X-Received: by 2002:aa7:81d1:0:b0:6e1:4a02:6217 with SMTP id c17-20020aa781d1000000b006e14a026217mr1851175pfn.22.1708129029787;
        Fri, 16 Feb 2024 16:17:09 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 46/60] python3-cachetools: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:37 -0800
Message-Id: <0784edb157890f2c4b99a84fcd9a1c1b2ef29661.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108816

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-cachetools/run-ptest     | 2 +-
 .../recipes-devtools/python/python3-cachetools_5.3.2.bb      | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools/run-ptest b/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-cachetools/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb
index 5946c267aa..22060ef049 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.3.2.bb
@@ -15,11 +15,12 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-math \
+	python3-math \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


