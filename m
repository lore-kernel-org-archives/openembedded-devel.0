Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34BBE7718C
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:29:15 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.138147.1734640146688168345
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=vHOXD4Yp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20241219202904301f66540d55d1bb07-zasp2c@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241219202904301f66540d55d1bb07
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:29:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=CtQ9GB0634YwQcAsdGLWyX2e8VCqvZaZqLiaR50JVu0=;
 b=vHOXD4Yp3eTMjbRlRnxE71w29p9YcDafzzegQlpGS/XDXLXBcEvBMZiOO5MVfdKOyGZICx
 YnlIwrYU4d6A8yY0d0/vxyHTbNABh6ETWYVxZjBJsttGMXmJA5BpUAkEi4MXLK4g/Unynagq
 84GpZd7UYHD4S1loOtfUZinyj1dkR6/3Vl/9hSNbELi0epeeDsLL18DzPDoq160JVIOyZOWO
 H/cT+XAEvs6AM4LrvXMK8c3S8xT1R63mk/104Fcf+BoapNx4SEtxGKcwAwX3og5D7Rd7EP9c
 4bhoFHpnK++lITxSdIJW3pEK7EgEW/taVqIbZBEVsc7IYnMjTBOxksWQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 08/12] spice-gtk: mark CVE-2012-4425 as fixed
Date: Thu, 19 Dec 2024 21:27:34 +0100
Message-Id: <20241219202738.346121-9-peter.marko@siemens.com>
In-Reply-To: <20241219202738.346121-1-peter.marko@siemens.com>
References: <20241219202738.346121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114409

From: Peter Marko <peter.marko@siemens.com>

It is fixed by [1] since 0.15.3.
NVD tracks this CVE as version-less.

[1] https://cgit.freedesktop.org/spice/spice-gtk/commit/?id=efbf867bb88845d5edf839550b54494b1bb752b9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index c8a3f7f532..4ef39f0904 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -12,6 +12,8 @@ SRCREV = "f04479c16f0969fb394ebe74b6eff74e560a42f0"
 
 SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice-gtk.git;protocol=https;branch=master"
 
+CVE_STATUS[CVE-2012-4425] = "fixed-version: fixed since 0.15.3"
+
 S = "${WORKDIR}/git"
 
 DEPENDS = " \
-- 
2.30.2


