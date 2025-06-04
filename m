Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EA5C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 06:39:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.9996.1749019139194067469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 23:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e127DHPm;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-312cbedfad1so424177a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 23:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749019138; x=1749623938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+kka0LyEJcaxDLsUTmhT82YT/z0WR/bZ3slA8x5AR4=;
        b=e127DHPmNxfloq3OMg9Fcgk7kBNLU8sj2u29aL0ugTbjG6mTa1Ijl2c58/MmxDwzqe
         PfMEMwiqB3/Pf4DJhuak2ZDmSp9Wk8VJjMMity0nwtNFpvgAoXanmiptfZyl9va79/OI
         yPzlA87lpeqVmYotBTOaj0tRULSIZTylNHG1d5/SfqbYpDCxt4P1YWNTZ8j9KRri6ZIh
         Fks5a06D/MnOZmEn7/Ma5UbBrlKNturdrJDu62faOz3VYvOmsRNOi9gEMffNSBsYRqj+
         hnKKh1DAIeHjvX62d5YFw978AnaFEnzBpqQUDaOCc3snf5Lrd1AMTCzF0aKgdfBxwULA
         oFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749019138; x=1749623938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+kka0LyEJcaxDLsUTmhT82YT/z0WR/bZ3slA8x5AR4=;
        b=nmR9W5ErGOM9uRF/0gbohqntwtDrhi991sjqmS1v6MWN4+AiDGpM/yow8xaMrD3HK+
         afxPw+lx/TPozh7z2HR0mdVax3VFAV/2FCKy6dLL5PWRRge7gsDHaPCQwnW+2sjPC1a+
         el8ZAvRV3L4Jt8srVJ4/aoQvpmntUv37MRDVpsXJ8odGaj0LVdEeXvN53eDsfzLC5Lvb
         onrPUrUtOR8eCIsil3MpMPYTOwG0nTtue3All/Pfv23ZNrFteJlqW2cPrBODNddy5Bbr
         xJ6cAVA0UONbQkCsbwpdnu5CoNAyjahxcszCaV+1C0f6uD5kNA+eYz+fkS1/0pCntxEm
         uSlQ==
X-Gm-Message-State: AOJu0YzfYRBxs9Nfj+fB4K+vCcG1nFWAoN3366KSysK9uyHsMfLFU49S
	OIJBQF2BchbhxrghdzIqDOpp8FsffvifSFlG4A8/xI4CcTHQeNOHIBr5dsjGT1ms
X-Gm-Gg: ASbGncuiKQcl1WCZOwJTR+6QKfa5LxiNIpBoz/v784nkXMmaSzEWSrIhhzfcvC6/SXv
	nCxL8nu8v+ahZQ6HaPX6Vx+tz/yoP/ljJ7vjji+BeLblAAqckWS/j5Bu1s5Wwn4CKoKcbhNG1pI
	aGMPS9e3KEO6bedMSQfq0bgOLrADfWoNzUVkR1tj2qqyT9nFJ+TEmN3gYXX17Q0LaY7zCT7ulpB
	x2LQo4Ggt9EVPENf5jjzweyUfaEx+nStf4T1M1NP1cR2rNLcIAAoXlI1uUJbVkO5oRmvmX4v4Ux
	3LWg9yVXoJR0rMn757DHTqt0CY7SEhSSEeBfJ/YjWw==
X-Google-Smtp-Source: AGHT+IFAoczdJzB6fFqoXODtfv0JVp3WrtpvEWVp8aGXqzmRrzrkF9Y3wz4m48fXonXmKSEW4Dn+kQ==
X-Received: by 2002:a17:90b:380c:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-3130d4b1c6dmr2862043a91.0.1749019138209;
        Tue, 03 Jun 2025 23:38:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::d6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e32feecsm8218453a91.47.2025.06.03.23.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:38:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pytest-sugar: Add recipe
Date: Tue,  3 Jun 2025 23:38:54 -0700
Message-ID: <20250604063855.1908198-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 06:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117728

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-pytest-sugar/run-ptest     |  3 +++
 .../python/python3-pytest-sugar_1.0.0.bb      | 23 +++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-sugar/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-sugar_1.0.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index b953ae2502..c62bfab034 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -72,6 +72,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pyroute2 \
     python3-pyserial \
     python3-pytest-mock \
+    python3-pytest-sugar \
     python3-pytoml \
     python3-pyyaml-include \
     python3-pydbus \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-sugar/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-sugar/run-ptest
new file mode 100644
index 0000000000..b4bf4b65d8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-sugar/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -vv | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pytest-sugar_1.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.0.0.bb
new file mode 100644
index 0000000000..9ce29aef7e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-sugar_1.0.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "pytest-sugar is a plugin for pytest that changes the default look and feel of pytest (e.g. progressbar, show tests that fail instantly)."
+HOMEPAGE = "https://github.com/Teemu/pytest-sugar"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dfc31f3b2a6a301239a1ba99b71a9459"
+
+SRC_URI += "file://run-ptest"
+SRC_URI[sha256sum] = "6422e83258f5b0c04ce7c632176c7732cab5fdb909cb39cca5c9139f81276c0a"
+
+inherit pypi python_poetry_core ptest-python-pytest
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[dev] = ",,,python3-black python3-flake8 python3-pre-commit"
+
+do_install_ptest:append() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/test_sugar.py ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += "python3-packaging python3-pytest python3-termcolor \
+                   python3-core python3-packaging python3-pytest \
+				   python3-pytest-xdist"
+
+RDEPENDS:${PN}-ptest +=  "python3-tox"

