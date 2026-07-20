Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6042DC44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:28:42 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5636.1784575712220887881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=b+FZdQXR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260720192834298ceb2a1000020745-h0nhp7@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260720192834298ceb2a1000020745
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:28:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NOS2MO8qNky5JWKzytEVR3XzAJJA0lHVR8fxMnkWPg8=;
 b=b+FZdQXR1XVi+t5o8tO9nEfdZv6a5VMSpbw+bMIL2hFsqbGaU/Omv3YQWj/yAdOK9IlyZo
 wFfcVF6KjT2IrkSGMOzivlWOUoRgGGrotFOoyxr+7r7CyIL6uMryljGAYC+lncvoPK8Z3u0J
 FGz+AbJ4vki01BthYIC1viI3F1XIBnaGOhUEa3EkxjBjc5+fGIgwRIEyvhGyBSx8A0wC1ItL
 KJlKvIq4zA0uuRD9bH4HdY/e9ptua98kh4ZTB8VNIzP0W4wamBNraRGSPKI7YGjCjaqu233h
 nFVop1CxM8PAcNOCr9dY7vFd2jSO7xx1PEUVAT4Hn/HIDH7wYz0R5inQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][wrynose][PATCH 6/6] libcoap: set status for CVE-2023-51847
Date: Mon, 20 Jul 2026 21:28:09 +0200
Message-ID: <20260720192809.28277-6-peter.marko@siemens.com>
In-Reply-To: <20260720192809.28277-1-peter.marko@siemens.com>
References: <20260720192809.28277-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128299

From: Peter Marko <peter.marko@siemens.com>

Reuse investigation of Debian security group.
As mentioned by [1], this was never present in any release because it
was introduces in 4.3.5 development, however also fixed before release.

[1] https://security-tracker.debian.org/tracker/CVE-2023-51847

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index 7ea3eba1b0..7252be8b1e 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -63,5 +63,6 @@ PACKAGE_BEFORE_PN += "\
 FILES:${PN}-bin = "${bindir}"
 FILES:${PN}-dev += "${datadir}/${BPN}/examples"
 
+CVE_STATUS[CVE-2023-51847] = "fixed-version: both introduced and fixed in 4.3.5"
 CVE_STATUS[CVE-2025-50518] = "disputed: happens only when library is used incorrectly"
 CVE_STATUS[CVE-2026-29013] = "fixed-version: fixed in 4.3.5b"

