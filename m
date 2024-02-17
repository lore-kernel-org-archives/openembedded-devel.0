Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19201C5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:23 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.577.1708128978023902245
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=isbC8SS5;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d8b519e438so2436277a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128977; x=1708733777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQU9O1HA6CBqEOln0QKnC/51z7T0sg4TvfyUOlFdTSo=;
        b=isbC8SS5pS3VIf2+n7wtCW1QtY2ks6JR+6b/7wIpnNmMhrzZ4ysG82piw/1LyWEQ3M
         eTs2KdnDSsBGRNYnUKGWFzimaPV/yBv4Xcpl80M3aq+fQKr5d+17EA3ULcVRCq42oTma
         q/fsvnk0YVYemgn0GJ4WuzvH5aZobp2tJAzZQmy4gVdfKwe4qNebhyOn0yD7oDbpG0mi
         oNacI/i1MoDrnXJReQMENaihf7lV8iK4D54bzALOyBOHiLhlIiDzrr0QVFx8pyIYgT69
         +iUpmWjzYfb62X8bkJ2A+7osTacoMhH+Qp8i2+P1FbLOFTQEEDnAgQ2fF/85IhjNw9Sh
         lQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128977; x=1708733777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQU9O1HA6CBqEOln0QKnC/51z7T0sg4TvfyUOlFdTSo=;
        b=bplj9esP6A6Ar+U2R0TraaDtjV1YmBh+LcwZzr6dSLX/q8U1OelLiq/1yLt6o0AfY2
         2Ob7yqEDqtjHBt8o1m3ofpHD0tE1J0443mROkiPL7rgI/rWcEQByXl+pNul34S+zySXe
         /+fr0VW2TNxq1wCsQXwdZ0MocP8Wjkw+/ljMWYoWubSjVsLzaLG3nRjwt7WmywjZvO3R
         4+3WuGQ5n2JCw6ULESSbEfvAJwh7UzHT+ZnE0FIyw6Zo3n/tpnfOeudnwbZVuB7bTDVV
         CynyFcjiPKhebGURpujVziuXpX7EeeQlVV80icEvZH1bzyvuI/XxFDqWGo5z7WK6fAjp
         jX/Q==
X-Gm-Message-State: AOJu0YxONhyxBHKzwL68DxyxN3vDgzysx7X0pqa4KI5zzxmdbq9NBXeV
	mVv7ckHcfBDhtWb4+QN4Ly8m0SmZHuy+HuXv3Dz34g7YCU/38qGOPUd7sgUv
X-Google-Smtp-Source: AGHT+IFpJoGOxrAvsEyOUuQsrWtcghnvYScSH9c2KFrRukdqIceoVS6Jn1bkwor3lFnn+YSIuCFFuw==
X-Received: by 2002:a05:6a21:2d08:b0:1a0:61e4:a952 with SMTP id tw8-20020a056a212d0800b001a061e4a952mr7366582pzb.11.1708128977235;
        Fri, 16 Feb 2024 16:16:17 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 11/60] python3-scrypt: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:02 -0800
Message-Id: <169b7ba5dd117b09906920c329c176635625df9a.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108781

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-scrypt/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt/run-ptest b/meta-python/recipes-devtools/python/python3-scrypt/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-scrypt/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb
index c386932683..ce0d4de9c4 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb
@@ -14,11 +14,12 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-ctypes \
+    python3-ctypes \
 "
 
 do_install_ptest() {
-- 
2.34.1


