Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546E9E7542B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117705.1766567653811888132
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lY6n12kZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567654; x=1798103654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QB4nNHhQYwXxkDybRS1e/I07mp0MkYKzoYTitCUjGdo=;
  b=lY6n12kZsTyEDCt5Tpoe+MwNqWqUvrOnEsr/JgzdkpG4IOH+PiCbwVOC
   4/NGa9rhXU13g2SyvqMA0k677mOqt1ZjMMNwt0mAuDwhvbCWQmeXx9iAZ
   wU0XxBVJvtTcAWkm+T02LtUH6VMWXabETlO7V7IO0KaEYpygToRSFS7Ix
   A3b/iXgKflR3Ci5sl2uzrLxgpwEj+2V/GyEFhse48CUbh4wUczFCM6Yq0
   aBLsmDBGiR3ReTWsqhdOypwGjgFxRe38occdxdkTOWkYBTW17hvXVJhB0
   SOFmEWcr1XkNv5rRSSRHzMJ2XpWn3VYSzA7UkQP1q7HC8pCPnvNYUPB95
   w==;
X-CSE-ConnectionGUID: KEotL8tRRYmxsgT4iQ2fMw==
X-CSE-MsgGUID: jHCtmCRYSAat6oeWn3oDvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223179793"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223179793"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3AD781C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:12 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E68088D29C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 387EF2000761;
	Wed, 24 Dec 2025 09:14:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/28] memcached: upgrade 1.6.39 -> 1.6.40
Date: Wed, 24 Dec 2025 17:12:46 +0800
Message-ID: <20251224091304.974-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122860

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.39.bb => memcached_1.6.40.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.39.bb => memcached_1.6.40.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.39.bb b/meta-networking/recipes-support/memcached/memcached_1.6.40.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.39.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.40.bb
index efcc6b4487..fedc693cca 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.39.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.40.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[sha256sum] = "23e5507e933b15463161d4c5d3921b0c5f340b542d6edd7f6c5e17c34f11a363"
+SRC_URI[sha256sum] = "a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


