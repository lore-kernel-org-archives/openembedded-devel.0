Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68847C44510
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3416.1784111988596236789
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SFBqcrem;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111988; x=1815647988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dj34LUBTXvbS5/7m0/AgLR5+sfwqxXELGJBdNjdUZvo=;
  b=SFBqcremOv9jFvbcwx6dobdM9Xfj7gwcixzFcXZk07urtjJO2kNcWiw3
   jR+GppiW14hNKs2Z2Daz5OJzQhlOL5XqxszCBEboWl3FqjmZtM5Gl5z88
   lK6NqmNYrTrDI0SMkceWJsQiP3CNpXTibOyDX/P3+F64fCI2f4w/gtW+G
   aFpeQf6Zqsw/epGdKfyd3qwu+Y0irsuYuUW0K7jyb4pArFwtR8gTTF4L6
   VhGihJPmJJHAnyHX9xwcLIxbZOLqJbpp8k7fzDjFUKnspqgG8IYCPIJsN
   mcdvDOLzfUYzYBdZ7gm0CVOz7bftLHA4/OYNoFStBhmwXNrwtFmFUUWRy
   g==;
X-CSE-ConnectionGUID: H9c7Kb8xQLaR8sO0J4qSQw==
X-CSE-MsgGUID: 74IkgQc4TdeHaogC8mnx9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="226397995"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="226397995"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EF5B1406EC9
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A203710214DE
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A80521800B81;
	Wed, 15 Jul 2026 10:39:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 07/44] memcached: upgrade 1.6.43 -> 1.6.45
Date: Wed, 15 Jul 2026 18:38:37 +0800
Message-ID: <20260715103914.2120-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128180

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.43.bb => memcached_1.6.45.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.43.bb => memcached_1.6.45.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.43.bb b/meta-networking/recipes-support/memcached/memcached_1.6.45.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.43.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.45.bb
index 9a98932f95..516b97def2 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.43.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.45.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435"
+SRC_URI[sha256sum] = "d362c64e6d8d5287153501eabf7c85b4a761432fbf53f5d7b085d0bb1653c1dd"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


