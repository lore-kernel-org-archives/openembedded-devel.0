Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A0ECA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 22:12:51 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.7422.1757023969615923146
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 15:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jUZOIlVt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202509042212479dacb8ea4e0002079b-hqp1ex@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202509042212479dacb8ea4e0002079b
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 05 Sep 2025 00:12:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ugckhMR8pBf4C993CVnrTgcIwBwLcxXXx0gF3y0T9vo=;
 b=jUZOIlVtpGos86CV7uFL9VMPiPhJDOIQ+UgskP7vGNjXfGFThWzC1r/dPAvL/ol9hegrwN
 R6hO7L3CjZmkm8kK6LaqtjrwWoqoTwGbiJ95maY+77Q901auW98kFjiFKJJgxncWhvjaNG/y
 PoZtVC8OaKYXeR4fGfSpR54FjPvOzDWW4i8p+oYPx4x83632yafBo9KYobY26aHG55PMl7Vk
 KCCz404l+bdU6aaZibNvPzJ1Rhd+y4r+YMkgNzCUOn+wM2PezQJ+b3DTrNu6K8GNH91iGpt3
 IzhzdTR7EhuKyNRtmhkgJ7QAplB0+7+chuNfRSJ9Z9xsA8WvQqL853gw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 03/10] poco: remove obsolete config define
Date: Fri,  5 Sep 2025 00:11:32 +0200
Message-Id: <20250904221139.3131569-3-peter.marko@siemens.com>
In-Reply-To: <20250904221139.3131569-1-peter.marko@siemens.com>
References: <20250904221139.3131569-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 22:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119300

From: Peter Marko <peter.marko@siemens.com>

Inspecting log.do_configure shows that this variable is listed in
"Manually-specified variables were not used by the project".
Also sqlite ptests are passing.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/poco/poco_1.13.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
index e338d88580..3a15b74537 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -44,7 +44,7 @@ PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON,-DENABLE_NETSSL=OFF,openssl"
 PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON,-DENABLE_CRYPTO=OFF,openssl"
 PACKAGECONFIG[JWT] = "-DENABLE_JWT=ON,-DENABLE_JWT=OFF,openssl"
 PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
-PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON -DSQLITE3_LIBRARY:STRING=sqlite3,-DENABLE_DATA_SQLITE=OFF,sqlite3"
+PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON,-DENABLE_DATA_SQLITE=OFF,sqlite3"
 PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
 PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-DENABLE_ENCODINGS=OFF"
 PACKAGECONFIG[Redis] = "-DENABLE_REDIS=ON,-DENABLE_REDIS=OFF"

