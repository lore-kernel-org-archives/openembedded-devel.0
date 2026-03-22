Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B64FC72C2
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:52:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28536.1774176722156918090
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TOOTqaiO;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b06d33e84cso21119275ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774176721; x=1774781521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlEB7G7AoUoV0ppBPEFsyJ5EB0vOLSdXQxpy1I1Tlxs=;
        b=TOOTqaiOXj/wdyUTFvWo8wOkksRkiy91nS1Qdh3wNYUaXRACNwSsAUoRs8K+tLTGbb
         KdUD9SyYrOp7BB0mufE3cG9Fob6uNqc3uBlBKq0Z3482kdDQ7/lhmCFMe5QA1+aGPNMC
         yRulNM3AzB97bjizDAufdlZAcrZFYlH3upuuPEkbJIOh/esCmmd0JUpz8dHxg6Kclwvu
         bciihhra/1WLc78DTj+v26bBPT3dOfHSorYpoPwuT7qeKzL26rZ2DzlvthGidrFLvFJ7
         ItjlE/i/zfWrk7n0G1uBWOa9cDkrYdctQNl0q4uWax71rNH07wKqqmeMnUlTUSm7vCkk
         W/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774176721; x=1774781521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VlEB7G7AoUoV0ppBPEFsyJ5EB0vOLSdXQxpy1I1Tlxs=;
        b=HZT9kJ5f1azcLlsLeQ0kgpAOgrP9DXYkUzxUO3hlAR1BlaiVTz8UulqCO16EaOWQJI
         tGQoPKjNOQC41Rfec37C3psxk4OIE/fNm4fnhTMaUADwMQk8uyNbYoTyLdOmErpGyy/t
         fxhobXOmdkoF2Qh98gMsxONGYUx33TkZwZ8TWnYlu6BFakWqTfL2F2BZjmwEVnEcj2Kw
         6KyitYkQGpvTN8t5WWym0fIVM0dyFFZyaFCxvHa9kzmP1h/qRf8cOS491z3ZSWvFLE8+
         9vRKVH9205cDmt0myXdchcESF12/j3MmqQlG3P8TAO40wIup/kobFqE2Mos28zfG15wo
         toew==
X-Gm-Message-State: AOJu0Yyai2ZtwGb7kN9UHsccyCFYa6hR70cNEYUybai5CmW9glqcJD5B
	8MjgJfVv6Mz84KWxTw5HxaGnUflZeQl7ff4uyH6q9a2a6DwOyAeKJ1NzG9Dw4sCW
X-Gm-Gg: ATEYQzz3vteAf8KI87UiJvFE6wTx/TJqOXpIM42OkbSAiWl4xL2T/lpbM8Mfh7k0YiK
	GhqKsrCxymLih2bgoy6pi+3F4wb2Pz8vGrKe5jclHI6FYsVx1irZHPafVrFpJMsHCEqhf7nMxeU
	s9pwdXFUSBWSh8dO1maek3DzNMamodQPGD4QTmleAdtureY4Zm48oHB20NACMfrZ43v+Lh0Ky3x
	EMhEW84h+RS/OOG9ta9bB7uqPvVcTbpNsLB6+VEC3uRUC8Hb1fPZ4Mt5K9M7AgonHxwlandqd7H
	IxrxmF/6fsCVVl0ODv1I1s7QHWnk6O88daMLbzSSMcjtbAGqEH+dd2/2g2EHM0WvQZorbwNOVGu
	B2BILOykcSxuDVIz92OsgUXPudz7KJ2NjdsajFP2991EXMvBGd1Z5Xsd3oovekhhaH1PsIlBeKH
	G8S+8iN3LV13zmaUeOk/XzGOw0cK8SJUwxlG0=
X-Received: by 2002:a17:902:e78d:b0:2ae:fc60:2651 with SMTP id d9443c01a7336-2b08278515fmr79716615ad.35.1774176721357;
        Sun, 22 Mar 2026 03:52:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836744a5sm75613895ad.63.2026.03.22.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 03:52:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 4/4] python3-gpiod: update to v2.4.1
Date: Sun, 22 Mar 2026 23:51:25 +1300
Message-ID: <20260322105125.528264-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322105125.528264-1-ankur.tyagi85@gmail.com>
References: <20260322105125.528264-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125482

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bug-fix release addressing a memory leak and a couple minor issues.

We now ship the license file with the dist tarball so update the recipe
to take this into account. While at it: trim the LICENSE value to only
include LGPL-v2.1-or-later as the other two licenses cover tests and
text files.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f75f4164fd7184ed47e119c782cea583b96fbb45)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb}    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
index 405951fe0c..61a3fb929e 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
@@ -1,13 +1,11 @@
 SUMMARY = "Python bindings for libgpiod."
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
-# The actual license files live in the upstream libgpiod from which the pypi
-# package is spun out.
-LIC_FILES_CHKSUM = "file://pyproject.toml;beginline=13;endline=13;md5=0fbc720d3e48432ee239eedb6adb0f07"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1"
+SRC_URI[sha256sum] = "d29a1e8b2a065f7ed82f00a96009bc1486fc705bb2ad25820a8ae962ec6d7688"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 

