Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.6848.1586915460384658510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 18:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,385,1580745600"; 
   d="scan'208";a="89043950"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 09:50:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 088A249DF12C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 09:40:25 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 09:50:53 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Apr 2020 09:51:01 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cpuid: upgrade 20200203 -> 20200211
Date: Wed, 15 Apr 2020 01:31:38 -0700
Message-ID: <1586939501-29659-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 088A249DF12C.A75AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../cpuid/{cpuid_20200203.bb => cpuid_20200211.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20200203.bb => cpuid_20200211.bb} (85%)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20200203.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20200211.bb
similarity index 85%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20200203.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20200211.bb
index b0540e541..56462a913 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20200203.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20200211.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            "
-SRC_URI[md5sum] = "93e99fd3d0d6cd5401c0f84f2cce1d8f"
-SRC_URI[sha256sum] = "ebbd6448a1e416d95889a252f7e03a5429ad4f30bc84c7e8ede8086433e86c55"
+SRC_URI[md5sum] = "c3dda40aee78bd187929f454a3c75f35"
+SRC_URI[sha256sum] = "a570ca23ce5543fb6974abcbbde0261ea7dbfea40f4e7335b4870274315e521b"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
-- 
2.17.1



