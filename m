Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCCEC5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:33 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.593.1708128991766483355
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ju7QvJ3f;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6da202aa138so1919863b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128991; x=1708733791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPr/IdN6d/tlZgNnB1qM7kAwl70qoyS+7CZg8G8rbZ4=;
        b=Ju7QvJ3fKXj0dgpCIq4PD8XvqQePLAFH9yhbPuqpypJQ9Ez/jIbJIas4B0zrpc9Jyx
         mJBGLDXVEoudYboPgcQbNCz3p4Mqn7pJ56bBJuB9oqtwQbtFeKJJsnqnuKgUjHtsw2ST
         Jt+kOfn2ttJu5pmkEi25KFzr+/DdxzGNYP+nccwV1ZZozYGxdEEZfthJZ87dJ/yFYIAH
         Fq+hmbBvmVCJvzmiswrUk5zNq7rOkNLZ/SO6T5nmIugISdwfAtRi4+rs9O+0sKK/nH4N
         Ou6w8xICsMoUwC/8+Ys2zo35vSR1nTb4EDfgY/Tle+hG/Cves1CwQdQlfw52/LDY4en3
         3Nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128991; x=1708733791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPr/IdN6d/tlZgNnB1qM7kAwl70qoyS+7CZg8G8rbZ4=;
        b=VEqxpIaZ5+plf3lZHZMA/rgKWf4Qj20g8eHl/uT3KyIWSdVwvAHYazD4YcbuTNf8KG
         pZq3AWIydPSQdjPAzEIHJZTKi8ayr62GwRfFsyaBuURUj9xEJ78dRBHQeIbcLDLyuEhA
         1QcxuSa5suDXXkzUWa7vQX24mSrbcWI9BlBpkHtYZ2ADAi6jr29K253JlR35BO18d1eh
         PMjkTamSroW2/tR7OOckC7/AT2xOOd7dezE+AdbyDVOADgqqIRGPuNVFKPJTLECV8j5a
         UK964jSY3mG2RwDF29K3cvIhhAKz8pjYag3WNvIotVp9eFf0N3FE9rTuJyfAZciPq/3U
         5GPw==
X-Gm-Message-State: AOJu0YyDvCcQOFwh8XjRQE4B87JnZ6bf8E3kgZgoV0wtSMpZxAdfO3JR
	koA8tE4MgSOjAPk1BQ7aSq79qaCV8k8viCoNVX5Ff1QXFrqGKIJdyafbhcmF
X-Google-Smtp-Source: AGHT+IFdNUvEvPSj9DgsEWDrgw7TorgM/wfhYh94Ej4P25x1Uk7bdxLIecBSqI4rFSdekEZW4K/FpA==
X-Received: by 2002:a05:6a00:2d20:b0:6e1:4854:a971 with SMTP id fa32-20020a056a002d2000b006e14854a971mr1978623pfb.29.1708128991018;
        Fri, 16 Feb 2024 16:16:31 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:30 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 20/60] python3-backports-functools-lru-cache: drop folder
Date: Fri, 16 Feb 2024 16:15:11 -0800
Message-Id: <ad11e168230eecd04196c2b16e2b192037825a7e.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108790

This old run-ptest file was skipped when the recipe was dropped in:
620689d4ef python3-backports-functional-lru-cache: remove, not needed for Python 3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-backports-functools-lru-cache/run-ptest     | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.34.1


