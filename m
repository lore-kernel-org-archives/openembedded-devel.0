Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F18EC35FF1
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:54:55 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.39864.1742165689268562806
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZkCAt+Zn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250316225445a15a9dbf434307b22f-fjstnz@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250316225445a15a9dbf434307b22f
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:54:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Y2xBgNPcLrLbnbgdIpKFkaqjOK4sLrXSod72tAW4EIk=;
 b=ZkCAt+ZnzMJrSv3vdZeWtxJd9j7hnIbDcI8oAn7gPj1MSjVtInSCLZVdsDV9TEic4Ko63h
 uGCPNTcotGUgDo9xXu3WQv7HgnDLLMdN5F6zgseHJ3TAl5Qw8zqxplQgEKuSOUv9DbhE5SYj
 0wB8UgWApB+3k8y10fu9+kjlnwH9/WXycMnT4BBSecnQwRBxLXsSRTQUO3CwXXQKqyzHzR4k
 JdOcL0EgrJEUm9xZavVahHM+jf55S9pjhZF8XVo/AqNdmJVajvxjx7+hyA5vKiVhtHhAfkBY
 BLRN+WP2MIl9NU/Es9x7vteV8CjxbuzTTs43g7Kils6hqD+qgAZxvEJg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 01/12] sox: extend CVE_PRODUCT
Date: Sun, 16 Mar 2025 23:53:47 +0100
Message-Id: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116006

From: Peter Marko <peter.marko@siemens.com>

Add all relevant items from queries:
$ sqlite3 nvdcve_2-2.db
sqlite> select vendor, product, count(*) from products where product like '%sox%' group by vendor, product;
commugen|sox_365|1
libsox_project|libsox|1
sox|sox|3
sox_project|sox|10
sqlite> select vendor, product, count(*) from products where product like '%sound_exchange%' group by vendor, product;
sound_exchange_project|sound_exchange|16

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 800fcad2c9..c1edd0fad7 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -35,6 +35,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"
 
+CVE_PRODUCT:append = " libsox_project:libsox sound_exchange_project:sound_exchange"
+
 inherit autotools pkgconfig
 
 # Enable largefile support

