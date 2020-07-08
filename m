Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7136.1594201646145977408
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jt6fk-0007zg-7D; Wed, 08 Jul 2020 12:47:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-jsonref: Consolidate in a single file
Date: Wed,  8 Jul 2020 12:46:59 +0300
Message-Id: <20200708094659.27331-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708094659.27331-1-leon.anavi@konsulko.com>
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
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
 .../python-jsonref/python-jsonref.inc                | 11 -----------
 .../python-jsonref/python3-jsonref_0.2.bb            | 12 +++++++++++-
 2 files changed, 11 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python-jsonref/python-jsonref.inc

diff --git a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
deleted file mode 100644
index 45deb09c7..000000000
--- a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "jsonref is a library for automatic dereferencing of JSON Reference objects for Python"
-HOMEPAGE = "https://github.com/gazpachoking/jsonref"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
-
-SRC_URI[md5sum] = "42b518b9ccd6852d1d709749bc96cb70"
-SRC_URI[sha256sum] = "f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
index d97893f5a..45deb09c7 100644
--- a/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
+++ b/meta-python/recipes-devtools/python-jsonref/python3-jsonref_0.2.bb
@@ -1 +1,11 @@
-require python-jsonref.inc
+SUMMARY = "jsonref is a library for automatic dereferencing of JSON Reference objects for Python"
+HOMEPAGE = "https://github.com/gazpachoking/jsonref"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
+
+SRC_URI[md5sum] = "42b518b9ccd6852d1d709749bc96cb70"
+SRC_URI[sha256sum] = "f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

