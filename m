Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id B816771AB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 17:47:08 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id n6so195600696qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0J+Zk52KSxoAS4sV8PC24ccyVpHq0m25lZLUIDit7QQ=;
	b=FfBflnqz2IipC+o7ScfQvNnPwgsowz1obCXBEo7bXKzx1c0s+7P4REHlH88inSN70W
	bqpiF5l2qHqkBLi6mWJJEHgoG38XsGxWHW9zC4qkAHmPGiO8EKJrbLjKD5g69vWpbdER
	ZHt6NtGpRvo1nLYbimiI+I+rxIwBPaayURJIIr4egi2AVVqyjyP/Zl1lqXMM6cbgW6Zq
	9Z7j7KHpVhJD0Dd6k3qxf41KFQJQxBVnmK80htU0Gr4D8LdnWCP5+6jPlY2sEpOADvOu
	DhO/LlsG76yuTVAk5uJWeCYVIRVbcwjw5gO06x2moith5QFjt39fjJqpowzCGNuQuceh
	TgNw==
X-Gm-Message-State: AKaTC01ayN6H+67ICxuTIUi0/1rrd1T5amgWo09WvbEiFaKMtYD8rli6Yf17J8q72x75fQ==
X-Received: by 10.237.35.114 with SMTP id i47mr33439889qtc.239.1480528030185; 
	Wed, 30 Nov 2016 09:47:10 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	r8sm33895578qtc.32.2016.11.30.09.47.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 09:47:09 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:47:03 -0500
Message-Id: <1480528023-12700-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.3.1
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
X-List-Received-Date: Wed, 30 Nov 2016 17:47:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc         | 10 ++++++++--
 .../{python-pymongo_3.3.0.bb => python-pymongo_3.3.1.bb}       |  0
 meta-python/recipes-devtools/python/python3-pymongo_3.3.0.bb   |  2 --
 meta-python/recipes-devtools/python/python3-pymongo_3.3.1.bb   |  7 +++++++
 4 files changed, 15 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.3.0.bb => python-pymongo_3.3.1.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pymongo_3.3.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo_3.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 0a256a7..347c497 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,5 +8,11 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
 
-SRC_URI[md5sum] = "42cd12a5014fb7d3e1987ca04f5c651f"
-SRC_URI[sha256sum] = "3d45302fc2622fabf34356ba274c69df41285bac71bbd229f1587283b851b91e"
+SRC_URI[md5sum] = "0a21c939d66d2459062a4333dab4301b"
+SRC_URI[sha256sum] = "4601cd3120e88fb532478f79f29f8f6deab380343d55ad7702a5aa1af27555b1"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.3.0.bb b/meta-python/recipes-devtools/python/python-pymongo_3.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.3.0.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.3.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.3.0.bb
deleted file mode 100644
index 5164b18..0000000
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.3.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.3.1.bb
new file mode 100644
index 0000000..55b3b55
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.3.1.bb
@@ -0,0 +1,7 @@
+inherit pypi setuptools3
+require python-pymongo.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-selectors \
+"
-- 
2.7.4


