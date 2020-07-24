Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.1742.1595577474301727452
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 00:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,389,1589212800"; 
   d="scan'208";a="96848098"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 15:57:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 23D484CE4BD9
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 15:57:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 15:57:48 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] capnproto: upgrade 0.7.0 -> 0.8.0
Date: Fri, 24 Jul 2020 15:57:35 +0800
Message-ID: <1595577459-84025-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 23D484CE4BD9.A488D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../capnproto/{capnproto_0.7.0.bb => capnproto_0.8.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.7.0.bb => capnproto_0.8.0.bb} (92%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
similarity index 92%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
index c6bab5ec2b..71f94badfa 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.7.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV}"
-SRCREV = "3f44c6db0f0f6c0cab0633f15f15d0a2acd01d19"
+SRCREV = "57a4ca5af5a7f55b768a9d9d6655250bffb1257f"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.25.1



