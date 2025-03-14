Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB32C28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:52:24 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.4453.1741985539596148229
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 13:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aWrhGq8L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202503142052172bc927be86215666bd-6yfosn@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202503142052172bc927be86215666bd
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 14 Mar 2025 21:52:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4zoA4kCxwqoqAsQm9rh+MOZjWDrW7Kxe2Aj07Xxt3Q0=;
 b=aWrhGq8L1G8fpyLl404kq6jD89GGMzXECo7q1aGsn+01Hgn6iFSWt6fYVF8FYDcNAqRPaY
 DpT4/AMM/C8+Q76rXXYNKmFHAgGcSLmu9Fu+WxzRtUJL5kifIPdRoiyD57mFxNZC8n8BSU1+
 Qm0SsTJexpw6v5YLcbg2piwgkpaR/mAgXV/lB/fesCP8t/0WH6XTj8grdCiJv1PoL5B8Llf8
 Hx0TwhqCGaSjF/zNfIYwci+qleBtZAMWeeoxeipdclt3vvUwQtUaXVPHgSVrdj8oarjSwRst
 xSLZ/5+G9BbcNktEtzC8GJ4uOm3fU0s3xo5C9P0UXpzN0R8BsjGe9u2Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 5/7] fluentbit: fix shared-lib package config
Date: Fri, 14 Mar 2025 21:50:33 +0100
Message-Id: <20250314205035.386919-5-peter.marko@siemens.com>
In-Reply-To: <20250314205035.386919-1-peter.marko@siemens.com>
References: <20250314205035.386919-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 20:52:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115992

From: Peter Marko <peter.marko@siemens.com>

Add library to packaged files to fix:

ERROR: fluentbit-3.2.8-r0 do_package: QA Issue: fluentbit: Files/directories were installed but not shipped in any package:
  /usr/lib/fluent-bit
  /usr/lib/fluent-bit/libfluent-bit.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
fluentbit: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
index cd4cba6a14..c7fc7d1e19 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
@@ -139,3 +139,6 @@ do_configure:prepend() {
 do_compile:append() {
     find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|${TARGET_DBGSRC_DIR}/|g'
 }
+
+# needed for shared-lib package config
+FILES:${PN} += "${libdir}/fluent-bit"

