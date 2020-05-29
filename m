Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.30554.1590739816903024628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2020 01:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343089"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:10:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3CBC24BCC885
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2020 16:10:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:10:07 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cpuid: upgrade 20200211 -> 20200427
Date: Sat, 30 May 2020 01:10:02 +0800
Message-ID: <1590772202-42997-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590772202-42997-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1590772202-42997-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3CBC24BCC885.A4B34
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../cpuid/{cpuid_20200211.bb => cpuid_20200427.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20200211.bb => cpuid_20200427.bb} (85%)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20200211.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20200427.bb
similarity index 85%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20200211.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20200427.bb
index 56462a9136..ff781f6942 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20200211.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20200427.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            "
-SRC_URI[md5sum] = "c3dda40aee78bd187929f454a3c75f35"
-SRC_URI[sha256sum] = "a570ca23ce5543fb6974abcbbde0261ea7dbfea40f4e7335b4870274315e521b"
+SRC_URI[md5sum] = "daa93ee2fdaf461e515b4713e7337076"
+SRC_URI[sha256sum] = "c1a9463f1f2175086120e9079e318bbd383dc1e574fafb2f724879f1d11061d4"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
-- 
2.17.1



