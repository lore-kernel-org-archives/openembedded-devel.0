Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEB5C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 20:27:15 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.4989.1742502429716654015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 13:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JB+d33pz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025032020270723af6c9687e38cac0d-hk9box@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025032020270723af6c9687e38cac0d
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 20 Mar 2025 21:27:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MxLMnuKg38RrBpCPToKVt0qXiTbqrz9YH3t/LpjmiWo=;
 b=JB+d33pzDJNlYV6ssnpRBwgofEZbMTLgrobGOLqWoyHocaTG+FRFiURAfGSl5BlFnn6Otz
 F4C+q6r1JK4p8rVSDBPsc+sy1o4S5ogmRUztRHOd+U7Aq1rGqpcVnWlvT9r3zZe8PPy/NTm9
 goXmguN26rxv898zjnzpV7y8GeZqcuiu3zW4vSIwypfETbOjV4d07knK4pKbuyEapDI0/2eg
 27DDSHhtDfRyUGj95Taehp8zgsfNCbNJQM0yYUuwS13LMKJIK65uGk1Mr1W2Y/WG7khBAYD0
 2Srov9pCP/7Q4Mm5/moDzcoLejmcxqCObYY+4NXocoQOroYufsVKw1kg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-something][PATCH 3/3] freerdp3: set CVE_PRODUCT
Date: Thu, 20 Mar 2025 21:26:06 +0100
Message-Id: <20250320202606.1679616-3-peter.marko@siemens.com>
In-Reply-To: <20250320202606.1679616-1-peter.marko@siemens.com>
References: <20250320202606.1679616-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116144

From: Peter Marko <peter.marko@siemens.com>

CPE does not contain mnajor version number, so set VE product to just
freerdp.
Without this there are no (fixed) CVEs in reports.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
index b6974af739..109b2b599b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "freerdp"
+
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland x11', d)} \
     ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'ffmpeg', '', d)} \

