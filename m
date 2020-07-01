Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.23035.1593613391809500925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60354 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqddm-0002cZ-DE; Wed, 01 Jul 2020 17:23:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pyperclip: Upgrade 1.7.0 -> 1.8.0
Date: Wed,  1 Jul 2020 17:22:42 +0300
Message-Id: <20200701142243.1686-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701142243.1686-1-leon.anavi@konsulko.com>
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.8.0:

- Correcting a URL
- Updating code and docs with waitForPaste() and waitForNewPaste()
  functions.

Use the exact line with license information from PKG-INFO.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pyperclip_1.7.0.bb             | 14 --------------
 .../python/python3-pyperclip_1.8.0.bb             | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
deleted file mode 100644
index 52d109abc..000000000
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a428356ada7737b416ec4b63dc65d581"
-
-SRC_URI[md5sum] = "6bbb8598579cc3ee50554b4c59d0cfae"
-SRC_URI[sha256sum] = "979325468ccf682104d5dcaf753f869868100631301d3e72f47babdea5700d1c"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-ctypes \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
new file mode 100644
index 000000000..8f331529a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
+HOMEPAGE = "https://github.com/asweigart/pyperclip"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
+
+SRC_URI[md5sum] = "c2564a74b909b6fc32401afd619de83d"
+SRC_URI[sha256sum] = "b75b975160428d84608c26edba2dec146e7799566aea42c1fe1b32e72b6028f2"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-ctypes \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

