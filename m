Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822CDC48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:53 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.603.1708129004127820244
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JYCmD8SO;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e0f803d9dfso955489b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129003; x=1708733803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytoa/tPRMtH1UrVOmYaQ/rQwY+pUPNdlg6lotdx2sUM=;
        b=JYCmD8SO/OEx6Rkn0jWvHzGDtM+rDmvy5STVsIBocf3ZU38o2hw26s56AXQI7U7Lh+
         pic8JjMDOrzZJKqd0MFsXfJjaei/lHHO/qgdTTiCoCMxdyNJCXPAxM2rt4vUtyh/5ojZ
         W5zsH/TfnRdFGnoK5KQRqfP75iprXeP7ygAMECyJOoQBI5MLXjE3RgId1rc1FU/UbuIE
         DjILfWpAlr6njxiAPClIDpEmktPEI9bdxVHXm2rND5c8lB6A+rcrZDf4vg/wGNzyIuN5
         Y4InWlRRLG97zEgnhVGkmsJMTUcU/Q9fietHozXV8+ej/qU3Ia62Z1BEWqciT0AT9e3g
         0e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129003; x=1708733803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytoa/tPRMtH1UrVOmYaQ/rQwY+pUPNdlg6lotdx2sUM=;
        b=Krh34eCFpBGtOfiBEo28eIDk4TzOGhU6F82haT4CakXZL61q3DcA+A9YFQDxtSHgXI
         e9Q/TTZFpHub0MiAf5FkJFuyZTlgPeScnxcb1mFwxguAABpe2RLkh0ibj/W/RXMGCPXq
         iAGYVsKQFd4swkynB9CPp1ubOwI9BpFrQ7+SbVQdtBCSr3jftNLQfjTFn60gwjuy9ktI
         y8e8Q6Fmdnc3OdIkLa2fXs5N1LCj5fHrFMQZmRoEAW9H8XgndT8UBtpycXLVpEcaRhho
         YH3ddH9FXnD8MTLQAe1hO1wHcBcC5SmrW46X12h08SWg5+Z8tokWd2B+ugHJiOcS9ycU
         QByg==
X-Gm-Message-State: AOJu0YyS8AjAHndJRwKOCKADzljvMxbUDzMJGghdTQaBdrJAEK+uuxyT
	bDICFuX/Wdr6KV2ZB4dUdLciavzXWTt07EcWHStysD+JVIar6WgSgF57ww6H
X-Google-Smtp-Source: AGHT+IF8qfjs+FZNhQUYKnBIM60VO7+Oq7rBGIhV10+yeSpYsEHsTO0thz25U8lwk5gAKpyQ4awqXA==
X-Received: by 2002:a05:6a20:d48c:b0:1a0:885e:96d6 with SMTP id im12-20020a056a20d48c00b001a0885e96d6mr4479921pzb.61.1708129003404;
        Fri, 16 Feb 2024 16:16:43 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:43 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 28/60] python3-pyroute2: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:19 -0800
Message-Id: <9bad15ac1b99a3c47cf99d426ebaff4e05cc324f.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108798

* Sort RDEPENDS for ptest alphabetically

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2/run-ptest | 2 +-
 meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest b/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
index ea429ba21e..f1c8729f0e 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyroute2/run-ptest
@@ -1,4 +1,4 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
 
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
index 6b340a18ce..740a6d7f73 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
@@ -27,9 +27,10 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
     python3-fcntl \
+    python3-pytest \
     python3-sqlite3 \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


