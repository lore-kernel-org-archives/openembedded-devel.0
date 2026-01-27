Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB7DD2D8CA
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:08 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7124.1769507041712997004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lQm7HiZ4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507046; x=1801043046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v0/ciA7zB3SK3jUlLTf2/vrtcCv/T5sBStvIOYClE4w=;
  b=lQm7HiZ4ve70d3I+ZcZKIWnqGbF6/sA3rAM+iFGXQa2Jf7aeN0fxV8iY
   KCW4e0Ravr/QhbF62naWOqQ1L2TOykmLw7gYsfBLwqnIc4KVGha2cVjU3
   7TJgfoj9BTNDnj+/f/yElgyPo93cOHXLYKvUvXSe1N28zzfGcAWGbDrZG
   HdS1dELqbSDYSBl/p0Thjt9EKT0wz/H9KLNRQpoY7VjrvS2RWsZzfezfd
   tnggYISG2G1sC96DWKmHyS7mCDwG4a+mHygxC2aFx1I8GeOQt88FnMmQW
   LYhGtq4VJ3QlIitEbwzZXA/3GQ4ZLC0cMKvdkWeDCAAuCKKYcsaGetaVK
   g==;
X-CSE-ConnectionGUID: /CuPnFojRcKW7Ltv3ZQBIw==
X-CSE-MsgGUID: fOeWc25lTQymLmI9Oc63FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="231321716"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="231321716"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:06 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5F02DC015B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:05 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 16CDC1801FF0
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 7337920000D2;
	Tue, 27 Jan 2026 09:44:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/25] libtdb: upgrade 1.4.14 -> 1.4.15
Date: Tue, 27 Jan 2026 17:43:24 +0800
Message-ID: <20260127094339.1081-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123919

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtdb/{libtdb_1.4.14.bb => libtdb_1.4.15.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.14.bb => libtdb_1.4.15.bb} (96%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.14.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.15.bb
similarity index 96%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.14.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.15.bb
index a7c88a4573..976932ae39 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.14.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.15.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "144f407d42ed7a0ec1470a40ef17ad41133fe910bce865dd9fe084d49c907526"
+SRC_URI[sha256sum] = "fba09d8df1f1b9072aeae8e78b2bd43c5afef20b2f6deefa633aa14a377a8dd2"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.43.0


