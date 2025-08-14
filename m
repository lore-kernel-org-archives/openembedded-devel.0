Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C5DCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 22:37:35 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.35024.1755211052125016963
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 15:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=OsBTpbE9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250814223727a85929bdeb6567e150-lnjjtr@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250814223727a85929bdeb6567e150
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 15 Aug 2025 00:37:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NOnxxYMTAGBygFuOTTWcwL9A65Q6s8aIrBcvratwXks=;
 b=OsBTpbE97QUF4KtmfB/JLTFNSWM6GDLlgxtdrfNKHLo5ea/tbSQxB3o+yZC/L7Ix4Qfdj7
 TAJCndHHJ/0qglGckHOuGCVQV6+SYZ+dWj476s+RIhFd35b5D72qJDkyWCJhrQZetZrSCD5P
 s1ichQM419IgSYoiL9dgHvKCIRatcpCQ7M32Ueo4vpe2rG9Xoi62fqbqYInas3+LsPb9EzD2
 v0JwUEV4ym5qr5olSN5TMbZvu4ltDsGCTb0NPDcZsRnESGw6DSm+SGpcytBYym44Ua23Bgiw
 HMMi9J7k4NFzjqqyyojTwTRb9CFaO+FYaAARZ57ZR9Br1rMveWxIFhug==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2] fcgi: upgrade 2.4.2 -> 2.4.6
Date: Fri, 15 Aug 2025 00:36:39 +0200
Message-Id: <20250814223639.2924283-1-peter.marko@siemens.com>
In-Reply-To: <20250814204603.2906352-1-peter.marko@siemens.com>
References: <20250814204603.2906352-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 22:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118950

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-23016 (in 2.4.5)

Add tag to SRC_URI.

Move version to recipe filename.

License-Update: file was renamed without any text change

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: moved version to recipe filename as requested in review

 .../recipes-support/fcgi/{fcgi_git.bb => fcgi_2.4.6.bb}    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-support/fcgi/{fcgi_git.bb => fcgi_2.4.6.bb} (61%)

diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb
similarity index 61%
rename from meta-webserver/recipes-support/fcgi/fcgi_git.bb
rename to meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb
index 03425c53c9..691274578d 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb
@@ -1,12 +1,11 @@
 DESCRIPTION = "FastCGI is a protocol for interfacing interactive programs with a web server."
 HOMEPAGE = "http://www.fastcgi.com"
 LICENSE = "OML"
-LIC_FILES_CHKSUM = "file://LICENSE.TERMS;md5=e3aacac3a647af6e7e31f181cda0a06a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3aacac3a647af6e7e31f181cda0a06a"
 
-SRCREV = "382aa2b0d53a87c27f2f647dfaf670375ba0b85f"
-PV = "2.4.2"
+SRCREV = "1ad48735cdf86d918936b53739348356daaa486d"
 
-SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master;tag=${PV} \
           "
 
 

