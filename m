Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.6565.1608276002869717447
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 23:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102706388"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 15:19:57 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A64DA4CE6793
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 15:19:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 15:19:56 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] openipmi: upgrade 2.0.29 -> 2.0.30
Date: Sat, 19 Dec 2020 03:19:53 +0800
Message-ID: <1608319193-4591-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A64DA4CE6793.A5095
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../openipmi/{openipmi_2.0.29.bb => openipmi_2.0.30.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.29.bb => openipmi_2.0.30.bb} (96%)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.30.bb
similarity index 96%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.30.bb
index 691848587..4929c4f05 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.30.bb
@@ -35,8 +35,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[md5sum] = "46b452e95d69c92e4172b3673ed88d52"
-SRC_URI[sha256sum] = "2244124579afb14e569f34393e9ac61e658a28b6ffa8e5c0d2c1c12a8ce695cd"
+SRC_URI[md5sum] = "8d35f68058ca5359973b4121e1544d31"
+SRC_URI[sha256sum] = "237a9be2a30bde85a88c4ec2759b54eb5b21fede554ffabf8fef1ffac2b42ade"
 
 inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
-- 
2.25.1



