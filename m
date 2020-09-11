Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3567.1599787188589292344
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114286"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:19:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D40F648990D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:19:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:19:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] xfsprogs: upgrade 5.7.0 -> 5.8.0
Date: Fri, 11 Sep 2020 21:19:43 +0800
Message-ID: <1599830383-14590-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D40F648990D2.A467B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xfsprogs/{xfsprogs_5.7.0.bb => xfsprogs_5.8.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.7.0.bb => xfsprogs_5.8.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.7.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.8.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.7.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.8.0.bb
index 9efcc5617..b02ec6f97 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.7.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.8.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
            "
-SRC_URI[sha256sum] = "8f2348a68a686a3f4491dda5d62dd32d885fbc52d32875edd41e2c296e7b4f35"
+SRC_URI[sha256sum] = "8ef46ed9e6bb927f407f541dc4324857c908ddf1374265edc910d23724048c6b"
 inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
-- 
2.25.1



