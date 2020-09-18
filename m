Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11155.1600430328528859525
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 04:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59702 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kJF2M-0005BI-BT; Fri, 18 Sep 2020 14:58:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-rfc3339-validator: Upgrade 0.1.1 -> 0.1.2
Date: Fri, 18 Sep 2020 14:58:35 +0300
Message-Id: <20200918115835.4742-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918115835.4742-1-leon.anavi@konsulko.com>
References: <20200918115835.4742-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 0.1.2:

- setup.py: move pytest-runner to test_requirements

Patch has been removed from the recipe because it has been already
upstreamed in the new release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...e-pytest-runner-to-test_requirements.patch | 32 -------------------
 ....bb => python3-rfc3339-validator_0.1.2.bb} |  8 ++---
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
 rename meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.1.bb => python3-rfc3339-validator_0.1.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch b/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
deleted file mode 100644
index ce8ca0bc8c..0000000000
--- a/meta-python/recipes-devtools/python/python-rfc3339-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2de281fdca88f223ace1eb6428a77b9903c69264 Mon Sep 17 00:00:00 2001
-From: Nicola Lunghi <nicola.lunghi@jci.com>
-Date: Thu, 14 Nov 2019 11:58:28 +0000
-Subject: [PATCH] setup.py: move pytest-runner to test_requirements
-
-This fixes an issue with yocto build.
-pytest-runner is only needed when running tests.
-
-Upstream-Status: Pending
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 9a50767..e3b1c6e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -12,9 +12,9 @@ requirements = [
-     'six',
- ]
- 
--setup_requirements = ['pytest-runner', ]
-+setup_requirements = []
- 
--test_requirements = ['pytest>=3', ]
-+test_requirements = ['pytest>=3', 'pytest-runner']
- 
- setup(
-     author="Nicolas Aimetti",
--- 
-2.20.1
-
diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
rename to meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
index 1f5d91d3b2..e226e11b75 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.2.bb
@@ -5,17 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
 
-SRC_URI[md5sum] = "9d8899041d83f98180bddd8b62ee7e99"
-SRC_URI[sha256sum] = "20a600d01fbb1f793cbb6f4ec4ebb2104f4c9e80d74d5f78350b63ecc6cccd08"
+SRC_URI[md5sum] = "2c233007189d5ef21046cb2afac51a96"
+SRC_URI[sha256sum] = "c9659c3183488a1875c4d327c9873d9e92c54cdcd69dfbfae7546ad8b27baf9a"
 
 PYPI_PACKAGE = "rfc3339_validator"
 
 inherit pypi setuptools3
 
-SRC_URI_append = " \
-    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
-"
-
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-datetime \
-- 
2.17.1

