Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB328C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 21:54:51 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.22870.1711490082095382826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 14:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LoDcRvGM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202403262154388738a118298db957a8-9ep7nl@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202403262154388738a118298db957a8
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 26 Mar 2024 22:54:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Pa4hgsDc9NLheosLhxOUu/pFZMwFih0uXcGmZAmo/2g=;
 b=LoDcRvGMUUtkVZ+YD0q/ZM45OCVFu9Vb2wO444W9jHHR5t1m0CbhHtDf/M9YZopbLhEGhg
 Eb1uavi5vE7IgYQonc8yXS6uG4wPbbz5ZumIpAttfBuoPs8O8Oj5eaSosd0qBok983mhnko6
 3btmKQvwpesi4uhBLd+JpKcZD8GVc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2] microsoft-cpr: add new recipe including ptest
Date: Tue, 26 Mar 2024 22:53:46 +0100
Message-Id: <20240326215346.586439-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109631

From: Peter Marko <peter.marko@siemens.com>

The Guidelines Support Library (GSL) contains functions
and types that are suggested for use by the C++ Core Guidelines
maintained by the Standard C++ Foundation.
This repo contains Microsoft's implementation of GSL.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../microsoft-gsl/microsoft-gsl/run-ptest     |  4 +++
 .../microsoft-gsl/microsoft-gsl_4.0.0.bb      | 36 +++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
 create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index fadec1221..70e5dad08 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -27,6 +27,7 @@ PTESTS_FAST_META_OE = "\
     libxml++-5.0 \
     libyang \
     lmdb \
+    microsoft-gsl \
     minicoredumper \
     neon \
     nlohmann-json \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6e2012dae..bc15373b6 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -310,6 +310,7 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
     yasm \
     json-schema-validator \
     poke \
+    microsoft-gsl \
 "
 RDEPENDS:packagegroup-meta-oe-devtools:append:x86 = " cpuid msr-tools pahole pmtools"
 RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 = " cpuid msr-tools pahole pcimem pmtools"
diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
new file mode 100644
index 000000000..2d5bdf4ff
--- /dev/null
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+gsl_tests && echo "PASS: gsl_tests" || echo "FAIL: gsl_tests"
+gsl_noexcept_tests && echo "PASS: gsl_noexcept_tests" || echo "FAIL: gsl_noexcept_tests"
diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
new file mode 100644
index 000000000..d07430709
--- /dev/null
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "GSL: Guidelines Support Library"
+DESCRIPTION = "The Guidelines Support Library (GSL) contains functions \
+    and types that are suggested for use by the C++ Core Guidelines \
+    maintained by the Standard C++ Foundation. \
+    This repo contains Microsoft's implementation of GSL."
+HOMEPAGE = "https://github.com/microsoft/GSL"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=363055e71e77071107ba2bb9a54bd9a7"
+
+SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=main \
+    file://run-ptest"
+SRCREV = "a3534567187d2edc428efd3f13466ff75fe5805c"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig ptest
+
+# this is header-only library
+ALLOW_EMPTY:${PN} = "1"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest','', d)}"
+PACKAGECONFIG[ptest] = "-DGSL_TEST=ON,-DGSL_TEST=OFF,googletest"
+
+do_install_ptest() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/tests/gsl_tests ${D}${bindir}
+    install -m 0755 ${B}/tests/gsl_noexcept_tests ${D}${bindir}
+}
+
+FILES:${PN}-ptest = "${bindir}/gsl*_tests"
+
+# there is already other gsl recipe, so recipe name does not match the real component name
+CVE_PRODUCT = "microsoft:gsl"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


