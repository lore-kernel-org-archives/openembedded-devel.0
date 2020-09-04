Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.38451.1599227251365733988
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kEC3t-0000aK-Na; Fri, 04 Sep 2020 16:47:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-fann2: Consolidate in a single file
Date: Fri,  4 Sep 2020 16:47:13 +0300
Message-Id: <20200904134713.13164-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904134713.13164-1-leon.anavi@konsulko.com>
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-fann2.inc        |  9 ---------
 .../recipes-devtools/python/python3-fann2_1.1.2.bb  | 13 +++++++++++--
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-fann2.inc

diff --git a/meta-python/recipes-devtools/python/python-fann2.inc b/meta-python/recipes-devtools/python/python-fann2.inc
deleted file mode 100644
index c415b35a9..000000000
--- a/meta-python/recipes-devtools/python/python-fann2.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Python bindings for Fast Artificial Neural Networks 2.2.0 (FANN >= 2.2.0)"
-SECTION = "devel/python"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f"
-
-SRC_URI[md5sum] = "0b85b418018746d63ed66b55465697a9"
-SRC_URI[sha256sum] = "cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9fa2b34299bdd41e"
-
-DEPENDS += "swig-native libfann"
diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
index a04c961f4..3fdc1363c 100644
--- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
@@ -1,4 +1,13 @@
-require python-fann2.inc
-inherit pypi setuptools3
+SUMMARY = "Python bindings for Fast Artificial Neural Networks 2.2.0 (FANN >= 2.2.0)"
+SECTION = "devel/python"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f"
+
+SRC_URI[md5sum] = "0b85b418018746d63ed66b55465697a9"
+SRC_URI[sha256sum] = "cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9fa2b34299bdd41e"
 
 SRC_URI += " file://0001-setup.py-Don-t-hardcode-swig-and-fann2-binary-locati.patch"
+
+inherit pypi setuptools3
+
+DEPENDS += "swig-native libfann"
-- 
2.17.1

