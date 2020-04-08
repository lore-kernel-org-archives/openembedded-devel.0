Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4086.1586311027131196351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88653265"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:57:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5218E49DF12A
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:46:38 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:57:00 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:57:07 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20190808 -> 1.3-20200327
Date: Wed, 8 Apr 2020 02:04:08 -0700
Message-ID: <1586336650-19326-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 5218E49DF12A.A3732
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../dialog/{dialog_1.3-20190808.bb => dialog_1.3-20200327.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20190808.bb => dialog_1.3-20200327.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
index a1acfcd00..5ac9b8902 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "f48b597251a26c522002736652e0300c"
-SRC_URI[sha256sum] = "886e12f2cf3df36cde65f32f6ae52bc598eb2599a611b1d8ce5dfdea599e47e2"
+SRC_URI[md5sum] = "f7a3c240af305b5282af590541e8f4b7"
+SRC_URI[sha256sum] = "466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.17.1



