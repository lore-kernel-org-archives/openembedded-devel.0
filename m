Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.32017.1613977085300571083
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; 
   d="scan'208";a="104716630"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 14:58:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AD33E4CE7317
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 14:58:02 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 14:58:04 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libburn: upgrade 1.5.2 -> 1.5.4
Date: Tue, 23 Feb 2021 02:58:01 +0800
Message-ID: <1614020281-4965-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AD33E4CE7317.A3C31
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libburn/{libburn_1.5.2.bb => libburn_1.5.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libburn/{libburn_1.5.2.bb => libburn_1.5.4.bb} (68%)

diff --git a/meta-oe/recipes-multimedia/libburn/libburn_1.5.2.bb b/meta-oe/recipes-multimedia/libburn/libburn_1.5.4.bb
similarity index 68%
rename from meta-oe/recipes-multimedia/libburn/libburn_1.5.2.bb
rename to meta-oe/recipes-multimedia/libburn/libburn_1.5.4.bb
index 73e8e3f564..0cae7c54bd 100644
--- a/meta-oe/recipes-multimedia/libburn/libburn_1.5.2.bb
+++ b/meta-oe/recipes-multimedia/libburn/libburn_1.5.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 
 SRC_URI = "http://files.libburnia-project.org/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "096f4acfba00f1210a84fb7650f7693d"
-SRC_URI[sha256sum] = "7b32db1719d7f6516cce82a9d00dfddfb3581725db732ea87d41ea8ef0ce5227"
+SRC_URI[md5sum] = "454d03ce31addb5b7dca62d213c9660e"
+SRC_URI[sha256sum] = "525059d10759c5cb8148eebc863bb510e311c663603da7bd2d21c46b7cf63b54"
 
 inherit autotools pkgconfig
-- 
2.25.1



