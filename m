Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9138.1604035483611319914
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100748950"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:24:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5634048990E8
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:24:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:24:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH 1/2] libnftnl: upgrade 1.1.7 -> 1.1.8
Date: Fri, 30 Oct 2020 13:24:33 +0800
Message-ID: <1604035473-70531-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5634048990E8.ADDF1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libnftnl/{libnftnl_1.1.7.bb => libnftnl_1.1.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.7.bb => libnftnl_1.1.8.bb} (88%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.8.bb
similarity index 88%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.8.bb
index 4ff00bf87..f1fd61be7 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.8.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "eedafeb6db330b8adff1b7cdd3dac325f9144195"
+SRCREV = "b2cd6d28fab02934c4ddff0699718d74272eccd3"
 SRC_URI = "git://git.netfilter.org/libnftnl \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
-- 
2.25.1



