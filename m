Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.8242.1609726662330995313
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103150908"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:17:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7928848990D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:17:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:17:35 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nss: upgrade 3.59 -> 3.60
Date: Mon, 4 Jan 2021 22:17:31 +0800
Message-ID: <1609769851-7484-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7928848990D2.A193D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.59.bb => nss_3.60.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.59.bb => nss_3.60.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.59.bb b/meta-oe/recipes-support/nss/nss_3.60.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.59.bb
rename to meta-oe/recipes-support/nss/nss_3.60.bb
index eb9162bea..112f67629 100644
--- a/meta-oe/recipes-support/nss/nss_3.59.bb
+++ b/meta-oe/recipes-support/nss/nss_3.60.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "e6298174caa8527beacdc2858f77ed098d7047c1792846040e27e420fed0ce24"
+SRC_URI[sha256sum] = "84abd5575ab874c53ae511bd461e5d0868d1a1b384ee40753154cdd1d590fe3d"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.25.1



