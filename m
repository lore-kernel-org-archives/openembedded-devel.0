Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.21821.1591972935496412026
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52426 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjksl-0006Jj-NT; Fri, 12 Jun 2020 17:42:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-javaobj-py3: Consolidate in a single file
Date: Fri, 12 Jun 2020 17:41:57 +0300
Message-Id: <20200612144201.4536-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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
 .../python/python-javaobj-py3.inc               | 15 ---------------
 .../python/python3-javaobj-py3_0.4.0.1.bb       | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-javaobj-py3.inc

diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3.inc b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
deleted file mode 100644
index e667057bc..000000000
--- a/meta-python/recipes-devtools/python/python-javaobj-py3.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Module for serializing and de-serializing Java objects."
-DESCRIPTION = "python-javaobj is a python library that provides functions\
- for reading and writing (writing is WIP currently) Java objects serialized\
- or will be deserialized by ObjectOutputStream. This form of object\
- representation is a standard data interchange format in Java world."
-HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e"
-
-SRC_URI[md5sum] = "352fe0df9336b8699ad0799ef152da6b"
-SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
index 0ec23ba99..49d258ca8 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
@@ -1,2 +1,15 @@
-require python-javaobj-py3.inc
-inherit setuptools3
+SUMMARY = "Module for serializing and de-serializing Java objects."
+DESCRIPTION = "python-javaobj is a python library that provides functions\
+ for reading and writing (writing is WIP currently) Java objects serialized\
+ or will be deserialized by ObjectOutputStream. This form of object\
+ representation is a standard data interchange format in Java world."
+HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e"
+
+SRC_URI[md5sum] = "352fe0df9336b8699ad0799ef152da6b"
+SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

