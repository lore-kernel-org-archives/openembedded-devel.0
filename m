Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E210C30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:14:04 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.166513.1719303239471088931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fP+XsF+d;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20240625081357b194fac6340049ed3a-rgqg2y@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240625081357b194fac6340049ed3a
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 25 Jun 2024 10:13:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kO8T1PiCrrpInQ3uaEdbV2HIoQ8f2jjkOc4gZlUFmcQ=;
 b=fP+XsF+dNZrzN7l2nlwZrgihRfer0fXDpKE+OlkPThp8J8qXkoI5HGP46c7JnMlOdIVV7c
 xVXhCyU8aQTYDpNEUXOznv7ocfTxFnpeHKFZeuwdXhFoZSJAvyYtZTFyVq5j9FsvgvJf255Z
 MH1A8KjElX7ok8SEJ1GFbtPrO/LVc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][scarthgap][PATCH] cjson: fix buildpath warnings
Date: Tue, 25 Jun 2024 10:12:59 +0200
Message-Id: <20240625081259.1785605-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111013

From: Peter Marko <peter.marko@siemens.com>

Following warning occurs when building with ptests enabled:
WARNING: cjson-1.7.17-r0 do_package_qa: QA Issue: File /usr/lib/cjson/ptest/CTestTestfile.cmake in package cjson-ptest contains reference to TMPDIR
File /usr/lib/cjson/ptest/tests/CTestTestfile.cmake in package cjson-ptest contains reference to TMPDIR
File /usr/lib/cjson/ptest/fuzzing/CTestTestfile.cmake in package cjson-ptest contains reference to TMPDIR [buildpaths]

The cmake files also contain full paths to original CMakeLists.txt file
in _BACKTRACE_TRIPLES property;
These are not needed for successful ptests as we don't install the
CMakeLists.txt files anyway.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
index 6c8934b342..ea74f1d680 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
@@ -24,6 +24,11 @@ do_install_ptest() {
         sed s#${B}#${PTEST_PATH}# ${B}/CTestTestfile.cmake > ${D}${PTEST_PATH}/CTestTestfile.cmake
         sed s#${B}#${PTEST_PATH}# ${B}/tests/CTestTestfile.cmake > ${D}${PTEST_PATH}/tests/CTestTestfile.cmake
         sed s#${B}#${PTEST_PATH}# ${B}/fuzzing/CTestTestfile.cmake > ${D}${PTEST_PATH}/fuzzing/CTestTestfile.cmake
+        # The cmake files also contain full paths to original CMakeLists.txt file in _BACKTRACE_TRIPLES property;
+        # these are not needed for successful ptests as we don't install the CMakeLists.txt files anyway.
+        sed -i s#${S}#${PTEST_PATH}#g ${D}${PTEST_PATH}/CTestTestfile.cmake
+        sed -i s#${S}#${PTEST_PATH}#g ${D}${PTEST_PATH}/tests/CTestTestfile.cmake
+        sed -i s#${S}#${PTEST_PATH}#g ${D}${PTEST_PATH}/fuzzing/CTestTestfile.cmake
         # install test artifacts
         install ${B}/cJSON_test ${D}${PTEST_PATH}
         install ${B}/tests/cjson_add ${B}/tests/*_tests ${B}/tests/parse_*  ${B}/tests/print_*  ${B}/tests/readme_examples ${D}${PTEST_PATH}/tests/
-- 
2.30.2


