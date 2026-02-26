Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F42DFD9E0A
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 21:14:44 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80982.1772140478667264582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 13:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Br2hzKOG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260226211435a23b1c6ff800020776-nruthc@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260226211435a23b1c6ff800020776
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 26 Feb 2026 22:14:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=MeL7rOyPQ1U3uqHOQvEo6ZJbcVd45gqRyGAd3Pa8MVY=;
 b=Br2hzKOG6uznGAyavWlwROiZFvoqowudGHtThVcHes3AzZo1Rrc/Pt49kVNf1NXQAQjjIQ
 NKcmTvQYwRjtqTz1+2aUK0BSxnCMfjcRmf07J58tmIbrXVjFw5h9yLSe45fdP+l5le9JBneH
 TJGWzE5YP1KngQFrvbkXkqhfwai3a8l/1C7F/0f5iyHr6hH2DhujZZ1sENXJqNQxNe8n1hpX
 xgYrr5Bdq/YP+Q/wa4oAFqHodKsyWtNI4pd3o4ZnlKetfPsOzuKGf34QkHqILklKvpWxsOwo
 5oObODwgI/I6x0QA/fuYTtKCycNdzjl+iHFcAh/fhbukF0NJ1B77wubg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH] jwt-cpp: upgrade 0.7.1 -> 0.7.2
Date: Thu, 26 Feb 2026 22:14:15 +0100
Message-ID: <20260226211415.559817-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 21:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124687

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Breaking Changes
- Update jsoncons trait to support v1 release

What's Changed
- Improve as_date narrowing conversion from C4244 warning
- update trait dependencies to support CMake v4
- Fix linter error
- Update workflows for new GitHub Action Runner Images
- Support passing ssl library key handles to algorithms
- Update CMP0135 to new behaviour
- Fix error in CMake config-file package
- CMake: synchronize cmake_minimum_required from main CMakeLists.txt
- Reduce usage of std::time_t, std::chrono::system_clock::to_time_t and
  system_clock::from_time_t in order to get correct dates when working
  with a 32bit application
- Fix set_expires_in not accepting non-default Period
- AppVeyor Warnings

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../jwt-cpp/{jwt-cpp_0.7.1.bb => jwt-cpp_0.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jwt-cpp/{jwt-cpp_0.7.1.bb => jwt-cpp_0.7.2.bb} (90%)

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
similarity index 90%
rename from meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
rename to meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
index 5ad953d260..431c77c695 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
 SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https \
             "
 
-SRCREV = "e71e0c2d584baff06925bbb3aad683f677e4d498"
+SRCREV = "b0ea29a58fc852a67d4e896d266880c2c63b0c4c"
 
 
 DEPENDS = "openssl"
-- 
2.53.0


