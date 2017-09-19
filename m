Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E98FE6E671
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 19:27:20 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id q8so403248qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 12:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iuw3xfdfqtPI5LxDPMWBuSbTWMr1ZsXF26+hZgJHMQA=;
	b=PVMM7tg7DbQksadWeJQ2JnYLWh5a+PaKmzokxK2YU+oOcXux8mJTw9414Nt0yon0gL
	LKqWQowOyDKAa9SYaoLiJytVBS+S/hKfPE6tCSn7efLLTdDZYDo1y+X0ReDCQ1IsvqVz
	suL6gvyBJoofZ72TNunznbAKWtTgdZh8SrrnEe1yVUbdC/U92qBz0tWSOJZ8MXBnkQi4
	lIOV0BZ70PBDMRRIARKUE0MFQejGFodkylztW0y9kaPLYOI5rxwWxuQ0g///jU1updr/
	dNnVj7VyBMKKqtX1ODMxzDnsXRsbUckqO0ufwsC0mRoZyJ/slNAhH5gKlUSK9hDb6NoT
	kH/w==
X-Gm-Message-State: AHPjjUiV7jEcDEdNxfsoGWG+tF31hWHMawrZa89/z05d7AJhw1g6ppoQ
	Td9WfHg2WYf85e/UK77I6Sjw4abq
X-Google-Smtp-Source: AOwi7QDL/OlIb8E6ohhlkVTIIfVaOiBBr64Na7JDDil3jk1GcIM9iaDjFxDKyBldfaF7VC1hZem0KA==
X-Received: by 10.200.24.65 with SMTP id n1mr3749276qtk.323.1505849241382;
	Tue, 19 Sep 2017 12:27:21 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id b202sm42035qkc.65.2017.09.19.12.27.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 12:27:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 15:27:07 -0400
Message-Id: <1505849227-16368-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-bcrypt: add a python3 version of the recipe
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
X-List-Received-Date: Tue, 19 Sep 2017 19:27:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-bcrypt.inc   | 15 +++++++++++++++
 .../recipes-devtools/python/python-bcrypt_3.1.3.bb      | 17 ++---------------
 .../recipes-devtools/python/python3-bcrypt_3.1.3.bb     |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-bcrypt.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-bcrypt_3.1.3.bb

diff --git a/meta-python/recipes-devtools/python/python-bcrypt.inc b/meta-python/recipes-devtools/python/python-bcrypt.inc
new file mode 100644
index 0000000..667a3fb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-bcrypt.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "Modern password hashing for your software and your servers."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
+
+DEPENDS += "${PYTHON_PN}-cffi-native"
+
+SRC_URI[md5sum] = "20da8b40790caad99c4086dba533154b"
+SRC_URI[sha256sum] = "6645c8d0ad845308de3eb9be98b6fd22a46ec5412bfc664a423e411cdd8f5488"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-cffi \
+    ${PYTHON_PN}-six \
+"
diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb
index c690f0d..2433354 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb
@@ -1,15 +1,2 @@
-DESCRIPTION = "Modern password hashing for your software and your servers."
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
-
-DEPENDS = "python-cffi-native"
-
-SRC_URI[md5sum] = "20da8b40790caad99c4086dba533154b"
-SRC_URI[sha256sum] = "6645c8d0ad845308de3eb9be98b6fd22a46ec5412bfc664a423e411cdd8f5488"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-cffi \
-    ${PYTHON_PN}-six \
-"
+inherit setuptools
+require python-bcrypt.inc
diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.3.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.3.bb
new file mode 100644
index 0000000..d2ec9e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-bcrypt.inc
-- 
2.7.4


