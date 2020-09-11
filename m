Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.9331.1599834415219871255
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 07:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08BEQkex011245
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 07:26:52 -0700 (PDT)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Sep 2020 07:26:37 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-django: add recipe for 3.1.1
Date: Fri, 11 Sep 2020 10:26:37 -0400
Message-ID: <20200911142637.1435646-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

meta-python only contains a recipe for django 2.2.x, so
add a recipe file for the newest branch.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-django_3.1.1.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
new file mode 100644
index 000000000..b36cfb699
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "d5e894fb3c46064e84e9dc68a08a46d0"
+SRC_URI[sha256sum] = "59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
-- 
2.26.2

