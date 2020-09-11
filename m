Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.8962.1599833439391457933
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 07:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08BEAWuu011114
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 07:10:33 -0700 (PDT)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Sep 2020 07:10:09 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-django: upgrade 2.2.13 -> 2.2.16
Date: Fri, 11 Sep 2020 10:10:09 -0400
Message-ID: <20200911141009.1409578-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Summary of release notes from https://docs.djangoproject.com/en/2.2/releases/

2.2.14 release notes:

- Fixed messages of InvalidCacheKey exceptions and CacheKeyWarning warnings
  raised by cache key validation (#31654).

2.2.15 release notes:

- Allowed setting the SameSite cookie flag in HttpResponse.delete_cookie()
  (#31790).
- Fixed crash when sending emails to addresses with display names longer than
  75 chars on Python 3.6.11+, 3.7.8+, and 3.8.4+ (#31784).

2.2.16 release notes:

- Fixed CVE-2020-24583: Incorrect permissions on intermediate-level directories
  on Python 3.7+
- Fixed CVE-2020-24584: Permission escalation in intermediate-level directories
  of the file system cache on Python 3.7+
- Fixed a data loss possibility in the select_for_update(). When using related
  fields pointing to a proxy model in the of argument, the corresponding model
  was not locked (#31866).
- Fixed a data loss possibility, following a regression in Django 2.0, when
  copying model instances with a cached fields value (#31863).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-django_2.2.13.bb     | 9 ---------
 .../recipes-devtools/python/python3-django_2.2.16.bb     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.13.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.16.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.13.bb b/meta-python/recipes-devtools/python/python3-django_2.2.13.bb
deleted file mode 100644
index 55eacdff2..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.13.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "30c688af9b63c4800ef9b044e0dd4145"
-SRC_URI[sha256sum] = "84f370f6acedbe1f3c41e1a02de44ac206efda3355e427139ecb785b5f596d80"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
new file mode 100644
index 000000000..0715abbd4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "93faf5bbd54a19ea49f4932a813b9758"
+SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2786594"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
-- 
2.26.2

