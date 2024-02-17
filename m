Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC1DC48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:43 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.589.1708128993631719812
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HcMGhJJZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6da9c834646so2386766b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128993; x=1708733793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0Y5sbSiLs0A4prCaBV7bGmW0QLipM33MOyTwzhqPNI=;
        b=HcMGhJJZMmFIoWZ8/vHKt5h3/bwKBkXh3X6S4ohkO0wqZ/XyXZJw9WzYYEvGDc24o0
         agZ1WuO/upfIMuZV5s2C/LwSNx0p7WeEhg55Cdhgua9P9lv0PptNflR1WSJzGL+0oi+W
         eWhK+pIWWfWrA+EFBnH5713X/K0QW0shJ5oLuyIU6fQqlD+LhNLfiFjCclCzUeX5hMTF
         xoq12Fynh2BISybgjSIKdpK+GUQhyUjOVHUSr8NJnvkb9RjdlvXvAz5vs2QdBwGobLCo
         q9gDcQjAa3/hA9Lu1nHdeJGiGEO2/Zan/hdN4zhQfmI3bJK+t73fDgmhrW25GgIgvQLc
         jN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128993; x=1708733793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0Y5sbSiLs0A4prCaBV7bGmW0QLipM33MOyTwzhqPNI=;
        b=OH0XYGjfNCxktKIJMuVxz4Ap6FzuHkFU749WnPODRBCtmYopGo0XpvUeBWCOEiyXIA
         WOnZeU97da+FvG50oU/HWaDrdIAsyEzHvNpjUaTU/a64R3vnFUZekxnqrFDCxyJ4HYWy
         OOtaea5nrui9jSahQryOSq+qJ1qh9IRkV29yfa757QpuWxNeqAueuqYdLd2RxlCrf+0e
         BlEPUy4B5VC4xF9TZG1CsevmH9X5rgA1IFGx4cApf/gVViYIA/BPfSKe4VTB2fNqQ7ch
         szAfoH0kSmHT1AaYa8j8fWj3REb/T2ETRLTeXjpKsVt8C/kji4lvMo1Swj5FcU5lCtgc
         OBjA==
X-Gm-Message-State: AOJu0Yz3wne0oJZ6XU23f7GTWdVWKlZdjDlhWs74q4Hsd8NmlHoxAh46
	npya2XafzRFzHnHuzjCMvAP62v37NzG61FtIyE8Jyam0UOVWNSKYirrQhOo7
X-Google-Smtp-Source: AGHT+IFOcmFfCTWJqhJ7FRaVLQLhJJNexfU5YrAwFMym54YN41fwR+dHzAYfDhXR4b3NsTKH9L7Fwg==
X-Received: by 2002:a62:ce85:0:b0:6de:3b41:2845 with SMTP id y127-20020a62ce85000000b006de3b412845mr6317915pfg.32.1708128992780;
        Fri, 16 Feb 2024 16:16:32 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 21/60] python3-whoosh: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:12 -0800
Message-Id: <4fa3f03f217763b1be77e0dc696cf95b1886083e.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108791

* Also replace ${PYTHON_PN} with python3
* Sort RDEPENDS for ptest alphabetically

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-whoosh/run-ptest           |  2 +-
 .../python/python3-whoosh_2.7.4.bb            | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-whoosh/run-ptest b/meta-python/recipes-devtools/python/python3-whoosh/run-ptest
index 3385d68939..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-whoosh/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index ed2a6d423f..38d3e1cecd 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -16,13 +16,13 @@ PYPI_PACKAGE_EXT = "zip"
 inherit ptest pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-multiprocessing \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
+    python3-email \
+    python3-multiprocessing \
+    python3-netclient \
+    python3-numbers \
+    python3-pickle \
+    python3-shell \
+    python3-stringold \
 "
 
 SRC_URI += " \
@@ -30,8 +30,9 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-fcntl \
+    python3-fcntl \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


