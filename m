Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68017C54764
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:43 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.594.1708129001216106964
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VDx5EfHt;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-59a8b9b327aso883228eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129000; x=1708733800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJseUfC5HY9slU4CxubCBaNS3nTEIH5Nf2zsSZXvs5w=;
        b=VDx5EfHtbrXdMkC8jnHXdNlrsPY8ORMOrC8O1KsBiv3X4wx2IvL/gbrRYtPQr4GnL0
         vlvsJ2fBZbixs+z9AONxEY6hY4lpRD1Zvi5qYm3sVUyFYiOKpcrMFBJxyCx5KkhOc2w0
         sIYhCVAFH/nDRnMPx03e91WdlnjKqO9ShZhpFhFXgMC1gEChmxleZBvgq/EhYoQz5dJ8
         3hj4+Ka1fZ39ZgVmIti0d8oNUhfmvpCW6Us4uUt+k6wYWOZNmOKfsEzg2Gld9Q+GrN9I
         2DvfzN2moUL7+u9jnmeS3u/6nSKzC4FNv1nZu3L+VEzA7zhhnD13uTYrp9uuvptzdMlX
         LBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129000; x=1708733800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJseUfC5HY9slU4CxubCBaNS3nTEIH5Nf2zsSZXvs5w=;
        b=mIg2E/MLavo96WvefMYo18ywDHtRarb/vz3zc32JgDVF4eW5L45AezXW8gQgjzI/Us
         0Eon/gJVk4Uiy9Uxkdj6LV2CQ3w6cOa4i6R8dEiZKPSrJJ5XZ/6oPOutJKmLSD0PBs4O
         S6W04aHJ6DQUthZO5Lo4PZcka/Wp92elBTRL7vkau5jZhjfuD8Lw1M5ykRfgQwzo36D9
         dvM72nCuSYXIoJqyRZQb8y0mtgHHKqlTeCZJWoRcFi0tLCAEPZVII16JiEK9yNH4f/UV
         K9mwk71DcRD7wmU0dvfmtAr5D6xHl/KI2VrhVZCK9nFSFYSFVn98BFBzE+fVvV8GxEjL
         TTlQ==
X-Gm-Message-State: AOJu0YwICENRwL5a4okq2fJRbXKZhklheE5RLra/HcOX6jKUAJvP4UnQ
	XYhc9ttOxx8lxkUMpQ3z5wTOcTkDp8JUSx1dIYAgDndR2CH33IGtcbF386sX
X-Google-Smtp-Source: AGHT+IGg9KBqy8+/W8f6k7a8NN1jSzlGXgA1qitQgarNP2eddUot+LmY8ZzHTWiBtBPgSHdaK2Hv2w==
X-Received: by 2002:a05:6358:9213:b0:179:ff:2486 with SMTP id d19-20020a056358921300b0017900ff2486mr7361045rwb.29.1708129000298;
        Fri, 16 Feb 2024 16:16:40 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:39 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 26/60] python3-gunicorn: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:17 -0800
Message-Id: <7f7291aafbbbdd842bb9272b8a0109eef9d0602a.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108796

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-gunicorn/run-ptest   | 2 +-
 .../recipes-devtools/python/python3-gunicorn_21.2.0.bb   | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest b/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
index 98d73fa037..5ca7e26e8a 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
@@ -4,4 +4,4 @@
 # ptests to work, so make sure there's at least one nameserver line
 echo "nameserver 8.8.8.8" >> /etc/resolv.conf
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb
index d765c8fd05..9fd601c999 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_21.2.0.bb
@@ -12,9 +12,10 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-eventlet \
-    ${PYTHON_PN}-gevent \
-	${PYTHON_PN}-pytest \
+    python3-eventlet \
+    python3-gevent \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -22,4 +23,4 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-RDEPENDS:${PN} += "${PYTHON_PN}-setuptools ${PYTHON_PN}-fcntl"
+RDEPENDS:${PN} += "python3-setuptools python3-fcntl"
-- 
2.34.1


