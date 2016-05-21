Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 96E3470179
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 12:31:35 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id i22so18065509ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 05:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tExBswuVoQ58bX5VaDE1O2EDvMZZ+NFWhGUtqUJxV4Y=;
	b=SWQiSkLaL6IDuKSiEM07DDQ5S9v7C95F5T4f754OHcYCzEeuD767TkTzIIhiWb/lp0
	lLtoIB5vdk6mIkUsDUFQiq+RVSFcmhsom5YmWmb4c2aTvnJNkw73jbzEpjx8wA2E9CkZ
	pgps+aRPAjYn+qyvIkCMX725CivQ/+1JsYU6eJBzHjwEUG7k9LfjABR96WjEZn393lH2
	guHGb78JTh3Py51GenWjT3SQfcbeCp+ZiCGpopzczmyIcD/qAU8GpZ+U8Q8a30L+2JSR
	cbiZM6Wa5Cyra+V0EmTx/KCBpLSDnBO+XqtYnNunWDwFxVL90D/kdK8lK6pV5xWiecZd
	okrA==
X-Gm-Message-State: AOPr4FXf0QzGY//dTfiUD3i56SCxwEER6RTSFxDq8nD2DxygBAHnUVFoD6mUVc8KISWyQg==
X-Received: by 10.129.89.134 with SMTP id n128mr5136980ywb.102.1463833895759; 
	Sat, 21 May 2016 05:31:35 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.116])
	by smtp.gmail.com with ESMTPSA id
	w185sm13927000ywe.1.2016.05.21.05.31.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 05:31:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 08:31:26 -0400
Message-Id: <1463833886-3626-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-enum34: update to version 1.1.6
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
X-List-Received-Date: Sat, 21 May 2016 12:31:36 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-enum34_1.1.2.bb | 8 --------
 meta-python/recipes-devtools/python/python-enum34_1.1.6.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-enum34_1.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-enum34_1.1.6.bb

diff --git a/meta-python/recipes-devtools/python/python-enum34_1.1.2.bb b/meta-python/recipes-devtools/python/python-enum34_1.1.2.bb
deleted file mode 100644
index 5083bda..0000000
--- a/meta-python/recipes-devtools/python/python-enum34_1.1.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "backport of Python 3.4's enum package"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
-
-SRC_URI[md5sum] = "025bb71b3f9d2fad15d0ee53e48dc873"
-SRC_URI[sha256sum] = "2475d7fcddf5951e92ff546972758802de5260bf409319a9f1934e6bbc8b1dc7"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
new file mode 100644
index 0000000..26293ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
@@ -0,0 +1,9 @@
+SUMMARY = "backport of Python 3.4's enum package"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
+
+SRC_URI[md5sum] = "5f13a0841a61f7fc295c514490d120d0"
+SRC_URI[sha256sum] = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"
+PYPI_PACKAGE_HASH = "bf3e31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876"
+
+inherit pypi setuptools
-- 
1.9.1


