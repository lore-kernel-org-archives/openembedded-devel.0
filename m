Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EB4C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 03:31:24 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.2982.1645846283302120081
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 19:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d+4DtJtW;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id d15so3061301pjg.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 19:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=65eFjLHW+z3obL0P4Yn++a0CfrCusbaEVKfuz26zfeQ=;
        b=d+4DtJtW0B9CKwquSwdHqYy6vBOYuj0NodmL/sUNS+NuXC0vgKq3onzReJlilM3sql
         iQetIBn8EetdLnZ3gPwSa/wThaIGp5tMdLUIq8bEuR0LiGLihOgsr7kZQq680wGXRrS4
         AvkumFuGHNNYEc7pPzcdigYvEDjj6FAlQVn/CrwmxiPKlPbXgI3P+jhAvlvzA5Wox5zF
         QxGy8GGLHBwcvTLeZl5qQ1hhx+sfidLkeSb/k4x5I17dA5/rcUwZotrctnZhr7CQnFdR
         9uLj4FMUEvPVm0Umm2Au7N1naA8KZ0xWh6wHYQx169+qLym/0RmCUYV5sRfVdpMlRQ0S
         x60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=65eFjLHW+z3obL0P4Yn++a0CfrCusbaEVKfuz26zfeQ=;
        b=MlDU4GE3q7i4EI2BqbVRlZ4XZ0E5ojH4h+LNG8dnMGxTp78DOvhIv3rZIYfPE/zyyZ
         m9Tu6outugG1blyt9QqO0TMJUcWQqIPPM34eQaPFHz1rh49OTq7Aa4ngioRLxbQt9b9W
         qXOamtrF5dh1rDOKKpGOJNlVG4ihuG5KVDNz0l1Y7tIk1ZF7VkAelFGXbuyZfMrMg8Vj
         vgtzVgdM4LSP0/di3TX/uXw6YqMzZBDmwkK+Wlpvd560CM9OLC0/Tj8vYbXSl9s+8qjn
         eOULAlsaQ7wr7imY0AuZfw2+lrMXjkNBpsxtIaG+wPvxUaMDF8Ls8pr/ZpFBa1rbfp6O
         tXtA==
X-Gm-Message-State: AOAM533XIi4vRSlBVH74JMtAi94Llba5n2D1gGDWf0ICICIoLy+CTH9c
	y9hQMCh27bet7Ik3G4UJJHSfWns2a5I=
X-Google-Smtp-Source: 
 ABdhPJxjqGpp5kSv7HK5lpKUuPB+vkHAe4Wk8nyUXgDSp1VTwnrdTzkN2tjiNEwIXBf2szuEjHg/gA==
X-Received: by 2002:a17:902:db0b:b0:150:2a0:189c with SMTP id
 m11-20020a170902db0b00b0015002a0189cmr10146416plx.128.1645846282382;
        Fri, 25 Feb 2022 19:31:22 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 y17-20020a63ce11000000b0036c96df445fsm3800513pgf.53.2022.02.25.19.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 19:31:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] ptyhon3-ipy: drop recipe
Date: Fri, 25 Feb 2022 19:31:00 -0800
Message-Id: <20220226033100.1353815-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 03:31:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95533

Does not build with bdist_wheel. If you need this package please work
with upstream to update to PEP-517 packaging.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  2 --
 .../python/python3-ipy/run-ptest              |  3 --
 .../python/python3-ipy_1.01.bb                | 32 -------------------
 3 files changed, 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ipy/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-ipy_1.01.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2b20937f78..ae9c86e7fb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -190,7 +190,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-intelhex \
     python3-intervals \
     python3-ipaddress \
-    python3-ipy \
     python3-ipython \
     python3-ipython-genutils \
     python3-iso3166 \
@@ -500,7 +499,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-html2text-ptest \
     python3-inflection-ptest \
     python3-intervals-ptest \
-    python3-ipy-ptest \
     python3-iso3166-ptest \
     python3-jdcal-ptest \
     python3-jinja2-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
deleted file mode 100644
index b63c4de0d9..0000000000
--- a/meta-python/recipes-devtools/python/python3-ipy/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
deleted file mode 100644
index 8b39679e45..0000000000
--- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "IPy - class and tools for handling of IPv4 and IPv6 addresses and networks"
-DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6 Addresses and Networks \
-in a fashion similar to perl's Net::IP and friends. The IP class allows \
-a comfortable parsing and handling for most notations in use for IPv4 \
-and IPv6 Addresses and Networks."
-SECTION = "devel/python"
-HOMEPAGE = "https://github.com/autocracy/python-ipy"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
-
-SRC_URI[md5sum] = "d6cf83e7f418ebbd23324ba1c658b907"
-SRC_URI[sha256sum] = "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a"
-
-inherit pypi setuptools3 ptest
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
-	install -d ${D}${PTEST_PATH}/test/
-	cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
-}
-
-PYPI_PACKAGE = "IPy"
-
-BBCLASSEXTEND = "native"
-- 
2.30.2


