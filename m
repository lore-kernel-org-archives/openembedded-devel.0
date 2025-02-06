Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23317C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:27 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.50465.1738869622612584275
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VWBlymhI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250206192020659d648b291fbcea6e-uxkvdg@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250206192020659d648b291fbcea6e
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:20:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NkKDN16T82M9I4JcCJ16MI2rVFSRUD6JvuELgrnu38U=;
 b=VWBlymhI53yxKcZZpg3Vc0HTmntpDJ43dPVaV4DfduuZsZSEqyytRI8z1a4IgwaGh/zm65
 CMrY8mjjObv4cCp6ABuJ37GumPk9SQO+/sTK9mIx7A6Y78SGws2TMqklIxAfEQc+jXjUlg5k
 ua90LGwYXjK6fIELmBOmHb27Otb95zc3brDQupNhF8KY1btm0PcKBVnnQ094J3kC4uFrPqT4
 nhhn6U6zZIRYoX6t3sqAUawpzpeuDUbRlskj2JzEJQ1BVn8xfzC4KdyFQDxq20vBH9wxlhGx
 2tm8+/XrV9Ua8qkEpZ28Dfp2tMbdbRRjL8KvQxHnY48n35Cp5R26W13A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 8/9] python3-grpcio: add missing license
Date: Thu,  6 Feb 2025 20:19:02 +0100
Message-Id: <20250206191903.2324783-8-peter.marko@siemens.com>
In-Reply-To: <20250206191903.2324783-1-peter.marko@siemens.com>
References: <20250206191903.2324783-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115300

From: Peter Marko <peter.marko@siemens.com>

LICENSE file contains 3 licenses, but recipe lists only 2.
Add the missing "Mozilla Public License Version 2.0".

License-Update: added missing license

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index 26d7564590..8482240b68 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Google gRPC"
 HOMEPAGE = "http://www.grpc.io/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0 & BSD-3-Clause"
+LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
 DEPENDS += "abseil-cpp c-ares openssl python3-protobuf re2 zlib"

