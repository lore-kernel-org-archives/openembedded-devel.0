Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0C35F60667
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:25:40 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id i22so18170528ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s34bPi/ymbbVh644NrIDiNRmMc1y406M79cNSqv82pk=;
	b=ZVjZj4lZpfGL+tkMO712mcA8XRrLakAsCnvDmmbkArcsNw0t5Ff0eko1fjc171r1Et
	IHhtZgZokpyGzhim2cNOkhNZ8NDTuO+l4IBPwso+80WEnbI7hXZWt4M+ZJ3/82+miNN0
	JE51q/aNo/lfFKlSqK6yHIrVt/CXLe6HZJ8Lgs3hCcNhJho1kNFN2jEmbwfD8cUifSrP
	/YOqdj+Npk1acSZc9TjxMe23Z6Dyr5+n9XG319r+hbsWfpPm2Zb6C2GHIchwc03jHdmX
	cseehc61XvcUvPTaiRUo5THyGhknC+8M+TRWjPM1csxLAW6AXJ5lWm4GioPukgkmrlo0
	LRDQ==
X-Gm-Message-State: AOPr4FWC9KWpDAXEmaJ/KtSzDhvQ5slP9g8fR48uNT+leqty7bA8XlT55qIwYCOWpY0ECw==
X-Received: by 10.129.165.144 with SMTP id c138mr5103250ywh.271.1463837141296; 
	Sat, 21 May 2016 06:25:41 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.116])
	by smtp.gmail.com with ESMTPSA id
	p66sm13984967ywc.40.2016.05.21.06.25.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:25:40 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:25:30 -0400
Message-Id: <1463837130-12117-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyflakes: update to version 1.2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 May 2016 13:25:41 -0000

updated license checksum to account for extra release notes in readme

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyflakes_1.1.0.bb      | 14 --------------
 .../recipes-devtools/python/python-pyflakes_1.2.3.bb      | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyflakes_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pyflakes_1.1.0.bb b/meta-python/recipes-devtools/python/python-pyflakes_1.1.0.bb
deleted file mode 100644
index ae7d471..0000000
--- a/meta-python/recipes-devtools/python/python-pyflakes_1.1.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "passive checker of Python programs"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=fe719d45f4c604c6e2c86872b6e9485f"
-
-SRC_URI[md5sum] = "e0bf854cd5abd4527e149692925b82eb"
-SRC_URI[sha256sum] = "e5f959931987e2be178781554b485d52342ec9f1b43f891d2dad07a691c7a89a"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += " \
-    python-prettytable \
-    python-cmd2 \
-    python-pyparsing"
diff --git a/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb b/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb
new file mode 100644
index 0000000..35906bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb
@@ -0,0 +1,15 @@
+SUMMARY = "passive checker of Python programs"
+HOMEPAGE = "https://github.com/dreamhost/cliff"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=eb48916870306ef34a061cec727ccae5"
+
+SRC_URI[md5sum] = "995747589e97c75055cf5b4e1e031e0b"
+SRC_URI[sha256sum] = "2e4a1b636d8809d8f0a69f341acf15b2e401a3221ede11be439911d23ce2139e"
+PYPI_PACKAGE_HASH = "54806a641f832eb6c6a8f7e151e7087aff7a7c04dd8b4aa6134817942cdda1b6"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += " \
+    python-prettytable \
+    python-cmd2 \
+    python-pyparsing"
-- 
1.9.1


