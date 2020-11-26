Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3678.1606389753573832060
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 03:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52394 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiFM8-0005Yd-Ht; Thu, 26 Nov 2020 13:22:33 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-fastnumbers: Upgrade 3.0.0 -> 3.1.0
Date: Thu, 26 Nov 2020 13:22:11 +0200
Message-Id: <20201126112215.11451-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126112215.11451-1-leon.anavi@konsulko.com>
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 3.1.0:

- query_type function to determine what as type fastnumbers will
  interpret a given input
- Support for Python 3.9 (eliminate use of private Python C
  function that is now hidden in 3.9)

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-fastnumbers_3.0.0.bb                |  9 ---------
 .../python/python3-fastnumbers_3.1.0.bb                | 10 ++++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
deleted file mode 100644
index b0ecb9d560..0000000000
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Super-fast and clean conversions to numbers."
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f797665cf3d3e0fdc0d488f5200c6f55"
-
-PYPI_PACKAGE = "fastnumbers"
-SRC_URI[sha256sum] = "93ce2f9516fbf2bbf46c85e4abef783cc569e5fbbc665352efb9cdddbae517ec"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
new file mode 100644
index 0000000000..5c913ffef8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Super-fast and clean conversions to numbers."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
+
+PYPI_PACKAGE = "fastnumbers"
+
+SRC_URI[sha256sum] = "7cc4f96981ccd3cf212b6ea7b84ef621620b62da8b454f420aa2e81c8529e68f"
+
+inherit pypi setuptools3
-- 
2.17.1

