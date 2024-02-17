Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82273C48BF6
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:53 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.607.1708129013195089420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l6dpNjZh;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5dca1efad59so2341019a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129012; x=1708733812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2g/BKFplwX13nJJf5cmFIOPomhNFFWX6MEoDQwyvIw=;
        b=l6dpNjZhe+oX3qZbu+1Rs23bUPFWDwNGfSYhLvbxdRJ3ZwJnipQA8EmyInMoJ6d7rM
         iVZHRVzIlsY9QSgwWzOFdu7x0EIzwpVuo+ERQe+rczZQRlGe1XaYr2TJZ1OQNBnbnT1v
         1q9cI9mKusb+xJzTdoqKwtl2DoPr4v/kc0WS0OzZpzTpl4YEOd6RYr0Krv/ZdlrZoVGm
         hnFHGsGgjV/8mFvv7wlsOz1C/SZMnkkmDLcacgKEArgQiV2jKeyHMm6nRetzXd8sL8Hx
         lEVmM5x5q1+HN5sJMUKyjP7nEzwUEuKqs3qwcpItOFVkm5Az3me+ZOnlIZ7DzC+VrNSy
         nTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129012; x=1708733812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2g/BKFplwX13nJJf5cmFIOPomhNFFWX6MEoDQwyvIw=;
        b=k0ucNbJ3qNGctY0uvUGCKl9drqi1tXPltDpsug4S1lMrhme/Tz5KlEwWfpo3QnN/sr
         QTW07Y3x2SDHO74YFVnKfy/NNLkObCjHHNFwUP0zeiJtMlzFVopfNmouDtvVtz+riWcY
         Sn63YE3y1a3/g5rVrl87JVrAIqRO7bC2pPOKPDKQQi3tgITme76rRW8oohrAKyuHEU+C
         Fip4+xbA712jw+KFSaPFWNXu3o+/tcdmUiP0iWN4sDcfH2ycTR5lCBlJHf8n/mcHGVib
         H/gJm0bH+pNeUFBG8n1an7OWSNesyCUsXMo0Xt4Snl+ixh5vHB61dAstgDZea8IklOVG
         Vp+Q==
X-Gm-Message-State: AOJu0YywkNPxkX/D+0EZF739HDSng5UYT9MLtHqAzcQUy91CwXkZ20We
	8d1cHaScFU5GSJD31SEv4iIIeKIyWs6LIVa1Bbc9SEfs+2MDKsRBPf7qY1r1
X-Google-Smtp-Source: AGHT+IFdVhU5EaBoNVtRMbEZyGGJf+lvAXGndAmavit6gkPxl98G12ArVnHHZAinRZES/OvA30ZSDw==
X-Received: by 2002:a05:6a20:93a8:b0:1a0:8578:fa86 with SMTP id x40-20020a056a2093a800b001a08578fa86mr5198551pzh.57.1708129012439;
        Fri, 16 Feb 2024 16:16:52 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 34/60] python3-soupsieve: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:25 -0800
Message-Id: <c9bdf11c7f0ff6a08a283137f73fedeb9f7ab83d.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108804

* Also replace ${PYTHON_PN} with python3
* Sort RDEPENDS for ptest alphabetically

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-soupsieve/run-ptest      | 2 +-
 meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-soupsieve/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
index 42c07fb4cb..d26a13dfbd 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
@@ -13,8 +13,9 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-beautifulsoup4 \
+    python3-beautifulsoup4 \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


