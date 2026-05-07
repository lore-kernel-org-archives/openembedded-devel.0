Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF8ACD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 08:24:13 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7302.1778142242985099730
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 01:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eZpwIYnP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202605070824003e89f15ebe000207e3-2krpgh@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202605070824003e89f15ebe000207e3
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 07 May 2026 10:24:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=W18QApKC3Ijnms619yhIeN8tm0cdIZjS3GTvAsOjcdU=;
 b=eZpwIYnPjTnIq6pW2AvePqwzcVpaYL446zC2FYLEJEHuwtNr5b05BVIBqaoENdNV8pFzOC
 x9e/F8cToIBQtjq73qMlYPcdhqso+LNKzLZ+1FEKtnPCqPSmuzNs8M1xvcCU7yVzNJiP2/+6
 4I32HLTv+lx0gTBBbwstMdORbZfsjIECpjuIQq0w8N73dSnnL6vHqTKBkruLVMKSE6C3JkpN
 hHgPgCvuhQCUv1+v0RIFXBp31eqh3QbrGLeWGDCGMXXRY6aIo7Oe5ZU5Z1grKpPB1VLZtrX+
 CFzNJktggmVp8ct6NLuKiLXYV4T0wPSBml/P4K2xkgWNAmZQdO94rQeg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] cryptsetup: update udev package config
Date: Thu,  7 May 2026 10:23:46 +0200
Message-ID: <20260507082346.37718-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 08:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126811

From: Peter Marko <peter.marko@siemens.com>

Commit 1ca8df16af411871e10f268064570146cdef54cb fixed a build problem in
wrong way. Relevant rules from lvm2-udevrules were merged into
libdevmapper (which was previously pulled by the rules package), however
instead of that, the whole lvm2 package was added as dependency (which
then pulls the needed libdevmapper).
That is a huge package completely unneeded and due to that, this new
dependency was later changed to recommendation.

Switch to libdevmapper instead of whole lvm2.
Keep recommendation for now as it gives more flexibility.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
index c74b7a1f35..c754131e3f 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
 PACKAGECONFIG[luks2-reencryption] = "--enable-luks2-reencryption,--disable-luks2-reencryption"
 PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
-PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,,udev lvm2"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,,udev libdevmapper"
 PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
 # gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
 # recognized.

