Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81758E7E62F
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 12:09:02 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.13893.1695714250695024442
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 00:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=FzMyaPfv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-456497-202309260744066c7333dcfb02f9c192-qocez6@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202309260744066c7333dcfb02f9c192
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 26 Sep 2023 09:44:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=y0tFCePLtSeg10wJtj0MvOno/tVvqr8P+yG1bKJIiBo=;
 b=FzMyaPfvf55ivDECvtdqXU8YmOm6obXu+BLDau0vDgGo30iZNS0n2XS+T4mooFVmKYHYOZ
 3xsu5zD0rDyFQhfegSEdoYpps7sCMc5au9LCe6BvyOz/Ax5af4wiSxvRFFiJr9A8WbfvYeCy
 dMxnT7yB4obCEq3wTo2jpd8bFq91Q=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ryan Eatmon <reatmon@ti.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [OE-core][kirkstone][PATCH] kernel.bbclass: Add force flag to rm calls
Date: Tue, 26 Sep 2023 09:43:54 +0200
Message-ID: <20230926074358.48827-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 12:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105143

From: Ryan Eatmon <reatmon@ti.com>

The latest 6.5 kernels do not appear to create the source file in
${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
recipe errors out when trying to remove it.  Simple fix is to add the
-f (force) flag to the call.

(From OE-Core rev: 2e669bf797b15d803e7d6a700e449bdc467a4bcc)

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f7d199e917..5951347361 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -442,8 +442,8 @@ kernel_do_install() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
 		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
-- 
2.41.0


