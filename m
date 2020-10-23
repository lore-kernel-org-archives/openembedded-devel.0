Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.4768.1603432812584168192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 23:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100435525"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 14:00:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BF39648990FC
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 14:00:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 14:00:12 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 5.2 -> 5.3
Date: Fri, 23 Oct 2020 14:00:11 +0800
Message-ID: <1603432811-100594-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BF39648990FC.A2B66
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_5.2.bb => nano_5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.2.bb => nano_5.3.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_5.2.bb b/meta-oe/recipes-support/nano/nano_5.3.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_5.2.bb
rename to meta-oe/recipes-support/nano/nano_5.3.bb
index f2cd2909cf..48e92de4cb 100644
--- a/meta-oe/recipes-support/nano/nano_5.2.bb
+++ b/meta-oe/recipes-support/nano/nano_5.3.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "32c2da43e1ae9a5e43437d8c6e1ec0388af870c7762c479e5bffb5f292bda7e1"
+SRC_URI[sha256sum] = "c5c1cbcf622d9a96b6030d66409ed12b204e8bc01ef5e6554ebbe6fb1d734352"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1



