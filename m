Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.36762.1606592839783718788
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=igkhAoah;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id w187so7392474pfd.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HbdyqHCQBj+hmCWhbtbhMu6PYhOwrQG+sYcz2i+mEZA=;
        b=igkhAoahjmMh8p6B0iTYZENP802TgGNvi4kFkJucyoOpbIbyyJBZ0g4w/XpFqS3OOf
         VhRpjGG3Jx4MF09Z3MgihAkJesQ+mn88R/yRQCkfC+ZtVBZwDF4rS0Fmd4GcxNpujQHn
         wwlNPgen1kr5ZLLdsBCRAUrcNuDKxCDUoxk+X7sNepDsCNnWA1yV4OeOEDOAHREnF8Ep
         4jG6Wkwde4UZsLTH36IHivYMczLsLiwC3bewBF0svPJveMUqXlv5fGO8b/PrCOcsSJrf
         3Ws8vfMBpecun2TDzAD3EQ/xrdFMMtfpNWWQ5y8oHPb0vkLZT6vmu9YOARqNqT6gMPW5
         B/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbdyqHCQBj+hmCWhbtbhMu6PYhOwrQG+sYcz2i+mEZA=;
        b=erNv9RyGtWBQab9103ZpxONovavUVJiehXICraqkPctU16sJso25hvAGEbfYMJ5ujy
         qWB7Mz8L0wLNNGC1EtAz0x8i0GR1gljjJf3swEP7+ZiGvCl7nWdUErdLY/TpNsYqVeza
         xBnzwLv224o3MPKcORoQZJN1JjJzuld61H2+Ct5jJcesDE98XznWRC1pl72sC/tK1CdJ
         442CVIZkT68GnyZsvd2cq/lAa46xqxUeWXRLXFTplHSZu7TkKAmmkggOKNELNAUzmxSi
         2UVweBpmErCO7ftrKT8szH5JMQV+ZUfJUyscgOrxCr9A6h5mMoNGtCYfmhrQy4AdFnvt
         jCRA==
X-Gm-Message-State: AOAM533auk0iM5Bb+wpPt+3C6EbqAEJfuuKv+vS+aKG/bYa7lf0ewzYL
	fuePntIjdBRWtEXsIjr2ARqpZdv/8edXCw==
X-Google-Smtp-Source: ABdhPJyLs9KMoHWGwJPPVJ4aRrXQUbe4WXHDCURH574Kyp9nSARFVuIL3v6Yv3KuuS5C2J+Wg5v/fw==
X-Received: by 2002:a65:60d8:: with SMTP id r24mr11306510pgv.152.1606592838810;
        Sat, 28 Nov 2020 11:47:18 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:18 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/16] python3-atomicwrites: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:41 -0800
Message-Id: <2bb86ee96cc90afbf46aa36c6f31d74f93fbead2.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-atomicwrites/run-ptest     |  3 ---
 .../python/python3-atomicwrites_1.4.0.bb      | 25 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest b/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb b/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
deleted file mode 100644
index 7edd41030f..0000000000
--- a/meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Powerful Python library for atomic file writes"
-HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
-
-SRC_URI[md5sum] = "b5cc15c8f9f180a48665f9aacf91d817"
-SRC_URI[sha256sum] = "ae70396ad1a434f9c7046fd2dd196fc04b12f9e91ffb859164193be8b6168a7a"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-unixadmin \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN} = "${PYTHON_PN}-misc"
-- 
2.25.0

