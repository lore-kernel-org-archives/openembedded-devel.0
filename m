Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6922CCFA00
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 23:01:50 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.908.1762038099455485293
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Nov 2025 16:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RySQLGFq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20251101230135a3a2b842fc000207a3-8ndnln@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20251101230135a3a2b842fc000207a3
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Nov 2025 00:01:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zvhhF2v8HBACeb6JhJfAJ0rI8an78lTThtEqXe/0WYA=;
 b=RySQLGFq7TaeV1ZGivVGyMBsyr30kjhTRarKYnxHtlALzvA5wkeeae+8s8jQCJRNnc6wVW
 RCLZRwHNBgcIqLjHRN2X+9uPfEhzOvPXq3al55GQXUIfGYl6F04maMQV/RGfdqY2ILXz95Zs
 lfifz+i4LIzi5GmrG4Rym/XuNAz2UQgEZW8WqNsX1vLSMekFTjsf8viOsxYzRbgQC8YhGfJB
 O0IoVCMeVC7sAkzQJKWU/nfqwKgsohH6D3+oTeZhpwu6VntrUYmL9MPNm/0q9LyzYdjUlTWM
 Y+5eLkFO8WUJXtfNG0I5jOHm2TPAGIjQijw1TujixEoy5NwW5ARGihtQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH] squid: upgrade 7.2 -> 7.3
Date: Sun,  2 Nov 2025 00:01:33 +0100
Message-Id: <20251101230133.2753445-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Nov 2025 23:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121256

From: Peter Marko <peter.marko@siemens.com>

* https://github.com/squid-cache/squid/releases/tag/SQUID_7_3
- Regression Bug 5520: ERR_INVALID_URL for CONNECT host with leading digit
- Quit NTLM authenticate() on missing NTLM authorization header
- Fix Auth::User::absorb() IP list transfer logic
- Fix type mismatch in new/delete of addrinfo::ai_addr
- Fix libntlmauth string parsing on big-endian machines
- ... and some code cleanups
- ... and some CI improvements

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-daemons/squid/{squid_7.2.bb => squid_7.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/squid/{squid_7.2.bb => squid_7.3.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.2.bb b/meta-networking/recipes-daemons/squid/squid_7.3.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_7.2.bb
rename to meta-networking/recipes-daemons/squid/squid_7.3.bb
index 0891d2208d..8d1d84c04e 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.2.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "5e077be1d83a9e696ce8d0d9e723b1273152207a091404be68a4b9a9e18c7003"
+SRC_URI[sha256sum] = "dadc2a9a3926ce1b3babeaa7a7d7b21cbb089025876daa3f5c19e7eb6391ddcd"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=c2a0e15750d3a9743af9109fecc05622 \

