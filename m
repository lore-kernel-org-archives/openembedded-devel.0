Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.36766.1606592848140814712
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tx/4szOp;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id t3so7008792pgi.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P5yE1K0Jf6IL1rWqPPTs9DRd0E18Ndfx9Cz9ZdK6ZqA=;
        b=tx/4szOp8hMkpGGCNvucHWPT2Qj574Sc04Vb5OqqpzGlfknRdTzE7pguAKZuHq6QIo
         sby+53iUAzQhIEhPoXGxOE2GOeEAEUOCSSc2TRcXqwqqSv2adV1tQF06Yub3I8HcXdjd
         wwK4JW3usXOMfwh2rwxmWd++BSlI3iAeSSVgK4BGEmLN6KvMaNVBmr8GisbSCnpClLEy
         HG4VRlN62Ige89uuqlXaPaoTcT7ZPAhBrxPparemle+WFcjkKfa5AU9gJ7QYvULmWNbl
         9cDgVxNT89wPw4PrvAKbh5ethgLmfyZzmIwrPYzyB9kazEQwa5Ebc6OgWRTe0NaBhPO0
         ASVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P5yE1K0Jf6IL1rWqPPTs9DRd0E18Ndfx9Cz9ZdK6ZqA=;
        b=iWKcOrpIHvhubGPWK69KTJux9yQCXEVic0WDrIwQvqsvb5SP5bezyIdK38aOANed0Z
         H8tWioz8YxzUj9Jh/EoimjHaoDNCktytt/074Ut4CCP7r8VNQWwW+eMsFCwGqs9b4Xfy
         HnfjKyr/Wpln3xZxJEWuv1VgsnAWapPVN143kX/3WTycAsOU8MNqxgfCj8cSrszjPoVc
         G6bGsBCcnjh1Jmgxf8RnZ/4r0nskN1AoK4PhtOlKAwPK8l/ybNiQCDuDSnL3BY9t5mLw
         C0YE8AUaDj/L7Y+WiuJuiukR05NeA0YEBXEn5cWkEsL+A+tLvh1MLHv4W1w7x2pRwYqT
         Mjpw==
X-Gm-Message-State: AOAM533ouXiuJUcoe6I+5XM6NWzBYf4c0bShFIeKeG0HQaiE5QmIQ8gJ
	0DDnZzhI1q3ogFJ48WMoHhkdiAQuYbWM8Q==
X-Google-Smtp-Source: ABdhPJwVEkbuqjYqhudxUHVoAER89oO044L4a2KdDk6dAqlfQha/YxygUs8j58rj9qFG7ua6ydSROg==
X-Received: by 2002:a17:90b:a54:: with SMTP id gw20mr18002606pjb.68.1606592847470;
        Sat, 28 Nov 2020 11:47:27 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:26 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/16] python3-wcwidth: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:50 -0800
Message-Id: <44a0935eadefad954d3e8f2c1cc3837d57eddac8.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-wcwidth/run-ptest          |  3 ---
 .../python/python3-wcwidth_0.2.5.bb           | 25 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest b/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
deleted file mode 100644
index bb4aae2e86..0000000000
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Library for building powerful interactive command lines in Python"
-DESCRIPTION = "Measures the displayed width of unicode strings in a terminal"
-HOMEPAGE = "https://github.com/jquast/wcwidth"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
-
-SRC_URI[md5sum] = "a07a75f99d316e14838ac760c831ea37"
-SRC_URI[sha256sum] = "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-        file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-       ${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-      install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

