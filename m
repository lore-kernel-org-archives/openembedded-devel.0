Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.44322.1598838330962126970
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 18:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,373,1592841600"; 
   d="scan'208";a="98715789"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Aug 2020 09:45:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1428648990E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 09:45:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 31 Aug 2020 09:45:30 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-oe] [PATCH] iperf3: upgrade 3.7 -> 3.9
Date: Mon, 31 Aug 2020 21:45:25 +0800
Message-ID: <1598881526-68512-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598881526-68512-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598881526-68512-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1428648990E1.A12EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-benchmark/iperf3/{iperf3_3.7.bb => iperf3_3.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.7.bb => iperf3_3.9.bb} (88%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
similarity index 88%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
index c7ad91b24..d969555c2 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
@@ -9,13 +9,13 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9088fe7ffdccd042f7645f1012d7f70"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b7fb682e9941a49f1214dcd7441410d7"
 
 SRC_URI = "git://github.com/esnet/iperf.git \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            "
 
-SRCREV = "dfcea9f6a09ead01089a3c9d20c7032f2c0af2c1"
+SRCREV = "1f8fb13297f3e3e40169ebcd12e171167e394473"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



