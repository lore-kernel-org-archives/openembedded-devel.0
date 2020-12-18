Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6569.1608276730051553221
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 23:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102707294"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 15:32:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8843D4CE600B
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 15:32:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 15:32:04 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 5.3 -> 5.4
Date: Sat, 19 Dec 2020 03:32:02 +0800
Message-ID: <1608319922-5050-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8843D4CE600B.A3F09
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_5.3.bb => nano_5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.3.bb => nano_5.4.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_5.3.bb b/meta-oe/recipes-support/nano/nano_5.4.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_5.3.bb
rename to meta-oe/recipes-support/nano/nano_5.4.bb
index 48e92de4c..68c326b52 100644
--- a/meta-oe/recipes-support/nano/nano_5.3.bb
+++ b/meta-oe/recipes-support/nano/nano_5.4.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c5c1cbcf622d9a96b6030d66409ed12b204e8bc01ef5e6554ebbe6fb1d734352"
+SRC_URI[sha256sum] = "fe993408b22286355809ce48ebecc4444d19af8203ed4959d269969112ed86e9"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1



