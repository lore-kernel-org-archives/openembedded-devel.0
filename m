Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2121.1592554264130246331
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 01:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51466 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmCLb-0007GG-9v; Fri, 19 Jun 2020 11:26:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-pretend: Consolidate in a single file
Date: Fri, 19 Jun 2020 11:10:08 +0300
Message-Id: <20200619081011.25051-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619081011.25051-1-leon.anavi@konsulko.com>
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-pretend.inc        |  9 ---------
 .../recipes-devtools/python/python3-pretend_1.0.9.bb  | 11 ++++++++++-
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pretend.inc

diff --git a/meta-python/recipes-devtools/python/python-pretend.inc b/meta-python/recipes-devtools/python/python-pretend.inc
deleted file mode 100644
index 58f196199..000000000
--- a/meta-python/recipes-devtools/python/python-pretend.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "A library for stubbing in Python"
-HOMEPAGE = "https://github.com/alex/pretend"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
-
-SRC_URI[md5sum] = "ad53883ede48aeac7ae584f0de0240e8"
-SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb b/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
index 9c5d8a843..21d14a03b 100644
--- a/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
@@ -1,2 +1,11 @@
+SUMMARY = "A library for stubbing in Python"
+HOMEPAGE = "https://github.com/alex/pretend"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
+
+SRC_URI[md5sum] = "ad53883ede48aeac7ae584f0de0240e8"
+SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10"
+
 inherit pypi setuptools3
-require python-pretend.inc
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

