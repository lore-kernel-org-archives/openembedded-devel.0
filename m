Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.130733.1598000867890893393
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 02:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98384378"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 17:07:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 311DE48990D0
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 17:07:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 17:07:40 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] sanlock: upgrade 3.8.1 -> 3.8.2
Date: Sat, 22 Aug 2020 05:07:33 +0800
Message-ID: <1598044054-6555-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 311DE48990D0.A1324
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../sanlock/{sanlock_3.8.1.bb => sanlock_3.8.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.1.bb => sanlock_3.8.2.bb} (96%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.1.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.2.bb
similarity index 96%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.8.1.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.8.2.bb
index abae36252..6f3685c4b 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.1.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.2.bb
@@ -16,7 +16,7 @@ PV .= "+git${SRCPV}"
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch;patchdir=../ \
           "
-SRCREV = "07ab65afb10c8f8c008880a73b7b7aaedbde0e15"
+SRCREV = "01b727adf1ce3c0ed5b95299d60f62bc66d98eb5"
 
 S = "${WORKDIR}/git/python"
 
-- 
2.25.1



