Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6B5C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 05:31:25 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.8787.1711776677311563080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Mar 2024 22:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KTK0m3nS;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5157af37806so2871537e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Mar 2024 22:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711776675; x=1712381475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPGQxvj8alNPv+1/cXGWae+OOMrw6CVRx6sRmmY7SxU=;
        b=KTK0m3nSIpD1UPGEICc9CkobJF46ZnlsOgmtY040w0zwlf6ULEDhrVBhHEX6QY/Yma
         ILr2c6RQFeLiuehdZv2H7TkR9pufn0E+R/uBToyf1JSEdvRghl2d0zngjQmvRjhjrIx4
         h5eYkM6BMNt2GF8njEyzFkkm6/7ibQK0VJGQeHFMelN40V/DuI5bqGCVU2LV31yjbLJv
         H/H/0ITE9enrBy/4XDMeA9TCDDeKao+xwqDKmQcC32vkNuAD45mP8nMXXKxb9L08ckw3
         4p/Yt5Lq+JW7bu1quYdvVIVzwJD30z0G22wX2G6rKX/c8VyLkdjoneejKyLPilCIZjxs
         2r3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711776675; x=1712381475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPGQxvj8alNPv+1/cXGWae+OOMrw6CVRx6sRmmY7SxU=;
        b=Y83gajIQZLmpjxLsQGB9iITR0Jsi8LI0CZ8XZ6zuh8pcrKbwmZ+dv2MjdH9yRRr8r1
         cqcxOE3s+P2uCB/e3mM1ECBoeKRJ4MOnh0sULRqQO52fuCC/Z5gDmgrH9yJvnd/kIILX
         q9O61M24PHDi0wNpNezgkBSzys+jib5sZYnRvl8jjQ2nvHelhW8p/g69qvHwq+jMAx4t
         LjY3QKZFz8W5/4vXVNwtI8y8im3w9UVOgXpmUkEPMeyLvnrnj3oKCw2l6Dqo4dygUobh
         Bnwo4QYQSKvY9BTR1k5O9CDcFjLkLQhZCwyZkWZu7wt3BRi3Uc7IPVWvD/Wimc7Jt94o
         n5EA==
X-Gm-Message-State: AOJu0YzXa4cXzZND4VkE4qVxb2Vj0lW38nQq/GScXyr1J1W7WLtGPw3R
	9URQiLgJ8dubIeKmqzJGnv128MAbgd1wMSSHw7iAX7c00hcJiMhSRFGAE0V1ooo=
X-Google-Smtp-Source: AGHT+IEadESkxRPSI3SWQSmJxoD58y7KV18m1EhMTMFlO4Cu4nwQV8Y83vHN3pCRt392iRu5yITIHw==
X-Received: by 2002:ac2:4a71:0:b0:516:9f28:f3d6 with SMTP id q17-20020ac24a71000000b005169f28f3d6mr189842lfp.1.1711776674306;
        Fri, 29 Mar 2024 22:31:14 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c139600b004148d7b889asm10467364wmf.8.2024.03.29.22.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 22:31:13 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-validators: upgrade 0.22.0 > 0.24.0 and enable ptest
Date: Sat, 30 Mar 2024 08:30:56 +0300
Message-Id: <20240330053056.77274-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 05:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109684

License-Update: Rename LICENSE to LICENSE.txt and update copyright year

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_FAST_META_PYTHON

qemux86-64:

Testsuite summary
TOTAL: 599
PASS: 599
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 19
END: /usr/lib/python3-validators/ptest
2024-03-30T05:07
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 599
PASS: 599
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 18
END: /usr/lib/python3-validators/ptest
2024-03-30T05:10
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Changelog:

0.24.0
===========
Features

    feat: conditionally raises ValidationError; bump version by @yozachar in #343

Maintenance

    patch: domain & url modules by @yozachar in #339
    fix: domain name not confirming to rfc_2782 by @yozachar in #341
    maint: update dev dependencies; adds favicon to docs by @yozachar in #342

0.23.2
===========
Maintenance

    maint: rectifies changelog by @yozachar in #336
    fix: packaging as well as rST & md document generation by @yozachar in #337

0.23.1
===========
Maintenance

    maint: fix between & length validators by @yozachar in #334
    fix: manual nav reference for mkdocs; bumps version by @yozachar in #335

0.23.0
===========
Features

    feat: add french i18n validation by @imperosol in #308

Maintenance

    fix: Valid URLs failing validation - query and fragment parts by @danherbriley in #297
    fix: bug in between module by @yozachar in #301
    chore: update dependencies, improve packaging by @yozachar in #304
    Fix fragment check by @darkdragon-001 in #305
    build(deps): bump urllib3 from 2.0.6 to 2.0.7 in /package by @dependabot in #310
    fix: allow pct-encoded entities in fragments by @conitrade-as in #317
    chore: update dev dependencies by @yozachar in #318
    build(deps): bump gitpython from 3.1.37 to 3.1.41 in /package by @dependabot in #321
    build(deps): bump jinja2 from 3.1.2 to 3.1.3 in /package by @dependabot in #322
    chore: monthly updates for Jan'24 by @yozachar in #324
    maint: adds versiond docs; update copyright year by @yozachar in #329
    chore: update dev dependencies by @yozachar in #330
    build(deps): bump gitpython from 3.1.37 to 3.1.41 in /package by @dependabot in #331
    build(deps): bump jinja2 from 3.1.2 to 3.1.3 in /package by @dependabot in #332
    build(deps): bump urllib3 from 2.0.6 to 2.0.7 in /package by @dependabot in #319

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-validators/run-ptest       |  3 +++
 ...0.22.0.bb => python3-validators_0.24.0.bb} | 26 ++++++++++++++++---
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-validators/run-ptest
 rename meta-python/recipes-devtools/python/{python3-validators_0.22.0.bb => python3-validators_0.24.0.bb} (23%)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ccb443182..2f7babe48 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -73,6 +73,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-u-msgpack-python \
     python3-unidiff \
     python3-uritemplate \
+    python3-validators \
     python3-wrapt \
     python3-wsproto \
     python3-xlrd \
diff --git a/meta-python/recipes-devtools/python/python3-validators/run-ptest b/meta-python/recipes-devtools/python/python3-validators/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-validators/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-validators_0.22.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.24.0.bb
similarity index 23%
rename from meta-python/recipes-devtools/python/python3-validators_0.22.0.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.24.0.bb
index 1da7ee4a0..78261dd67 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.24.0.bb
@@ -2,9 +2,29 @@ SUMMARY = "Python Data Validation for Humans"
 HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf28bd09a60e145c3171c531b9e677d"
-SRC_URI[sha256sum] = "77b2689b172eeeb600d9605ab86194641670cdb73b60afd577142a9397873370"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
+SRC_URI[sha256sum] = "cd23defb36de42d14e7559cf0757f761bb46b10d9de2998e6ef805f769d859e3"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
+
+SRC_URI += " \
+	file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+	python3-pytest \
+	python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+	python3-crypt \
+	python3-datetime \
+	python3-netclient \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


