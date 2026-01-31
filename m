Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E550FD73EB9
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 18:46:29 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15071.1769885179253820567
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 10:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dug/EEl7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202601311846156603a7d70e000207b0-yvd82k@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202601311846156603a7d70e000207b0
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 31 Jan 2026 19:46:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wQ8S3+ZI0n1iz2nQaBWnPdnj8r3YX2rQ2HiFeUEbpD8=;
 b=dug/EEl7pT9dffIM4+8MlChPV0ZdUVv8vyY6B1HkdQ9meuS8Xrf/B3atGE0l4X8kFQrXYq
 UaCL1UIwKgx8gZfwcjLdgLg56QIXJAUNL+W7Jscf5IHJbiAoB3w5QRTjcBf/uv8+POmQo4Yt
 U6lNvh3Vpz/aJfLaqT0rR0vQitmtBDVfey6H/qjW+ReunFrK8hLrBs5dzdvINbidy9aW7WJC
 By4BCzGhNqIDX4cWV7GjXevV1L8wh/NyadBAk+qkMugCH876/U/GVLoutOTgtE7Tr+h7nB5W
 y0OMkeLv5pYwPOwnf7flRyxn7SLhCu4+bkhOkjbfFYyMDYJI+ek+Sgdw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH] python3-m2crypto: workaround for swig issue with sys/types.h
Date: Sat, 31 Jan 2026 19:46:09 +0100
Message-Id: <20260131184609.112032-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 18:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124019

From: Peter Marko <peter.marko@siemens.com>

Upgrade to openssl 3.4.0 added sys/types.h into include/openssl/e_os2.h
Unfortunetelly swig has issue with this and the build broke.
Add a workaroung to remove this include until swig is fixed.
In our setup this include is not necessary.

Upstream issue: https://github.com/swiftlang/swift/issues/69311

(From meta-openembedded rev: f9158ce32fffa6f18eed4008c3295146c81d55ea)

This backport is part of effort to upgrade openssl to LTS in scarthgap.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-m2crypto_0.40.1.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
index 736399c9d2..dce459477f 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
@@ -46,6 +46,11 @@ export SWIG_FEATURES
 
 export STAGING_DIR
 
+do_configure:prepend() {
+    # workaround for https://github.com/swiftlang/swift/issues/69311
+    sed -i "/sys\/types.h/d" ${RECIPE_SYSROOT}${includedir}/openssl/e_os2.h
+}
+
 do_install:append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/M2Crypto/SSL/__pycache__/*.cpython-*.pyc
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/M2Crypto/__pycache__/*.cpython-*.pyc

