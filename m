Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68D3D206B2
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 14:36:56 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44813.1764859008791806502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 06:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AQilvoyi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025120414364589d0e0f9060002073b-_0ojgu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025120414364589d0e0f9060002073b
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 04 Dec 2025 15:36:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VDHAZ6cufsOKXMEB+bLKTRGH3JHj7vKZggKKR9nc09g=;
 b=AQilvoyiRbzXkuUqTifOJAk4PfsfwmXMZWPsN7uOCkQ9yWysbuq7pi/TVsMDCnp3NKZ1kt
 2XC0Kwn3fyC31SP6ZdH6sME3rd8vJzDKZCa98zBb4+AKrzGF6c7jxeeGfA325TzwIkbu1Nv0
 HdQlDXlaimErdng25Y+UZvoHhv1SxtqQYlQhhgiVpFy/z40uNNblUMVnv9uE+ky0/ebzjJLv
 /FpJxR82tDGFALTnSHF0G7u+PhYOqcMml6Fa4HW18v7vs/mz39UgFKv0lVWQCwCmE3P//sGK
 PofFIUoQg4TTZrc2GYAAupiT7j5sGuYpYxpS4VK/yTkEQNeWzS5AuLlw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH] nftables: remove python dependency from main package
Date: Thu,  4 Dec 2025 15:36:37 +0100
Message-Id: <20251204143637.229960-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 14:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122324

From: Peter Marko <peter.marko@siemens.com>

The recipe splits python code to nftables-python package, however
setuptools classes add the dependency to main package.
Since nftables-python package already has python3-core explicit
dependency, remove it from the main package.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
index a2c6ce0e23..5ae9fc609d 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
@@ -42,6 +42,8 @@ inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python_setuptools
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)}"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
+# setuptools3-base.bbclass adds this to main package, but this recipe is moving it to python sub-package
+RDEPENDS:${PN}:remove:class-target = "python3-core"
 
 # Explicitly define do_configure, do_compile and do_install because both autotools and setuptools3
 # have EXPORT_FUNCTIONS do_configure do_compile do_install

