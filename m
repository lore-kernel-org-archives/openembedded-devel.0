Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4788E7C6F7
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 22:11:40 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18731.1769897492919349864
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 14:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Lxp9euuY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202601312211296c561b19ec000207b5-3jd1_c@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202601312211296c561b19ec000207b5
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 31 Jan 2026 23:11:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/ui34JF4gwrqgI1ROfY/4XrgYeW+/Mrwh9D9ImeZM8U=;
 b=Lxp9euuYwyhpsz3HtZchFwslXVTCN1X3WYHxBcpyl7WT8EGBKcNdccML1cxZL7U0oMlpU6
 1WzS2qlbEuWy1De/rluECDX1ewzvMhCbcfmO0qNQNfjSjRROL5YE+kZ2MWKoFj7gVB5Rn48S
 Ceh+WlB+gesdfYRNX1XHSriwg9zQ1SVsgtZZu+EpkR4k6rhfxJRWfRXJ86sFi0tt7BCYHtzs
 6R4aP8tCLY1L/r/B1cn21ETO9eLOJoXh77ZyeXTJ44p4xfIxSSOCeosOnaXh0yRZtDCc1JAt
 hPa2Y5AL3lbkldASawZ2ke7kSsr/r+5/Flydtfi1S+Pa5cnniaAfPqQQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 1/2] python3-protobuf: upgrade 6.33.1 -> 6.33.5
Date: Sat, 31 Jan 2026 23:11:23 +0100
Message-Id: <20260131221124.306284-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 22:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124025

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-0994.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{python3-protobuf_6.33.2.bb => python3-protobuf_6.33.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.2.bb => python3-protobuf_6.33.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
index d0ef7753b0..af30165f81 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
+SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 

