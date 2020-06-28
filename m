Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.22406.1593316186290863553
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Jun 2020 20:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05S3ni4v014801
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 27 Jun 2020 20:49:45 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sat, 27 Jun 2020 20:49:43 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libmcrypt: set CLEANBROKEN
Date: Sun, 28 Jun 2020 11:47:22 +0800
Message-ID: <20200628034722.2160330-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

reproduce steps:
1. bitbake libmcrypt
2. add bb.note('hello') in do_fetch of base.bbclass
3. bitbake libmcrypt

do_configure failed:
Making clean in doc
make[1]: Entering directory 'build/tmp-glibc/work/cortexa72-wrs-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/doc'
make[1]: *** No rule to make target 'clean'.  Stop.
make[1]: Leaving directory 'build/tmp-glibc/work/cortexa72-wrs-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/doc'
Makefile:316: recipe for target 'clean-recursive' failed

error occurred in autotools_preconfigure, since we have build one time
in step1, we have CONFIGURESTAMPFILE, and also BB_TASKHASH changed after
step2, in step3, after do_fetch, ${S} is renewed, but with main Makefile
exist but no Makefile exist under sub folder, so above error occurred.

set CLEANBROKEN to fix this error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index be413a1c7..46e694be4 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -13,3 +13,5 @@ UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mcrypt/files/Libmcrypt/"
 UPSTREAM_CHECK_REGEX = "Libmcrypt/(?P<pver>\d+(\.\d+)+)/"
 
 inherit autotools-brokensep gettext binconfig
+
+CLEANBROKEN = "1"
-- 
2.17.1

