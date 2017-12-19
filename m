Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 42CAF78289
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 17:14:20 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d4so25047182qtj.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 09:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ziqeRGtLbChJYzJk+pwBBIZsCbZIfzzQSfvbvF4G3s4=;
	b=rHUG3LKVDI1NL4pd8UwpHyzKpFjCL8lYI9dV0Ny/wq6g9MxWvcMkg8L1xw8do2bBQI
	IDiSlm2qnOXtlBts5yKGK3LvTQq6XhEkbsEXVw9P54BkYUj68bM0jhtc1r4QQIzCrsuK
	efBrptIKAVE9yhx2xpzLJBHTZ5eubZOTUtYlKx7LeAAlOJgP2xy+fOL1G2x9Zc9k8y5s
	pW0o1KlWA8a1ePeMyl7hRVwczYQA4zrOKpjX1UWSE//uXhmOl76nHmJsD2OUPwVwmZBW
	CJCXWXC2XtvJbqElyTRmcd5BSexAdGNi6VlIJZ9ceogDVZvpOejHdr6WFAfRZK99NENf
	iuKw==
X-Gm-Message-State: AKGB3mI2AfVq/l9jOq6vg1IKkUTrAE6r/qPTe2gD/kExhX/qXDpiC9tH
	tCcE8Vra0thPUyPyOFxc/43u+BnO
X-Google-Smtp-Source: ACJfBouNfE6jnMkQsQ/2eHyii5VbtpTHUORHEMsxGRCLz8v545Lq+SrqZS2ipnDsSP2Boorhw6FVJA==
X-Received: by 10.200.19.129 with SMTP id h1mr5956601qtj.233.1513703661133;
	Tue, 19 Dec 2017 09:14:21 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v81sm9536832qkb.73.2017.12.19.09.14.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 09:14:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 12:14:12 -0500
Message-Id: <1513703652-24021-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513703652-24021-1-git-send-email-derek@asterius.io>
References: <1513703652-24021-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-pytest: update to version 3.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2017 17:14:20 -0000

Update RDEPENDS for latest version

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc     |  7 +++++--
 ....py-remove-the-setup_requires-for-setuptools-scm.patch | 15 +++++++++------
 .../recipes-devtools/python/python-pytest_3.2.5.bb        |  2 --
 .../recipes-devtools/python/python-pytest_3.3.1.bb        |  7 +++++++
 .../{python3-pytest_3.2.5.bb => python3-pytest_3.3.1.bb}  |  0
 5 files changed, 21 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest_3.2.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pytest_3.3.1.bb
 rename meta-python/recipes-devtools/python/{python3-pytest_3.2.5.bb => python3-pytest_3.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 2f68343..90d1a56 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -3,18 +3,21 @@ HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c39b24965f4aef64222cb35de9d47cc4"
 
-SRC_URI[md5sum] = "6dbe9bb093883f75394a689a1426ac6f"
-SRC_URI[sha256sum] = "6d5bd4f7113b444c55a3bbb5c738a3dd80d43563d063fc42dcb0aaefbdd78b81"
+SRC_URI[md5sum] = "6c056c2c41dfd2a0766682b942abf39c"
+SRC_URI[sha256sum] = "cf8436dc59d8695346fcd3ab296de46425ecab00d64096cebe79fb51ecb2eb93"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
                    file://pytest_version_fix.patch "
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-pluggy \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
 "
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pytest:"
diff --git a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
index e283b17..06dfcdf 100644
--- a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
+++ b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
@@ -1,29 +1,32 @@
-From e2d81009c790b4ebeced8408b6bae78060cabcaf Mon Sep 17 00:00:00 2001
+From 24a901fd17926e8e05be4ed2e01b0113a2e3a852 Mon Sep 17 00:00:00 2001
 From: Derek Straka <derek@asterius.io>
-Date: Wed, 5 Jul 2017 09:35:51 -0400
-Subject: [PATCH 1/1] setup.py: remove the setup_requires for setuptools-scm
+Date: Tue, 19 Dec 2017 11:36:39 -0500
+Subject: [PATCH] [PATCH 1/1] setup.py: remove the setup_requires for
+ setuptools-scm
 
 The setup_requires argument forces the download of the egg file for setuptools-scm
 during the do_compile phase.  This download is incompatible with the typical fetch
 and mirror structure.  The only usage of scm is the generation of the _version.py
 file and in the release tarball it is already correctly created
 
+Upstream-Status: Inappropriate [oe specific]
+
 Signed-off-by: Derek Straka <derek@asterius.io>
 ---
  setup.py | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 751868c..ef6ebf1 100644
+index 3eb38ef..1163202 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -71,7 +71,6 @@ def main():
+@@ -82,7 +82,6 @@ def main():
          keywords="test unittest",
          cmdclass={'test': PyTest},
          # the following should be enabled for release
 -        setup_requires=['setuptools-scm'],
+         python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*',
          install_requires=install_requires,
          extras_require=extras_require,
-         packages=['_pytest', '_pytest.assertion', '_pytest._code', '_pytest.vendored_packages'],
 -- 
 2.7.4
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.2.5.bb b/meta-python/recipes-devtools/python/python-pytest_3.2.5.bb
deleted file mode 100644
index d322f09..0000000
--- a/meta-python/recipes-devtools/python/python-pytest_3.2.5.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-pytest.inc
diff --git a/meta-python/recipes-devtools/python/python-pytest_3.3.1.bb b/meta-python/recipes-devtools/python/python-pytest_3.3.1.bb
new file mode 100644
index 0000000..d7bd0a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytest_3.3.1.bb
@@ -0,0 +1,7 @@
+inherit pypi setuptools
+require python-pytest.inc
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-compiler \
+    ${PYTHON_PN}-funcsigs \
+"
diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.2.5.bb b/meta-python/recipes-devtools/python/python3-pytest_3.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_3.2.5.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.3.1.bb
-- 
2.7.4


