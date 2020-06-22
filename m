Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14644.1592822179722524089
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJoG-0005ty-9H; Mon, 22 Jun 2020 13:36:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-padatious: Upgrade 0.4.7 -> 0.4.8
Date: Mon, 22 Jun 2020 13:35:40 +0300
Message-Id: <20200622103542.27830-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.4.8:

- Add support for saving / loading models
- Handle apostrophes in a better way

Change LIC_FILES_CHKSUM due to repo restructure and update of
README.md. The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-padatious_0.4.7.bb   | 9 ---------
 .../recipes-devtools/python/python3-padatious_0.4.8.bb   | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
deleted file mode 100644
index 4abe7c747..000000000
--- a/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "An efficient and agile neural network intent parser. Padatious is a core component of Mycroft AI."
-HOMEPAGE = "https://github.com/MycroftAI/padatious"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.md;md5=77baec496a458dd0e0fc4ca64cd305bc"
-
-SRC_URI[md5sum] = "1f53967a1633baa8fd48f11139808a33"
-SRC_URI[sha256sum] = "3c235942ff4151a3c36536fd776bd8a6d4d57c97046723d2fa80a89b34faac1f"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
new file mode 100644
index 000000000..404a0170d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
@@ -0,0 +1,9 @@
+SUMMARY = "An efficient and agile neural network intent parser. Padatious is a core component of Mycroft AI."
+HOMEPAGE = "https://github.com/MycroftAI/padatious"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.md;md5=cc85c733dffe81e8a7fde2e8f8a6a404"
+
+SRC_URI[md5sum] = "7dd2f1830737dc142aa199f77dacf32e"
+SRC_URI[sha256sum] = "e471f251b94e8cadf6e4214f0f3b7b36678848aaa8c51cd5638ab23ecb716f75"
+
+inherit pypi setuptools3
-- 
2.17.1

