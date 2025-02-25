Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323E0C282D1
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2297.1740525897445317206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JJLx2vDu;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525899; x=1772061899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YkySka54kzN8CKB6QQgypy5RCN/5tG7EXZONY6BKfDY=;
  b=JJLx2vDuFW8CcPYKPhEogp7eOuwFYpWC1SQTupJP00dPDPVtnunRukZS
   7oa91vkUzinVmwInU6PL2R/6HgvkMwOu0VWRa1cdohGjoaq5InWKsAh3N
   M6HhUlf0m2fgYlve8JDNxWnLiliPfL+OnrzbG8F+ypKqgKrIhyq7zOI4L
   yFPUHaf4t0tyFGe/+PAeAxWjAiGo0O2aeOKTRk+y6GqShNIR3R6aY4ZuQ
   TG2iIiioDMMByghtk0I80IhvxHdiHrcGt9AzKu6pedl1hHLYFTIAE7N6b
   YsHv6zwt0jGT88eVB6IeqtE14fYVlohi+MttQKzg7iRLC3WvGUPji/iRV
   g==;
X-CSE-ConnectionGUID: 2jF0OEDuQCCREP09p28IyA==
X-CSE-MsgGUID: zyOlSRxrSECFfVKKvT0Dqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170073416"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170073416"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 979A6D6EA1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60F6DD50A7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 02A141A000B;
	Wed, 26 Feb 2025 07:24:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 17/51] libtdb: upgrade 1.4.12 -> 1.4.13
Date: Wed, 26 Feb 2025 07:24:07 +0800
Message-Id: <1740525881-21103-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115613

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtdb/{libtdb_1.4.12.bb => libtdb_1.4.13.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.12.bb => libtdb_1.4.13.bb} (96%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.12.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
similarity index 96%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.12.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
index a96527a3e6..6342459154 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.12.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "6ce4b27498812d09237ece65a0d6dfac0941610e709848ecb822aa241084cd7a"
+SRC_URI[sha256sum] = "5ee276e7644d713e19e4b6adc00b440afb5851ff21e65821ffaed89e15a5e167"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.43.0


