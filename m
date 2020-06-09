Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6460.1591707370777417061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 05:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37164 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jidnT-0002LY-MQ; Tue, 09 Jun 2020 15:56:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-wcwidth: Upgrade 0.1.8 -> 0.2.4
Date: Tue,  9 Jun 2020 15:55:59 +0300
Message-Id: <20200609125600.17773-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 0.2.4. The license file has been renamed but
the source code remains avaiable under MIT. Add a description
and a homepage.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-wcwidth_0.1.8.bb | 10 ----------
 .../recipes-devtools/python/python3-wcwidth_0.2.4.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
deleted file mode 100644
index f9f6474ad..000000000
--- a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Library for building powerful interactive command lines in Python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=11fba47286258744a6bc6e43530c32a1"
-
-SRC_URI[md5sum] = "dc6677d099e6f49c0f6fbc310de261e9"
-SRC_URI[sha256sum] = "f28b3e8a6483e5d49e7f8949ac1a78314e740333ae305b4ba5defd3e74fb37a8"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
new file mode 100644
index 000000000..48ff37654
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.2.4.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Library for building powerful interactive command lines in Python"
+DESCRIPTION = "Measures the displayed width of unicode strings in a terminal"
+HOMEPAGE = "https://github.com/jquast/wcwidth"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
+
+SRC_URI[md5sum] = "5e6cd8cd008a7ad2c2578ac49a9d87a1"
+SRC_URI[sha256sum] = "8c6b5b6ee1360b842645f336d9e5d68c55817c26d3050f46b235ef2bc650e48f"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

