Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5907.1608860983716406606
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 17:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,446,1599494400"; 
   d="scan'208";a="102920155"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Dec 2020 09:49:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A82034CE6788
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 09:49:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Dec 2020 09:49:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH 2/2] opencl-icd-loader: upgrade 2020.06.16 -> 2020.12.18
Date: Fri, 25 Dec 2020 09:49:40 +0800
Message-ID: <1608860980-71704-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A82034CE6788.A3C12
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
index ed27b2616..b951dabce 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
@@ -9,8 +9,8 @@ DEPENDS += "opencl-headers"
 inherit pkgconfig cmake
 
 S = "${WORKDIR}/git"
-PV = "2020.06.16+git${SRCPV}"
-SRCREV = "862eebe7ca733c398334a8db8481172a7d3a3c47"
+PV = "2020.12.18+git${SRCPV}"
+SRCREV = "1d5315c3ed30d026acb79a1aa53a276fc833ffa7"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git"
 
 do_install () {
-- 
2.25.1



