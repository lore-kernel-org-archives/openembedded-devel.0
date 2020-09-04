Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.28813.1599182651642751701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 18:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,387,1592841600"; 
   d="scan'208";a="98892034"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Sep 2020 09:24:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9C80148990DB
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2020 09:24:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Sep 2020 09:24:04 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libdbd-sqlite-perl: upgrade 1.64 -> 1.66
Date: Fri, 4 Sep 2020 21:23:59 +0800
Message-ID: <1599225840-4801-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1599225840-4801-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1599225840-4801-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9C80148990DB.A2697
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...{libdbd-sqlite-perl_1.64.bb => libdbd-sqlite-perl_1.66.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.64.bb => libdbd-sqlite-perl_1.66.bb} (90%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.64.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.66.bb
similarity index 90%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.64.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.66.bb
index 468add972..aef1d348c 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.64.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.66.bb
@@ -14,8 +14,8 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[md5sum] = "10796495b52927eb2e1df34c86924027"
-SRC_URI[sha256sum] = "f4ae8f7b50842305566aadd90f7bfd12a9e32b6c603a9b1c1529e73eb82aff01"
+SRC_URI[md5sum] = "38581209de5c981f0e79840c8937fa16"
+SRC_URI[sha256sum] = "89e75dff9f66c273e0e459d51f151f88960eb7d82e2821e6902f18688ba592fe"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1



