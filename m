Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.1489.1587016281465528225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 22:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03G5pIlR025039
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 15 Apr 2020 22:51:18 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 15 Apr 2020 22:51:02 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] mariadb: clean the empty /lib dir
Date: Thu, 16 Apr 2020 13:51:00 +0800
Message-ID: <1587016260-203798-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <160600B2F0BD635E.31800@lists.openembedded.org>
References: <160600B2F0BD635E.31800@lists.openembedded.org>
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

Considering the empty /lib dir is introduced when pam
is enabled in DISTRO_FEATURES, so remove the empty /lib
dir when pam is enabled to fix the above error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 5ff273e..95f5acb 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -170,6 +170,7 @@ do_install() {
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
         mv ${D}/lib/security ${D}/${libdir}
+        rmdir --ignore-fail-on-non-empty ${D}/lib
     fi
 }
 
-- 
2.7.4

