Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.41810.1585532755546059665
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 18:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,322,1580745600"; 
   d="scan'208";a="87782797"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 09:45:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 83B89406AB15
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 09:35:30 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 09:45:45 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 09:45:50 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 0.85.0 -> 0.86.1
Date: Mon, 30 Mar 2020 02:26:56 -0700
Message-ID: <1585560419-98714-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 83B89406AB15.A1984
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../poppler/{poppler_0.85.0.bb => poppler_0.86.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.85.0.bb => poppler_0.86.1.bb} (93%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.85.0.bb b/meta-oe/recipes-support/poppler/poppler_0.86.1.bb
similarity index 93%
rename from meta-oe/recipes-support/poppler/poppler_0.85.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.86.1.bb
index 857b67ff9..96006dc8d 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.86.1.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "5315084523a4d73e9514f51eef78a332"
-SRC_URI[sha256sum] = "2bc875eb323002ae6b287e09980473518e2b2ed6b5b7d2e1089e36a6cd00d94b"
+SRC_URI[md5sum] = "2a638739f29e82a0a57b633ea39c87f3"
+SRC_URI[sha256sum] = "af630a277c8e194c31339c5446241834aed6ed3d4b4dc7080311e51c66257f6c"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.17.1



