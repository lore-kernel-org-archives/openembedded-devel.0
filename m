Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.127423.1597988054250929534
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 22:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98374602"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 13:34:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A4D5A48990D0
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 13:34:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 13:34:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 5.0 -> 5.1
Date: Sat, 22 Aug 2020 01:33:57 +0800
Message-ID: <1598031241-3582-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A4D5A48990D0.A494C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_5.0.bb => nano_5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.0.bb => nano_5.1.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_5.0.bb b/meta-oe/recipes-support/nano/nano_5.1.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_5.0.bb
rename to meta-oe/recipes-support/nano/nano_5.1.bb
index e97c01f14..216ad594f 100644
--- a/meta-oe/recipes-support/nano/nano_5.0.bb
+++ b/meta-oe/recipes-support/nano/nano_5.1.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7c0d94be69cd066f20df2868a2da02f7b1d416ce8d47c0850a8bd270897caa36"
+SRC_URI[sha256sum] = "9efc46f341404d60095d16fc4f0419fc84b6e4eaeaf6ebce605d0465d92a6ee6"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1



