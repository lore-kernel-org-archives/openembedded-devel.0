Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.41349.1597663768641708047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dKP-000361-Mh; Mon, 17 Aug 2020 14:29:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-wheel: Upgrade 0.34.2 -> 0.35.1
Date: Mon, 17 Aug 2020 14:28:57 +0300
Message-Id: <20200817112901.28914-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.35.1:

- Switched to the packaging library for computing wheel tags
- Fixed a resource leak in WheelFile.open()

License-Update: Use PKG-INFO to check the license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-wheel_0.34.2.bb | 13 -------------
 .../recipes-devtools/python/python3-wheel_0.35.1.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb b/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
deleted file mode 100644
index 8633a4fc9..000000000
--- a/meta-python/recipes-devtools/python/python3-wheel_0.34.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "The official binary distribution format for Python "
-HOMEPAGE = "https://github.com/pypa/wheel"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9d66b41bc2a080e7174acc5dffecd752"
-
-SRC_URI[md5sum] = "ce2a27f99c130a927237b5da1ff5ceaf"
-SRC_URI[sha256sum] = "8788e9155fe14f54164c1b9eb0a319d98ef02c160725587ad60f14ddc57b6f96"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
new file mode 100644
index 000000000..b4e77ea84
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "The official binary distribution format for Python "
+HOMEPAGE = "https://github.com/pypa/wheel"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "7ec7c435cc73eefebd9f0af43c120044"
+SRC_URI[sha256sum] = "99a22d87add3f634ff917310a3d87e499f19e663413a52eb9232c447aa646c9f"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
+
-- 
2.17.1

