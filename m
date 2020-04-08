Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.4064.1586310929691087613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88652758"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:55:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 282AE49DF12E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:45:09 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:55:31 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:55:38 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH 2/2] [oe] [meta-networking][PATCH] conntrack-tools: upgrade 1.4.5 -> 1.4.6
Date: Wed, 8 Apr 2020 02:02:51 -0700
Message-ID: <1586336571-19263-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586336571-19263-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586336571-19263-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 282AE49DF12E.A3F25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{conntrack-tools_1.4.5.bb => conntrack-tools_1.4.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/conntrack-tools/{conntrack-tools_1.4.5.bb => conntrack-tools_1.4.6.bb} (91%)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
similarity index 91%
rename from meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
rename to meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
index 51e0ec1a6..ad50a89a4 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-too
     file://conntrack-failover \
     file://init \
 "
-SRC_URI[tar.md5sum] = "9356a0cd4df81a597ac26d87ccfebac4"
-SRC_URI[tar.sha256sum] = "36c6d99c7684851d4d72e75bd07ff3f0ff1baaf4b6f069eb7244990cd1a9a462"
+SRC_URI[tar.md5sum] = "a9dc7567921213007def78ad72313109"
+SRC_URI[tar.sha256sum] = "590859cc848245dbfd9c6487761dd303b3a1771e007f4f42213063ca56205d5f"
 
 inherit autotools update-rc.d pkgconfig
 
-- 
2.17.1



