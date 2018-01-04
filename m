Return-Path: <rjpdasilva@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B683E71B31
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 18:13:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t8so5024100wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1iOPkRwDIzdsUp8yqmdtHcR/xYND9CYhmgrH6/Y56cM=;
	b=BMq4asERnrhUdb0BZcAnkOE2L5tTB2az6yY7cFsSHFVjS4s/UnhohQGv/PHoyq81A/
	vSIrW5Nnvdcmkfa7YZFiesh0FcMbMD67on2irwvMBNwFLfLubG9Mt+BR/CKPfTeVyJ29
	qIw4JKddAuyBxlQN47XRnMicgtoVorZSDAya5QtotE2B7WaCWrWmhzpZcYK/lwlA/bbZ
	JRUCgbARECsQiOoCsH7k2Ia2WARlDEh1s1pOMCe+0N4yBNwyuX9NUwp2zYv1bNHCf7yp
	in+Os+9xtoIkBCplLuz5Seb8EDwd8cV0IyV27/OZEv6FjUfFle5ao27YOMtO9M1OgA5O
	QNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1iOPkRwDIzdsUp8yqmdtHcR/xYND9CYhmgrH6/Y56cM=;
	b=k5JJLNO2WxOHT9zZqqwXKsWUIojy7yymMPObugkIP5x748QRyOpnBl9HM2utJBkTB3
	2c2Ivl42CLQAbRLRUV923f7e76u419lIe+xmJMkzkb5+9R+A7CNpPANVSUiu6AS5GagL
	C8uhxZZVWJl+Ng5BOFyEra42s4GLyY6xYgpNvSOEl2ewQFXGl2x1ry0cb3MdvuJSCIJQ
	L2aU+Kx7oDz/m6IYAIUTxx6zYzSi8uq358nzWhRPQF/7BHbNymiAZulS4RCqKCp4Xy2/
	p/nWvUXIxEKsaqIY8c/4BmUHQVg+bH81ZaCjnwLthS/TXB0qHoSFB+c29xxA6WMEBg3a
	zbbA==
X-Gm-Message-State: AKGB3mIcL/y0D7uNQuv/WbGRp0I+AkhLTSNmYJNKAbt6q23kx9vnynew
	zBrZ27/Y/SYLOV0LA/LMUQEyTA==
X-Google-Smtp-Source: ACJfBouAB2N5OZ+RjxOw4VdzoMbWRWrFV3KvBUR5lOWMTqyHsF8hAmKPbeWczDIeYGhua1nA4x64kw==
X-Received: by 10.28.24.11 with SMTP id 11mr259674wmy.108.1515089639305;
	Thu, 04 Jan 2018 10:13:59 -0800 (PST)
Received: from localhost.localdomain ([2001:8a0:6606:9100:7f03:4efc:e311:2e44])
	by smtp.googlemail.com with ESMTPSA id
	p29sm5778765wmf.20.2018.01.04.10.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 10:13:58 -0800 (PST)
From: Ricardo Silva <rjpdasilva@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 18:13:46 +0000
Message-Id: <20180104181346.3326-1-rjpdasilva@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-python][PATCH v2] pycrypto: Add recipe to have support on python3
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
X-List-Received-Date: Thu, 04 Jan 2018 18:13:58 -0000

The pycrypto module sources can be used for both python2 and python3,
but a recipe for python3 was missing, so add it.

Additionally, since the sources (and thus the patches) are shared
between both versions, move the SRC_URI (same on both recipes) to the
common 'python-pycrypto.inc' file, to avoid duplication.

Also, to use the same patch files for both python2 and python3 without
having to duplicate them over 2 folders, change 'python-pycrypto.inc' so
that FILESEXTRAPATHS is prepended with the 'python-pycrypto' local dir
for both versions instead of having that dir named after the package
name '${PN}'.

The python3 recipe is basically the same as for python2, but using
distutils3 instead.

Signed-off-by: Ricardo Silva <rjpdasilva@gmail.com>
---

v1->v2:
- Tim Orling <timothy.t.orling@linux.intel.com>
  - Fix fetcher failure in python3.
  - Move SRC_URI to common file and force files into 'python-pycrypto' dir for
    both versions.

 meta-python/recipes-devtools/python/python-pycrypto.inc       | 6 +++++-
 meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb  | 4 ----
 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb | 9 +++++++++
 3 files changed, 14 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
index fb2c17df1..232cdb711 100644
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
+           "
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
2.15.1


