Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CD2E66897
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 09:02:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.148314.1733043732911689477
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Dec 2024 01:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NmzTDUaW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202412010902086a8be3e49301a1acd9-xot_om@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202412010902086a8be3e49301a1acd9
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 01 Dec 2024 10:02:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WOfQwAx3bmt6K3DZnVCJshM+k1HllNp9OvTwWA9s4lM=;
 b=NmzTDUaWC3+1//yjlFOI7VNm1egfmRumvRkrzxfe+DULchV7AzRRaNF0APa96eQBIsGdrM
 svU5ouqCdINUVu3bG/wup3ZiQC7tdz0w+STerhXWpeZ2bnOVONapKqrkf5Smv/WQEzAGp79u
 0rYMnFLuDDQz9SIX9Na17od3yCVWQlj0rPV3UAxf8l9a9DUjnDGvtTBIV2WtUFzOtx3eC5nK
 TmOX2BO+bWyip/GYaRpKsk9zNEOx568BXsBo5FHHEaiEfPwXbjUcARcVU4Q4wUy4q74LeZSr
 4cMWDqF/uiFjwc+z6L0ZAFATl3SfGPo7C1csZqF6e9wUlsxp965Ip2Kw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] python3-m2crypto: workaround for swig issue with sys/types.h
Date: Sun,  1 Dec 2024 10:01:19 +0100
Message-Id: <20241201090119.1946131-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Dec 2024 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114130

From: Peter Marko <peter.marko@siemens.com>

Upgrade to openssl 3.4.0 added sys/types.h into include/openssl/e_os2.h
Unfortunetelly swig has issue with this and the build broke.
Add a workaroung to remove this include until swig is fixed.
In our setup this include is not necessary.

Upstream issue: https://github.com/swiftlang/swift/issues/69311

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
master-next has already 0.43.0, but that does not compile for other reasons yet
so I have updated 0.42.0 that the master can compile with newest oe-core with openssl 4.3.0

 .../recipes-devtools/python/python3-m2crypto_0.42.0.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
index 6b178cd127..b50ae31e4c 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
@@ -35,6 +35,11 @@ export SWIG_FEATURES
 
 export STAGING_DIR
 
+do_configure:prepend() {
+    # workaround for https://github.com/swiftlang/swift/issues/69311
+    sed -i "/sys\/types.h/d" ${RECIPE_SYSROOT}${includedir}/openssl/e_os2.h
+}
+
 do_install:append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/M2Crypto/SSL/__pycache__/*.cpython-*.pyc
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/M2Crypto/__pycache__/*.cpython-*.pyc
-- 
2.30.2


