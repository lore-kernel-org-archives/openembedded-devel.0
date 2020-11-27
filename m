Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.13750.1606442686454999694
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 18:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101800779"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 10:04:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9B7C94CE5440
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 10:04:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 10:04:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] nngpp: upgrade 1.2.4 -> 1.3.0
Date: Fri, 27 Nov 2020 10:04:42 +0800
Message-ID: <1606442682-117303-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9B7C94CE5440.A356C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
index 517624dce..176fa3bed 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=6d17d78c3597e0d4452fb1c63bf7c58e"
 DEPENDS = "nng"
 
-SRCREV = "85294eda3f584281439649a074f46e2d3516b2a1"
-PV = "1.2.4"
+SRCREV = "cc5d2641babab165d8a9943817c46d36c6dc17c2"
+PV = "1.3.0"
 
 SRC_URI = "git://github.com/cwzx/nngpp"
 
-- 
2.25.1



