Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 247B471BA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 17:16:45 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id 11so4680058qkl.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 09:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sg/5cEsP1gWGJZ0FCifojZXgzgSGBLl/x4gOlC27/oE=;
	b=gtyba4X62EHlb8D0O28Th6B6NL95cqRJ/VA3R5puPLrA6GQpchLkVrK46zs4SASAOd
	k8bSGQd73bIUlXc57O+mhrffQjj66QjPUZDm3iBxLKBYnEzakc5oKczwXJPAlxLgNnMy
	AfU1ZHnRXyM5CUZXFGEAiPSnj5LN7ep5RbyzuK998s+zcrK19dBplDir4Ewa9IMUrPFx
	lVfzIIsOkwxztztYw/jfE3tpWcKsoV1YalrqUajioultLh4Wm7DulNzto+Ocf8hh8cBW
	FnPOpSALi22W641qsezGjXD+BGeRi2O/lnFqi1msp6ffu5Qdt9ADnysH579TC7BY5ix+
	Ny+w==
X-Gm-Message-State: AMke39m8ZXg++DGmJzJgqHH4+Q1Ca9lAqUB0PoibSuq8hM6D+cHpd//iwsGw0MtwKyoFiw==
X-Received: by 10.55.152.3 with SMTP id a3mr15299464qke.202.1486142206074;
	Fri, 03 Feb 2017 09:16:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	m30sm25000757qtg.10.2017.02.03.09.16.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 09:16:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 12:16:34 -0500
Message-Id: <1486142194-26410-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pybind11: Update to version 2.0.1
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
X-List-Received-Date: Fri, 03 Feb 2017 17:16:52 -0000

  * Verified license remains the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pybind11.inc            | 7 +++----
 .../python/{python-pybind11_1.8.1.bb => python-pybind11_2.0.1.bb}  | 0
 .../{python3-pybind11_1.8.1.bb => python3-pybind11_2.0.1.bb}       | 0
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pybind11_1.8.1.bb => python-pybind11_2.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pybind11_1.8.1.bb => python3-pybind11_2.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
index e13f6a5..6d36d87 100644
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
+++ b/meta-python/recipes-devtools/python/python-pybind11.inc
@@ -1,9 +1,8 @@
 SUMMARY = "Seamless operability between C++11 and Python"
 HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1e9383cd3e97753d7dd6067d079519ea"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=485d9f8aa1ab513bec0de2f55cd69672"
 PR = "r0"
 
-SRC_URI = "https://pypi.python.org/packages/89/0b/f3a25633e49be5fae17ed2c7751c8106a08199db70e3c82e8cc043388ba9/pybind11-1.8.1.tar.gz"
-SRC_URI[md5sum] = "67845d8fd89a1c400dc7c61ccdee14d6"
-SRC_URI[sha256sum] = "358d4b7d8c38cd1dde66064178c6bbaaa2c479a44e67e642820fe0f329a4fff8"
+SRC_URI[md5sum] = "c96103168e9abceaa6d46f6074dcaf38"
+SRC_URI[sha256sum] = "1b1a4824aad88b1073fe8dbd21683e1e5228f3ed3b29c2785fbf5dea6bf1063c"
diff --git a/meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python-pybind11_2.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pybind11_1.8.1.bb
rename to meta-python/recipes-devtools/python/python-pybind11_2.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pybind11_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.0.1.bb
-- 
2.7.4


