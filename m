Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5816.1587698994782779784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 20:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,310,1583164800"; 
   d="scan'208";a="90068088"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Apr 2020 11:29:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id A6DC54BCC88A
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 11:19:10 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Apr 2020 11:29:47 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 24 Apr 2020 11:29:53 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-more-itertools: Modify ptest output format
Date: Fri, 24 Apr 2020 11:32:51 +0800
Message-ID: <20200424033251.29949-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A6DC54BCC88A.ABBDE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-more-itertools/run-ptest    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest b/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
index 5cec71169..8a4fef09b 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.20.1



