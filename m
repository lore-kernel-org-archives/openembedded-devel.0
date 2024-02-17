Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20E8C54787
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:53 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.595.1708129005569276988
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d78V+X5R;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so1117633a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129005; x=1708733805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMxpbsdByKYtUsTEvNQlUmnwuKT6IIxaPKn5hiPsH/I=;
        b=d78V+X5RWfsOpO3uoAVMkqNoB9YWUgnLszlNCOJzCxdIGkBrTii/4BJFor8sNDEAJZ
         oehcpJWney1OGdfiGXMFMaWzEjD0g5Qz9LOn8jjQ1jw+8+mplEfprlVrP95rQB+YKDJc
         sxCDZeV7MavrsFMhBYcNQMEmr9y9+QlpPKfxH7Qsoyqaq1k5JPs5yokowv0Od+le2XaI
         0y5QHYKZkjP/7+5GalIfXizR2F8qBt4EhABrDR4xb1n0N6IumeV1+QEpwZ2Crq1uoGcc
         Z0VLEPNdEXKHAxxg2Lvq/EsOVWRUlbqhDlZTZUGF2OdBv1TM1Ilc8Vh+Tfqik9orRcPf
         OK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129005; x=1708733805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMxpbsdByKYtUsTEvNQlUmnwuKT6IIxaPKn5hiPsH/I=;
        b=hNpDjjLk8HxChUQMMNI+R0kAhEaqDh/9B7h5QGPrLKqKvvUs3/gkrZbghepVFNWt3/
         0raK7cp4PxZSGJH3IKJt5rDXb3tw2Hr9vL2vK2KYtHmDGPrfdDwi8EiG9R+n9v0tCz6M
         68yIuib55C1fVgr7mDXN4Tl/OH3ievuGm49IRJC7HvEm+VTTqU+18kakGG3hXnbkPmy0
         DDVstfhgmLi/pe7OxxVi1lE0s+PmnKdM1J6QzQ64ErhCY9Dw3VFpIYg2aq353YOIR4M6
         cYUW36Ox1Zq5zCr2qf5G2ngdKYi9RRfArOnQj7eJu/8ICeQwRWYsyLPnLJKPVDCS5UTP
         RhXQ==
X-Gm-Message-State: AOJu0YyfrLThxGERGVd61MZO+4i6QnzWBJd++3bWxXDAenD+Bcz6H2Ge
	cPFFpl8ip+8Ex2b1cxdfQqbvfk5QgAnlwJR/tCYWwsIpJ1qMXtAKaPJSDTw/
X-Google-Smtp-Source: AGHT+IH4ael0LuPCdraD6JhknIT6jp3itrAtaOI8L5OvT+iC31WE0jKTVSzjm3O53RfP09A+83rtpw==
X-Received: by 2002:a05:6a20:6f03:b0:1a0:85ed:4769 with SMTP id gt3-20020a056a206f0300b001a085ed4769mr5334706pzb.11.1708129004859;
        Fri, 16 Feb 2024 16:16:44 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:44 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 29/60] python3-smpplib: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:20 -0800
Message-Id: <1b80e81f6140565bc0b21559e985c467b3568d29.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108799

* Also replace ${PYTHON_PN} with python3
* Sort RDEPENDS for ptest alphabetically

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-smpplib/run-ptest                |  2 +-
 .../python/python3-smpplib_2.2.3.bb                 | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib/run-ptest b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-smpplib/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
index 25f8f6afdd..7979f04c5b 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
@@ -13,15 +13,16 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-logging \
-        ${PYTHON_PN}-six \
+        python3-logging \
+        python3-six \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-unittest \
-        ${PYTHON_PN}-profile \
-        ${PYTHON_PN}-mock \
+    python3-mock \
+    python3-profile \
+    python3-pytest \
+    python3-unittest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


