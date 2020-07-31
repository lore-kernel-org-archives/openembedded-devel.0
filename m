Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.14546.1596184971389887728
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 01:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97210925"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 16:42:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 52DC54CE4B09
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 16:42:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 16:42:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libbytesize: upgrade 2.3 -> 2.4
Date: Sat, 1 Aug 2020 04:42:39 +0800
Message-ID: <1596228160-6530-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596228160-6530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596228160-6530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 52DC54CE4B09.A4AC1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libbytesize/{libbytesize_2.3.bb => libbytesize_2.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.3.bb => libbytesize_2.4.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.3.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.4.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.3.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.4.bb
index db8270f49f..0aaf188b61 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.3.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "96aba1e99aa40a21df980bac4f2ed3bd1e25dbde"
+SRCREV = "732ee8d28492e4bc9b52c29bcb81a5c19388d002"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master"
 
 inherit gettext autotools python3native
-- 
2.25.1



