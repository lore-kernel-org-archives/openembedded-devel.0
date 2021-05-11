Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.1858.1620751948245594146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 09:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lgVcR-0007jj-44; Tue, 11 May 2021 19:52:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-aiohue: Upgrade 2.2.0 -> 2.3.0
Date: Tue, 11 May 2021 19:52:15 +0300
Message-Id: <20210511165217.18433-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511165217.18433-1-leon.anavi@konsulko.com>
References: <20210511165217.18433-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.0:

- Fix Hue communication protocol
- Create Dependabot config file
- Include LICENSE in the manifest

License-Update: Use file LICENSE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-aiohue_2.2.0.bb  | 12 ------------
 .../recipes-devtools/python/python3-aiohue_2.3.0.bb  | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohue_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
deleted file mode 100644
index a2a7363f6c..0000000000
--- a/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Asynchronous library to control Philips Hue"
-HOMEPAGE = "https://pypi.org/project/aiohue/"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-# No license file available but the license is specified in PKG-INFO and setup.py.
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
-
-SRC_URI[sha256sum] = "35696d04d6eb0328b7031ea3c0a3cfe5d83dfcf62f920522e4767d165c6bc529"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += "${PYTHON_PN}-aiohttp"
diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.3.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.3.0.bb
new file mode 100644
index 0000000000..02f698532e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohue_2.3.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Asynchronous library to control Philips Hue"
+HOMEPAGE = "https://pypi.org/project/aiohue/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
+
+SRC_URI[sha256sum] = "d36fa57747191b92e77c89c453c792f13b9af8f7ca9610bb4bb46f2636a536f6"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-aiohttp"
-- 
2.17.1

