Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.26440.1591609256866341766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 02:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,487,1583164800"; 
   d="scan'208";a="94081305"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jun 2020 17:40:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A710950A9975
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jun 2020 17:40:09 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Jun 2020 17:40:13 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mksh: upgrade 58 -> 59
Date: Tue, 9 Jun 2020 05:40:07 +0800
Message-ID: <1591652407-3373-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A710950A9975.A19E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-shells/mksh/{mksh_58.bb => mksh_59.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-shells/mksh/{mksh_58.bb => mksh_59.bb} (74%)

diff --git a/meta-oe/recipes-shells/mksh/mksh_58.bb b/meta-oe/recipes-shells/mksh/mksh_59.bb
similarity index 74%
rename from meta-oe/recipes-shells/mksh/mksh_58.bb
rename to meta-oe/recipes-shells/mksh/mksh_59.bb
index a9940f88a..110e793b0 100644
--- a/meta-oe/recipes-shells/mksh/mksh_58.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_59.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "http://www.mirbsd.org/mksh.htm"
 SECTION = "base/shell"
 
 LICENSE = "${@bb.utils.contains("TCLIBC", "glibc", "MirOS & ISC", "MirOS", d)}"
-LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=26;md5=0651e575e39d1a3e884562e25d491fc7 \
+LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=26;md5=6efc2c249328e4d2bd3e595d5b1f9d31 \
                     file://strlcpy.c;beginline=1;endline=17;md5=d953f28f0c43ee29e238ec9bc15df2a0 \
                    "
 
-SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R58.tgz"
+SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R59b.tgz"
 
-SRC_URI[md5sum] = "6922a3e2228de2f0e78ff25398ccf8df"
-SRC_URI[sha256sum] = "608beb7b71870b23309ba1da8ca828da0e4540f2b9bd981eb39e04f8b7fc678c"
+SRC_URI[md5sum] = "dce6abffc2036288540b9ba11dfb2ec8"
+SRC_URI[sha256sum] = "907ed1a9586e7f18bdefdd4a763aaa8397b755e15034aa54f4d753bfb272e0e6"
 
 inherit update-alternatives
 
-- 
2.17.1



