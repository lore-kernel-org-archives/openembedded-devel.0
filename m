Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.22874.1591588013184064539
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 20:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,486,1583164800"; 
   d="scan'208";a="94055650"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jun 2020 11:46:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 818A350A9975
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jun 2020 11:46:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Jun 2020 11:46:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libvpx: upgrade 1.8.1 -> 1.8.2
Date: Mon, 8 Jun 2020 11:46:36 +0800
Message-ID: <1591587996-32965-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 818A350A9975.AEF8D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../webm/{libvpx_1.8.1.bb => libvpx_1.8.2.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.8.1.bb => libvpx_1.8.2.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
index 006e73af4..4a98ec17d 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "8ae686757b708cd8df1d10c71586aff5355cfe1e"
+SRCREV = "7ec7a33a081aeeb53fed1a8d87e4cbd189152527"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https \
             file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.17.1



