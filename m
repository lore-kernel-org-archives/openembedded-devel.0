Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id BACD27888D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 00:04:55 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a23so5685077qtm.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 17:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F/Yp5bh+bw93VdQ9c/AwynjeIjXnOIPv4KUwvsntVoY=;
	b=Wyo1K00mDsZ7fePqyUQRtLqfq1GAssWaRNAGpKi6qjKlPCB8hYvj7KZgB/6m0MVaB0
	27UIKSkImddFChi/S2XHPTDC6MIASBXhELyRlNePHq4CjV6gmLlR7zkJiCD4G9SMgzJi
	n9W8MEN2ySdPX8PE1FxRwxH1/ttnNbqZRVpGDMCPexIOwcJN3snRYv8iszr55zkhfaLC
	u99AMxk9vUBkeZta7K4EaUdrvR4khlzxl2YNlS5BKuhPgJ0DdvlshPDeGe/xvAZKOUYw
	LYWCHpQeiwNeURtCquKPJNQpB459q3GrIX/RriSClymmPvSJrszB5nLSzh3H7rhtwsoW
	0Wgg==
X-Gm-Message-State: AElRT7FWwlhJH4X0d0AMeUhnAbtG2DQ4RAmJSA2LlwgT23TuNBWhT5hW
	CwDGjX+gzG5l3LRf4apO6Du2EWah
X-Google-Smtp-Source: AG47ELuHJgEV9s4XfU0CwCMC1jwvTKf/nTNFeOu4ZCKC5KJHr2aybZuXdbVUhddtRc2k2nYR1DRfBQ==
X-Received: by 10.200.44.114 with SMTP id e47mr9239660qta.59.1520813096349;
	Sun, 11 Mar 2018 17:04:56 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n58sm2089376qta.34.2018.03.11.17.04.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 17:04:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 20:04:48 -0400
Message-Id: <1520813088-16248-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-scrypt: update to version 0.8.6
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
X-List-Received-Date: Mon, 12 Mar 2018 00:04:56 -0000

Add patch to fix host include paths used

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-scrypt.inc      |  8 +++++--
 ...crypt-remove-the-hard-coded-include-paths.patch | 26 ++++++++++++++++++++++
 ...thon-scrypt_0.8.0.bb => python-scrypt_0.8.6.bb} |  0
 ...on3-scrypt_0.8.0.bb => python3-scrypt_0.8.6.bb} |  0
 4 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
 rename meta-python/recipes-devtools/python/{python-scrypt_0.8.0.bb => python-scrypt_0.8.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.0.bb => python3-scrypt_0.8.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-scrypt.inc b/meta-python/recipes-devtools/python/python-scrypt.inc
index 85f1d27..783d05b 100644
--- a/meta-python/recipes-devtools/python/python-scrypt.inc
+++ b/meta-python/recipes-devtools/python/python-scrypt.inc
@@ -3,8 +3,12 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378"
 HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
 
-SRC_URI[md5sum] = "0704e59cc3afb3845c27bb3827baeea9"
-SRC_URI[sha256sum] = "d4a5a4f53450b8ef629bbf1ee4be6105c69936e49b3d8bc621ac2287f0c86020"
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-scrypt:"
+
+SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
+
+SRC_URI[md5sum] = "ae8e3263aa31b040c1f9c7f1e1843a56"
+SRC_URI[sha256sum] = "f8239b2d47fa1d40bc27efd231dc7083695d10c1c2ac51a99380360741e0362d"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch b/meta-python/recipes-devtools/python/python-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
new file mode 100644
index 0000000..d535e43
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
@@ -0,0 +1,26 @@
+From d8db473ce9346cd6254c90e13ac45b3bbde494c4 Mon Sep 17 00:00:00 2001
+From: Derek Straka <derek@asterius.io>
+Date: Sun, 11 Mar 2018 19:55:38 -0400
+Subject: [PATCH] py-scrypt: remove the hard coded include paths
+
+Upstream-Status: Pending
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index e36adc4..2ebfbf1 100644
+--- a/setup.py
++++ b/setup.py
+@@ -24,7 +24,6 @@ if sys.platform.startswith('linux'):
+                      ('HAVE_SYS_SYSINFO_H', '1'),
+                      ('_FILE_OFFSET_BITS', '64')]
+     libraries = ['crypto', 'rt']
+-    includes = ['/usr/local/include', '/usr/include']
+     CFLAGS.append('-O2')
+ elif sys.platform.startswith('win32'):
+     define_macros = [('inline', '__inline')]
+-- 
+2.7.4
diff --git a/meta-python/recipes-devtools/python/python-scrypt_0.8.0.bb b/meta-python/recipes-devtools/python/python-scrypt_0.8.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-scrypt_0.8.0.bb
rename to meta-python/recipes-devtools/python/python-scrypt_0.8.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.0.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
-- 
2.7.4


