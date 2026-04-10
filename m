Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E573E9904B
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:19:35 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151039.1775805569975211482
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=O97si47d;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202604100710457d53982f25000207e1-aesj6w@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202604100710457d53982f25000207e1
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 10 Apr 2026 09:19:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hEuKmxyMT3TJ/nwqfjfGqtKPhKOaVq0fXL/prKj6dB8=;
 b=O97si47d1BwCDqeq1pIyIliudNkrWIkWZQP/SRMpPbUfBFetX++vQLtrQeimf5lmTDMexS
 jWVTLb1MX227fRVDzK/3BZ9j+f+mcmWF/H7ckdIv9ze0Le0c0tUWGV9tZgquc4et5yn4RVCP
 S8T2DdppmreGN+fQ1xhUE8mhXsAi6hTIhoXVQ8L1iSpFU5OHzzYfRCsJRD/lV4bwaLqa7FM1
 ZZlMdxJPLiJ4y384kZJT17uG1kwgJ2nX3jFnu3WODSPHAr2ooVgZtxn1hInE1vll62HTvWG/
 9p9TBt+lC0NWcMXJUUSAZvJrQ1iLxrq4dDn96DMlKGB/fpZAlmBVMdSw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2] crow: add new recipe
Date: Fri, 10 Apr 2026 09:09:57 +0200
Message-ID: <20260410070957.35220-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126236

From: Peter Marko <peter.marko@siemens.com>

Crow is a C++ framework for creating HTTP or Websocket web services.

Disable tests as they are using CPM (Cmake Dependency Manager), which
would be downloading the test dependencies in configuration step.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: corrected branch name

 meta-oe/recipes-support/crow/crow_1.3.2.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/crow/crow_1.3.2.bb

diff --git a/meta-oe/recipes-support/crow/crow_1.3.2.bb b/meta-oe/recipes-support/crow/crow_1.3.2.bb
new file mode 100644
index 0000000000..09970fcfc2
--- /dev/null
+++ b/meta-oe/recipes-support/crow/crow_1.3.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A Fast and Easy to use microframework for the web"
+HOMEPAGE = "https://crowcpp.org/"
+DESCRIPTION = "Crow is a C++ framework for creating HTTP or Websocket web services. \
+It uses routing similar to Python's Flask which makes it easy to use. \
+It is also extremely fast, beating multiple existing C++ frameworks as well as non-C++ frameworks."
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e08502e395a6f7c037ddfe7d2915f58e"
+
+SRC_URI = "git://github.com/CrowCpp/Crow.git;protocol=https;branch=v1.3;tag=v${PV}"
+SRCREV = "f8c060c51feeca2c65828fb6f538603db4392d55"
+
+inherit cmake
+
+DEPENDS = "asio"
+
+EXTRA_OECMAKE = "\
+    -DCROW_BUILD_EXAMPLES=OFF \
+    -DCROW_BUILD_TESTS=OFF \
+"

