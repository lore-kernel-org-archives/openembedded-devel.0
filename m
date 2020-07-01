Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.15999.1593586920215939664
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 00:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,299,1589212800"; 
   d="scan'208";a="95616738"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Jul 2020 15:01:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 324D34CE4BD8
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Jul 2020 14:51:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 15:01:32 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] nspr: upgrade 4.25 -> 4.26
Date: Wed, 1 Jul 2020 15:01:26 +0800
Message-ID: <1593586888-23124-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 324D34CE4BD8.A3280
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-support/nspr/{nspr_4.25.bb => nspr_4.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.25.bb => nspr_4.26.bb} (97%)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.25.bb b/meta-oe/recipes-support/nspr/nspr_4.26.bb
similarity index 97%
rename from meta-oe/recipes-support/nspr/nspr_4.25.bb
rename to meta-oe/recipes-support/nspr/nspr_4.26.bb
index 1de26e1ee..a15afd667 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.25.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.26.bb
@@ -23,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "4ca4d75a424f30fcdc766296bb103d17"
-SRC_URI[sha256sum] = "0bc309be21f91da4474c56df90415101c7f0c7c7cab2943cd943cd7896985256"
+SRC_URI[md5sum] = "615695d57eaafa1fca085d3891befd68"
+SRC_URI[sha256sum] = "fc9d142d85b74ffd2e6374a0c9016f3f2dac074225e24df3070e5a72d31b773d"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.17.1



