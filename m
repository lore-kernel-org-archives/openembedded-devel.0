Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id ECA44745D3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 15:50:36 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s78so13661328qkl.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 08:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mfLeOqyfjGAHU8g7xn6ZB5fWk+24lBiAmOBq4jjphYg=;
	b=YCzdxdEdQfgxjl37I5KFJMUx4YrbMunj/EI1I/E2B5FuaABVertWeLYGEWhj4wl07u
	c7ujrWDrzoz+MpfWv2dAsxIaaNXwS0t5CHZ1NQf0VcTkPNphpRo/jjZKe8xkpy2bkngp
	E3/vfUZrO8XVZOe9gAint8fnDVce++kVMYBeFIk1RM1KihahYWdVuvH1alxblNEiF1HO
	yjgfEpxoxVD+U2trk3x83S8JgExB3VYNzynDZM9DTYRfEAuBDHkaHtZrhDjcYHB7oXKJ
	sK+UWJNi47aOghpR7O104O7f4XDBJunnUXHjN4TUHFn6zag4y9WUs2DJrGA0JBggMvV7
	rTxA==
X-Gm-Message-State: ALQs6tDctosXhbBVOjO6OGriwfnHG/u7p0paXb6ctMS4Tp/RJhbN+S9J
	mGbdqEHIxUyWh05ImNinKjRSJcEh
X-Google-Smtp-Source: AB8JxZoy3UxYYA/JfwZdHAFMTKcprDulCWxP6eGgD0RKvTLRhlM6XGxrVmsDw+EuC3BbNtqR8qbPdQ==
X-Received: by 10.55.150.131 with SMTP id y125mr19954105qkd.334.1524412237201; 
	Sun, 22 Apr 2018 08:50:37 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	j7-v6sm8513750qth.32.2018.04.22.08.50.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Apr 2018 08:50:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Apr 2018 11:50:28 -0400
Message-Id: <1524412228-5481-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jsonpatch: update to version 1.23
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
X-List-Received-Date: Sun, 22 Apr 2018 15:50:37 -0000

Remove upstreamed patch Drop-support-for-EOL-Python-3.3.patch

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-jsonpatch.inc   |  4 +--
 .../Drop-support-for-EOL-Python-3.3.patch          | 35 ----------------------
 ...-jsonpatch_1.21.bb => python-jsonpatch_1.23.bb} |  4 ---
 ...jsonpatch_1.21.bb => python3-jsonpatch_1.23.bb} |  0
 4 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.21.bb => python-jsonpatch_1.23.bb} (55%)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.21.bb => python3-jsonpatch_1.23.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc b/meta-python/recipes-devtools/python/python-jsonpatch.inc
index e559fb1..409c09a 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi
 
-SRC_URI[md5sum] = "0b20d819daf120ed3fef3be608f2ce18"
-SRC_URI[sha256sum] = "11f5ffdf543a83047a2f54ac28f8caad7f34724cb1ea26b27547fd974f1a2153"
+SRC_URI[md5sum] = "83c4c9faccb4a2ff8c1db80cbddc590d"
+SRC_URI[sha256sum] = "49f29cab70e9068db3b1dc6b656cbe2ee4edf7dfe9bf5a0055f17a4b6804a4b9"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
 
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch b/meta-python/recipes-devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
deleted file mode 100644
index ccd8e12..0000000
--- a/meta-python/recipes-devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 71bdeed8b49390ff14fe8f0434fc8a1038d89128 Mon Sep 17 00:00:00 2001
-From: Hugo <hugovk@users.noreply.github.com>
-Date: Tue, 16 Jan 2018 14:22:33 +0200
-Subject: [PATCH 1/4] Drop support for EOL Python 3.3
-
-Upstream-Status: Backport
-
-[MA: remove dev only files from patch]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-
----
- setup.py      | 2 +-
-
-diff --git a/setup.py b/setup.py
-index 0776c41..471c433 100644
---- a/setup.py
-+++ b/setup.py
-@@ -58,7 +58,6 @@ CLASSIFIERS = [
-     'Programming Language :: Python :: 2',
-     'Programming Language :: Python :: 2.7',
-     'Programming Language :: Python :: 3',
--    'Programming Language :: Python :: 3.3',
-     'Programming Language :: Python :: 3.4',
-     'Programming Language :: Python :: 3.5',
-     'Programming Language :: Python :: 3.6',
-@@ -81,5 +80,6 @@ setup(name=PACKAGE,
-       package_data={'': ['requirements.txt']},
-       scripts=['bin/jsondiff', 'bin/jsonpatch'],
-       classifiers=CLASSIFIERS,
-+      python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*',
-       **OPTIONS
- )
--- 
-2.7.4
-
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.23.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb
rename to meta-python/recipes-devtools/python/python-jsonpatch_1.23.bb
index 2b253b5..90cd318 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.21.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.23.bb
@@ -2,7 +2,3 @@ inherit setuptools
 require python-jsonpatch.inc
 
 RDEPENDS_${PN} += "${PYTHON_PN}-re"
-
-SRC_URI += " \
-    file://Drop-support-for-EOL-Python-3.3.patch \
-"
diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.23.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.21.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.23.bb
-- 
2.7.4


