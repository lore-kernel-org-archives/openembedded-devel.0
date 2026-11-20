Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4887.1795147167035858976
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ohcZXpFV;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so1233955eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 19:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147166; x=1795751966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVFJ8m2u9YDyXt2icXhSbY5MVk13nUQuBAdGZY8m9ks=;
        b=ohcZXpFVz3kg4S6Q8DRIjla4Sbymy3zAzoe3eyXC/L95QwTRITe7dY8W+c4WoAhkHo
         rMUvi+6jpMc3GOUrTX+yGzbzs3o6pURVXivGrvdnK1fJFlWEHYG2FXkF8wCU/KwYNKEg
         HatFOdVI8OTE+lz9aiTM6TcysaEpzILHjSCoxNwXyZSk03oSReGLpurFTOuKIYSgJLzx
         bznQ8fshyjnPF3LTo70ELKA0W5W7/FGXb/PREijehsAObi7dq0QJlWrRbPeRFb+3mq5t
         kV6cOLVf23b1hzxu2okQJgnD5/nd6gkFts7M+zJ0XVMICX9AJ3Rz2YnAmdDUQYmn2U3y
         nR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147166; x=1795751966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVFJ8m2u9YDyXt2icXhSbY5MVk13nUQuBAdGZY8m9ks=;
        b=O9hzs9UvW7m8OEOEkUEjTyIWOBXTRl61QCrrWEha1aNaZWlQCvXiZQlaw0rG2MQ5xC
         Mvm2lgHX8rhHN5L3nyBBxYgqUmtIbX2IQTZjM7+kiohr3PdlcBcBCVzMgzJCUWdeWzCT
         DHTjLZN4U9ryNX/vwNkiuwIYwcD+7D/7BUrxBU5aOe+0gsDJtn3kEuwGPP+UWRA1yWwI
         DP21nGIGfAIT8x9E+WjAuBZLnpkrt1gK39rn87dEBY+rjmJMMxqdsNbMJkTqsOakyfGJ
         bVaQw0qeGHGnSsdqnH5ZVZ3szQciRJeKSgbvnCW++Jzcbr5cvEwO48QggJT8baiootPB
         NgTw==
X-Gm-Message-State: APuU4Z+O+ZvMoC6UMk8jpOEh93McuO675zARLItg/3wbhMd4cn1QwHJA
	MkSteL/US8KpFtUgdj+Wh6NVK2keYtRcH330+j0R76oPGsHNCcKVwZQKIjGgmlOr
X-Gm-Gg: AZFdTZcaRA9Wb1pN1eQQ8dmDrT6UqtRba8V1Se6DYitxBECkN+FF7s+36jXgA2kNSyl
	ZZ/jlKbOhNCXhKv5350noTf+ohGLSznivllc+H2jkt83pSOrQsttrhVEsXNJaZVgQzyMzLOC9hj
	g7iYCZCcJuRS4D17VPij6mJ9EFfYnifTnibSnhz6WO0IzvRc6lkYynxXSBYenmQ1/vSGBH5GChB
	f4n3H+M0bXIImlDPVzQj9dwJIala4SFSjBXEbjFdA5flSOESSHBTegHk4ar3RM0fBcx7sKRDc9B
	0RayojwpjQ8mIKkmsSMY/hIrw4aMezYfM8usIWJojSK/GDP5590AiNRWu4e58ORSqC+UEjt7Ue6
	ITLi740nMjrPiLO8cMSmFAzquEBmI9yDPjHWFxS514RpRD2CmYiw6pQVdgFvq0WUQRhsrG9oSZT
	H3I1qj+4sSWkp31Pj4Ks4fcgEPqyOe3+9It7EEuNZfQXzZ86v/EUmuI2EiAuaM5QG+nt/7mueuW
	akddsxSDGSZgaTblF1SfNcxsWqW6JMJUfCkj0mKnVbQ9ao2V0bojkzpww8UqGzDZClg4ErL6CRc
	JtWsWoiWbvKsK7kuhqs2CMd3So1di/SeUtfvttQ2H7VIcUFHcv72n/1sBlzEGrNGdGobNy++k/I
	gBJ96g6Qan7QWdx7JlZOQsrGR6hyF7lznM/u1D9FkkUkWUptyQeYDXaHdlNfD7X5WlYvJfl73iQ
	eXO29CDUbmFWgB3FLHMlZL4r+NDQNhaSX+oCJEcW753+hRYVAd6seauChxEXZUK1aksOmvkeOQM
	yP6yl6EQS7vae5Y+U97hPjZ12ZAH/ErqqcE93qnN3Mq5emebei33A15jHtjDZ8sp1zIqggrOnPW
	N7UL
X-Received: by 2002:a05:7300:c3aa:b0:385:c28b:a4d5 with SMTP id 5a478bee46e88-385c28baffbmr732852eec.17.1795147166249;
        Thu, 19 Nov 2026 19:59:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm3190201eec.23.2026.11.19.19.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 1/4] gupnp-igd: Bound each ptest with a timeout
Date: Thu, 19 Nov 2026 19:59:19 -0800
Message-ID: <20261120035922.3013969-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 03:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132760
Content-Type: text/plain; charset="utf-8"

gupnp-simple-igd blocks in g_main_loop_run() until the UPnP exchange
over loopback completes, with no timeout of its own. It hung once on
qemux86-64 for 9+ hours; 15 back-to-back reruns passed in ~10s each.
Its GLib debug output keeps flowing while it waits, so ptest-runner's
inactivity timeout never fires. Wrap each test in timeout(1) and pull
in coreutils, since busybox in ptest images lacks the applet.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest | 2 +-
 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
index 05aa2a9b3a..ff024e9a66 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
@@ -3,7 +3,7 @@ RET=0

 cd test
 for t in $(find . -type f -executable); do
-    if ./$t; then
+    if timeout 300 ./$t; then
         echo PASS: $t
     else
         echo FAIL: $t
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
index de14e50d41..b17719dbca 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
@@ -12,6 +12,8 @@ SRC_URI[archive.sha256sum] = "4099978339ab22126d4968f2a332b6d094fc44c78797860781

 GTKDOC_MESON_OPTION = "gtk_doc"

+RDEPENDS:${PN}-ptest += "coreutils"
+
 do_install_ptest(){
     cd ${B}/tests/gtest
     for t in $(find . -type f -executable); do
