Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2455678210
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 20:42:59 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id v29so1422831qtv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 13:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Mx6MUkMbyxEeRtax1BOnmLwaff/8k/TfkU1m7Omd0Xg=;
	b=ZABEkObwqD7q2ZqhNZAphDEnrqLT80bAzON7nLk1lK7OZjFUY7+FFGhoA/ZQ+RBY25
	Ih+01dL3vVbLc+q0l45vcF/KsDrZooOYfMoeE5ijF5/OB1RPDq+OuSkVBYb//QGvTB5N
	Xcqb5lYAHgj7+eau+fY6RceLNtfrxV9UFz+MUu9lDXDis5a/jQ97e1g7sBMEe0dnuaQW
	6H1uWiq50su0OUK7MGs1aI8C3vGFEmcppXR0X/GQvXJLvaKRx5EnQdxD8QQsdnrw+UoX
	xfi5KDf0XboFTbdRd2L/9HhlOIv/a2q25G+l5Tshwr9RBOfOFpCBWbkrHKh4IpHLFGQG
	rH8A==
X-Gm-Message-State: AHYfb5g4PtJBHJQjbex55ZtavUaGE22d2DjAIRqNsB9CAEvL1ktvfIai
	RJzYyvAqEsuGOwv4
X-Received: by 10.200.41.174 with SMTP id 43mr2678767qts.100.1503952980719;
	Mon, 28 Aug 2017 13:43:00 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id v11sm823739qkl.88.2017.08.28.13.42.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Aug 2017 13:42:59 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 28 Aug 2017 17:42:52 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Aug 2017 17:42:51 -0300
Message-Id: <20170828204251.3803-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH v2] python3-pycrypto: Add python3 version of recipe
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
X-List-Received-Date: Mon, 28 Aug 2017 20:43:00 -0000

The python2 version of the recipe already exist but there was no
python3 alternative. This patch adds the missing bits.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- rebase to master
- avoid duplication of patches
- move patches to .inc file so we ensure both versions are in sync

 meta-python/recipes-devtools/python/python-pycrypto.inc       | 6 +++++-
 meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb  | 4 ----
 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb | 9 +++++++++
 3 files changed, 14 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
index fb2c17df1..76d0bea8c 100644
--- a/meta-python/recipes-devtools/python/python-pycrypto.inc
+++ b/meta-python/recipes-devtools/python/python-pycrypto.inc
@@ -3,12 +3,16 @@ HOMEPAGE = "http://www.pycrypto.org/"
 LICENSE = "PSFv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:"
 
 DEPENDS += " gmp"
 
 inherit pypi autotools-brokensep
 
+SRC_URI += "file://cross-compiling.patch \
+            file://CVE-2013-7459.patch \
+"
+
 SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
 SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
 
diff --git a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
index 919f91ecb..e13db01b7 100644
--- a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -1,10 +1,6 @@
 inherit distutils
 require python-pycrypto.inc
 
-SRC_URI += "file://cross-compiling.patch \
-            file://CVE-2013-7459.patch \
-           "
-
 # We explicitly call distutils_do_install, since we want it to run, but
 # *don't* want the autotools install to run, since this package doesn't
 # provide a "make install" target.
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
new file mode 100644
index 000000000..02d634cb0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -0,0 +1,9 @@
+inherit distutils3
+require python-pycrypto.inc
+
+# We explicitly call distutils_do_install, since we want it to run, but
+# *don't* want the autotools install to run, since this package doesn't
+# provide a "make install" target.
+do_install() {
+       distutils3_do_install
+}
-- 
2.14.1


