Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEC4F364C9
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:07:05 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.144029.1775772423048848432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SQofPejE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260409220701709224254a000207ad-1gtaw5@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260409220701709224254a000207ad
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 10 Apr 2026 00:07:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=w25zdOIDULgsVrZAwYI+bWcDSeIaFB8e57fc5YwpVfs=;
 b=SQofPejEhHfz9b/gsWQnf27hD7ByGa/E+iENrBnByBNbzqg4ymgvrr60Bf3p/wo3e74U+g
 /Rw36N6rHuLW04m1BzcT8o/yuo/cHbmnX/uDc73v0rmRv3Lhg4grjc+/k1ejhkHBGcXSiVv+
 7Pu6wArngyTJSfl64jrD9dOzz3E97PUEzu+nhcq0FaDBbQU84i27lg/NUq+0DC6e/U4Xbyn+
 SlYk7DY4RZqsl4vU/bkIAEw8B9INIfgqtw5Y4HYSYc7A3YkJrZ7ze1erQz1+JxAXAt4GhyVi
 a7oQO5D495j9BOFuVi7amVZoOgteTRVzCeQ49HUM18XMNFqLFrCpSG+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/4] ttyd: add new recipe
Date: Fri, 10 Apr 2026 00:06:08 +0200
Message-ID: <20260409220610.1216303-2-peter.marko@siemens.com>
In-Reply-To: <20260409220610.1216303-1-peter.marko@siemens.com>
References: <20260409220610.1216303-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 22:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126204

From: Peter Marko <peter.marko@siemens.com>

ttyd is a simple command-line tool for sharing terminal over the web.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-connectivity/ttyd/ttyd_1.7.7.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/ttyd/ttyd_1.7.7.bb

diff --git a/meta-oe/recipes-connectivity/ttyd/ttyd_1.7.7.bb b/meta-oe/recipes-connectivity/ttyd/ttyd_1.7.7.bb
new file mode 100644
index 0000000000..8f4a1d3211
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ttyd/ttyd_1.7.7.bb
@@ -0,0 +1,11 @@
+SUMMARY = "ttyd is a simple command-line tool for sharing terminal over the web."
+SECTION = "console/network"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fe5f001c65f923d49dc96cce96ce935"
+
+SRC_URI = "git://github.com/tsl0922/ttyd.git;protocol=https;branch=main;tag=${PV}"
+SRCREV = "40e79c706be14029b391f369bee6613c31667abb"
+
+inherit cmake
+
+DEPENDS = "libuv json-c zlib libwebsockets"

