Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.41286.1602511233110914505
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 07:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kRyNK-00026S-IA; Mon, 12 Oct 2020 17:00:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-regex: Upgrade 2020.9.27 -> 2020.10.11
Date: Mon, 12 Oct 2020 17:00:19 +0300
Message-Id: <20201012140022.15761-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201012140022.15761-1-leon.anavi@konsulko.com>
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.10.11:

- Updated .yml file for Python 3.9.
- Didn't parse regex comments property when in VERBOSE mode.

License-Update: Changed to Apache Software License

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-regex_2020.10.11.bb                | 11 +++++++++++
 .../python/python3-regex_2020.9.27.bb                 | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
new file mode 100644
index 0000000000..df2c00bbaa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Alternative regular expression module, to replace re."
+HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c046c93d45d8e4bc"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "642c259122a3b578cec66d8bba5665e4"
+SRC_URI[sha256sum] = "463e770c48da76a8da82b8d4a48a541f314e0df91cbb6d873a341dbe578efafd"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
deleted file mode 100644
index fb891f8716..0000000000
--- a/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Alternative regular expression module, to replace re."
-HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745d623f406b500ec"
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "195f5e867e9f87a39f921ad0e5761a61"
-SRC_URI[sha256sum] = "a6f32aea4260dfe0e55dc9733ea162ea38f0ea86aa7d0f77b15beac5bf7b369d"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

