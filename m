Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7030.1586915472321395398
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 18:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,385,1580745600"; 
   d="scan'208";a="89043970"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 09:51:11 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D3ADC50A9999
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 09:40:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 09:50:58 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Apr 2020 09:51:06 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mksh: upgrade 57 -> 58
Date: Wed, 15 Apr 2020 01:31:40 -0700
Message-ID: <1586939501-29659-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D3ADC50A9999.A6D2B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-shells/mksh/{mksh_57.bb => mksh_58.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-shells/mksh/{mksh_57.bb => mksh_58.bb} (83%)

diff --git a/meta-oe/recipes-shells/mksh/mksh_57.bb b/meta-oe/recipes-shells/mksh/mksh_58.bb
similarity index 83%
rename from meta-oe/recipes-shells/mksh/mksh_57.bb
rename to meta-oe/recipes-shells/mksh/mksh_58.bb
index 7e9c18ed2..a9940f88a 100644
--- a/meta-oe/recipes-shells/mksh/mksh_57.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_58.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=26;md5=0651e575e39d1a3e884
                     file://strlcpy.c;beginline=1;endline=17;md5=d953f28f0c43ee29e238ec9bc15df2a0 \
                    "
 
-SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R57.tgz"
+SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R58.tgz"
 
-SRC_URI[md5sum] = "4d2686535252ea6a57bdec531498239a"
-SRC_URI[sha256sum] = "3d101154182d52ae54ef26e1360c95bc89c929d28859d378cc1c84f3439dbe75"
+SRC_URI[md5sum] = "6922a3e2228de2f0e78ff25398ccf8df"
+SRC_URI[sha256sum] = "608beb7b71870b23309ba1da8ca828da0e4540f2b9bd981eb39e04f8b7fc678c"
 
 inherit update-alternatives
 
-- 
2.17.1



