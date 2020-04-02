Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5280.1585791938707910994
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363698"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:45:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B4DF9406AB15
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:35:16 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:45:35 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Apr 2020 09:45:43 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-perl][PATCH] libtest-deep-perl: upgrade 1.128 -> 1.130
Date: Thu, 2 Apr 2020 02:15:29 -0700
Message-ID: <1585818933-28648-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B4DF9406AB15.A3CE8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

lib/Test/Deep.pm: version update

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ibtest-deep-perl_1.128.bb => libtest-deep-perl_1.130.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-deep-perl_1.128.bb => libtest-deep-perl_1.130.bb} (91%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.128.bb b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb
similarity index 91%
rename from meta-perl/recipes-perl/libtest/libtest-deep-perl_1.128.bb
rename to meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb
index 44a915c5b..c82a1a170 100644
--- a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.128.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb
@@ -23,11 +23,11 @@ SECTION = "libs"
 HOMEPAGE = "http://github.com/rjbs/Test-Deep/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://lib/Test/Deep.pm;beginline=1817;endline=1826;md5=aebc793c87a3d8771fe98d5d369898e7"
+LIC_FILES_CHKSUM = "file://lib/Test/Deep.pm;beginline=1817;endline=1826;md5=a897a42bafc3422cab17c2eb94f87a7c"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Deep-${PV}.tar.gz"
-SRC_URI[md5sum] = "9bc47147ea720fc01bc6b214afb884ff"
-SRC_URI[sha256sum] = "852d7e836fba8269b0b755082051a24a1a309d015a8b76838790af9e3760092f"
+SRC_URI[md5sum] = "d466e471108f7f7a5df3802cb13761ac"
+SRC_URI[sha256sum] = "4064f494f5f62587d0ae501ca439105821ee5846c687dc6503233f55300a7c56"
 
 UPSTREAM_CHECK_REGEX = "Test\-Deep\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.17.1



