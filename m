Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76AACA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 20:46:54 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.32717.1755204412616585996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 13:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NYJgJ+Lp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202508142046496c6e23914b4e05e700-ibkib8@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202508142046496c6e23914b4e05e700
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 14 Aug 2025 22:46:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5Lltd3u88V8Ri+K55+mxAgxXBp8j4o1WJOM+gqzU8Hs=;
 b=NYJgJ+LpKMD7j+kBao7ST+w/KFrGHPPhlmqd+F+LhsCR4g6qKFJnxM+XjwnldB5v3JyqIe
 wr6dBSDQuKX+uAmkTQOx/q1jbc4HKa/EbOaXTPeo5ZQnSEL1ZirUNQ9nNCIxh68VPOhL+sMa
 jvjGmn4c/7spevmewUFrsQxO0RgmDQEerY+XBB5Y4/eqAuzXHuZr2fIMXThzkGREvphVLeQj
 SXGBWpnVHTFrY1pHxVNXC2zj6x0GrvawJS5hKCamFbi72mvcpFch4UyeQrVKYFJ+cqjUfyQB
 /8+ZM6TUGEIGPNd5GpXT9QJZJj919/bfzcGJN5zg0qmd11qeZAOQMHhA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH] fcgi: upgrade 2.4.2 -> 2.4.6
Date: Thu, 14 Aug 2025 22:46:03 +0200
Message-Id: <20250814204603.2906352-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 20:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118948

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-23016 (in 2.4.5)

Add tag to SRC_URI.

License-Update: file was renamed without any text change

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-support/fcgi/fcgi_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
index 03425c53c9..0f18b8f018 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "FastCGI is a protocol for interfacing interactive programs with a web server."
 HOMEPAGE = "http://www.fastcgi.com"
 LICENSE = "OML"
-LIC_FILES_CHKSUM = "file://LICENSE.TERMS;md5=e3aacac3a647af6e7e31f181cda0a06a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3aacac3a647af6e7e31f181cda0a06a"
 
-SRCREV = "382aa2b0d53a87c27f2f647dfaf670375ba0b85f"
-PV = "2.4.2"
+SRCREV = "1ad48735cdf86d918936b53739348356daaa486d"
+PV = "2.4.6"
 
-SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master;tag=${PV} \
           "
 
 

