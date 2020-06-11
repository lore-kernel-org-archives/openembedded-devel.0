Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3532.1591866605746465083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 02:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjJDn-0007qt-Ua; Thu, 11 Jun 2020 12:10:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-pocketsphinx: Consolidate in a single file
Date: Thu, 11 Jun 2020 12:09:03 +0300
Message-Id: <20200611090904.29772-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611090904.29772-1-leon.anavi@konsulko.com>
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
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
Add a homepage and a description.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-pocketsphinx.inc |  9 ---------
 .../python/python3-pocketsphinx_0.1.0.bb            | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pocketsphinx.inc

diff --git a/meta-python/recipes-devtools/python/python-pocketsphinx.inc b/meta-python/recipes-devtools/python/python-pocketsphinx.inc
deleted file mode 100644
index 1f8f66a18..000000000
--- a/meta-python/recipes-devtools/python/python-pocketsphinx.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
-
-SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
-SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
-
-DEPENDS += "swig-native"
diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
index 2275d1b50..cb22040df 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
@@ -1,2 +1,13 @@
-require python-pocketsphinx.inc
+SUMMARY = "This package provides a python interface to CMU Sphinxbase and Pocketsphinx libraries created with SWIG and Setuptools."
+DESCRIPTION = "Python interface to CMU Sphinxbase and Pocketsphinx libraries"
+HOMEPAGE = "https://github.com/bambocher/pocketsphinx-python"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
+
+SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
+SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
+
 inherit pypi setuptools3
+
+DEPENDS += "swig-native"
-- 
2.17.1

