Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.28813.1599182651642751701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 18:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,387,1592841600"; 
   d="scan'208";a="98892029"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Sep 2020 09:24:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B856C48990E3
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2020 09:24:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Sep 2020 09:24:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.06 -> 3.07
Date: Fri, 4 Sep 2020 21:24:00 +0800
Message-ID: <1599225840-4801-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1599225840-4801-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1599225840-4801-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B856C48990E3.A3495
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libencode-perl_3.06.bb => libencode-perl_3.07.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.06.bb => libencode-perl_3.07.bb} (95%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.06.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.07.bb
similarity index 95%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.06.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.07.bb
index 24bde2163..4b0c1d873 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.06.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.07.bb
@@ -15,8 +15,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "d2e51a37b4e1d5b16816604f02363637"
-SRC_URI[sha256sum] = "5b2dcd6861287880584e63b2e518840d483aa38da70194cf64d9957282851eea"
+SRC_URI[md5sum] = "a63fa96cbe236b2f7bb5a5e9fd740837"
+SRC_URI[sha256sum] = "34a4ec9b574b7a6c6132c4ab3ded490fd600bc7ce382124aeda58bb1e112910f"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1



