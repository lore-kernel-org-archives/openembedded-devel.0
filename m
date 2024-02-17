Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE28AC5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:12 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.575.1708128965523186167
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LktUHXaK;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: ticotimo@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ddf26eba3cso1720403a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128964; x=1708733764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1niHM48yD3aE7X3oOPE0wm4ghdAOh7xiIOfdaCVaGDw=;
        b=LktUHXaKsD2H0gDpaFVtKoI2VrNO3vIhYyeu6iyI2mGaKGtVd+P1q1MNIVpLPKk5LS
         Wo1Y2Sb2+3Sc1+homE8EYhWM5q3ZNa4cngD1wJPz3PCYmXFRjULkXv+y4OKGVI9bD1jR
         p5N47j0qgKqLOTSPn7Pq0Y/2ffvRamb3CP00+h60YF1dBehiR1qXiXi5GiWG+5HAQo2E
         cKTMhaYE/p9ZYFtUuUdfrrzujpUxd+itDUuNI1wQyQYV1aY2I5aXttTiTnnSJuj03kw3
         0/NWZhHdqs1EuFOf7v2YehlD0FzymXtUdeSmXrPxkwmObPui0NM5xrjX3tip2A6qNGmk
         FbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128964; x=1708733764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1niHM48yD3aE7X3oOPE0wm4ghdAOh7xiIOfdaCVaGDw=;
        b=mIaHS75zEfIXUa4Ohjm9ATDQIODDmrwdyINqFLsSjr0fYpmdbcKi2NE7matmv5OLQy
         egOeAESxB4S70Darxwf3FSlCD8G29wUyYf0e2MADTDCDqLrlnwJHuoS8C6WjJvlL7kDs
         KwqqTeTkNZI3AOa8B2D5t6s/ngQA2GBpVJbxgsAiY8XJr4sgJyXi3PIyotAorVMTfmtk
         ZSJ1mQV0xZ/cy4vcE60NVq3Lku1uLYz6tCaLEmCvy89KJavdJWpK4TLDHE7wDzDZpb1w
         sZ8yvLmJ6zCu3slpOhs0UbJuAdSwsIc8B20Iq5l5uQMYlPjfz6/DMD2HLgeFn3duxcSG
         SrVQ==
X-Gm-Message-State: AOJu0YytrGMxgFZgIyjfFoB7vSTZacW8hh1I0Sm3JWPwQ6a9KfhNUIPA
	U4wto1JPYXkUKf474cVK8KzuWDMbQ03PFmUb3i7E+UPnxwk2aFggXvkGFBaz
X-Google-Smtp-Source: AGHT+IEfzE3jcQOXMWWF3yksQWKDwzTAlVPBxYL97Fb/AC4FXd/F9kMK2rtBverUnVbGIJy9kv7w9w==
X-Received: by 2002:a05:6358:e497:b0:176:d2dc:5115 with SMTP id by23-20020a056358e49700b00176d2dc5115mr7119964rwb.20.1708128964402;
        Fri, 16 Feb 2024 16:16:04 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/60] python3-ujson: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:14:54 -0800
Message-Id: <c7f2b088da48c81570c5d696541c34b53da7b6dc.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108773

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-ujson/run-ptest |  2 +-
 .../recipes-devtools/python/python3-ujson_5.9.0.bb  | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
index 8de9b030dd..b5f6be9f27 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
@@ -13,17 +13,18 @@ SRC_URI += " \
     file://0001-setup.py-Do-not-strip-debugging-symbols.patch \
 "
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-numbers \
+    python3-datetime \
+    python3-numbers \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytz \
+    python3-json \
+    python3-pytest \
+    python3-pytz \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


