Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.32364.1613979675980432705
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 23:41:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; 
   d="scan'208";a="104718504"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 15:41:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B725B4CE7315
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 15:41:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 15:41:09 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libjcat: upgrade 0.1.4 -> 0.1.6
Date: Mon, 22 Feb 2021 15:41:05 +0800
Message-ID: <1613979665-44075-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B725B4CE7315.A9366
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libjcat/{libjcat_0.1.4.bb => libjcat_0.1.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.4.bb => libjcat_0.1.6.bb} (94%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.4.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.6.bb
similarity index 94%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.4.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.6.bb
index 9f4a7636d6..bbfba55a3d 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.4.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git \
     file://run-ptest \
 "
-SRCREV = "55872cea013755a170a581333077b23e322f388b"
+SRCREV = "c4f032468c56a5750e1e15b01fa31539b5c7ae51"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala
-- 
2.25.1



