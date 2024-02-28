Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5647FC47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 12:39:54 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.11981.1709123991504076721
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Feb 2024 04:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=ne49h+AC;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=FuYzjAgF;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1709123991; x=1740659991;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5iuUzXm34GeQwNzRCTigm715WcWwMMF2vwwZQTO1j84=;
  b=ne49h+ACZmm9sMd/470uGD+pSWmfOGsefRbcXYNVQwWsxzffRV97qFA8
   NJ2wPWXCD12x8j+f6887cwzNTsnmxvjglYIbUuciKCrhah5m5OkjkR0ht
   fCN7fZ2KpQP43/Y7vX4wFQeN3KY6ju5slzVh8k8qm750U7ZXJbDj0rNmO
   8WRDyT4gkPgwpcup3yGGrqZJM8tvC4Leibhyn1H/RZmex26q/TUTMU/bw
   R675Jk4xY3/deeECWHNZ5oG2yxXMgl9Aztcj+W3p9/8Rb2yqJKARg+/be
   gMSSvVXgVF3gDbxejLJ+RiwqdjBvjXBSy6Z3zkf2qv8McnrvwfLRTl9Oc
   w==;
X-IronPort-AV: E=Sophos;i="6.06,190,1705359600"; 
   d="scan'208";a="35641692"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2024 13:39:49 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5357116E5FA;
	Wed, 28 Feb 2024 13:39:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1709123985; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=5iuUzXm34GeQwNzRCTigm715WcWwMMF2vwwZQTO1j84=;
	b=FuYzjAgFR82pO5Ord5QU18whuHOKODk5j08tNFi5jN/kksYhfYDIx1KZgXCLUisU+tByJB
	Afa3zIZYwx6f3rm9djQsg4gmMju2KL4TOwpUN0KNzl/ewhl88BaAlVe1IED2Z8ORaPAnhs
	DkC96wvinAuYd6s/z2tf6QBYe/cRc5N/uAStpH43oDiIn+27E7UWM9gw2AqcwN9mDAXO+N
	7T9QpvuDES31s9RErdZH/2D7YlaoEDIrk6cbRHpwWUcijkVd8mRkS8h0mGTH9+Q5dwggG8
	IElqbNUC9iuGnt+1Jmy0CCRg2ZyY8am5yPcqJHmbr9DY64g0SfpTx0M5SpQ8ow==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [meta-oe][PATCH 1/1] libkcapi: Update HOMEPAGE url
Date: Wed, 28 Feb 2024 13:39:41 +0100
Message-Id: <20240228123941.2913915-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 12:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109049

The library's homepage url has changed.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
index 35e9b032b..a34614dd9 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
-HOMEPAGE = "http://www.chronox.de/libkcapi.html"
+HOMEPAGE = "https://www.chronox.de/libkcapi/index.html"
 LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d8a091d797491204567185a6efce70f"
 
-- 
2.34.1


