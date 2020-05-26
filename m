Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.44587.1590463815681956321
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 20:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,435,1583164800"; 
   d="scan'208";a="93092626"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 26 May 2020 11:30:11 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 04F904BCC89D
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 11:30:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 May 2020 11:30:05 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 4.9.2 -> 4.9.3
Date: Tue, 26 May 2020 20:30:05 +0800
Message-ID: <1590496205-24777-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 04F904BCC89D.A7BFD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_4.9.2.bb => nano_4.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.9.2.bb => nano_4.9.3.bb} (80%)

diff --git a/meta-oe/recipes-support/nano/nano_4.9.2.bb b/meta-oe/recipes-support/nano/nano_4.9.3.bb
similarity index 80%
rename from meta-oe/recipes-support/nano/nano_4.9.2.bb
rename to meta-oe/recipes-support/nano/nano_4.9.3.bb
index 2b236ba1eb..645b07b4ce 100644
--- a/meta-oe/recipes-support/nano/nano_4.9.2.bb
+++ b/meta-oe/recipes-support/nano/nano_4.9.3.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "10df0100ebf4aa7bb4806428c11751eb"
-SRC_URI[sha256sum] = "d8a25eea942ecee2d57b8e037eb4b28f030f818b78773b8fcb994ed5835d2ef6"
+SRC_URI[md5sum] = "52137a960ae8b3ca6d7dab6767fe6e5f"
+SRC_URI[sha256sum] = "6e3438f033a0ed07d3d74c30d0803cbda3d2366ba1601b7bbf9b16ac371f51b4"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.17.1



