Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.7153.1594200698196005878
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0689VFDr031425
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Jul 2020 02:31:26 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 8 Jul 2020
 02:31:05 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] drbd-utils: Add CLEANBROKEN to fix rebuild errors
Date: Wed, 8 Jul 2020 02:31:04 -0700
Message-ID: <20200708093104.188354-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fixed when rebuild:
DEBUG: Executing shell function autotools_preconfigure
NOTE: make clean
aclocal
autoheader
autoconf

You need to call ./configure with appropriate arguments (again).

make: *** [Makefile:287: config.status] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
index b83f68f8c..5dabdd51d 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
@@ -56,3 +56,5 @@ FILES_${PN} += "${nonarch_base_libdir}/drbd \
                 ${nonarch_libdir}/drbd \
                 ${nonarch_libdir}/tmpfiles.d"
 FILES_${PN}-dbg += "${nonarch_base_libdir}/drbd/.debug"
+
+CLEANBROKEN = "1"
-- 
2.17.1

