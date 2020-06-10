Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10459.1591794946656655936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 06:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40010 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jj0Zy-0005hT-HK; Wed, 10 Jun 2020 16:15:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-meld3: Consolidate in a single file
Date: Wed, 10 Jun 2020 16:15:30 +0300
Message-Id: <20200610131536.31426-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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
 .../recipes-devtools/python/python-meld3.inc     | 15 ---------------
 .../python/python3-meld3_1.0.2.bb                | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-meld3.inc

diff --git a/meta-python/recipes-devtools/python/python-meld3.inc b/meta-python/recipes-devtools/python/python-meld3.inc
deleted file mode 100644
index 558e436c9..000000000
--- a/meta-python/recipes-devtools/python/python-meld3.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "meld3 templating system used by Supervisor"
-DESCRIPTION = "\
-meld3 is an HTML/XML templating system for Python which keeps \
-template markup and dynamic rendering logic separate from one \
-another.  See http://www.entrian.com/PyMeld for a treatise on the \
-benefits of this pattern."
-HOMEPAGE = "https://github.com/supervisor/meld3"
-LICENSE = "BSD-4-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf"
-
-SRC_URI[md5sum] = "3ccc78cd79cffd63a751ad7684c02c91"
-SRC_URI[sha256sum] = "f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558"
-
-PYPI_PACKAGE = "meld3"
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb b/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
index f69591629..b3e68c1a9 100644
--- a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-meld3.inc
+SUMMARY = "meld3 templating system used by Supervisor"
+DESCRIPTION = "\
+meld3 is an HTML/XML templating system for Python which keeps \
+template markup and dynamic rendering logic separate from one \
+another.  See http://www.entrian.com/PyMeld for a treatise on the \
+benefits of this pattern."
+HOMEPAGE = "https://github.com/supervisor/meld3"
+LICENSE = "BSD-4-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf"
+
+SRC_URI[md5sum] = "3ccc78cd79cffd63a751ad7684c02c91"
+SRC_URI[sha256sum] = "f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558"
+
+inherit pypi setuptools3
-- 
2.17.1

