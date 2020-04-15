Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.13977.1586956686891002897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 06:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03FDI2Oe016823
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 06:18:02 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 15 Apr 2020 06:18:01 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: clean the empty /lib dir
Date: Wed, 15 Apr 2020 21:18:00 +0800
Message-ID: <1586956680-2704-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

When usrmerge is enabled in DISTRO_FEATURES, there
comes below error:
ERROR: mariadb-10.4.12-r0 do_package_qa: QA Issue: mariadb-leftovers package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
ERROR: mariadb-10.4.12-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.

It is because empty /lib dir exists in mariadb-leftovers
as below:
 $ rpm -qpl mariadb-leftovers-10.4.12-r0.core2_64.rpm |grep ^/lib
 /lib

So remove the empty /lib dir to fix the above error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 5ff273e..2387c2a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -170,6 +170,9 @@ do_install() {
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
         mv ${D}/lib/security ${D}/${libdir}
+        if [ "`ls -A ${D}/lib`" = "" ]; then
+            rm -rf ${D}/lib
+        fi
     fi
 }
 
-- 
2.7.4

