Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1178CCEACCB
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 14:14:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.82882.1727792057530025660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 07:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KnVtRRMS;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5398b589032so4955230e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792055; x=1728396855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WBOO8RSjQQj9ptMqPlRnPlDvTLf1uxARGwQurCznp/M=;
        b=KnVtRRMSgOIPJT8BkyuwUq4sP8WAKRcZt3DT/rwDLJB9h+oBhVplpbqUNxyQ6UF37b
         1//tIkN4nE0lveAJ4pQh1yEzMEc7HTyjM5VFx4LDYgcOjdmynvmoSPB4y3qc51yxB/83
         iqqYMXCrI8F7aTDb4BxOVsKn2RtD8Dv5WTdduWKN0yxGyLK/LiAFp+fx8FM1X0sor3v/
         fvzXg4gSKLe8YLSQHthkvyMdj8w1iQOsBL4cdxAVi6TFLuwqDjVfVMkHQk7Y1I0eeH99
         EljGM5JL3/f2ONwL0XdIC57NlC6zRBPEQBEt21yJxoU6D3cTRFGZwdaFsnXgfPzrsULq
         cGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792055; x=1728396855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBOO8RSjQQj9ptMqPlRnPlDvTLf1uxARGwQurCznp/M=;
        b=F3AsCQWs27oYXkZKCX2z4vbs1A2t3M5cxYVJUPrSLt+nj9HyRdZovwSG9PC70uPMWD
         ri7IGRJ5nr6n09w4/4TnXwpDeYqh2diWGKY1vYLjip4aEGtK+tXyv4ic1NtS+xQY0cnw
         nmYTGcQjysZBQaglnp1UwPWLKlx+AxWGguTkwZ3odfu8cGTd1YIVbFKhq/ejNHqsRlS2
         5SdZQvN5l4JXW9ncrnLc47gXx+lJMoTBBck/GaT++SxskuvCjzZIlM/idEM6jdmXqFmi
         Q/Sn1ooyDHoB9LUXTQTn2hsUVw+VXXrg2aETDcaXaWxSH7wiOovzwspyl6EC4smPGAxC
         DXNg==
X-Gm-Message-State: AOJu0YzSjfuLk/cYwN3WCsETMgvOfmcNF+PH3RrspZEN/oKgE2v9wtpz
	M2SDuH5F0GPefSG/mJfEkr4GGoyNEuaiywe+NEqM8RGyZg0Y3ABwWyIn2stjWAO6IJ131CEkS90
	V27Y=
X-Google-Smtp-Source: AGHT+IHdqkvjbLWIhVVXHdQw5xg4SbAvO6oEs23gphyPlHO3jG2pxkwvaB+BCn9g/z2bpB/KwITBow==
X-Received: by 2002:ac2:51cc:0:b0:539:8d2c:c01a with SMTP id 2adb3069b0e04-5398d2cc08fmr7568593e87.29.1727792055406;
        Tue, 01 Oct 2024 07:14:15 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e3basm1605268e87.93.2024.10.01.07.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:14:14 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][PATCH] python3-pefile: remove recipe
Date: Tue,  1 Oct 2024 17:13:52 +0300
Message-ID: <20241001141352.54484-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 14:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112632

It has been moved to oe-core.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 -
 .../python/python3-pefile/run-ptest           |  3 --
 .../python/python3-pefile_2024.8.26.bb        | 28 -------------------
 3 files changed, 32 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python3-pefile/run-ptest
 delete mode 100644 meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index f20eff219..ff48e9d14 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -36,7 +36,6 @@ PTESTS_FAST_META_OE = "\
     pegtl \
     protobuf \
     pv \
-    python3-pefile \
     sdbus-c++ \
     uthash \
     xmlsec1 \
diff --git a/meta-oe/recipes-devtools/python/python3-pefile/run-ptest b/meta-oe/recipes-devtools/python/python3-pefile/run-ptest
deleted file mode 100644
index 95ae72306..000000000
--- a/meta-oe/recipes-devtools/python/python3-pefile/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake --ignore=./tests/pefile_test.py
diff --git a/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb b/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
deleted file mode 100644
index 87e651d9d..000000000
--- a/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Python PE parsing module"
-DESCRIPTION = "A multi-platform Python module to parse and work with Portable Executable (PE) files."
-HOMEPAGE = "https://github.com/erocarrera/pefile"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e34c75178086aca0a17551ffbacaca53"
-
-inherit setuptools3 ptest
-SRCREV = "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
-SRC_URI = "git://github.com/erocarrera/pefile;branch=master;protocol=https \
-           file://run-ptest"
-S = "${WORKDIR}/git"
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_install_ptest() {
-   install -d ${D}${PTEST_PATH}/tests
-   cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS:${PN} += " \
-    python3-mmap \
-    python3-netclient \
-    python3-stringold \
-"
-RDEPENDS:${PN}-ptest += "\
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-- 
2.34.1


