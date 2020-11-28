Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.36475.1606592842448942603
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OdDANq5M;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id b10so5981608pfo.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nBbyTNkTH/HFTvYMCNzjw6RJcVhvkJgsr/n6C8LwnsU=;
        b=OdDANq5MFTP7y6cFi1US5AZO8glvgaD0Ie8d5N1iKLCjiCdMVtm4OaXmit50WGYpMP
         mKObFaBG25epxTD55gT5Sz+Nugnh05xVgPyXluFs3ZgaNA/jqPZtFVTpbmLRMmrGu3aQ
         /RsqhvQpAsaFrO6fHkFquHnbp7NFRz8fNffVsYpyYve6hDclKe5TNfAJvjl1MYu6KbIY
         wAP7TEHVyqcxUlpPpdMPI3mhZWQvGG1Go4Zu5rEbjJQhjWfWfX/mq9igxvEwJ0jofjwj
         zgO6qiEkbFopxaJU5Zdp/rjxuDYhVM0gOtNN+ekgA1+B9UBvMyXuKq32NxNMefBMsvIk
         tagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nBbyTNkTH/HFTvYMCNzjw6RJcVhvkJgsr/n6C8LwnsU=;
        b=MJaO1WHGI/zIxSvXGCfRW5RcHvAg5bXf7Wam+7aoABNEwGPBLyfOkQdDPTVWbKvRwW
         Q78iW9l3LFgdZjgWxFtrg/c/cSN7E8MxTIKn33foa0mNn0SH3RW5ZVlZpP79yd4MjwMA
         HlTYFabtG1MbXgT/mtfIBnI/6k6CAybDfDwKtaRE35bfDsKOVQmutYFhDxXuJfMNBTyt
         UZPQCwlWiADFwqrNu1fqfsHYYbZYegfm4Xtwv/m86QsshYtz7jeUsA/LkHWzKbwNxw/1
         w81mrn99ZecEZigl3rSI/nTrr2re682CmtlY2N3nbvserD1P4Rz/26kc9EUzdr+oWDNy
         6X2g==
X-Gm-Message-State: AOAM531rGMnU01sQ2xYMH7XoiWWZjwIGqTb6blyX0aU2msvKNzDp+RQ0
	r2kKur63zJwxSHETPylZYBA3mqWJ3BnZ8g==
X-Google-Smtp-Source: ABdhPJx/OoRQ5V2S/x//lNVhGsedgEGqrwYd9/4Iz00NpbURzQa2TsJx1tegC1bWkaDRLq+HjgODmA==
X-Received: by 2002:a17:90a:8d86:: with SMTP id d6mr17660265pjo.120.1606592841826;
        Sat, 28 Nov 2020 11:47:21 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:21 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/16] python3-more-itertools: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:44 -0800
Message-Id: <cadb7b01d64a9a3de0e1b781daf244bee8b41dca.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-more-itertools/run-ptest   |  3 ---
 .../python/python3-more-itertools_8.5.0.bb    | 24 -------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest b/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
deleted file mode 100644
index 3385d68939..0000000000
--- a/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
deleted file mode 100644
index e924b0f731..0000000000
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "More routines for operating on iterables, beyond itertools"
-HOMEPAGE = "https://github.com/erikrose/more-itertools"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
-
-SRC_URI[md5sum] = "2588b5a7042576b99574779582be9292"
-SRC_URI[sha256sum] = "6f83822ae94818eae2612063a5101a7311e68ae8002005b5e05f03fd74a86a20"
-
-inherit pypi setuptools3 ptest
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.25.0

