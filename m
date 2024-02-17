Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66642C48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:34 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.634.1708129048659901561
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dU58BwDl;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e0fc87fc2dso1691208b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129048; x=1708733848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyD72Q8ayNSD6xJ+RyBt0AQ/3raqnWF1XdA5Uk1RxHk=;
        b=dU58BwDlGf0Or+l8f/jM2YheRl1d/Nyigs6bKXbZknldmgXFlxrUR9DSsMqqjHcybT
         suTy4R+PMNoNPMQinpJjfyqI9ZRbNBElsbTDOygok+sGhinzm3qDYhRE3YKorryiWof8
         VSLcglVFusNi2KhhnvPFSLI3Wx8YQfsNiMpESuW0a3AIvXEc/qdyVO8Gio3duezHC8AB
         qDf6IZ/Fn+SH5YL54t2AIWy4oLgqyMk6T/KZxTSafy6jVdxUSVzrtixRXJ8WP8HCo6Gb
         Whsk/LFEy51cWTIvmMWdTqMAA+nYuHxCIwUkHnQprSiC7wcoZ/d1HQ5zsvJAjM1kFZAq
         StMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129048; x=1708733848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyD72Q8ayNSD6xJ+RyBt0AQ/3raqnWF1XdA5Uk1RxHk=;
        b=T4k99tAeBQ6xr+g/KqrLYjLe8DzmF8wsKr6OcG4+zf+u9dkPfIXXqKQ0VGO2LxLj2t
         A4wVQxfknz6MzLWVqy41zhB2z487UgPlJ8ongcRyHDrAP+EZSwLVsHnr5WQWbwRu+ZpP
         YLoMbZeobGJow0ZK16lrLkIfXwRdo3BlZoRpEXOsxiYjMlVcfrJHaSbRjXc40XbvdZ/1
         txJlGxzo03wlnnuHb1f0HY7XlKHoTFFKwtdsQEGZNA5DehvJcdRNabdtRjmKAuNyxwLj
         E7YN9O79QyW5AFAB8YYIONjqX+8+wmY6nZWF2w5mwZSXl9j/uNkkmqKXnGUAbKdYjdau
         xsjA==
X-Gm-Message-State: AOJu0Yz22nr8JKpQtyCdIl8BxOJ1ekgGnDD8ae4XrVL1DZ80vER3wHRR
	WLvN5dB9J2/UzzA9fISHPd2e2UPm638ObvY3NolChv8QKBhcD0h5tkBpvg/a
X-Google-Smtp-Source: AGHT+IGYbia2/z7wcAeO2x5IcnNU4ZysmilOjmAhlY9yBrh6+QOMKdHMACun0k4VNCYTbvcp78J0Bg==
X-Received: by 2002:a62:e10d:0:b0:6e2:9ff2:19b1 with SMTP id q13-20020a62e10d000000b006e29ff219b1mr471608pfh.13.1708129047889;
        Fri, 16 Feb 2024 16:17:27 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:27 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 59/60] python3-xxhash: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:50 -0800
Message-Id: <558e9c55f5534f1cd79bfb75954dea87eb4c7e85.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108829

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-xxhash/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash/run-ptest b/meta-python/recipes-devtools/python/python3-xxhash/run-ptest
index e398fa8ca0..72c918c1a1 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-xxhash/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest tests/test.py -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake tests/test.py
diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb
index 4050d12eb9..be9ce005ea 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb
@@ -14,7 +14,8 @@ SRC_URI += " \
 inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


