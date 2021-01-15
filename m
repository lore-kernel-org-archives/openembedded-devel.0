Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.4508.1610680783132021224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 19:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,347,1602518400"; 
   d="scan'208";a="103502160"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Jan 2021 11:19:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D0BCF4CE1A08
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Jan 2021 11:19:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 15 Jan 2021 11:19:38 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] librole-tiny-perl: upgrade 2.001004 -> 2.002003
Date: Fri, 15 Jan 2021 23:19:36 +0800
Message-ID: <1610723976-7417-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D0BCF4CE1A08.A54AB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-tiny-perl_2.001004.bb => librole-tiny-perl_2.002003.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/librole/{librole-tiny-perl_2.001004.bb => librole-tiny-perl_2.002003.bb} (77%)

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002003.bb
similarity index 77%
rename from meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb
rename to meta-perl/recipes-perl/librole/librole-tiny-perl_2.002003.bb
index 41743d5082..531e77a107 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.001004.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.002003.bb
@@ -6,11 +6,11 @@ SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Role::Tiny"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=182;endline=219;md5=26df7e7c20551fb1906e2286624f0b71"
+LIC_FILES_CHKSUM = "file://README;beginline=197;endline=234;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "98446826608b1e943e65c1f6e35942fe"
-SRC_URI[sha256sum] = "92ba5712850a74102c93c942eb6e7f62f7a4f8f483734ed289d08b324c281687"
+SRC_URI[md5sum] = "065e459cdc3c6e163c6e8359baf69f45"
+SRC_URI[sha256sum] = "6981e5f2d0beded157840199d678da462b22a9a3753333cab322ab6efb0fbb89"
 
 S = "${WORKDIR}/Role-Tiny-${PV}"
 
-- 
2.25.1



