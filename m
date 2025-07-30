Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CF7C88CB9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.31493.1753869308081090093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o3JW84EO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869309; x=1785405309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W0RoXQXNxMHHDc2Tbb/JgSVHXT3kH6x4J0LzIB4YtpM=;
  b=o3JW84EONBe1YMOpNIOSXok0ksjtQX+n7tjNE/5aEqZcSKX57P5jvdUj
   hs1v1BhjaunrwYFSBm7yZ6GjBdZlLnGjnjIYmqtPKvVkjcxr5kTb7gxFt
   n3Ha5Dsq8w++PCxHmh8kJMJq+xzn1LVVKfPdne994Lbby1s+Leq81D1aX
   QpTAvyZfCGpeDanxU3p5oJDULTuAfmx6JAzE6MViKoM8++ldIdOFcPN+9
   urVM0ZmIZOFqWa7d8DmTPOrLKtlDLK9clzDIrUpWos7n+PiMV2BTuoDPI
   WimbcDm6y7lzJgC+uO5R8+avqis7xEMMHRvHoaZZOQsb2VeIFkZ8AEdVh
   Q==;
X-CSE-ConnectionGUID: aPYlAesYQsGT93FGOmmocA==
X-CSE-MsgGUID: 8lqxtZnqSqehRnVfZ7nCbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207849420"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207849420"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:07 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7BAA91C00093
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DD2E9C03713
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9FC5B1A00A1;
	Wed, 30 Jul 2025 17:55:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/40] msktutil: upgrade 1.2.1 -> 1.2.2
Date: Wed, 30 Jul 2025 17:54:30 +0800
Message-ID: <20250730095456.695-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118781

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Improve CI
- configure.ac: more robust krb5 autodetection
- configure.ac: Replace obsoleted AC_CONFIG_HEADER with AC_CONFIG_HEADERS
- configure.ac: fix linking with minimal LIBS
- Use getnameinfo(3) instead of inet_ntop(3)
- dns_lookup_kdc setting in create_fake_krb5_conf causes issue when using a trusted domain user to create computer account (#208)
- Fix several messages
- Style fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../msktutil/{msktutil_1.2.1.bb => msktutil_1.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/msktutil/{msktutil_1.2.1.bb => msktutil_1.2.2.bb} (89%)

diff --git a/meta-oe/recipes-support/msktutil/msktutil_1.2.1.bb b/meta-oe/recipes-support/msktutil/msktutil_1.2.2.bb
similarity index 89%
rename from meta-oe/recipes-support/msktutil/msktutil_1.2.1.bb
rename to meta-oe/recipes-support/msktutil/msktutil_1.2.2.bb
index 4c68e7adf4..3d9322d831 100644
--- a/meta-oe/recipes-support/msktutil/msktutil_1.2.1.bb
+++ b/meta-oe/recipes-support/msktutil/msktutil_1.2.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "https://github.com/msktutil/msktutil/releases/download/${PV}/${BP}.tar.bz2 \
            file://0001-configure.ac-Remove-native-include-path.patch"
-SRC_URI[sha256sum] = "f9686237c4e24414802415f4c8627c7343da365c5a3bcdef7a853fa3cd27b45d"
+SRC_URI[sha256sum] = "51314bb222c20e963da61724c752e418261a7bfc2408e7b7d619e82a425f6541"
 
 UPSTREAM_CHECK_URI = "https://github.com/msktutil/msktutil/releases/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


