Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.15248.1612661293903973653
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,158,1610380800"; 
   d="scan'208";a="104284718"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Feb 2021 09:28:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 079B14CE6F76
	for <openembedded-devel@lists.openembedded.org>; Sun,  7 Feb 2021 09:28:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 7 Feb 2021 09:28:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] librole-tiny-perl: upgrade 2.002003 -> 2.002004
Date: Sun, 7 Feb 2021 21:28:08 +0800
Message-ID: <1612704488-4719-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 079B14CE6F76.A2789
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

2.002004 - 2021-01-24
  - restore requiring base class when using create_class_with_roles, which was
    accidentally lost in 2.002_000 (RT#134075)

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...le-tiny-perl_2.002003.bb => librole-tiny-perl_2.002004.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/librole/{librole-tiny-perl_2.002003.bb => librole-tiny-perl_2.002004.bb} (84%)

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002003.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
similarity index 84%
rename from meta-perl/recipes-perl/librole/librole-tiny-perl_2.002003.bb
rename to meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
index 531e77a10..db8646d7c 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002003.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002004.bb
@@ -9,8 +9,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=197;endline=234;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "065e459cdc3c6e163c6e8359baf69f45"
-SRC_URI[sha256sum] = "6981e5f2d0beded157840199d678da462b22a9a3753333cab322ab6efb0fbb89"
+SRC_URI[md5sum] = "9ee45591befa3d0b1094ac75d282b6ba"
+SRC_URI[sha256sum] = "d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45"
 
 S = "${WORKDIR}/Role-Tiny-${PV}"
 
-- 
2.25.1



