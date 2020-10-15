Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.7172.1602746936236132741
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 00:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,378,1596470400"; 
   d="scan'208";a="100184742"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Oct 2020 15:29:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 15DA848990D3
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 15:29:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Oct 2020 15:29:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libcurses-perl: upgrade 1.36 -> 1.37
Date: Thu, 15 Oct 2020 15:28:58 +0800
Message-ID: <1602746938-13700-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 15DA848990D3.A1809
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libcurses-perl_1.36.bb => libcurses-perl_1.37.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcurses/{libcurses-perl_1.36.bb => libcurses-perl_1.37.bb} (80%)

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.36.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.37.bb
similarity index 80%
rename from meta-perl/recipes-perl/libcurses/libcurses-perl_1.36.bb
rename to meta-perl/recipes-perl/libcurses/libcurses-perl_1.37.bb
index 782b973b58..17fbbae25b 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.36.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.37.bb
@@ -10,8 +10,8 @@ DEPENDS += "perl ncurses "
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "389c70ee5530b887f8e5dc1303cb5294"
-SRC_URI[sha256sum] = "a414795ba031c5918c70279fe534fee594a96ec4b0c78f44ce453090796add64"
+SRC_URI[md5sum] = "aede9d1ed9856eff89f4ce208ee59de0"
+SRC_URI[sha256sum] = "74707ae3ad19b35bbefda2b1d6bd31f57b40cdac8ab872171c8714c88954db20"
 
 S = "${WORKDIR}/Curses-${PV}"
 
-- 
2.25.1



