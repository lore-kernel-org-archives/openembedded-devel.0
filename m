Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A85C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 21:15:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.3538.1645564551274538787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 13:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jxulJeCZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id 4so8175662pll.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 13:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQCIVrLgMsK0wZtK4A4aSyFpxHT2wFz8lsPgwcNN540=;
        b=jxulJeCZQpbHQ4jMn6h16uvJ2Ub+kM9s1mzByyiTg37G0xG7mEJQBwOIQTiGix+LvH
         MUNiDHzl53vf337d4y3NWrF9GJTbKb6to0HObZZomu3UsGOUW3ti4UJxQdxULqJ68rgI
         20ZozyFWDTMVc5K0Mk8GmKhYa22IY4nSISmBZ22ZtQou11Y3E0EA8ejAsAeQ6tmdATBC
         stRPHuaA/3tWv9Ra9Q33rdINLzcTINYjhSly2M7Tjw2Uk1HCfY5N+lf0bcge7MFYyagM
         5dA67LQU6PPa2IBZ258R3i50Ud74jr5MKCLQZrD3luITnXf00h5o96zLvPJqaOhtp3lT
         uaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQCIVrLgMsK0wZtK4A4aSyFpxHT2wFz8lsPgwcNN540=;
        b=kTYtUolKeiy2AbNXFqcQEqomdoYpwM1jYdDgtTQeqE55QdRHvSDG4CBlyDx1LR8Y8t
         k+q6uGJY9khuGp13eUxfFKjxYY78cvBXgUztUtFuk2YJRlTgA4M8yNoC++uNRL/Tc+Mr
         kh9oxGH1G6CbvSnnmoOm7Pm4PzNEYiPiMrsVx9gtqx9m+Heuns+IAYgBQ6LXxzDkgwuz
         QdtHWQ+laWn+TOdIrPiktNLGC9GX1NoZwfgSNtUmN8tYRYdiC/CZra7vVun7CrdViivk
         Aq2nLK4vbpFYLYt6Q68//c+W6BPh6EbdJmNQS0hI8G2FtROBNhuQ0cy72Ff10t9khFeo
         xAVQ==
X-Gm-Message-State: AOAM530LUHB7+7GPelRsac/yn+sUZ/3vfU356eyN4PF86H+rS5LxESX/
	/gRnNqsyg+NgaMJkj4mHqVUdctJcPevG7g==
X-Google-Smtp-Source: 
 ABdhPJzGETseCW4ZEkAbQsc+i0DxdLp245rCE1zFFsEykZ5JNaPTpRYNPp3P+yeecjBjd1QUOvj9gg==
X-Received: by 2002:a17:90b:1b51:b0:1b9:b61a:aaf4 with SMTP id
 nv17-20020a17090b1b5100b001b9b61aaaf4mr6027457pjb.79.1645564550152;
        Tue, 22 Feb 2022 13:15:50 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 h9sm18198024pfv.135.2022.02.22.13.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 13:15:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-test-generator: drop recipe
Date: Tue, 22 Feb 2022 13:15:45 -0800
Message-Id: <20220222211545.2340237-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 21:15:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95451

python3-nose still contains Python 2 code which causes errors in
do_compile when using bdist_wheel or PEP-517 packaging.

Like nose, test-generator has not been touched since 2016.

Drop this recipe unless someone fixes the issues in python3-nose

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  2 --
 .../python/python3-test-generator/run-ptest   |  3 --
 .../python/python3-test-generator_0.1.2.bb    | 29 -------------------
 3 files changed, 34 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-test-generator/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 8b574bdf0f..8345fc5989 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -423,7 +423,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-tabulate \
     python3-term \
     python3-termcolor \
-    python3-test-generator \
     python3-textparser \
     python3-texttable \
     python3-thrift \
@@ -535,7 +534,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-smpplib-ptest \
     python3-soupsieve-ptest \
     python3-sqlparse-ptest \
-    python3-test-generator-ptest \
     python3-typeguard-ptest \
     python3-ujson-ptest \
     python3-u-msgpack-python-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-test-generator/run-ptest b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
deleted file mode 100644
index 5cec711696..0000000000
--- a/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest
diff --git a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
deleted file mode 100644
index 7f212ddd87..0000000000
--- a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Generator is a helper for generating test methods for nose while still using unittest."
-DESCRIPTION = "Python package with modified subclasses of all stdlib XML \
-parsers that prevent any potentially malicious operation."
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=041a2bff595d40ccb4b36356f89dab00"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-SRC_URI[md5sum] = "6c69e73ba5b4b3ed62f7bcda071c64f1"
-SRC_URI[sha256sum] = "ad5925c814bfe79497b43df096e3bb52c166d1577f7aff160137301676232f4a"
-
-inherit pypi setuptools3 ptest
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-mock \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-DEPENDS += "python3-nose-native"
-
-RDEPENDS:${PN} += "python3-six"
-- 
2.30.2


