Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.9460.1604037049242676564
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100749860"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:50:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6FCB948990E8
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:50:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:50:52 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] poppler-data: upgrade 0.4.9 -> 0.4.10
Date: Fri, 30 Oct 2020 13:50:50 +0800
Message-ID: <1604037050-71614-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6FCB948990E8.A130C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update(COPYING):The changes are as follows
version 0.4.9: The cidToUnicode, nameToUnicode and unicodeMap data files
installed by the poppler-data package are under the COPYING.gpl2 license
version 0.4.10: The cidToUnicode, nameToUnicode and unicodeMap data files
installed by the poppler-data package are licensed under the GNU General
Public License (GPL), version 2 (COPYING.gpl2) or version 3 (COPYING.gpl3).

-License-Update(COPYING.adobe):Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{poppler-data_0.4.9.bb => poppler-data_0.4.10.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.9.bb => poppler-data_0.4.10.bb} (80%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.10.bb
similarity index 80%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.10.bb
index eda3f7ecd..46e33514e 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.10.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "Encoding files for use with poppler that enable poppler to \
                correctly render CJK and Cyrrilic."
 HOMEPAGE = "https://poppler.freedesktop.org/"
 LICENSE = "BSD & GPLv2 & GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
-                    file://COPYING.adobe;md5=63c6a8a9df204c00461fa5f163d8a663 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=96287d49ec274d9c3222b5f966c132fd \
+                    file://COPYING.adobe;md5=a790726a74164c30b5de1ef93fd69e99 \
                     file://COPYING.gpl2;md5=751419260aa954499f7abaabaa882bbe \
 "
 
@@ -18,8 +18,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz \
            ${CMAP_RESOURCES_BASE}/Identity-H;name=idh \
            ${CMAP_RESOURCES_BASE}/Identity-V;name=idv"
 
-SRC_URI[md5sum] = "35cc7beba00aa174631466f06732be40"
-SRC_URI[sha256sum] = "1f9c7e7de9ecd0db6ab287349e31bf815ca108a5a175cf906a90163bdbe32012"
+SRC_URI[md5sum] = "a7f15fb2f26c60a7a92093cfdf2378d5"
+SRC_URI[sha256sum] = "6e2fcef66ec8c44625f94292ccf8af9f1d918b410d5aa69c274ce67387967b30"
 SRC_URI[idh.md5sum] = "009c93cf0141ab7bd6acb7eea14306cc"
 SRC_URI[idh.sha256sum] = "ae702c203a82ea124e9b96590f821db6fbf8754e2c4547a9dba0e82f94739e95"
 SRC_URI[idv.md5sum] = "2f32a45d43d001c26eeac6b878855fbf"
-- 
2.25.1



