Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983F0C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:34:32 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.3596.1737142462634538043
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aiRbBvjV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202501171934195b9421cb7d2f5139cb-9sqmbc@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202501171934195b9421cb7d2f5139cb
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 17 Jan 2025 20:34:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yvgcUvUwcQlvAmA3jiplOFdYCisgbrkfKC447+T1fpw=;
 b=aiRbBvjVb41JCUqrG2xrLTniX+pdkYCBpL4+AMPJZNJ0mZ4f3TZ7CUp5Ydwqcb0j1lYNwy
 hpnfZTnQvfeALZxxP+aG+7xK5Oc8jmbxA/LYM/nLWdub4HcgiO7o+kmOaMoIX0SGFoWtF1Xa
 roTBvWe7qzDcmI+RBc5XT4iHtayUaNPkK/Yz47qu6wbHX/o0If8CUSvZaa1cK5MOidD7J3FS
 F3z5k3BFCVYZ0GccSE/PkAjMZutEOErxUK6CliXxmskSZhEuw2B0wmfUJGecUDvQ0MIjoisB
 haZx4HXvQEMcdW6wnQPAu7GjV1iI6GOX9O3m6jQHM1MAbTRgxOfI843A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH] audiofile: mark CVE-2020-18781 as patched
Date: Fri, 17 Jan 2025 20:33:21 +0100
Message-Id: <20250117193321.2339069-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 19:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114932

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE is already patched by commit [2].

This can be also verified with yocto build.

Running without this patch:
root@qemux86-64:~# sfconvert poc.wav output format wave
malloc(): corrupted top size
Aborted

Running with it:
root@qemux86-64:~# sfconvert poc.wav output format wave
Audio File Library: Bad number of coefficients [error 62]
Could not open file 'poc.wav' for reading.

[1] https://github.com/mpruett/audiofile/issues/56
[2] https://github.com/antlarr/audiofile/commit/c48e4c6503f7dabd41f11d4c9c7b7f8960e7f2c0

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../files/0004-Always-check-the-number-of-coefficients.patch     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
index 282f4c01b9..17a97163f5 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
@@ -17,6 +17,7 @@ CVE: CVE-2017-6832
 CVE: CVE-2017-6833
 CVE: CVE-2017-6835
 CVE: CVE-2017-6837
+CVE: CVE-2020-18781
 Upstream-Status: Inactive-Upstream [lastrelease: 2013]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
-- 
2.30.2


