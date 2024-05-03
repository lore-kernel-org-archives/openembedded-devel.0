Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86A6C25B4F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 09:42:57 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.8655.1714729367311028127
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 May 2024 02:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=vlkbJwXZ;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=f1F8hGT2hNW4N1u/5jk3AgXy4FrQtGZHd0Wry53BwX4=; b=vlkbJwXZ73qxd4rwayCHKaSDoK
	pqs3Bk7q8dQaIScPmm65PuDS/+nKSiRggKPKoyAHw4wUQTUsS/KVFbMynRVo2c9ndu5sPgCjXt66u
	THAcR7osMgHsBT1OLUDRbdTLvJioD9/unK4Ez3UmnB0CPI7rYuBzpJOcsv13YuRQ0qzUVVV+AWqjM
	mBuSwKhXtJs7/KyU3gOuNCSHN1tisFyjAg9Fa7U0tcVjs5ZOvmMutfjemy7mkPXiN4ZtzkNak3LnB
	aavkBADX0RIDIZk7WDZEZ7F5E6dcBGrnFAg1PxVluCf68OJ+NnU4IFtDcUJO8X3vNrXs/pmE/QWxq
	Tgr81s6g==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s2pRE-000MaL-Uy; Fri, 03 May 2024 11:42:44 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s2pRE-000A8x-2G;
	Fri, 03 May 2024 11:42:44 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH] nodejs-oe-cache: fix offline install of dependencies
Date: Fri,  3 May 2024 11:42:20 +0200
Message-ID: <20240503094232.2114574-1-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27264/Fri May  3 10:24:33 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 09:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110244

Apparently, npm has changed its request accept header, so that cache
lookup misses. This causes an ENOTCACHED error when doing the offline
install in do_compile() from npm.bbclass.

Fix it by updating the fake cache entry to match the newest behaviour
from npm.

Note that npm doesn't agree with itself, as it still uses the previous
header value when doing `npm cache add <pkg>`, but the new value when
doing `npm install <pkg>`.

Bug submitted upstream:
https://github.com/npm/cli/issues/7465

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 .../recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
index f59620764..eb0f143ea 100755
--- a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache
@@ -30,7 +30,7 @@ const xlate = {
 		time: Date.now(),
 		url:  key,
 		reqHeaders: {
-		    'accept': 'application/vnd.npm.install-v1+json; q=1.0, application/json; q=0.8, */*',
+		    'accept': 'application/json',
 		},
 		resHeaders: {
 		    "content-type": "application/json",
-- 
2.44.0


