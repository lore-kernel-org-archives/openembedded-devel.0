Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9548CA1016
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 22:13:31 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.7369.1757024008328412647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 15:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DwQsy2mL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250904221326279d02528d000207dd-_ntv1e@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250904221326279d02528d000207dd
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 05 Sep 2025 00:13:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9t3AGoKUaOUQihgKbw4p0MUE6H5WcUWIhYUvHY5VlWk=;
 b=DwQsy2mLz6ZS1+tsnCUfabgtthAuvnflYWnEKQXsIDLOpn2WiVz3IuGyEsrmPhD5Xmb3CB
 L4Q40hGTAIZYEExbYlmfzYuuF8nDfCXfZlowjiXN+ePd3tm4epGVqFiZcjwB2/ptuU+YEP5O
 nWDNUsFzAxZwf0Mk2mRWDv3ge1QP96E2niIMsyDekLru2hVZ1yIf3zggtDTDtWxzmm9juxAh
 y5vu8L5U08uXw2Gyml8BSZ/kUxaLWDOLhEyrrgnM5+Cb4G2Za0eMoHch34z9itYwJpobYxH2
 BSd9nucuT5bCSLAV9MMuhReYWq83ZRNzquRcsLTFXmEWrCcnjMkt2OoA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 09/10] utf8proc: add new recipe with ptest
Date: Fri,  5 Sep 2025 00:11:38 +0200
Message-Id: <20250904221139.3131569-9-peter.marko@siemens.com>
In-Reply-To: <20250904221139.3131569-1-peter.marko@siemens.com>
References: <20250904221139.3131569-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 22:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119306

From: Peter Marko <peter.marko@siemens.com>

It is needed for poco 1.14+
Ptest runs for less than a second.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../utf8proc/utf8proc/run-ptest               | 15 +++++++++
 .../utf8proc/utf8proc_2.10.0.bb               | 33 +++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
 create mode 100644 meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index d77b97d576..18324ff0d3 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -44,6 +44,7 @@ PTESTS_FAST_META_OE = "\
     pv \
     sdbus-c++ \
     tomlplusplus \
+    utf8proc \
     uthash \
     xmlsec1 \
     zeromq \
diff --git a/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest b/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
new file mode 100644
index 0000000000..349e496d68
--- /dev/null
+++ b/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+execute_test() {
+    eval "./$1" && echo "PASS: $1" || echo "FAIL: $1"
+}
+
+execute_test "case"
+execute_test "custom"
+execute_test "iterate"
+execute_test "misc"
+execute_test "printproperty"
+execute_test "valid"
+execute_test "charwidth"
+execute_test "graphemetest data/GraphemeBreakTest.txt"
+execute_test "normtest data/NormalizationTest.txt"
diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb b/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
new file mode 100644
index 0000000000..e42d16b8b7
--- /dev/null
+++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
@@ -0,0 +1,33 @@
+SUMMARY = "library that provides operations for data in the UTF-8 encoding"
+DESCRIPTION = "utf8proc is a small, clean C library that provides Unicode \
+normalization, case-folding, and other operations for data in the UTF-8 \
+encoding, supporting Unicode version 16.0"
+HOMEPAGE = "https://juliastrings.github.io/utf8proc/"
+SECTION = "libs"
+
+LICENSE = "MIT & Unicode-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=96d5a3ba306e0f24fb289427af484408"
+
+SRC_URI = "\
+    git://github.com/JuliaStrings/utf8proc;protocol=https;branch=master;tag=v${PV} \
+    file://run-ptest \
+"
+
+inherit cmake ptest
+
+EXTRA_OECMAKE = "\
+    -DBUILD_SHARED_LIBS=ON \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', '-DBUILD_TESTING=ON -DUTF8PROC_ENABLE_TESTING=ON ', '', d)} \
+"
+
+do_install_ptest() {
+    # this list and run-ptest needs to be updated on upgrade (the project uses add_test feature)
+    for t in "case" custom iterate misc printproperty valid charwidth graphemetest normtest; do
+        install -m 0755 ${B}/$t ${D}${PTEST_PATH}/
+    done
+    install -d ${D}${PTEST_PATH}/data
+    install -m 0644 ${B}/data/GraphemeBreakTest.txt ${D}${PTEST_PATH}/data/
+    install -m 0644 ${B}/data/NormalizationTest.txt ${D}${PTEST_PATH}/data/
+}
+
+BBCLASSEXTEND = "native"

