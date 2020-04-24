Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.2827.1587723096376959370
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 03:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,311,1583164800"; 
   d="scan'208";a="90117622"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Apr 2020 18:11:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 59DF04BCC885
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 18:00:58 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Apr 2020 18:11:35 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 24 Apr 2020 18:11:37 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-perl][PATCH] libmoo-perl: upgrade 2.003006 -> 2.004000
Date: Fri, 24 Apr 2020 11:11:11 -0700
Message-ID: <20200424181111.21063-4-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424181111.21063-1-wangmy@cn.fujitsu.com>
References: <20200424181111.21063-1-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 59DF04BCC885.A6322
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

README is updated.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libmoo-perl_2.003006.bb => libmoo-perl_2.004000.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libmoo/{libmoo-perl_2.003006.bb => libmoo-perl_2.004000.bb} (89%)

diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003006.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.004000.bb
similarity index 89%
rename from meta-perl/recipes-perl/libmoo/libmoo-perl_2.003006.bb
rename to meta-perl/recipes-perl/libmoo/libmoo-perl_2.004000.bb
index 0bd0eae92..dbad74d22 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003006.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.004000.bb
@@ -7,11 +7,11 @@ SECTION = "libs"
 HOMEPAGE = "http://metapan.org/release/Moo/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=2ee6a628a04af08d75bc73a86da86d4a"
+LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=0e7ee44f5ce5e9b84619cd198caad1d6"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
-SRC_URI[md5sum] = "53af7e7849492a8e3994ee379d12e348"
-SRC_URI[sha256sum] = "bcb2092ab18a45005b5e2e84465ebf3a4999d8e82a43a09f5a94d859ae7f2472"
+SRC_URI[md5sum] = "e542104553d616b15631b5c66ccee904"
+SRC_URI[sha256sum] = "323240d000394cf38ec42e865b05cb8928f625c82c9391cd2cdc72b33c51b834"
 
 S = "${WORKDIR}/Moo-${PV}"
 
-- 
2.17.1



