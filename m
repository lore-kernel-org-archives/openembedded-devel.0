Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3A9C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 15:52:39 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.176920.1719330757879607711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 08:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eI2mkteo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024062515523443bcf7c46e59997f78-3ighpv@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024062515523443bcf7c46e59997f78
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 25 Jun 2024 17:52:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rj17cX/chCcdSqtvmbYJB6Px9JXH6CXARxwkHU8sUA8=;
 b=eI2mkteoNXEWUMDQJIiYg42TLJ1dBBlvXHuvwu9l6oQwm+u+SDt0QE52MgpUrcSOcYcX+Y
 r2sHDbChbvMIbVbSqPjo3ZEU7dTJuCCzKoHeAIgXN6Cqz5DgzYy9t7pf13nrx6f4zkO6pmmi
 GMGnU6RwbMJl8/wjcA0uGM2O8jBl4=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] cjson: fix buildpath warnings
Date: Tue, 25 Jun 2024 17:51:46 +0200
Message-Id: <20240625155146.7246-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 15:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111074

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
 meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index 5e992845a1..bdeab3055c 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
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


