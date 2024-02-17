Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B68C48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:33 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.585.1708128990606956996
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V+G1ekWP;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e0a4c6c2adso1809516b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128990; x=1708733790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amJDr/rAWiDRZGZTJNXZ6lajqN2ZJ5Q9eFiMvWLdlzo=;
        b=V+G1ekWPpHAap6T0AtSeCViO8ZEpF/kYPeD618sInuuGtF1LMafRITC15YR+G89G1x
         GOiwTdtb3utJmxmm43WvrQAhA/5VW3JWfwdRxZ0SWTr4gk6I6/9FZw1a3eVIA0f1X3RG
         +m6M0BXoIMYj0Lu1gAh9PQIENzOJC29/bw0Ps93nyFXt+9H/Ug6KDwrW2a3/PN2/jHgx
         8D93UhC45PWZr0NCcX0Yd9gMcoEHTOnQwFEWsMXHMsCevfw4zz/qa7V4AgwxJ8DNbDrA
         +D9YYjGyPtQLwj4imDD0uKtZbB2AEFdI+XmJlh/xhSY/IMIdsjnD5w+B59wXAeGCgwQJ
         qPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128990; x=1708733790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amJDr/rAWiDRZGZTJNXZ6lajqN2ZJ5Q9eFiMvWLdlzo=;
        b=KfInrAZsaSWzwaYwRKyZw0RSPneUt7Vwnb6D5q6TwpGV9xR1EY/6TjiK0K4MjWGxK7
         8qUnJMgpd84aRBPxfuRuWf+BBHHVnW/xhziZp+g8kgeFHD4XczbtgFIG/1IhMhBzGjgX
         r/CPpc0ijTibO7YMiPGh/xgI8TbtohaiF0OicNaVWBQGMqfT5zWgiTYYnVCd5LpPrIrj
         YH+TSTfnd2wGz5OC0ttCOGntWjL8Il2+9E7JUinyUK4tEVmNxReNS+odRjhhPUE5z3oM
         bcAl9Gw5gopVGJ9Ackz5rTPHhNuEnJLoJ7JHZh37CNaZHCEy/Oq3NzUXC0OI8/PLMEmz
         J6+g==
X-Gm-Message-State: AOJu0YwcBwVUQ4Nh/9oQG0SdqjyjqE2IZDl1VpifIsU3ueXy1U7YUgih
	lWqv4VgY2lvSLPFXQUyPxTB7C+RndWH6dwhYTs9IXgGpKipKQPvOL11ACC8B
X-Google-Smtp-Source: AGHT+IFXhx+c3PwFHANiWd5ib883ubaPdJT7SF8gtkVRCZYzSZEug7ku3wRojnuGha8Opm4XDsbirQ==
X-Received: by 2002:a05:6a00:2fd1:b0:6db:d2f5:9e28 with SMTP id fn17-20020a056a002fd100b006dbd2f59e28mr6494406pfb.10.1708128989751;
        Fri, 16 Feb 2024 16:16:29 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 19/60] python3-py-cpuinfo: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:10 -0800
Message-Id: <966faef096bdd8c157d072d019941e1c6eb61f35.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108789

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-py-cpuinfo/run-ptest       | 2 +-
 .../recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb        | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest b/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
index 84172c058e..857afd1db7 100644
--- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
@@ -17,7 +17,7 @@ SRC_URI += "file://run-ptest \
 do_install:append() {
     # Make sure we use /usr/bin/env python3
     for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
-        sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
+        sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
     done
 }
 
@@ -28,6 +28,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "\
     python3-pytest \
+    python3-unittest-automake-output \
 "
 
 RDEPENDS:${PN} += "python3-core python3-ctypes python3-datetime python3-json python3-io python3-mmap python3-multiprocessing python3-netclient python3-pickle python3-pprint python3-shell"
-- 
2.34.1


