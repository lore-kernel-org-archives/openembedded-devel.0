Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5070CC282D9
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2203.1740525898314938418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cgwpD2I/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525900; x=1772061900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wB8XyEbiF7xZbpSYPSBFPv2yeY0ygL7ncpSWjD+l9RA=;
  b=cgwpD2I/jBOc3oFgFShKha+X6TgM2Fgy8mEoJ+0VuZIMwQ6sMF+7YDw0
   yLphThFkJ2W+ptPfTg+foAmjSN/JqKlmB8kK/ku/J3old7DtLzSQ0++ih
   L7tjLPpbDIAYzBF8ANXiX4bfS/E3w/OmT74NzV0i/4Dx43onAP66PKXhy
   bhliLkH0I05bK48TGK7x3d33hNvImXpsxD7qpFVL/izjiOF6fA6irnBnK
   4FyFMZisKtcRyDvZB3wkfG45DwyCAvBxoQn1BTxqI+jpjKgv8nT9IQp8/
   j3HAowzBvDHxdzX2E7fWEwzL5fUv6uYaLwPt4EzQ1wdsv2xESMc+GUAcx
   w==;
X-CSE-ConnectionGUID: vyjZR44JS++rmL4S3hn2Lw==
X-CSE-MsgGUID: IdtUPB3LS+OBGVcccHDzGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179142881"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179142881"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 49519E6141
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1360BD4F5F
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC5DB1A000B;
	Wed, 26 Feb 2025 07:24:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 20/51] memcached: upgrade 1.6.36 -> 1.6.37
Date: Wed, 26 Feb 2025 07:24:10 +0800
Message-Id: <1740525881-21103-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115618

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- proto: -X disables stats detail as well

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.36.bb => memcached_1.6.37.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.36.bb => memcached_1.6.37.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.36.bb b/meta-networking/recipes-support/memcached/memcached_1.6.37.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.36.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.37.bb
index 26a86d6f48..e77ca464c9 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.36.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.37.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[sha256sum] = "2eeeadbe8ab6c6848654594733e9da4875be7fc870a2c28f651f5bdb4053d041"
+SRC_URI[sha256sum] = "74a0629370f6bf60873937e439cd59659fbd7a84f24c1095bc082da0c8406969"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


