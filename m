Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id BA9AA774E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:45:09 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id t184so100939542qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 18:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oy5pr1aCzXx/lbNAG4vxaBsDWICVLC/IGlFGv2CZ494=;
	b=UvIwJcloXlUQMQzwqG9YZg3FXRSgAY4rjlf0kXm6QvzM5NOWyDO0Yt0jo8VdpevuUj
	bleqYACBN4zZIozv6SzaxTlSo71QUP5voFInzTNZK4J46kuyfgzkPggFsz0nYIHVVijA
	Vn04LZqi8o7k9qtUUobyNkprT5meWf2bxXgZM+XpJ3YCuiEhxdh9mc157/Hy/VW0ryMk
	Bbu/4se9SxsAcrI9SuDCBMDieRBfD0VSsFTLXSafGVu5o7UzptxYWzPbZ0uXaPSaYKI4
	xJcX/mo3zrK4EEniXLpc1M+ZY5gYTl/WOGtZTeufeaHMR+Tr1/pJsN/jHW47Dvy4Axnw
	8hFA==
X-Gm-Message-State: AIkVDXLbZTKHCa+jv4b9mFcPFrOXTgdd9E/4S7y5ws0wOS4tr3G19ShnE4l6OHrP25u4MA==
X-Received: by 10.55.144.6 with SMTP id s6mr8157704qkd.266.1482374710842;
	Wed, 21 Dec 2016 18:45:10 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	g13sm17024947qtg.15.2016.12.21.18.45.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 18:45:10 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 21:44:58 -0500
Message-Id: <1482374698-3996-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-astroid: update to version 1.4.9
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
X-List-Received-Date: Thu, 22 Dec 2016 02:45:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-astroid_1.4.8.bb     | 10 ----------
 .../recipes-devtools/python/python-astroid_1.4.9.bb     | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-astroid_1.4.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python-astroid_1.4.9.bb

diff --git a/meta-python/recipes-devtools/python/python-astroid_1.4.8.bb b/meta-python/recipes-devtools/python/python-astroid_1.4.8.bb
deleted file mode 100644
index 63401aa..0000000
--- a/meta-python/recipes-devtools/python/python-astroid_1.4.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "An abstract syntax tree for Python with inference support."
-HOMEPAGE = "https://pypi.python.org/pypi/astroid/1.4.8"
-SECTION = "devel/python"
-LICENSE = "LGPL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI[md5sum] = "3def6c80afcd38b4ca4aca6aea71cbde"
-SRC_URI[sha256sum] = "5f064785a7e45ed519285f2eb30b795e58a4932a0736b32030da6fef3394ddb3" 
-
-inherit setuptools pypi
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.4.9.bb b/meta-python/recipes-devtools/python/python-astroid_1.4.9.bb
new file mode 100644
index 0000000..cee1291
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-astroid_1.4.9.bb
@@ -0,0 +1,17 @@
+SUMMARY = "An abstract syntax tree for Python with inference support."
+HOMEPAGE = "https://pypi.python.org/pypi/astroid"
+SECTION = "devel/python"
+LICENSE = "LGPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI[md5sum] = "a57438971de05eb801b82eae59c05217"
+SRC_URI[sha256sum] = "a483e7891ce3a06dadfc6cb9095b0938aca58940d43576d72e4502b480c085d7"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-distutils \
+    ${PYTHON_PN}-lazy-object-proxy \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-wrapt \
+"
-- 
2.7.4


