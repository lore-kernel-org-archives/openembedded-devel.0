Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FB0D1D880
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:24:03 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37917.1764833040742939705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=m0+v/f16;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20251204072358833b8be219000207b3-8_lrfx@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20251204072358833b8be219000207b3
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 04 Dec 2025 08:23:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pNJJNNqJX0eYkCnasEsajFWhHNags/X+snyrpUuWFyE=;
 b=m0+v/f167pWweaxWELbL0DM47D0d8ENi6Zry/OrmxDh7Udp1GA3T19cnSWRNFZqpzGgF97
 D/eviHa66lqne+VvAzQHC/KwjwNgQkIQDERbqRu+R7BCElA2MH8/05ss1ac+EwbJ2yZXWenY
 9duM8n8oSQj5ZwrAEKTxOx7v5PxpamQuviQtb4oLxriQbupFagwDh1jLsRjD7gDqeoEpM4Yb
 J4Qggc+1J+//WCvr+ZBzTprBqwcOy1Oza478gSIXDlVqwZK86ksqa2KtSMlm3RPVpWodCKU7
 RHnikq3AWgznwURUkhzshHZpIJXPes+BbnmYWEWHhKW8DYW1R7jRbbRA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH v2] libcoap: upgrade 4.3.5 -> 4.3.5a
Date: Thu,  4 Dec 2025 08:23:54 +0100
Message-Id: <20251204072354.10142-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122300

From: Peter Marko <peter.marko@siemens.com>

Changelog [1]:
  * Fixes the following CVEs
    CVE-2025-59391
    CVE-2025-65494
    CVE-2025-65495
    CVE-2025-65496
    CVE-2025-65497
    CVE-2025-65498
    CVE-2025-65499
    CVE-2025-65500
    CVE-2025-65501
  * CVE-2025-50518 not fixed as user application error.
  * Support for Mbed TLS 3.6.3.
  * Support for RIOT update changes.
  * Fixes for later CI environment builds.
  * Critical reported bugs fixed.

Add tag to SRC_URI for hash verification.

License-Update: copyright years refreshed [2]

[1] https://github.com/obgm/libcoap/blob/v4.3.5a/ChangeLog
[2] https://github.com/obgm/libcoap/commit/993c12ac92ce6a24a409924fe78a5c0fe7246699

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: corrected git branch name

 .../libcoap/{libcoap_4.3.5.bb => libcoap_4.3.5a.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.5.bb => libcoap_4.3.5a.bb} (90%)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
similarity index 90%
rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
index a4e5f5ca46..55c5ed8775 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
@@ -5,12 +5,12 @@ RF range, memory, bandwith, or network packet sizes."
 HOMEPAGE = "https://libcoap.net/"
 
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9aa68c0f6785376aa8ec7f4f1aa6ae3c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05d17535846895e23ea4c79b16a9e904"
 
-SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/obgm/libcoap.git;branch=release-4.3.5-patches;protocol=https;tag=v${PV} \
            file://run-ptest \
            "
-SRCREV = "7cf7465b784baded4de183290c547d582becfd28"
+SRCREV = "e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9"
 
 
 inherit autotools manpages pkgconfig ptest

