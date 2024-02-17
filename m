Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00944C48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:23 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.585.1708128980521366337
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQiVYwML;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e12dbc7843so1143050b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128980; x=1708733780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nclpJulwwi+7IUmloQOOpEa/Q25l5Xi0Kwlhezwm27o=;
        b=SQiVYwMLet7onSUU4+/No6qoKnACtY/4dNiXdxIWgPeT3wNlAYSw05V7deWzOKK0jK
         XDHTOD3sl5E2YCu0+LMWS4nn6asSGX8pkp7BnbCu+9e9YjyFcyW/q7LFwBOyrvdam6TE
         nC0glwAcLU0/z37Jq9L8lRIOlMfeJR+/tMsjM79WKIOkoT9/hTjjrjxebVLsKzgcEDUD
         TncPga+wNXAvbj6O1GT40QjOSOv7K5KlnEZvovT5Lw2d82cGFxLxLpweEzgNjBpmRCc7
         NOokjmeNty9T3+S9CcwsgCozWmEuwHm299ivF2yx1U6de3MEsEaKhGbMbUe4md9cVl7u
         mrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128980; x=1708733780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nclpJulwwi+7IUmloQOOpEa/Q25l5Xi0Kwlhezwm27o=;
        b=kN3E2SUGbnmzz1BvfGpQ/6XbDKzImuvDVd4g1lKclxfFBJ22nlgLi5SJXNeAwIJ3W7
         yahzZ7hJVAH5QJLTrlWBCZDh2454HK1tL57tb1rySl9kGwCsFqzHHqoeNUL7M3eHgScF
         UqVCSMHmvvw3EQjxlK6WDR9MSg1RMtbpqLHZgtBK+fwlRx9rgzCrRiV92BwNjeiCjk9i
         E20MykDjOiIfG0GzM5c69uhln1Ilp61UTa5yIrJ3aEZzK7fV+h9opfkSWE9DBbH1bmoa
         j1TqXnI25ZfZt+nAwhL7lPZIac+XIOAIZ47s9iHJBZjJ2PxYW2glt78txPYdnxJmXmt1
         VDzA==
X-Gm-Message-State: AOJu0YxWQlscothRIts179Y1EkPdGgdDMjowTGVhGrNECvjHHLfXIUMe
	Rxv5nWz+6Gm4UDORSXgSzvkoXpzGGpjISLLviGxcy4qDblwLVwJPIy0mFWTX
X-Google-Smtp-Source: AGHT+IGNNgQYqKedPSV+S3I9WqZBIi4hH3B27k0jQVUc7mWlO3P8ag85Ql6yvNWRHfeRrIZj5AS58w==
X-Received: by 2002:a05:6a00:1f0d:b0:6e0:d77b:5a09 with SMTP id be13-20020a056a001f0d00b006e0d77b5a09mr7429090pfb.14.1708128978832;
        Fri, 16 Feb 2024 16:16:18 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 12/60] python3-u-msgpack-python: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:03 -0800
Message-Id: <2af9ca84e8505fa5657c61b932daa5bed8947eac.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108782

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-u-msgpack-python/run-ptest                | 2 +-
 .../python/python3-u-msgpack-python_2.8.0.bb                 | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
index 7110f6bc40..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO test_umsgpack.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
index 8baedcb951..6cde243fe8 100644
--- a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.8.0.bb
@@ -12,7 +12,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-       ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -20,7 +21,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-datetime \
+    python3-datetime \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


