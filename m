Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B78AC433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 05:29:36 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.30128.1642310975049407714
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dgwNde0B;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id a5so6679466pfo.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Cym1qgoz8PjimmqXNQO1w3yUi8y8zkjISY08gom5P0Y=;
        b=dgwNde0BaF0o7WVYRRJ/UA5ajSwy18cyo2vHJ+I6LpOUmxcW8E4PQiPKjXNz3ECXfp
         L94+xA3nTPlfq1QCK3CtCPrdBFRq4RPcH2fA1MH9IWI0i/yNe9MWQ1tomjMYGQNU6xeE
         7k4vSc4QXJgQIWlWE5dqJm/1XQhB6wKbkMFVVHrDw653J+yCDV/iZpcGG7A+pPJvmwBR
         B3GNA9J6s57eeK9bDoyIhuRb2txx5JanBFPc+HmKDIuKLrXRrMQ/JaCMsAFWIXt26nZv
         6s0MzTqiXXzNSq+Qw3c2JwZMyRLzSSLaFQXLVWiZRd1CWFTfdxwBW8WUKKZDNn5FR1kd
         k5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cym1qgoz8PjimmqXNQO1w3yUi8y8zkjISY08gom5P0Y=;
        b=jdU1rXryLST2rfcdyKmwBLwcud8NSArWlCppyZThrv0Mw+SX/nkf41+wchYs1hCnn7
         7Jw785j89a6lhp4AGYzXeXkk+b5+7RVDN1XOdheIVMKEcBJ+NYis7Eotj8QxLD8DEvCF
         H3CxQM3kZa6GPp9Rb+lvBVsk1csy2qu8uaqZXPCchzKPZ0KZ+5YI8q/qxRFafwbLrLDg
         ApXHfqMt7cRr26XRsStfBFSKT/ZaG8mPVi1i1o5BaOIxIdWhjN/eFcgpB1wwKqlxR9NV
         OAw1DXFyeBROtNXNlDjuX9GduSkghrMpB/jMljS5ptAgbe1MA3gYc/Xco0RI8zmdhrdY
         JTCg==
X-Gm-Message-State: AOAM530GN5GQnywRks5BJUmvTgpSaZr+khym97mynaewrejAt+L2UYTh
	1nJyVS3ZuJjD2pllCk6lexdo5TtQiiV0Ww==
X-Google-Smtp-Source: 
 ABdhPJw90lfHn3YiOxm0VMlAsslty+NfRftK52v1nQ4E16ZgyRubz2inCyj2F3z8ESZ+cqnYSBx5MQ==
X-Received: by 2002:a63:6bc3:: with SMTP id
 g186mr14129927pgc.192.1642310974242;
        Sat, 15 Jan 2022 21:29:34 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bfd3:7196:2716:eb37])
        by smtp.gmail.com with ESMTPSA id
 l11sm10062146pfu.115.2022.01.15.21.29.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:29:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/7] python3-pytest-subtests: upgrade 0.5.0 ->
 0.6.0
Date: Sat, 15 Jan 2022 21:29:02 -0800
Message-Id: 
 <ca300a20a3ede2c7f3302e52b4f24f41de725c8f.1642309436.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1642309436.git.tim.orling@konsulko.com>
References: <cover.1642309436.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 05:29:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94880

0.6.0 (2022-01-15)
* pytest>=6.0 is now required.
* Added official support for Python 3.10.
* Dropped support for Python 3.5.
* Users no longer need to configure a warnings filter for the internal A private pytest class or function was used pytest warning (#52).
* Experimental: Use SUBPASS and , for passed subtests instead of general PASSED, SUBFAIL and u for failed ones instead of FAILED (#30).

References:
https://github.com/pytest-dev/pytest-subtests/pull/52
https://github.com/pytest-dev/pytest-subtests/pull/30

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pytest-subtests_0.5.0.bb   | 16 ---------------
 .../python/python3-pytest-subtests_0.6.0.bb   | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
deleted file mode 100644
index 2e03512bde..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.5.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "unittest subTest() support and subtests fixture."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
-
-SRC_URI[sha256sum] = "5bd1e4bf0eda4c89a6cd42b0ee28e1d2ca0848de3fd67ad8cdd6d559ed00f120"
-
-inherit pypi setuptools3
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pytest \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
new file mode 100644
index 0000000000..5e4847b8d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "unittest subTest() support and subtests fixture."
+DESCRIPTION = "Adds support for TestCase.subTest.\
+New subtests fixture, providing similar functionality for pure pytest tests."
+HOMEPAGE = "https://github.com/pytest-dev/pytest-subtests"
+BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
+
+SRC_URI[sha256sum] = "3ebd306a8dcf75133f1742f288c82f36426ebcf8a132d4ee89782d20e84fc13a"
+
+inherit pypi setuptools3
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-pytest \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


