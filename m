Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.30618.1590740043585879640
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2020 01:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343291"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:13:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D7A9E4BCC8A8
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2020 16:13:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:13:52 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mcelog: upgrade 168 -> 170
Date: Sat, 30 May 2020 01:13:49 +0800
Message-ID: <1590772430-43159-2-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590772430-43159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1590772430-43159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D7A9E4BCC8A8.A91A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_168.bb => mcelog_170.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_168.bb => mcelog_170.bb} (95%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_168.bb b/meta-oe/recipes-support/mcelog/mcelog_170.bb
similarity index 95%
rename from meta-oe/recipes-support/mcelog/mcelog_168.bb
rename to meta-oe/recipes-support/mcelog/mcelog_170.bb
index e2ef6ea589..bdb080f418 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_168.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_170.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;
     file://run-ptest \
 "
 
-SRCREV = "078d593b8b0c7d44afdd439aacfad6682913038f"
+SRCREV = "391abaac9bdff385934b18134789bcc98b0adeb7"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
-- 
2.17.1



