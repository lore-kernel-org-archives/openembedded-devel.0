Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00F3C54764
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:03 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.614.1708129021827421349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zlg+cNfQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5ce942efda5so1055254a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129021; x=1708733821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GC7OW+DQiibHt1uKFjfciKNNNFAzHZtg39IZ5yd9gE=;
        b=Zlg+cNfQeb20ts1VxA45CkdONdsZ14bsc0TgGPC0EDW3pRN2HHxgMSVHcrSaBfgwTF
         uPuUpPDk8BTE16+AO8jDNvQ88/Vi9eHjTFoG1wAjtuStLpEI9xSPAB8jUeMAQWS8+qG+
         eYkl0gq5QXiyg5fgJQfG9glvY6sNhL1OAmnuFEzINeFd/Rwu1pB75am1RFyD202yzEOL
         La58og9VZL7IGS031q3FejlX1pB5mzVYMuFPtr2s2lgGHjYIMlY2iE4gWZ0m5zPxKPBd
         Vzvx1/5f7al8sSE7zUzCHLpIr0WcV2vAIBOqzfgMZQNKPbf408QK33eTdVGBaBBbGpwL
         I5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129021; x=1708733821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GC7OW+DQiibHt1uKFjfciKNNNFAzHZtg39IZ5yd9gE=;
        b=Eu8VYhi6vJz8dbhO3O4rCFAq6oaq4IDxnkPD+RXUzBioENZolJbeJYYeOWMlsYTe5X
         x1ty/pzlgXIa/7Tmsq0yBnT/qZrjHC7tN57PLknnqbDAZZgZGQtQ2wH2/J1KJfi+tWva
         tkkjGbKJ8sLFndequ8WGg4nVFB1YQlBXyfxN+Niy9bGo/lkIeABUK4J3DUcbL9bV07Jl
         navr7iyMQChWGoNZrGL3Lr+AF81HPz4ZY+8O9ahgkqx4oUbeAdXUN6r14Q3hAsF4xtnM
         TqflwjGWxSkGUhRd5I5Ntd7+4Qu9lpccFsGpE14KJyPcBPYhKA0SwxFHTZLd4VBsZf4E
         9tuQ==
X-Gm-Message-State: AOJu0YxPfzQcIN9ugV1MXiCfMsTaWy0jFMv4nmEbSEvMWtdYR5oS2ikL
	O1yTuE2Luk0DkCAj6gLKxtX4ZsRIXSvK9LwIWyyfqTa64MZJUDiZ2kqK3CYh
X-Google-Smtp-Source: AGHT+IF64yV/2fpWbeoYYMieEtIQluD4qFc/HhsXvmhxC+o7R+8mUTbFRWTJRyVBVmWNc4jHHMIPUA==
X-Received: by 2002:a05:6a20:4c96:b0:19e:9a75:7834 with SMTP id fq22-20020a056a204c9600b0019e9a757834mr5504576pzb.33.1708129021110;
        Fri, 16 Feb 2024 16:17:01 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:00 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 40/60] python3-sqlparse: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:31 -0800
Message-Id: <0e3b117a3bd2ce684cc351d65cc230067d2a7662.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108810

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-sqlparse/run-ptest       | 2 +-
 .../recipes-devtools/python/python3-sqlparse_0.4.4.bb        | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest b/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
index e4ac403eb5..c04971ee8f 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
@@ -16,8 +16,9 @@ export HOST_SYS
 inherit pypi ptest python_flit_core
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-unixadmin \
+    python3-pytest \
+    python3-unittest-automake-output \
+    python3-unixadmin \
 "
 
 do_install_ptest() {
-- 
2.34.1


