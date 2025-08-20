Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E27CA0FE5
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.15250.1755679199610507839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=groyvit3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679205; x=1787215205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LsAuGLhGzVYY6GRNZImdTG0gVy6g+JG+j7ny+4HcBmQ=;
  b=groyvit3W3WyTNzU3o+kP/Omny5KiCdZwHxWmpt73BASyLMsdalNrq9q
   dRFVKuTqi3+6HlDNtXXzT2lSJRPq8SUVhAlxtQgsy+80AoBYDq7H8qIIv
   kfHbjSXTNoJ9VpviCDjjmhIJUBk/+iw+Lo1ki+z+ztKI1h3rjhMLg7Btz
   1w5FecL2SmwLJ1u0k8Dfg4FGnTVckWxUSKNLl/5GfsBZTHVAXMVNDTXkM
   th7oR7xTMWkybqDxqEEGFq2JywTkk+ZKNE4QmwIo2KgytoxK3BmUYKOaF
   UMOd95/tCw0irxZ8Hzw+0DVzzmieUszcsET6FKVojv5PGtSGYFcs/ULqB
   Q==;
X-CSE-ConnectionGUID: K6tp6gv6TOO/Ch5ayCuaOA==
X-CSE-MsgGUID: lSDBPEuqSnSCi7olWSmTBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210000430"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210000430"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B6CF2C000BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:03 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7577A180632C
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 6EF921000350
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 64F281A0074;
	Wed, 20 Aug 2025 16:39:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/26] nftables: upgrade 1.1.3 -> 1.1.4
Date: Wed, 20 Aug 2025 16:39:33 +0800
Message-ID: <20250820083945.802-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119024

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nftables/{nftables_1.1.3.bb => nftables_1.1.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.1.3.bb => nftables_1.1.4.bb} (98%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.3.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.4.bb
similarity index 98%
rename from meta-networking/recipes-filter/nftables/nftables_1.1.3.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.1.4.bb
index 09da57a372..eb119c6451 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.3.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.4.bb
@@ -14,7 +14,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "9c8a64b59c90b0825e540a9b8fcb9d2d942c636f81ba50199f068fde44f34ed8"
+SRC_URI[sha256sum] = "3444f0012af0472399eeae89a758b9c6dc5f311f6c67a48988fa1600fc4bac86"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.43.0


