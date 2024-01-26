Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13456C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 20:10:14 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.3205.1706299806042414372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 12:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7bed9f5d35dso25965739f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 12:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706299804; x=1706904604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH5maoWBrBIY3ZZe3HbEwQN+Soj0Sr2EXdPlndWZTRQ=;
        b=cb8VQ2Y/kmo4SubMCERx+FhLugeLUpGANrMKfFHXlX9okk0+ulu0LIQyzDA/pIMqKl
         F2fTkHrsNvafnZYhy0+IjAtDAveV+8/Rbu9JgYhmhWNC6ndDgURjfTmVlM1k1jb66fRo
         MFLNsTimVrwutJj9cQeLy3yj4WLjN3jZElEdsgKBXv02Un5ylvuiG/P8z95OfPgeEKSG
         L6V7cdnwFHOoMyM5pC/U0xwBffG4ad9olN9bImZYwrU1vwm/a5eJmnNnLdhH/sXoZ8oL
         gzYSj/0RYwCiLtO5UvqOQmQ/kingDh4JWygHndZkPq2uxXakTG2gnrg8yBqwXGXfohc8
         oliA==
X-Gm-Message-State: AOJu0Yxd6COuKAogXnakiuhoTEoZTfDlU1QulIvvPYJI7UGT4l1IjBR8
	lGBU2p1JOZrckMrePBKl0pEU0XHZWtXF4FstbhE9gMlQjGP0Y55mcg/pcb3XeHRuVg==
X-Google-Smtp-Source: AGHT+IENzqOXKHQNRG2Z04kpf+ko1GEtluU36H1xKgDB0xJVhteTABu6uYD4yIsw+/Aavrso0OWZ4A==
X-Received: by 2002:a5e:924b:0:b0:7bf:3569:2e4f with SMTP id z11-20020a5e924b000000b007bf35692e4fmr402242iop.9.1706299804118;
        Fri, 26 Jan 2024 12:10:04 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id m5-20020a6bea05000000b007bf05f618f3sm529401ioc.55.2024.01.26.12.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 12:10:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-bandit: update to version 1.7.7
Date: Fri, 26 Jan 2024 20:09:59 +0000
Message-Id: <20240126200959.1488455-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 20:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108466

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-bandit_1.7.6.bb => python3-bandit_1.7.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.6.bb => python3-bandit_1.7.7.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.7.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.7.bb
index 3cf927e10..2de7fc7ae 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.7.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "72ce7bc9741374d96fb2f1c9a8960829885f1243ffde743de70a19cee353e8f3"
+SRC_URI[sha256sum] = "527906bec6088cb499aae31bc962864b4e77569e9d529ee51df3a93b4b8ab28a"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.34.1


