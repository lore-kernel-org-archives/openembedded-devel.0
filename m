Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id D5CD07FF32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:59:41 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id b9so2454431pgk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Tb1Epq0famHbK7KKvmrv1F4CE0bXd5wmtJZBpRZxP5U=;
	b=PcdYMeY1/cYcyAScRGWiPv4U3CkDuwjP/gfleui7tbbH+CCPp4CNzw8bRNQoi4/NmD
	pA3cIamApesvtuiaDbqcctn+rGxUMmLtJE6KbixueRWRegz2MR2nneD/2+0tIIKoq1A2
	ZIH3YFjo+hQ7iT5AJVf5g/8ANdj8vzUoFySFnQIbsjMkTfBjgfEFQnmYYA8d0YkJg7sf
	rI+cgU38Yk9lVpPoF9qaJbEYe0BHwMirRWMP2PLqzgjdoSB4qF9npDFnrf048am4lZ/8
	gW1Mmqnen5E86Ft7QlJoxhJLDEKirpG3K2KAlRew23LetVt+aXyYinDDQdzksR5dMiEg
	T2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Tb1Epq0famHbK7KKvmrv1F4CE0bXd5wmtJZBpRZxP5U=;
	b=K26pGz7z6BmGfeRrMkWw01twhXCHGoMDWqDyz+7pk7Rup6D14D+hDfrPnTccDXfXNG
	tZfxBP1VEqplJAFvvPCW5dx2zM2hZdXvAyxmyKNSm/u0uBA33y68YH90Ps4UjH72sTpd
	2troR308re4b2MKJgVYSjabJ3mdHaBjLKHArtlNjZ79QjwSJtToApqH8iGYvu5P8oEXL
	JvDJc1yGJaZadkIeSpKTp1WIMAjB6QNcJA//QxcO0m+x97SBQKWRC2x3GuJe8dRcmrSl
	4zpz0ttQ+hp3Pg47jEu71o95qLep6bwXZt0mWTofIRJ+oHtSPDnbHglQY2aT0sIFaNI7
	vRjg==
X-Gm-Message-State: APjAAAVWdMWkDU3rXLmZhAtJo590pHVfWo9P/ey4x0ltip7L+GZhfcTt
	iVdLph1HMWf8hZYFfhlEx5gtptO3E5s=
X-Google-Smtp-Source: APXvYqx6EOY6YjgW8oC3NAtzD4wnwVHw/zpj885lhtmIjnSAUxOr5WCU/1WGmiSgXWso4mJSaaN2iQ==
X-Received: by 2002:aa7:90c5:: with SMTP id k5mr227934pfk.143.1579654782393;
	Tue, 21 Jan 2020 16:59:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z26sm46107269pfa.90.2020.01.21.16.59.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:59:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 16:59:35 -0800
Message-Id: <20200122005941.3706171-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/7] python3-robotframework-seriallibrary: Backport a patch to fix py3 build
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
X-List-Received-Date: Wed, 22 Jan 2020 00:59:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...5fdf2ea00ac6349e64580a20816783064dd4.patch | 45 +++++++++++++++++++
 ...hon3-robotframework-seriallibrary_0.3.1.bb | 20 ++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/e31d5fdf2ea00ac6349e64580a20816783064dd4.patch

diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/e31d5fdf2ea00ac6349e64580a20816783064dd4.patch b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/e31d5fdf2ea00ac6349e64580a20816783064dd4.patch
new file mode 100644
index 0000000000..21e97fd93a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary/e31d5fdf2ea00ac6349e64580a20816783064dd4.patch
@@ -0,0 +1,45 @@
+From e31d5fdf2ea00ac6349e64580a20816783064dd4 Mon Sep 17 00:00:00 2001
+From: Hideki Takeoka <hideki.takeoka@smartfrog.com>
+Date: Sun, 25 Aug 2019 19:25:00 +0200
+Subject: [PATCH] Update setup.py for python3.7+ support
+
+---
+ setup.py                     | 9 +++++----
+ src/SerialLibrary/version.py | 3 +++
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 4c34705..70bb1af 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,6 +1,5 @@
+ #!/usr/bin/env python
+ 
+-from imp import load_source
+ from os.path import abspath, dirname, join
+ from sys import platform
+ 
+@@ -18,9 +17,11 @@
+ 
+ 
+ CURDIR = dirname(abspath(__file__))
+-VERSION = load_source(
+-    'version', 'version',
+-    open(join(CURDIR, 'src', 'SerialLibrary', 'version.py'))).VERSION
++
++with open(join(CURDIR, 'src', 'SerialLibrary', 'version.py')) as f:
++    exec(f.read())
++    VERSION = get_version()
++
+ README = open(join(CURDIR, 'README.rst')).read()
+ CLASSIFIERS = '\n'.join(
+     map(' :: '.join, [
+diff --git a/src/SerialLibrary/version.py b/src/SerialLibrary/version.py
+index 6ce65c4..19831bc 100644
+--- a/src/SerialLibrary/version.py
++++ b/src/SerialLibrary/version.py
+@@ -1 +1,4 @@
+ VERSION = (0, 3, 1)
++
++def get_version():
++    return VERSION;
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
index d82b7b96ae..b6de42f7c1 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
@@ -1,2 +1,20 @@
+SUMMARY = "Robot Framework test library for serial connection"
+HOMEPAGE = "https://github.com/whosaysni/robotframework-seriallibrary"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
+
+SRC_URI[md5sum] = "b7c9565d54c30df7cd3f3c0e29adffa3"
+SRC_URI[sha256sum] = "256ad60fc0b7df4be44d82c302f5ed8fad4935cda99e4b45942e3c88179d1e19"
+
+PYPI_PACKAGE = "robotframework-seriallibrary"
+
 inherit pypi setuptools3
-require python-robotframework-seriallibrary.inc
+
+SRC_URI += "file://e31d5fdf2ea00ac6349e64580a20816783064dd4.patch"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pyserial \
+    ${PYTHON_PN}-robotframework \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


