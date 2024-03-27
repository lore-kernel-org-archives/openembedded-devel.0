Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C115C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 13:28:27 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.37540.1711546097858326955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 06:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Sz3adveD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240327132814e19b76409b8c2157c2-87tg2i@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240327132814e19b76409b8c2157c2
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 27 Mar 2024 14:28:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=IkkDJU5LpYnK2J5dxp95EGck5ef9JR4e1msFHgSh0Vs=;
 b=Sz3adveDtUgNvvyvyeF2O6RO9BhQ51ONXnY6qtuZPm4q6lsJuDA+fdk6YKdq5zTBS5cnWk
 5QFpmMLhoPhCB519ATr9CjkCy8fXdHOEdAwudjrpbP6PBRsPrQHrDJg1NjkaV9MHvud3nBEB
 ih054pw995+1WAKfa0z3zSPdUi1ZI=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] python3-grpcio: cleanup dependencies
Date: Wed, 27 Mar 2024 14:27:11 +0100
Message-Id: <20240327132711.760220-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 13:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109644

From: Peter Marko <peter.marko@siemens.com>

* setuptools: this is needed only for building
* six: no longer needed for some time already,
  see https://github.com/grpc/grpc/pull/31340

Current requirements:
https://github.com/grpc/grpc/blob/v1.62.1/setup.py#L539

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb
index 6efde8da5..8405ebed0 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.1.bb
@@ -12,10 +12,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            "
 SRC_URI[sha256sum] = "6c455e008fa86d9e9a9d85bb76da4277c0d7d9668a3bfa70dbe86e9f3c759947"
 
-RDEPENDS:${PN} = "python3-protobuf \
-                  python3-setuptools \
-                  python3-six \
-"
+RDEPENDS:${PN} = "python3-protobuf"
 
 inherit setuptools3
 inherit pypi
-- 
2.30.2


