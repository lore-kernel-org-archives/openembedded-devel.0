Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA2BC5475B
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:43 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.591.1708128996378416072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GEuVFbk8;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e104196e6eso2735800b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128995; x=1708733795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMRFj/gxYGc07zmtpUS6qDVivxgF1tknD1yvAjhMFPA=;
        b=GEuVFbk8CjM8bGsBwpKcnLUpOjbpjFpySxGgdsRjUO/br0/bBKanGaP8r/vY7hcr7O
         ItgXl1gvmcOXNXmPO49sOsf84CsK8PrqaU24BCYfQ9J43TKbdUdua8Hy8EC8V4OJbYx2
         hOIdVH2Ci6OAi2+J9pbfUhWztfG/XxKpB+Axo/z/y5hYI/hrL/q0ODRbpZn18MRlDEej
         mXfcMDnS23WPM40r5kC8zEjufz2Qqu+Ofyt4zbt1DM8KHvFOLvG6aPUryHl/fAvXeCnb
         6sgBetwV/E0PEYYJD3ksxPh1z2kDce+aQg80qdz7CSoC+dsCNH1mSHqog0U1X2YwbodZ
         1f8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128995; x=1708733795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMRFj/gxYGc07zmtpUS6qDVivxgF1tknD1yvAjhMFPA=;
        b=SA8ydkdH5J98cucJRYPeLyNq5CXjckAlOErkJXkgt4CwQCZWx+LLZyg+WlZ6zHG6w9
         sP1StSwtTBATYDbCy4IZs+lRspmc9pS/srjisP6FcJPfD+fKPD65ellhUDq8OzYFj7NM
         6a20vFAFGHHpr3Mb0PjPNkre9ZD0frsVJvum5BMC4g9F36X4UBHHFzXuLtscfwtpegxd
         T6dRpd1t1AXEa+UOwj0hTnrxIQRoTFXlayBLixYoPO8TgOmedL+TXDyb+Pud7TTyQTEc
         odLuL43IyHf7RgcvfeMuv/iSbhaRq/URcJR4tzZvvIJzys1vR+XlqxxP6rjL2wmzk23R
         uVlQ==
X-Gm-Message-State: AOJu0YyMHDfRgt5xqA8haPPhi8SDuDJK9yMW1CCZbjcKx+3v/hYmjTLx
	wLUyXAukAE5aPjWesztg8E9L5EAPj2lHYEJ8xeP+diTTt5/fcscZ8vruwod5
X-Google-Smtp-Source: AGHT+IGOhoVFMxlf1T2i1GcgI3sSE966R6kpwu715fVJhm9JepsrhFf1ezFts5t/tvf6c0IDAY8ewQ==
X-Received: by 2002:a05:6a00:9085:b0:6db:d978:9047 with SMTP id jo5-20020a056a00908500b006dbd9789047mr7383513pfb.1.1708128995444;
        Fri, 16 Feb 2024 16:16:35 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 23/60] python3-dnspython: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:14 -0800
Message-Id: <29991ef4dfe4e898b61237e1d006176f9f259f69.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108793

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-dnspython/run-ptest        |  2 +-
 .../python/python3-dnspython_2.5.0.bb         | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython/run-ptest b/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-dnspython/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb
index 6b7212b9b5..c5c8d42e2d 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb
@@ -12,7 +12,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -21,15 +22,15 @@ do_install_ptest() {
 }
 
 DEPENDS += "\
-    ${PYTHON_PN}-wheel-native \
-    ${PYTHON_PN}-setuptools-scm-native \
+    python3-wheel-native \
+    python3-setuptools-scm-native \
 "
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
+    python3-crypt \
+    python3-io \
+    python3-math \
+    python3-netclient \
+    python3-numbers \
+    python3-threading \
 "
-- 
2.34.1


