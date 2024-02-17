Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8292C48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:12 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.572.1708128964007869637
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZmxi4ov;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-595d24ad466so1347682eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128963; x=1708733763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOqOewBcUjmcyJxdSAswK9zPJ8L3khpnTbpdvWTnung=;
        b=XZmxi4ovJxNNTuZf78xXrrubc7/5w2LRbdQYbeHy6YpeDXUn77lvRBF87OXFsB+RYF
         2b/+0scg/5C/eHqgeLNvOuCtEXyu54E6sIYqBWbaPOjpQTGQFm68zxcpebyGlKPZ9JGJ
         DAKste4ZwlG2kZoQz8c0Fxq+devPbmIBe/3JBYH0XRohBXidTHRDvQgVz5HHKOdQSAEX
         XbQF+IkK5CzlCuQQMiSQPxIVCQL3KcJekUsJs47HgFLY3GDk0LtWi1PBUDh58Ywlg+CP
         ivvYto6VtgNg7fyg9Mq9B4sRIzGF7Ml0d7xjiqe1gG3GldNjOWeKB6udL0ueZ6fpxbqg
         mP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128963; x=1708733763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOqOewBcUjmcyJxdSAswK9zPJ8L3khpnTbpdvWTnung=;
        b=lXb47FJ0X/9IdJDkrhUMxrhOGMNat2euZKMaj6VlQBR0D7CN2ai9kIkObwmNUMvCtF
         9sSA1asPdeT+1GTP2Z4l5IefVxIwlenCE4X/WI1jYiZqTQ1cOFEyi03wfTF0HxiqA/gN
         BmprzAEzVj8CXrvmwuEu0PHlGoUyUQkvY7pff/SRs1WI2RpjQ9a6IW8rf7i7xEghtT5S
         ZH8dxROvl1JhQPlvqM+Un5fzq3vnZaCfQIk8EYadD4i77c+U2PxOtLkkWaExge496tOS
         RGkagJKoq5rL6awQc6QSpYXzFN10k1yK7QQlkXIbYTNbwIp3jyKl3VUe/OiudkZte/C7
         J5wQ==
X-Gm-Message-State: AOJu0YxUTlwS+3LOK2L+5NnIDpvfd6ZzCFhEIL8oNZQLYnWJq+S1Krqb
	AJFJGUm7VesvvoTyzRDZkwPXNfMzBLRNW2ppbKoBjol8k+F5FHj5kYAgXXcJ
X-Google-Smtp-Source: AGHT+IGaftTcg8W7r2w6CKFuj/7L6iuZvoha2+OYVZrngA+OE0ex/7nCZRbOQjrRWfxZI5V/Cx2zcw==
X-Received: by 2002:a05:6358:d59e:b0:178:20ea:abb5 with SMTP id ms30-20020a056358d59e00b0017820eaabb5mr7062490rwb.26.1708128963078;
        Fri, 16 Feb 2024 16:16:03 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/60] python3-unidiff: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:14:53 -0800
Message-Id: <c4781542007379bb8da74d0597c7cbe6dbf6b4b8.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108772

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-unidiff/run-ptest      | 2 +-
 .../recipes-devtools/python/python3-unidiff_0.7.5.bb       | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff/run-ptest b/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-unidiff/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
index 690acf8634..d77252beac 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
@@ -12,7 +12,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-       ${PYTHON_PN}-pytest \
+       python3-pytest \
+       python3-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -21,6 +22,6 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-io \
+    python3-codecs \
+    python3-io \
 "
-- 
2.34.1


