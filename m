Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B85C282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 18:08:25 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.619.1741198094647997698
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 10:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EQU6hbG0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250305180811e0609920dc5b9012b3-gp4fyy@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250305180811e0609920dc5b9012b3
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 05 Mar 2025 19:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=B0omcidODTYAM5EmdJhKrsH7lccOI1AqtYUdFPGj7Bo=;
 b=EQU6hbG0Ks0oxBpqxNlGlWj0VWH8kgr1nFarkKmUN3C4+lp97GJPngBiM2jBGHKVQZsAIu
 7lDy8Qb4CH5IiMb2460r38206d/voqhxVhX0+4ikEyECzZmiCh7dLJdIg/92b+X1PVhQ2R84
 baGqQV5IBw8Bz7lsIgjd+A+x4KKrpXZjTuFJhG+3C0400pWP4E/+S1xpf5zdetj5GnwPI1Sx
 LH+nyuC5+JFBEI33eQ5nicpOlhKjSAQca4CHxCYUyek0pTzO5qdV56+mGdLHOFjmJ6nthPKO
 bGD0qsvr4HNJ0xEilgdVfRwu5LJp8OYbeIQSGR+eUr/K4jm463BKyJ0A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] libmodbus: upgrade 3.1.10 -> 3.1.11
Date: Wed,  5 Mar 2025 19:07:34 +0100
Message-Id: <20250305180734.772654-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 18:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115762

From: Peter Marko <peter.marko@siemens.com>

Resolves CVE-2024-10918

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libmodbus/{libmodbus_3.1.10.bb => libmodbus_3.1.11.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libmodbus/{libmodbus_3.1.10.bb => libmodbus_3.1.11.bb} (92%)

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
similarity index 92%
rename from meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
rename to meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
index 9e17f91669..80644b0833 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.11.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=https"
-SRCREV = "2cbafa3113e276c3697d297f68e88d112b53174d"
+SRCREV = "5190e5e141780ae481f24be16d7b39a5f3ad8f8f"
 
 S = "${WORKDIR}/git"
 

