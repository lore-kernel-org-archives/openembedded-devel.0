Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.742.1589262351525751986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 22:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,382,1583164800"; 
   d="scan'208";a="91937774"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 13:45:40 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 24FA04BCC89E
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 13:45:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 13:45:38 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl][PATCH] libencode-perl: upgrade 3.05 -> 3.06
Date: Tue, 12 May 2020 22:46:01 +0800
Message-ID: <1589294761-97283-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 24FA04BCC89E.A5A58
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libencode-perl_3.05.bb => libencode-perl_3.06.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.05.bb => libencode-perl_3.06.bb} (95%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.05.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.06.bb
similarity index 95%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.05.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.06.bb
index 62430e91f9..24bde21630 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.05.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.06.bb
@@ -15,8 +15,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "137aef00bfc3d5cb97096ad985d3153a"
-SRC_URI[sha256sum] = "e0f51e03cd787a3e26026503e806afdc03f3823ae3551c711a9b04ad901a8794"
+SRC_URI[md5sum] = "d2e51a37b4e1d5b16816604f02363637"
+SRC_URI[sha256sum] = "5b2dcd6861287880584e63b2e518840d483aa38da70194cf64d9957282851eea"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.17.1



