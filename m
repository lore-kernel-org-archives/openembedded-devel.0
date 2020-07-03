Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6840.1593768641653350387
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1n-0007av-FK; Fri, 03 Jul 2020 12:30:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-regex: Upgrade 2020.1.8 -> 2020.6.8
Date: Fri,  3 Jul 2020 12:30:14 +0300
Message-Id: <20200703093020.3514-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.6.8:

- Updated to Unicode 13.0.0.
- Improved performance of string sets.

Fix SUMMARY and HOMEPAGE. Use exact line from PKG-INFO to
determine the license and LIC_FILES_CHKSUM. The license remain
the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-regex_2020.1.8.bb                 | 12 ------------
 .../python/python3-regex_2020.6.8.bb                 | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
deleted file mode 100644
index 6bdc03995a..0000000000
--- a/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = ""
-HOMEPAGE = "http://pythonhosted.org/regex"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3d9edb84b293ab5a9ed5bcaf1b769ab6"
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "73abc3d7e902e94b4281fd2652f5a94f"
-SRC_URI[sha256sum] = "d0f424328f9822b0323b3b6f2e4b9c90960b24743d220763c7f07071e0778351"
-
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
new file mode 100644
index 0000000000..d09f638400
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Alternative regular expression module, to replace re."
+HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745d623f406b500ec"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "a991f73b0ccfe8f6e9a99bd1bc9071b1"
+SRC_URI[sha256sum] = "e9b64e609d37438f7d6e68c2546d2cb8062f3adb27e6336bc129b51be20773ac"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

