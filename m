Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1531BC54766
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:04 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.612.1708129016100671561
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+HZLZuR;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so1117671a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129015; x=1708733815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YN039ZwTEx6vOxNE1MuAOBvXNAn94DXL4a4ajxAOeLM=;
        b=h+HZLZuR0oU1BC4fcM+AmTnjREPwn4jOoft0sMIT4TG/TYgN6ZTLuaLGXBEws1T1wS
         2cDPIMpB2FdPE+fHXaxqPITL5H87s4x4lHeTBTWN8NMl3bo6AukpXgNXS1oNNF/A0gc9
         DksF40Fojr8rzveVy5dgX8YSf+1WKSHlSagN8nCs7UEDdBVMahJuw74E/I2rrVwweQhf
         CLtXveK7/+HCP9KxRlAzy96dswpcgUL1TE38vOk0IT4XfE85CMjN1OiAgTZSNaxeL2zl
         1Bf2KF7ISBw43DwMtpLd1irfVweHQhoXvJZf5R6R58eOjR88e978rZyWga7ztNBTpPXi
         JscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129015; x=1708733815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN039ZwTEx6vOxNE1MuAOBvXNAn94DXL4a4ajxAOeLM=;
        b=nSchU8/spTQIbSu0tDU1/TIkVB8BqJNsCjui6rcckGgPK92r0OwaT1Q8pJFk5IZ8LQ
         2Nf0ey89DMqYmCshUI8zjKFdV2awsRL6SA7+TK5ZNn8H1B+X0UwIW6aV+HmlQPk4jK3v
         Sw5wLc8m1nRITUtJDqEzvEMRaCXEvqd7iULeOkiaxeT5E1nrkr+HZGo9HEz0lK6x1N2Z
         6q8qkDP6Dj4qtZna+8gW4eCMpAqUVRZrbevqbXgSPbjYPXL+7eKzmIQXSrxu5Q2EgSAy
         un8m5Z1x6QK9bwlnysAOFymNFJedrvuCpxNgruhwdK2AzYIaaoEfTUYO8O/iUwscUztt
         WDAA==
X-Gm-Message-State: AOJu0Yzp5h31xmqQ7zuxgPKGW4cqHE8bmNtU9AmDlTBuRyagWdPp2hyQ
	rFcjE5l+MEnHyL4Zz+QJSXwh8NB38CgCDNbriDha0mCiX/W+sc2ZmiNSvFG/
X-Google-Smtp-Source: AGHT+IEddnmVzEesttyX3+G8tffVQHnJRJTdkV7pFAFDeMy/Ng0Y0D3LKeIbHxqpnsSJdka2Qs9kOg==
X-Received: by 2002:a05:6a20:c78d:b0:19e:ba42:4ed9 with SMTP id hk13-20020a056a20c78d00b0019eba424ed9mr9562335pzb.1.1708129015345;
        Fri, 16 Feb 2024 16:16:55 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 36/60] python3-yarl: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:27 -0800
Message-Id: <9b120060429e1c7eb706fad98f84716dc2d916a7.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108806

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-yarl/run-ptest  |  2 +-
 .../recipes-devtools/python/python3-yarl_1.9.4.bb   | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-yarl/run-ptest b/meta-python/recipes-devtools/python/python3-yarl/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-yarl/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-yarl/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb b/meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb
index d9fe4c0c4c..29897b7f1c 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.9.4.bb
@@ -12,18 +12,19 @@ PYPI_PACKAGE = "yarl"
 inherit pypi ptest python_setuptools_build_meta
 
 DEPENDS += " \
-    ${PYTHON_PN}-expandvars-native \
-    ${PYTHON_PN}-cython-native \
+    python3-expandvars-native \
+    python3-cython-native \
 "
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-io \
+    python3-multidict \
+    python3-idna \
+    python3-io \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


