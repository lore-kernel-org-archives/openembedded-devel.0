Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3456.1585100584041451872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 18:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,302,1580745600"; 
   d="scan'208";a="87205961"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 09:43:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 344C849DF125
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 09:32:50 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 09:42:58 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Mar 2020 09:43:08 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] fatresize: upgrade 1.0.2-11 -> 1.0.2
Date: Tue, 24 Mar 2020 23:47:14 -0700
Message-ID: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 344C849DF125.A2F8F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
index 88d495b68..7fec96ccc 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.0.2.bb
@@ -4,9 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https"
-SRCREV = "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
+SRCREV = "eb87617875abe47fb307ac3c5a741afc4f88b855"
 
-PV = "1.0.2-11"
+PV = "1.0.2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



