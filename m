Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.64372.1600100431812508019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 09:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08EGKPp0011652
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 14 Sep 2020 09:20:25 -0700 (PDT)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 14 Sep 2020 09:20:06 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <ticotimo@gmail.com>, <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-django: add recipe for 3.1.1
Date: Mon, 14 Sep 2020 12:20:05 -0400
Message-ID: <20200914162005.2572117-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

meta-python only contains a recipe for django 2.2.x, so
add a recipe file for the newest branch.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---

v2 adds DEFAULT_PREFERENCE so that the 2.2.16 LTS version of
python3-django is still the default choice for builds.

 .../python/python3-django_3.1.1.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
new file mode 100644
index 000000000..ed6513d0c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
@@ -0,0 +1,14 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "d5e894fb3c46064e84e9dc68a08a46d0"
+SRC_URI[sha256sum] = "59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
+
+# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
+# default. To build the 3.x branch, 
+# PREFERRED_VERSION_python3-django = "3.1.1" can be added to local.conf
+DEFAULT_PREFERENCE = "-1"
-- 
2.26.2

