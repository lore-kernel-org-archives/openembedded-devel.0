Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116B6103E31C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:17 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18758.1773312790653252746
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LtRL5pTC;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312792; x=1804848792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b45wRL04kP8wS/ZpWcti9BWnhmbYaRoMlT7eVaXnFX8=;
  b=LtRL5pTCXhryBjD43AT3R7EtjgXRFxMDNhr5ZhikjNEW0RHpPEFy5Dko
   cJH5ZrvEkFNEfstOF788NPl1MfdnllW7WMFR+DpOilwgNJo2VBT+Chdf2
   IT6cmyT4GoQSuo71Ck7I8NeO0YTulNFOsVZHclpV1jsWSx1N+c25AOrx/
   Dj5AuEGueBd5QYPvQtBrKHzQ4KP3MLTeTOzbegD0VbvYLOleSxzRmAngT
   u5qnmGGb4WoabqPlpTouMqtAqgMZuFXD+ZGO7JG+nsVo/y5mN+2F4cxLn
   /3pYmKQa6BUQegdG5KQTXQLOrI14Q+CB5wZ87Oea7vFyOu5r0fNWK7ULj
   A==;
X-CSE-ConnectionGUID: IQ1dPUYDSfObVAJZ2mtjUg==
X-CSE-MsgGUID: JRg2gqCmQSWbXou8LqJtwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211989666"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211989666"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:11 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5CA981C166D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:11 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 10DCB14042C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2271018029A2;
	Thu, 12 Mar 2026 10:53:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 21/64] memcached: upgrade 1.6.40 -> 1.6.41
Date: Thu, 12 Mar 2026 18:51:37 +0800
Message-ID: <20260312105220.1856-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125121

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- tests: make slabs-reassign2 test more resilient
- proxy: reduce flakiness in t/proxyunits.t
- proxy: fix off by one in temp string with 250b key
- slabs: fix hang and crash.
- Fix failing proxy*.t tests on some systems like OL8
- Account for absent 'ssl_proto_errors' in stats during SSL tests
- Fix test compatibility on IPv6-only systems.
- Use SSLv23 method when TLSv1.3 is unsupported (e.g., macOS)
- extstore: more compaction write patience
- parser: fix lru command regression
- Fix: avoid null print for slab busy reason
- extstore: testing around rescued compaction items
- extstore: fix compaction checks wrong refcount
- proto: armor against empty commands

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.40.bb => memcached_1.6.41.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.40.bb => memcached_1.6.41.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.40.bb b/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.40.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.41.bb
index fedc693cca..9d759069ba 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.40.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[sha256sum] = "a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd"
+SRC_URI[sha256sum] = "e097073c156eeff9e12655b054f446d57374cfba5c132dcdbe7fac64e728286a"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


