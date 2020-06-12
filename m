Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.22137.1591974296729817895
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05CF4YhS010377
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 08:04:45 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 12 Jun 2020
 08:04:23 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id E4FEF9009BA;
 Fri, 12 Jun 2020 08:04:23 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-django: upgrade 2.2.7 -> 2.2.13
Date: Fri, 12 Jun 2020 08:04:23 -0700
Message-ID: <20200612150423.94579-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade from 2.2.7 for:

- Bugfixes, including CVE-2020-13254, CVE-2020-13596, many
others;
- Official support for Python 3.8 (as of Django 2.2.8)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-django_2.2.13.bb     | 9 +++++++++
 .../recipes-devtools/python/python3-django_2.2.7.bb      | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.13.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.13.bb b/meta-python/recipes-devtools/python/python3-django_2.2.13.bb
new file mode 100644
index 000000000..55eacdff2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.13.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "30c688af9b63c4800ef9b044e0dd4145"
+SRC_URI[sha256sum] = "84f370f6acedbe1f3c41e1a02de44ac206efda3355e427139ecb785b5f596d80"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.7.bb b/meta-python/recipes-devtools/python/python3-django_2.2.7.bb
deleted file mode 100644
index e56453abc..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.7.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "b0833024aac4c8240467e4dc91a12e9b"
-SRC_URI[sha256sum] = "16040e1288c6c9f68c6da2fe75ebde83c0a158f6f5d54f4c5177b0c1478c5b86"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-"
-- 
2.24.1

