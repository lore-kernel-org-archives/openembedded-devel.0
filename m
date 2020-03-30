Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.41836.1585532829007648583
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 18:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,322,1580745600"; 
   d="scan'208";a="87783212"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 09:47:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BC96D4BCC892
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 09:36:50 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 09:47:08 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 09:47:10 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libuv: upgrade 1.34.2 -> 1.35.0
Date: Mon, 30 Mar 2020 02:26:58 -0700
Message-ID: <1585560419-98714-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585560419-98714-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585560419-98714-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: BC96D4BCC892.A3FDD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libuv/{libuv_1.34.2.bb => libuv_1.35.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.34.2.bb => libuv_1.35.0.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.35.0.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.35.0.bb
index 234cec37b..21a8fce60 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.34.2.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.35.0.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
+SRCREV = "e45f1ec38db882f8dc17b51f51a6684027034609"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.17.1



