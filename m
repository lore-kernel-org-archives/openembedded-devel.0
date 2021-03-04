Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.4038.1614848426011592393
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 01:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; 
   d="scan'208";a="105154142"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 17:00:23 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3B9234CE9E50
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 17:00:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 17:00:17 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 5.5 -> 5.6
Date: Thu, 4 Mar 2021 17:00:16 +0800
Message-ID: <1614848416-105725-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3B9234CE9E50.A6EB8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_5.5.bb => nano_5.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.5.bb => nano_5.6.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_5.5.bb b/meta-oe/recipes-support/nano/nano_5.6.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_5.5.bb
rename to meta-oe/recipes-support/nano/nano_5.6.bb
index 29ec00a791..1ce08dd506 100644
--- a/meta-oe/recipes-support/nano/nano_5.5.bb
+++ b/meta-oe/recipes-support/nano/nano_5.6.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "390b81bf9b41ff736db997aede4d1f60b4453fbd75a519a4ddb645f6fd687e4a"
+SRC_URI[sha256sum] = "fce183e4a7034d07d219c79aa2f579005d1fd49f156db6e50f53543a87637a32"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1



