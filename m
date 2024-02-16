Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F5FC48BEF
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 15:23:31 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.21348.1708097007117616824
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 07:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: straka.derek@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59fa37c33dbso238757eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 07:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708097006; x=1708701806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRs0u1AQtrBKtlnF1ElyRotMGoLu0llOk0n/0IgY1VU=;
        b=xDFvB+uxf93/nCdANRmYdhw5itFP/cae4s3dk9GvxsxMBJJ9z464rl/aaSIQU+w8qj
         w59piLEbeNuCjtse6vc9FnbI0dKjgSQ39FKK4V+HcKyLzRl52ahcKZbL5Ng1dO4WL0Xy
         qQRtB+Abv/oNdvm4EVATdLXjbYjFo/hcgoySmyz1Zkf+DETUfRZ0tEwE3ogxnDp/9zhe
         SxUre6lhUFvUv/jr0rSzcW4KjcNOEq/QnxNJkLFqALmA5KcwR/HMUy379KQzZzA0iASn
         kUxqkEjXWEjupskYxwRewkqQfxmLPWoB5f5t71pYAJGJcqoYEJmtSFl0ORUu15Kcu6HB
         mD7w==
X-Gm-Message-State: AOJu0YzebiN/OQRdcXtaENZrDi+ezRvlQsNzouXEw85daoBnWh65cD4G
	obBXf8nYI5jDwyu/RMenVNWUugwOBcP0GUzDHl9VNYhf6HRA3S472QSsOZXjr5I=
X-Google-Smtp-Source: AGHT+IE6Zt0nGRqU5zkuX01uLVEqQkk1KZHx1lugMjnKrmFE4MbJIVFCSBY3Ru5FK0z4ZoWft7070A==
X-Received: by 2002:a4a:384f:0:b0:59a:96a1:289d with SMTP id o15-20020a4a384f000000b0059a96a1289dmr5662799oof.3.1708097006061;
        Fri, 16 Feb 2024 07:23:26 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k1-20020a4a9101000000b0059a14309a29sm13648oog.16.2024.02.16.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 07:23:25 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 3/3] python3-ujson: add ptest into PTESTS_FAST_META_PYTHON items
Date: Fri, 16 Feb 2024 15:23:00 +0000
Message-Id: <20240216152300.2587130-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216152300.2587130-1-derek@asterius.io>
References: <20240216152300.2587130-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 15:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108769

Verified successful test run using bitbake meta-python-image-ptest-python3-ujson on qemu86-64

291 passed in 9.08s.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 meta-python/recipes-devtools/python/python3-ujson/run-ptest | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 67e861ba8..598548262 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -50,6 +50,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-soupsieve \
     python3-sqlparse \
     python3-tomlkit \
+    python3-ujson \
     python3-u-msgpack-python \
     python3-unidiff \
     python3-uritemplate \
@@ -85,6 +86,5 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-trustme \
     python3-typeguard \
     python3-whoosh \
-    python3-ujson \
     python3-xlrd \
 "
diff --git a/meta-python/recipes-devtools/python/python3-ujson/run-ptest b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
index b1539453a..b63c4de0d 100644
--- a/meta-python/recipes-devtools/python/python3-ujson/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ujson/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 tests/test_ujson.py
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.34.1


