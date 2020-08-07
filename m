Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.3045.1596768208107280924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 19:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,443,1589212800"; 
   d="scan'208";a="97744120"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Aug 2020 10:43:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5F81D4CE34E9
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Aug 2020 10:43:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 7 Aug 2020 10:43:20 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 6.0.5 -> 6.0.6
Date: Fri, 7 Aug 2020 22:43:19 +0800
Message-ID: <1596811399-7392-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596811399-7392-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596811399-7392-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5F81D4CE34E9.A6A25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../redis/{redis_6.0.5.bb => redis_6.0.6.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.0.5.bb => redis_6.0.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.0.5.bb b/meta-oe/recipes-extended/redis/redis_6.0.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/redis/redis_6.0.5.bb
rename to meta-oe/recipes-extended/redis/redis_6.0.6.bb
index 893f323d34..c9846c5c73 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.0.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Redis is an open source, advanced key-value store."
 HOMEPAGE = "http://redis.io"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3c01b49fed4df1a79843688fa3f7b9d6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ffdd6c926faaece928cf9d9640132d2"
 DEPENDS = "readline lua ncurses"
 
 SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
@@ -17,8 +17,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            "
 
-SRC_URI[md5sum] = "617d680fc0944c217e2350a365686eb0"
-SRC_URI[sha256sum] = "42cf86a114d2a451b898fcda96acd4d01062a7dbaaad2801d9164a36f898f596"
+SRC_URI[md5sum] = "2f65e1f5610d98dd48e10eef49c79b02"
+SRC_URI[sha256sum] = "12ad49b163af5ef39466e8d2f7d212a58172116e5b441eebecb4e6ca22363d94"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1



