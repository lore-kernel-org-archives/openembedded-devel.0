Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13838.1591191766683635109
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 06:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47258 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgTfJ-00009o-Bn; Wed, 03 Jun 2020 16:42:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-feedformatter: Consolidate in a single file
Date: Wed,  3 Jun 2020 16:42:32 +0300
Message-Id: <20200603134232.22336-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603134232.22336-1-leon.anavi@konsulko.com>
References: <20200603134232.22336-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
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
 .../python/python-feedformatter.inc            | 16 ----------------
 .../python/python3-feedformatter_0.4.bb        | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-feedformatter.inc

diff --git a/meta-python/recipes-devtools/python/python-feedformatter.inc b/meta-python/recipes-devtools/python/python-feedformatter.inc
deleted file mode 100644
index 6ddcaa98e..000000000
--- a/meta-python/recipes-devtools/python/python-feedformatter.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "A Python library for generating news feeds in RSS and Atom formats"
-HOMEPAGE = "http://code.google.com/p/feedformatter/"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=258e3f39e2383fbd011035d04311008d"
-SRCREV = "7391193c83e10420b5a2d8ef846d23fc368c6d85"
-
-SRC_URI = "git://github.com/marianoguerra/feedformatter.git"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-xml \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
index 95a5405f3..81c5fde13 100644
--- a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
@@ -1,2 +1,18 @@
+DESCRIPTION = "A Python library for generating news feeds in RSS and Atom formats"
+HOMEPAGE = "http://code.google.com/p/feedformatter/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=258e3f39e2383fbd011035d04311008d"
+
+SRC_URI = "git://github.com/marianoguerra/feedformatter.git"
+SRCREV = "7391193c83e10420b5a2d8ef846d23fc368c6d85"
+
+S = "${WORKDIR}/git"
+
 inherit setuptools3
-require python-feedformatter.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-xml \
+    "
-- 
2.17.1

