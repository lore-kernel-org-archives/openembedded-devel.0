Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.9203.1601196264628675299
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 01:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08R8hk9k030160
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 27 Sep 2020 01:43:56 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 27 Sep 2020 01:43:35 -0700
From: "kai" <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, <ticotimo@gmail.com>
Subject: [meta-python][PATCH v2 2/2] python3-pytest: 5.4.3 -> 6.1.0
Date: Sun, 27 Sep 2020 16:43:20 +0800
Message-ID: <20200927084320.17334-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927084320.17334-1-kai.kang@windriver.com>
References: <20200927084320.17334-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade python3-pytest from 5.4.3 to 6.1.0
* add runtime dependency python3-iniconfig

And the release changelog is at:

https://docs.pytest.org/en/stable/changelog.html#pytest-6-1-0-2020-09-26

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...he-setup_requires-for-setuptools-scm.patch | 35 ++++++++++---------
 ...ytest_5.4.3.bb => python3-pytest_6.1.0.bb} |  3 +-
 2 files changed, 21 insertions(+), 17 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.4.3.bb => python3-pytest_6.1.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
index c29fb12de..8c5c17247 100644
--- a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
+++ b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
@@ -14,23 +14,26 @@ Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Derek Straka <derek@asterius.io>
 
 Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
+
+Rebase for pytest 6.1.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index adbafb5..75fdd09 100644
---- a/setup.py
-+++ b/setup.py
-@@ -19,7 +19,7 @@ INSTALL_REQUIRES = [
- def main():
-     setup(
-         use_scm_version={"write_to": "src/_pytest/_version.py"},
--        setup_requires=["setuptools-scm", "setuptools>=40.0"],
-+        setup_requires=["setuptools>=40.0"],
-         package_dir={"": "src"},
-         extras_require={
-             "testing": [
+ setup.cfg | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 60f6564..c4d1471 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -55,7 +55,6 @@ package_dir =
+ 	=src
+ setup_requires = 
+ 	setuptools>=40.0
+-	setuptools-scm
+ zip_safe = no
+ 
+ [options.entry_points]
 -- 
 2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
rename to meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
index ca67223db..1da43c4f9 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "Simple powerful testing with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-SRC_URI[sha256sum] = "7979331bfcba207414f5e1263b5a0f8f521d0f457318836a7355531ed1a4c7d8"
+SRC_URI[sha256sum] = "d010e24666435b39a4cf48740b039885642b6c273a3f77be3e7e03554d2806b7"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
@@ -13,6 +13,7 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-iniconfig \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-pluggy \
     ${PYTHON_PN}-py \
-- 
2.17.1

