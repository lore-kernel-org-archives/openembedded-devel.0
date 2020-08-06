Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.4048.1596676526772808226
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2020 18:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,439,1589212800"; 
   d="scan'208";a="97674052"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Aug 2020 09:15:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9CDEB4CE34EE
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Aug 2020 09:15:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 6 Aug 2020 09:15:19 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] uhubctl: upgrade 2.1.0 -> 2.2.0
Date: Thu, 6 Aug 2020 21:15:18 +0800
Message-ID: <1596719718-116822-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596719718-116822-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596719718-116822-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9CDEB4CE34EE.A7017
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../uhubctl/{uhubctl_2.1.0.bb => uhubctl_2.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uhubctl/{uhubctl_2.1.0.bb => uhubctl_2.2.0.bb} (92%)

diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.1.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.2.0.bb
similarity index 92%
rename from meta-oe/recipes-support/uhubctl/uhubctl_2.1.0.bb
rename to meta-oe/recipes-support/uhubctl/uhubctl_2.2.0.bb
index b294d77bad..fb60446cb2 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.1.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.2.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "c9fa3c68a1b2c9790c731602b8bae2b513e80605"
+SRCREV = "5ee8260c71647f687b5e71af11f45244814835d7"
 SRC_URI = "git://github.com/mvp/${BPN}"
 S = "${WORKDIR}/git"
 
-- 
2.25.1



