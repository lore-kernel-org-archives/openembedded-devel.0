Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.3960.1586311020761657731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88653264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:57:06 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id BD0F350A999B
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:46:40 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:57:02 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:57:10 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.067 -> 2.068
Date: Wed, 8 Apr 2020 02:04:09 -0700
Message-ID: <1586336650-19326-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586336650-19326-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: BD0F350A999B.A13B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ocket-ssl-perl_2.067.bb => libio-socket-ssl-perl_2.068.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.067.bb => libio-socket-ssl-perl_2.068.bb} (91%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.067.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb
similarity index 91%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.067.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb
index c262d3a21..fc9786bec 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.067.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "1d55e9f66ca442f4e0ae4d018e3067fc"
-SRC_URI[sha256sum] = "ef8842806d047cf56e2af64add4ed30b24547bcbb50e8df33cee0c54609af1c1"
+SRC_URI[md5sum] = "4230c829c8875889848093b2b46a7284"
+SRC_URI[sha256sum] = "4420fc0056f1827b4dd1245eacca0da56e2182b4ef6fc078f107dc43c3fb8ff9"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.17.1



