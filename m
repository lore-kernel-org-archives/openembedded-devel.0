Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4858CA0FE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.15254.1755679203851170396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dV9cPB/N;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679204; x=1787215204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kQQHgNszBu66aU2081v0JGjvIOB7aqW5YN5ucaWWhwI=;
  b=dV9cPB/NDN+3Q8aH7W8/d4S+pR3TFrGKcgQ559/kUDYNmFbgmyGKCmaf
   IFtHAYQJ1sITEuIeu4Ap+NYj4vpeQeY3mnBbb061QlTGN+NehAM9r0sxZ
   jIB+f11eZWB+S1IkgVX8TRwIqLeGOSVI3m6G7YfXsuryDILlhpG11o4xZ
   6mZTERC+KvwETk+DqPprFXETZIT7IaQbqkULu/I4Ub9OntjkmnyM+c/s+
   vWAJrDskfq0q9M3xVCDUQMKPTOjHW20mcWk1j09pDOvv9ZSQStFHuj2k9
   JdUHFk902xQjrrlUchevTKO/d2hG0u+Ju9XkhLEe2ACZIAznsLXvl3A1R
   Q==;
X-CSE-ConnectionGUID: Zg7oWwLqSX+yD5cY5OK7Xg==
X-CSE-MsgGUID: D4Kz372LS9Sa4OE04cdnqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210032875"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="210032875"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:03 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 4DADE1000344
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:02 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0AA6D100084E
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id F3F782000123
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8D061A000B;
	Wed, 20 Aug 2025 16:39:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/26] libtdb: upgrade 1.4.13 -> 1.4.14
Date: Wed, 20 Aug 2025 16:39:29 +0800
Message-ID: <20250820083945.802-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119023

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtdb/{libtdb_1.4.13.bb => libtdb_1.4.14.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.13.bb => libtdb_1.4.14.bb} (96%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.14.bb
similarity index 96%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.14.bb
index 7221130fe6..a7c88a4573 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.14.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "5ee276e7644d713e19e4b6adc00b440afb5851ff21e65821ffaed89e15a5e167"
+SRC_URI[sha256sum] = "144f407d42ed7a0ec1470a40ef17ad41133fe910bce865dd9fe084d49c907526"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.43.0


