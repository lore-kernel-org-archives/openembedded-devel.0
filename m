Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB76C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:56:17 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.12868.1647359777320294616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BTVibmzp;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id a5so20398269pfv.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uIoFWkygW0yWUEsQmYP4JtpgHHFKIg3GBmaMOGwyh/M=;
        b=BTVibmzpXkk5vYCy5dYp/llcbaF2Q75tEinnnf0ZNjZrFTCkNC2Duojgf6k7G59VIB
         DNn2Se5G/GFNiOr2AisCj8c10vDmFrgCD0fMdYo1eiGozI8TMKbfa4XvyT7Rlsk5mzeO
         Gk0HOY/hqgCQWfUq510VMSsrcmr5cIa26Fz56nYO52NBfjXRJigMwDSI/JxaazNT44Ya
         n6zXBRy4kHZaDObM4b/aK47t0B4knOYtb7j7WvypssdhFF6eWc1YcGWmBUGXqJBzra27
         RkARZ4KYDCpXwZw892FvS7KuW7r1RpkiUhhyJeKK+Gv7mGiztpFI+YKkCtN3sDKXsgYc
         4iMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uIoFWkygW0yWUEsQmYP4JtpgHHFKIg3GBmaMOGwyh/M=;
        b=WHqQ3qVsJwM4tx7HX5/1Crr0pmxqnSmD+YUfMmeKkcbl0ktqMKNYbJkK1ezKH3Leol
         LS1ZECLTRNkv8BFO03LxvgCa8cWKBXs2IH7EGsdK8SqfNXlDbDA89QVb+rHP6cUrzFLN
         QPPq2PnkZGOjECfIzuuNZ2TBOjVg8TCl33AFjl3Ev3V2pPjKbZbD6Q3zFfgsHROBsrJO
         mt06OD2yNFxVoJbqL/Us1MfR8dFctdNesbm+APX1kXCh1mNjasqjROFuT/zFHKAg7UpS
         N5X2300uI/DSzsZk5wXPbxHtUr6LG8hqT/mM+9vmN0tcleAGj4aQMEv3GdIzTGGai+F8
         r1mw==
X-Gm-Message-State: AOAM533Mw7+Y967Naf1M6tLyAkDVbzI9n3wUFBbIpR1egiVEDleg3HU7
	1qSipqIDefRDhH5rX2X7adK8EPkux9U=
X-Google-Smtp-Source: 
 ABdhPJxV9FF3KxNZ13Hx5XvHS+vTQAxuSGOXH5pGpKEG6IQdpq13txxvhDpxjwIOAGr6cgV8bM0Tqw==
X-Received: by 2002:a63:9049:0:b0:37c:7fb3:93f8 with SMTP id
 a70-20020a639049000000b0037c7fb393f8mr24857294pge.413.1647359776231;
        Tue, 15 Mar 2022 08:56:16 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1b20:4e7c:5db8:f14f:580b])
        by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b001bf50a8b468sm3912101pjb.51.2022.03.15.08.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:56:15 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-pytz: move to oe-core
Date: Tue, 15 Mar 2022 08:55:58 -0700
Message-Id: <20220315155558.969249-6-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315155558.969249-1-tim.orling@konsulko.com>
References: <20220315155558.969249-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Mar 2022 15:56:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95999

This recipe has been moved to oe-core in support of
python3-cryptography.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pytz/run-ptest             |  3 --
 .../python/python3-pytz_2021.3.bb             | 35 -------------------
 2 files changed, 38 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytz/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytz_2021.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytz/run-ptest b/meta-python/recipes-devtools/python/python3-pytz/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytz/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2021.3.bb b/meta-python/recipes-devtools/python/python3-pytz_2021.3.bb
deleted file mode 100644
index 119342a4bd..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytz_2021.3.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "World timezone definitions, modern and historical"
-HOMEPAGE = "http://pythonhosted.org/pytz"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
-
-inherit pypi setuptools3 ptest
-
-SRC_URI[sha256sum] = "acad2d8b20a1af07d4e4c9d2e9285c5ed9104354062f275f3fcd88dcef4f1326"
-
-RDEPENDS:${PN}:class-target += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-pickle \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-threading \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/pytz
-	install -d ${D}${PTEST_PATH}/pytz/tests
-	cp -rf ${S}/pytz/tests/* ${D}${PTEST_PATH}/pytz/tests/
-	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
-
-}
-- 
2.30.2


