Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61770C48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:43 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.601.1708129000831617166
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8fapc1o;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e0a37751cbso2383098b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129000; x=1708733800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RK7HTse1Xb4J9NchDQBFdYqVuHIZP5mbsV/clgBrpEk=;
        b=E8fapc1oNqj89Fo0K4zscEFdRfOpFhvm90hy3ybROKCMeVlSegOgdTAtHM4P8gSVGl
         C7l/mqEUTp7Ai1jGu0/IpCHcmXXjBEcVF1feoKw+nFqlfAv5Vx7CnLRUB//1YlHEk3KD
         MEeotck8tDzfI7bQVY77rd4qFrCyKVRLI0+yatBhiM/ntDNtgIGox3im4JU7yCu+oyeH
         3fNtXStpIN+h6LKUBKf115ZUsGl1opd3DVK1CBalpqKRwSMhvNXaH7ese1BRzZYmH8gu
         kN4NcyKMpYAfg68P2ABcwKOTYuA0cwsf3VXAYPrp1bF3W0+Chdxb8asbOuZXkRfcqP7N
         r0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129000; x=1708733800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK7HTse1Xb4J9NchDQBFdYqVuHIZP5mbsV/clgBrpEk=;
        b=vOn7CvXdo2ubF3XZqVh+ChGcg598wWAjB5YcGCFNCiM4mNheMJTauxrxkCg9CzmFSJ
         yORs/JeAlttXZoquN3mQ8x6M7kAvfgiOLDVSO18XfGwrrj3kf/LhrGu9toXM4UWeAoS2
         sFuA2ojzia2qjRszRcyk0bT2KAY7YfKgodMDW2ImDFbIBGKzyeSu/a97O63MT5izO5FS
         6KcBby3HRM9vyax8uanJjKdS40x48pWMZ8FkjzR38evigYzIQn7ryJyjiRitSO72tcX4
         DM/c6jJ65dKz/xnBIwV6lJOkAxUxEMRh1FSCO/yD8IV4vpKHIEuq1n0AsSALzg1u4UYO
         296Q==
X-Gm-Message-State: AOJu0Yy4fHHhmSX18yPED4a4csndAddWHkiwPv9Ed8cGycyJ/4XJ8nlj
	wcvni+GvL7feBcVrDTaDEF33S+JViLB1T3ZZOIv4mgiGRI4GCcgh/X5KFlRq
X-Google-Smtp-Source: AGHT+IGVWN0nfI5BjdPMuOickJ9S8HovprUgTxnm5eh3XF1Ru60T/riTpf6vtLlA2a4gbdOK3u+vgw==
X-Received: by 2002:a05:6a00:1d06:b0:6df:f7f3:6197 with SMTP id a6-20020a056a001d0600b006dff7f36197mr7161360pfx.34.1708128998844;
        Fri, 16 Feb 2024 16:16:38 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:38 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 25/60] python3-ptyprocess: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:16 -0800
Message-Id: <ac22dd50f5cb8c64e666eca007f04d753ef4747e.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108795

* Also replace ${PYTHON_PN} with python3
* Sort RDEPENDS for ptest alphabetically
* Remove trailing whitespace in run-ptest script

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-ptyprocess/run-ptest       |  4 ++--
 .../python/python3-ptyprocess_0.7.0.bb        | 19 ++++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest b/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
index 15c3f6282d..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess/run-ptest
@@ -1,3 +1,3 @@
-#!/bin/sh 
+#!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
index 2a8b8730c4..4abec0a01c 100644
--- a/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ptyprocess_0.7.0.bb
@@ -15,10 +15,10 @@ UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-terminal \
-    ${PYTHON_PN}-resource \
+    python3-core \
+    python3-fcntl \
+    python3-terminal \
+    python3-resource \
 "
 
 BBCLASSEXTEND = "native nativesdk"
@@ -30,11 +30,12 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-fcntl \
-	${PYTHON_PN}-terminal \
-	${PYTHON_PN}-resource \
-	bash \
+    bash \
+    python3-fcntl \
+    python3-pytest \
+    python3-resource \
+    python3-terminal \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


