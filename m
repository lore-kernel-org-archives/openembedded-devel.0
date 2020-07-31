Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.18248.1596201785974484834
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V03-000741-Uu; Fri, 31 Jul 2020 16:23:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/15] python3-xlsxwriter: Consolidate in a single file
Date: Fri, 31 Jul 2020 16:22:25 +0300
Message-Id: <20200731132230.20031-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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
 .../recipes-devtools/python/python-xlsxwriter.inc   | 11 -----------
 .../python/python3-xlsxwriter_1.2.9.bb              | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-xlsxwriter.inc

diff --git a/meta-python/recipes-devtools/python/python-xlsxwriter.inc b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
deleted file mode 100644
index f5d56db00..000000000
--- a/meta-python/recipes-devtools/python/python-xlsxwriter.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Python 2 and 3 compatibility library"
-HOMEPAGE = "https://xlsxwriter.readthedocs.io"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672"
-
-inherit pypi
-
-PYPI_PACKAGE = "XlsxWriter"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
index cba856143..114f48214 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
@@ -1,5 +1,14 @@
-inherit setuptools3
-require python-xlsxwriter.inc
+SUMMARY = "Python 2 and 3 compatibility library"
+HOMEPAGE = "https://xlsxwriter.readthedocs.io"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "XlsxWriter"
 
 SRC_URI[md5sum] = "20f8b7df7f1705fa2f7ac3f84789d2ca"
 SRC_URI[sha256sum] = "828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

