Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2903.1612492331610161193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 18:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:32:10 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 72EFF4CE6D91
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Feb 2021 10:32:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:32:08 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] live555: upgrade 20210101 -> 20210129
Date: Fri, 5 Feb 2021 10:32:09 +0800
Message-ID: <1612492329-18413-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 72EFF4CE6D91.A8BD2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../live555/{live555_20210101.bb => live555_20210129.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210101.bb => live555_20210129.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210101.bb b/meta-oe/recipes-multimedia/live555/live555_20210129.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210101.bb
rename to meta-oe/recipes-multimedia/live555/live555_20210129.bb
index 817e52dca..1e7a674f4 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210101.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210129.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "a26a2fb43c56719e5e94bbde7d2c492eb8306aa457a5a08034c6b942c4a3b0d4"
+SRC_URI[sha256sum] = "85ab8d4337d414482586089b6f64fc39af64ff4be5b51976b54b0e10dceb333b"
 
 S = "${WORKDIR}/live"
 
-- 
2.25.1



