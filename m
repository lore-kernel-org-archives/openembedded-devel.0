Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5830.1593171002497789366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYS-000568-Ou; Fri, 26 Jun 2020 14:30:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/12] python3-pybind11: Consolidate in a single file
Date: Fri, 26 Jun 2020 14:29:43 +0300
Message-Id: <20200626112944.25569-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python-pybind11.inc  | 7 -------
 .../recipes-devtools/python/python3-pybind11_2.4.3.bb    | 9 ++++++++-
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pybind11.inc

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
deleted file mode 100644
index d1d53e125..000000000
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "Seamless operability between C++11 and Python"
-HOMEPAGE = "https://github.com/wjakob/pybind11"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
-
-SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
-SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
index 355e28460..9efa2db75 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
@@ -1,2 +1,9 @@
+SUMMARY = "Seamless operability between C++11 and Python"
+HOMEPAGE = "https://github.com/wjakob/pybind11"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
+
+SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
+SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
+
 inherit pypi setuptools3
-require python-pybind11.inc
-- 
2.17.1

