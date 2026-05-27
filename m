Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB28CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:52 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16785.1779875325160849935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NhSi8HbC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875325; x=1811411325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zbC5pey8ndhKPO/DdC86KtIfGjUiF1xmU01ZJrjusk4=;
  b=NhSi8HbCLn3O0NgsPLd2DbUsahrNDB08WJMrm90V3HEh6HiO2pWLZ44G
   uJXL/V9DiARiO3psIsb1bnoSP/9jdlgnkxLn3/xKiJIgUGT6rIXEprkno
   JzXENDH03Th4FaNTbRy41umsO1jSb/f8CpfuqyGuItXP+e2uISpVZgkyR
   xkXd1M2oxgPAL5kznQ79t61wzSqyIkJ0wsbk7H4YykAlNc41IE/NhMU1v
   BPSaof94yhLC+aSCq/jfBgDsHgGL6Y/kNt3oyvJiBT7/QDsuFbm4RHVFk
   /IzmoOvBpc7tMC9rem/XHqlyp8lCzR8ZI3RPy0GVB0+gScG0dyA2mdymz
   Q==;
X-CSE-ConnectionGUID: XgRRB9RnR1CdlYsLlm6wwg==
X-CSE-MsgGUID: tCRcehe6S5ijVr9ax7lNHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="240144193"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="240144193"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:43 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AAD8A1000143
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:43 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 61FE5C03F75
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7AD1482A2CE;
	Wed, 27 May 2026 09:48:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 15/56] memcached: upgrade 1.6.41 -> 1.6.42
Date: Wed, 27 May 2026 17:47:24 +0800
Message-ID: <20260527094805.2039-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127222

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.41.bb => memcached_1.6.42.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.41.bb => memcached_1.6.42.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.41.bb b/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.41.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.42.bb
index e41ebdb171..28d8ba3cf9 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "e097073c156eeff9e12655b054f446d57374cfba5c132dcdbe7fac64e728286a"
+SRC_URI[sha256sum] = "50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


