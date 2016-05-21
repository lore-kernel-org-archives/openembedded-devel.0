Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id F13F060667
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:53:07 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id n16so5068400ywd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NPZrShcepvxxt8ADDU5VoGZeSMZg3DjHchIGo5lL7/o=;
	b=VS5Xfxn9fCch+q7Rf1x2lTti3TZ8/NZkCOItOlVQCCe/kS6kCrOJmcNT/lpiDcK4Ro
	bqgJqv+C+6+oa8Fl8puy/CcEWaXSURMcJh3fBWYwbmNNnV9ua7z16zxkkDkaOdUnH3P+
	0oCH8z9OkWudjCGgnmZNNuRFDbJ5ecw2Nls7Jq32ZISuefQB78qMkKQWL6lU3LZmgcAU
	Oba8ddO/zRnqvxS2qExwfjgLsx9MbWD9RaYp6GyVaqR0J/3QTDxprjmyO0R40aMpWBND
	WgoM8UUmCOXc8q+FB7HMkj0syB3cHajJ9utWpGo/Hqi3U8J2rDfFYIruO40TreXBC0CG
	T7UA==
X-Gm-Message-State: ALyK8tI8/2c4WOoi6yl+u/Y6M97T9MSZRRnsYj4dDDXQhlas8BZ+nYXOi0DeNM1fv16iOg==
X-Received: by 10.129.53.70 with SMTP id c67mr2152532ywa.149.1463838788652;
	Sat, 21 May 2016 06:53:08 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.70])
	by smtp.gmail.com with ESMTPSA id
	h131sm14061346ywb.25.2016.05.21.06.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:53:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:53:02 -0400
Message-Id: <1463838782-21618-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-urllib3: update to version 1.15.1
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
X-List-Received-Date: Sat, 21 May 2016 13:53:09 -0000

update license checksum to account for new date ranges

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3_1.14.bb   | 11 -----------
 meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-urllib3_1.14.bb
 create mode 100644 meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb

diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.14.bb b/meta-python/recipes-devtools/python/python-urllib3_1.14.bb
deleted file mode 100644
index 4e30991..0000000
--- a/meta-python/recipes-devtools/python/python-urllib3_1.14.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
-HOMEPAGE = "https://github.com/shazow/urllib3"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3be3707c5f24a69709682265e29566fe"
-
-SRC_URI[md5sum] = "5e1407428ac33b521c71a7ac273b3847"
-SRC_URI[sha256sum] = "dd4fb13a4ce50b18338c7e4d665b21fd38632c5d4b1d9f1a1379276bd3c08d37"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "python-netclient"
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb b/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb
new file mode 100644
index 0000000..8e1b950
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
+HOMEPAGE = "https://github.com/shazow/urllib3"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
+
+SRC_URI[md5sum] = "5be254b0dbb55d1307ede99e1895c8dd"
+SRC_URI[sha256sum] = "d0a1dc60433f7e9b90b4f085f1d45753174b4594558b29eda0009abe0b82da4c"
+PYPI_PACKAGE_HASH = "4926a7d12ea00cb4b9fa1e13b5980e5a04a1fe7c477eb8f657ce0b757a7a497d"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "python-netclient"
-- 
1.9.1


