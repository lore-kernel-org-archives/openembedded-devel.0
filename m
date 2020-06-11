Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3523.1591866587261542436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 02:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38022 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jjJDV-0007qt-Ct; Thu, 11 Jun 2020 12:09:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-ply: Consolidate in a single file
Date: Thu, 11 Jun 2020 12:09:02 +0300
Message-Id: <20200611090904.29772-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611090904.29772-1-leon.anavi@konsulko.com>
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-ply.inc    | 18 -----------------
 .../python/python3-ply_3.11.bb                | 20 +++++++++++++++++--
 2 files changed, 18 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-ply.inc

diff --git a/meta-python/recipes-devtools/python/python-ply.inc b/meta-python/recipes-devtools/python/python-ply.inc
deleted file mode 100644
index 149fe058f..000000000
--- a/meta-python/recipes-devtools/python/python-ply.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Python Lex and Yacc"
-DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
-HOMEPAGE = "https://pypi.python.org/pypi/ply"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
-
-SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
-SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
-
-inherit pypi
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-ply_3.11.bb b/meta-python/recipes-devtools/python/python3-ply_3.11.bb
index 72410baeb..3aa010fac 100644
--- a/meta-python/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta-python/recipes-devtools/python/python3-ply_3.11.bb
@@ -1,2 +1,18 @@
-require python-ply.inc
-inherit setuptools3
+SUMMARY = "Python Lex and Yacc"
+DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for Python"
+HOMEPAGE = "https://pypi.python.org/pypi/ply"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
+
+SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
+SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

