Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D16CD8CA9
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 16:54:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.95994.1696954086767450211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 09:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=fCi/5JUi;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3296b3f03e5so3871025f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696954084; x=1697558884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2yUGR8Hc7ArLBNqKcFQ/V/bihse2zrP57vNTaKhNwI=;
        b=fCi/5JUiSWti3pGY0PWpgSKEWiJEoiXh14Utjst31dDqesog6aBbpoTRzJsGti34M1
         hCcbEXZHkR7yZha4XQCOxmgIfomVG7GYHTej2InEwk9ddMFkqDfZvcpDAyGuEjkgvX8f
         EMr8xo26RVJ3yNrrzmBrAgDkuj+9kwWJnf6Pf76eyk5KgyYh0vKu/KYEx/3iBbc5sd6I
         1PWbTK158QE7OE4Pymqkefu4oSYTFcs1AUl7XMC36NkSoFEGAZNfoVaFsv8McRgYYvvf
         zUmvK9Q1N2UxzQBnQg9sI5aOxyps6S+OJp4xmjaNwr7uR7/jUY2Zrk/c8Ko7nsa9wLUH
         +vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696954084; x=1697558884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2yUGR8Hc7ArLBNqKcFQ/V/bihse2zrP57vNTaKhNwI=;
        b=HOMQcZRwCnHE7fZLJoMeWka5AmeiVQKB5+coRB3KEcrpwMAENLDlsXJ/aopHaPx2AH
         BfCnoTG1PPbHTCyaSsk4k4snsEm2r0kXMQ/p7uIV4H3AI9Jvf2/uQeyhjgeAmaakc5hs
         i/+IQZMhHU0yhRo6+bvaD8QRTXS/3ZjOU+4PSFRMF3JIYWqElMURpGtAE0jDfv4gFUVE
         +Lw1Bixo08QyfmEbR+dSA8A+hugnW7ws2v+6llDDOKgkuuuWAgIIvsVJ2DhlNqZJYEpY
         YpKQ3nFjgWXr4lA3YkWdUmMwmbGhZLf0BgfIv3sR4JJ2NFpK0/OYJEJ7PX91l2UYmd4r
         Yd4Q==
X-Gm-Message-State: AOJu0YzLmgf5N+1zISl9f6ps85QPBL/j7mLetwWvZ7CMl1dGcyrmzsXO
	JJ4KBq1+Xtq9GwbJkbzdCMsMCaXmFJN5/etDOgY=
X-Google-Smtp-Source: AGHT+IHApIP3Y/EZVb5clw0Q8lbAXnMsek1Y+21Hp/T3r8U31DNizS3UzUimzTczrY3TK2gqHBue4g==
X-Received: by 2002:a05:6000:10c9:b0:317:636b:fcb1 with SMTP id b9-20020a05600010c900b00317636bfcb1mr16147997wrx.27.1696954084558;
        Tue, 10 Oct 2023 09:08:04 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d68cd000000b0031ae8d86af4sm13013696wrw.103.2023.10.10.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 09:08:04 -0700 (PDT)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Mickael RAMILISON <mickael.ramilison@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH] python3-rapidjson: add ptest
Date: Tue, 10 Oct 2023 18:07:40 +0200
Message-Id: <20231010160740.1711437-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 16:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105412

From: Mickael RAMILISON <mickael.ramilison@smile.fr>

Signed-off-by: Mickael RAMILISON <mickael.ramilison@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-rapidjson/run-ptest        |  3 +++
 .../python/python3-rapidjson_1.11.bb          | 20 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-rapidjson/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
index 930ad3434..3ea559488 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
@@ -9,14 +9,32 @@ SRCREV = "e1b41f64df1705770b7b70d7221a4812909c1d0f"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools3
+# Inheriting ptest provides functionality for packaging and installing runtime tests for this recipe
+inherit setuptools3 ptest
 
 SETUPTOOLS_BUILD_ARGS += " --rj-include-dir=${RECIPE_SYSROOT}${includedir}"
 
+# run-ptest is a shell script that starts the test suite
+SRC_URI += " \
+    file://run-ptest \
+"
+
 DEPENDS += " \
     rapidjson \
 "
 
+# Adding required python package for the ptest (pytest and pytest->automake report translation)
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unittest-automake-output \
+"
+
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-core \
 "
+
+# Installing the test suite on the target
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.30.2


