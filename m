Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F74C021A6
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 17:42:50 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.27150.1739554966107935241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 09:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=W3CaPGRb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250214174241aae68106962d0b68ef-sxkodk@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250214174241aae68106962d0b68ef
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 14 Feb 2025 18:42:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=S2DIRDfB2z/DruIea7WBwds5coIxaO8+qVpXYPhVH6M=;
 b=W3CaPGRbK+f94SrHlceADotbIh11EKynWLo20f9McleIoigDiUR+11UPEx3Q9YgEBfEZpL
 lOLsN8mVhKkuOQqhBdccS8GNAphYNXzZV98aoD9EJjCusKfhFV5VkUv9OkmPRSPEDU+Arm8r
 Hht60lu1hcK0ZW6VwPG6/yQ2I5WYUXrYZgRWQaRF6VcUhZnd+qOcDj3F5Cceux1XQImWoY0R
 tp3klfo0GoEaTWchk0TIGRDIhzBlYbzBtd13xBmG35/SCjBzcB4tdUvfSePWxQp3Y9SjrnEA
 nA/QRoMaXj6Ymsp4GCvUPONRS19WQlSoKlvJ7zXEjtLFgUboEDN3j6IQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH] python-grpcio(-tools): add grpc:grpc to cve product
Date: Fri, 14 Feb 2025 18:41:54 +0100
Message-Id: <20250214174154.13911-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 17:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115490

From: Peter Marko <peter.marko@siemens.com>

These grpc python modules contain parts of grpc core.
Each CVE needs to be assessed if the patch applies also to core parts
included in each module.

Note that so far there was never a CVE specific for python module, only
for grpc:grpc and many of those needed to be fixed at leasts in grpcio:

sqlite> select vendor, product, count(*) from products where product like '%grpc%' group by vendor, product;
grpc|grpc|21
grpck|grpck|1
linuxfoundation|grpc_swift|9
microsoft|grpconv|1
opentelemetry|configgrpc|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.70.0.bb      | 2 ++
 meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
index e295e0329e..8af6bb5714 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
@@ -20,3 +20,5 @@ SRC_URI[sha256sum] = "e578fee7c1c213c8e471750d92631d00f178a15479fb2cb3b939a07fc1
 RDEPENDS:${PN} = "python3-grpcio"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT += "grpc:grpc"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
index bebfa51be1..c9edc1d541 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
@@ -35,3 +35,5 @@ CLEANBROKEN = "1"
 BBCLASSEXTEND = "native nativesdk"
 
 CCACHE_DISABLE = "1"
+
+CVE_PRODUCT += "grpc:grpc"

