Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8806FC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4904.1783503931899056496
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lBRaSgqZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503932; x=1815039932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MVu5AG1pHOGeRWQFI+P69c56kvpns8IlD9bSFZq4pTU=;
  b=lBRaSgqZ+ucamZhuCVTl/2NPrKbTkY0nsQbF0ussSkHMtwTMtvIVHLaB
   W+GFemzlpwyCnNEQmxMxajOjNk4rhRA7v1914vhgeDZcEr814+mcGXJsy
   r+PrrV18l6kPwb/I5AwY1XdS5CcWeoVO72JadRwAKdFBdJhO8AKdXoq/E
   bD3rRKC92+XFmGVSGm1lu/7GFrOKYX8spwf7wI6SOmfTMk7ChB/udyC8O
   wyC1SlUZjJpyHeKOlI4+uUSYz0k0Q4y5RPvtTgdFu3xpCE0xhJizkep0u
   OPGgr6YGvZJ9HTpNJlsjHdAuuCg9kunKFA2WQmE9zcr16JutLJXtdP2PV
   A==;
X-CSE-ConnectionGUID: vk9BoWMVQvuYZe6bTldjxg==
X-CSE-MsgGUID: og61Z4lQThC7UdC8DOXweg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246626021"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246626021"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:29 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id ED4F2C00541
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:28 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A5CD583CCAF
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CF0651801139;
	Wed,  8 Jul 2026 09:45:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/37] memcached: upgrade 1.6.42 -> 1.6.43
Date: Wed,  8 Jul 2026 17:44:19 +0800
Message-ID: <20260708094508.2060-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128080

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.42.bb => memcached_1.6.43.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.42.bb => memcached_1.6.43.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.42.bb b/meta-networking/recipes-support/memcached/memcached_1.6.43.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.42.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.43.bb
index 28d8ba3cf9..9a98932f95 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.43.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7"
+SRC_URI[sha256sum] = "8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


