Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.9335.1604035835583326389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100749117"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:30:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EE48E48990E8
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:30:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:30:34 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] xfsprogs: upgrade 5.8.0 -> 5.9.0
Date: Fri, 30 Oct 2020 13:30:32 +0800
Message-ID: <1604035832-70711-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EE48E48990E8.A370B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xfsprogs/{xfsprogs_5.8.0.bb => xfsprogs_5.9.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.8.0.bb => xfsprogs_5.9.0.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.9.0.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.8.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.9.0.bb
index b02ec6f97..48d15cca9 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.8.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.9.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
            "
-SRC_URI[sha256sum] = "8ef46ed9e6bb927f407f541dc4324857c908ddf1374265edc910d23724048c6b"
+SRC_URI[sha256sum] = "bc5c805596bc609a18dc1f1b4ed6a2821dba9f47408ec00e7799ceea1b2097f1"
 inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
-- 
2.25.1



