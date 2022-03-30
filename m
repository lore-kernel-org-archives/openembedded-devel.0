Return-Path: <sjl@vctlabs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804A7C433F5
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 07:23:02 +0000 (UTC)
Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web10.4386.1648624981377507768
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 00:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135,
 mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id AE321280242; Wed, 30 Mar 2022 00:22:56 -0700 (PDT)
Received: from codepurple (c-71-202-197-248.hsd1.ca.comcast.net
 [71.202.197.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 5465F2801DC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 00:22:56 -0700 (PDT)
Date: Wed, 30 Mar 2022 00:22:58 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python] [PATCH] python3-evdev: fix host header contamination
Message-ID: <20220330072258.GD52115@codepurple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 07:23:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96264

The attempt to pass in correct headers was being ignored,
because it never got updated after distutils class was removed.
Switch to SETUPTOOLS_BUILD_ARGS, which setuptools3 class does
pay attention to.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
index 97a8aedd7..ca324c9ae 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.4.0.bb
@@ -11,7 +11,7 @@ do_compile:prepend() {
     rm -rf ${S}/evdev/ecodes.c
 }
 
-DISTUTILS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
+SETUPTOOLS_BUILD_ARGS = "build_ecodes --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-ctypes \
-- 
2.20.1


