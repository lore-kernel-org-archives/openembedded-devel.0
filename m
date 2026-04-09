Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8191DF364C7
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:07:05 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.143784.1775772420930666574
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ionuGz67;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260409220657cc2754662e0002076d-lwap4g@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260409220657cc2754662e0002076d
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 10 Apr 2026 00:06:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=r0le9lIjMIIo5Jm6IuO3SdlCV1cKoaJYo8Ry1MZ1dAo=;
 b=ionuGz67c+LAeRru+PMDDvkdV5NfhPc4TLUxdxYLLT4pXD/bP7CleOl9wN4bvxm1MqsBk8
 7N8hPimZf32zPYzlMWeJ5Msb5j6AYG9jRR01usyuOxeD9B+k0SL6uGGfB4BLzAW325O/JJn5
 RTvxSnKWKl1DRn3AI9Yb6KkC3AjbdsyFz/RNCIHdEXkLNJZtrhokB16DEjrpB2Yqx6UQIFhl
 CZnMijgnVhapwV+WbvRQLlaLiMg+s72gmgVq98qwPlKyk9gI5KTwlTpf7fV50n+wsNe+lpwO
 XzzV75gcAS/bY3gmVbd52bsCzmthqUcVzm59dW+Ng6lW+qvG5MGmUWFA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/4] crow: add new recipe
Date: Fri, 10 Apr 2026 00:06:07 +0200
Message-ID: <20260409220610.1216303-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 22:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126203

From: Peter Marko <peter.marko@siemens.com>

Crow is a C++ framework for creating HTTP or Websocket web services.

Disable tests as they are using CPM (Cmake Dependency Manager), which
would be downloading the test dependencies in configuration step.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/crow/crow_1.3.2.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/crow/crow_1.3.2.bb

diff --git a/meta-oe/recipes-support/crow/crow_1.3.2.bb b/meta-oe/recipes-support/crow/crow_1.3.2.bb
new file mode 100644
index 0000000000..611b732b2b
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
+SRC_URI = "git://github.com/CrowCpp/Crow.git;protocol=https;branch=master;tag=v${PV}"
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

