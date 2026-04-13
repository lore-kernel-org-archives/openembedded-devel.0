Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE49F34C5F
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:47:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.273717.1776091656065839907
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 07:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SJFgCkDF;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488c21c636dso26748905e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776091654; x=1776696454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Es6X9l6I136TyASLt3P+keDeukD2CE8zWviD9op5FFU=;
        b=SJFgCkDFP0THsrsT3xcOcJ4+uPGgTWxandhCSotRQH8Yo3mxnwC8RbmPADhP0j5Y1R
         GKRgagVzHPlvnaXhNuFMV+zRUP16DtFLM17WbWqqeoFMaRixT2+D8rsCtU3ofwE+evHl
         aPFifJArXwd8+mu1zV3z5Mk9ZZiH4opwg37l09KMYTCxGpXDzvPkzvOgnBcbnpZ+8MtL
         IL+YDZffllQrRTNX7dnvK51804hT65uTTVg+5lXGfQu6ollXnqC2uEhf6pZ9LlNUEP4C
         P+8JDpLL1+BxOGQAjFBFZjnT3nRajfDAnMtrjkp8ZbQx8vNjj0QlZv33pBLd5jEglfc7
         E2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091654; x=1776696454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Es6X9l6I136TyASLt3P+keDeukD2CE8zWviD9op5FFU=;
        b=iteJAs6ckNwPOGQazHOumV2h1j1+gntxKRmdLXM+wMC8hv/dcTuPdG1YQGimBUIBbr
         PX72VRztJSlwTVdudutEld8hWS2L/WVel3QjoHNTrPMQJm0E5OfqnDrhY+58ZPAcUeCu
         HD5lYJEqG0s+V7zYXtWrnSZSyenCTixdPONKGPolVVKVYWcgNYs4eUWaBuYRnyJ+LAx5
         PrEE3q/gqRXxtlYlwpeAUUNJi/yRHonJzAlL7BoASCKX61WUATnzyLKLRMd/dJTsxmaC
         xx/Ik4IMlpSH9goOL562hP0y62PVSTM0jEGeSwlKrrDI1FcGRxBX3VRcYQl/hdXUyG4n
         LS5Q==
X-Gm-Message-State: AOJu0Yw5kywz8k8EyMZ40b5QK+uhYIGLnJ0T3I0L9+X9bO1XHQFasYGZ
	SqVU4A3dCGocRSXqKV6cwrwr2i2eNuA154CgLA8elFo+V/JQZ1Aadh+BM/GWmw==
X-Gm-Gg: AeBDievcels8rg1XH32E3EaXjWeDINjitlb8xEd4fkqBrUFb5sWRSmbgdTg/reUL1jQ
	Ux3zdgGkFhpEctuTQv//x4rsvrZ6AKSyMvotw3c0o859vuSDLxlroKjOsxr/3wM2eOdPOqtRhf4
	FJ4cMVX4LKe3aBQZ6/1NlNm2pzA8E87WVEZunnAv8HVD8VAqSaZVVoIGYcnWjZ/RyRBr5/ckETU
	RtKeQrSRi4UUGQzYcfi9+jjE//LlFi2NHaY9YWrqemMEhNNOeeLxgBbpuXUgh6ARhhwEcPR0LSa
	dpuofbNKfTyalWMb4j5GmoYCCeJdjFEmK3cSCVO5tIbsJi9g6FblPe5LmXEK+GiHfHsTyhzXzTZ
	HnK4baRF9S6pEKGFEU4l7EJjQRbDiwuQMESjdbQ4fV/X+7AvMrG8D4gMPTgFhRe3Kw9lQwMlKmM
	w+IhWCHAFqIkqjDz0uKXjH
X-Received: by 2002:a05:600c:a411:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-488d67ec72cmr148531605e9.5.1776091654206;
        Mon, 13 Apr 2026 07:47:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm152665455e9.3.2026.04.13.07.47.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:47:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-cbor2: return correct error code from run-ptest
Date: Mon, 13 Apr 2026 16:47:32 +0200
Message-ID: <20260413144732.203208-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 14:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126278

In case the test fails to even start executing, and there is no
output on stdout, there are no logs stored of the test run, so
the test log parser will not report a failure.
Also, since the run-ptest command is a piped script, by default
the last command's return code is set as the exit code, which
is always 0.

To report the result correctly return the test executions's
return code as the exit code (instead of the last command in the
pipe), and redirect the error output to standard out, to create
a logfile that can be parsed after the execution.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cbor2/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
index b63c4de0d9..c951b418c5 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-cbor2/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest -o log_cli=true -o log_cli_level=INFO 2>&1 | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+exit ${PIPESTATUS[0]}

