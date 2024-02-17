Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00BCC48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:03 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.611.1708129015816004890
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CCGZu2mg;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso2425445b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129015; x=1708733815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1n8zlI8I3Ug5WhbyRf7mOA7SR89KZc8c6A/d2OcxNs=;
        b=CCGZu2mgQKNG2D4h4ZQNF31GO73ImDddQA1JHLSjn+wTaMM8yDZ9H0FEoaNN8DPfaV
         UZ/npY035O+l8RfT4JKpLzcuKMnaJp+oRw0+UNMDz6bpoJIK3DT9ylCntrVvbtI9Z3Vk
         GJwUuUoX1d+aV44ipZSqCO3Ady8yZNIGC7UZOuq4KCUyVPwKYtkykxxZVGp6hOrXmL7X
         HkAfVKrEG1lOFsehTEGSlc+L9R0qFrBUW82h22RFSlI7lJYgst0VGkEYhkjtd474yifU
         h5FefdlxlOjkMyIsdf2n2GE/lT9bJKIlSKCsHcODYLQLr8FfiKAHtjato86waLCcWi04
         80uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129015; x=1708733815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1n8zlI8I3Ug5WhbyRf7mOA7SR89KZc8c6A/d2OcxNs=;
        b=bRxNwaDtU5uNx7GWqonxc/xem6F7Shy1HdvgLwsM8knLEWq45KP3MZWGVDr7IE1Scc
         vqjPe+RG6gNKqwMwprpR/boxUJwY2xlFYKbnu1IK3RoYn7ApNaD0O5Zlc9PsX7ADINRz
         /cMh5JnZHx+I5urBFo3ITVKyMf7c5y8sSjUZ8Um+60MQHOtYM+3jBzlVmLZbFDq3+Eio
         OIYs0Mwfrtt8wNc5kj2S9/rhrlmf9ybpWL5tAoHWRI1P7GlVyi91TQm0VLUaM4y3PS2b
         H1plDRQXs0SDKW26yJ6K1Y56C1F2uX3UpxC0tBgOHZ/JBJTWD2Xycz3S+WNT+6J5XRnZ
         poAA==
X-Gm-Message-State: AOJu0Yw2T7NI1s50j0nMpEhcvkloYDFzqfXRL+BUpOgEIXqeuspRUwm+
	Rmnig3iUiFo5o4oFhVjS8YnyNMbZTkVHdu4/KnCmIHcWlBfK0tGM3vZOGKjG
X-Google-Smtp-Source: AGHT+IHzvKPsu0hrX9lPPELI/DD9Fkx+nO3w1/a4m0OVhM3HCx7NnSsdgh9TQcdTpifx+w2Jk3at1Q==
X-Received: by 2002:a62:f251:0:b0:6db:d59c:a5b7 with SMTP id y17-20020a62f251000000b006dbd59ca5b7mr6349479pfl.20.1708129014033;
        Fri, 16 Feb 2024 16:16:54 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 35/60] python3-requests-toolbelt: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:26 -0800
Message-Id: <6fbe1dfeee2f178f7adc7d5f83fd0cc8bdb1c8a3.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108805

* Also replace ${PYTHON_PN} with python3
* Sort RDEPENDS for ptest alphabetically

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-requests-toolbelt/run-ptest      |  2 +-
 .../python/python3-requests-toolbelt_1.0.0.bb       | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
index 2534c1c62c..9cbe4927a2 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
@@ -14,15 +14,16 @@ SRC_URI[sha256sum] = "7681a0a3d047012b5bdc0ee37d7f8f07ebe76ab08caeccfc3921ce23c8
 inherit pypi setuptools3 ptest
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-requests (>=2.0.1) \
+    python3-requests (>=2.0.1) \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-betamax \
-	${PYTHON_PN}-mock \
-	${PYTHON_PN}-multiprocessing \
-	${PYTHON_PN}-trustme \
+    python3-betamax \
+    python3-mock \
+    python3-multiprocessing \
+    python3-pytest \
+    python3-trustme \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


