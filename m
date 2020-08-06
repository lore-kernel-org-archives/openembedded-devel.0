Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.4048.1596676526772808226
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2020 18:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,439,1589212800"; 
   d="scan'208";a="97674054"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Aug 2020 09:15:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F1254CE34DD
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Aug 2020 09:15:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 6 Aug 2020 09:15:19 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ipc-run: upgrade 20180523.0 -> 20200505.0
Date: Thu, 6 Aug 2020 21:15:17 +0800
Message-ID: <1596719718-116822-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596719718-116822-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596719718-116822-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3F1254CE34DD.A4F71
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../perl/{ipc-run_20180523.0.bb => ipc-run_20200505.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{ipc-run_20180523.0.bb => ipc-run_20200505.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20180523.0.bb b/meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/perl/ipc-run_20180523.0.bb
rename to meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
index c812ae1374..27dc358d15 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_20180523.0.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20200505.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
 DEPENDS = "perl"
 
 SRC_URI = "git://github.com/toddr/IPC-Run.git"
-SRCREV = "0b409702490729eeb97ae65f5b94d949ec083134"
+SRCREV = "af435a1635ef9e48a84adc3230099e7ecf20c79d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



