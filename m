Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 5FBC471CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 12:32:31 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170302123230192_0685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 04:32:30 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=59523 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cjPuC-0000dv-Ou for openembedded-devel@lists.openembedded.org;
	Thu, 02 Mar 2017 07:32:24 -0500
Date: Thu, 2 Mar 2017 07:32:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703020726520.13807@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] meta-python: Remove superfluous "PYPI_PACKAGE" assignments
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
X-List-Received-Date: Thu, 02 Mar 2017 12:32:32 -0000
Content-Type: text/plain; charset=US-ASCII


Given calculation of PYPI_PACKAGE value from recipe file name, a
number of Python recipe files unnecessarily set this value, so delete
these superfluous lines.

In addition, the act of editing added a missing EOL at the end of one
of the files.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i dislike extraneous content, so a quick cleaning of some
meta-python recipes where PYPI_PACKAGE will already have the correct
value as calculated by pypi.bbclass.

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
index 6eeab7e..5cef7d9 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI[md5sum] = "b7fa82034b1c0e1fb1b518ffe3bb4fc0"
 SRC_URI[sha256sum] = "46c64c0692063fd0c9fb0216d49f7884bec9fa9760d8473db4b1e2f8162fab4a"

-PYPI_PACKAGE = "pyconnman"
-
 inherit pypi setuptools

-RDEPENDS_${PN} = "python-dbus python-pprint"
\ No newline at end of file
+RDEPENDS_${PN} = "python-dbus python-pprint"
diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
index 42e31a9..fb2c17d 100644
--- a/meta-python/recipes-devtools/python/python-pycrypto.inc
+++ b/meta-python/recipes-devtools/python/python-pycrypto.inc
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

 DEPENDS += " gmp"
-PYPI_PACKAGE = "pycrypto"

 inherit pypi autotools-brokensep

diff --git a/meta-python/recipes-devtools/python/python-pyinotify.inc b/meta-python/recipes-devtools/python/python-pyinotify.inc
index a9edb2c..0168f1a 100644
--- a/meta-python/recipes-devtools/python/python-pyinotify.inc
+++ b/meta-python/recipes-devtools/python/python-pyinotify.inc
@@ -7,5 +7,4 @@ RDEPENDS_${PN} += "python-threading python-io python-subprocess python-misc pyth
 SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
 SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"

-PYPI_PACKAGE = "pyinotify"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb b/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
index 87f46e5..44c9505 100644
--- a/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
@@ -9,5 +9,4 @@ LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
 SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
 SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"

-PYPI_PACKAGE = "singledispatch"
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-ujson_1.35.bb b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
index 4ef3d18..238dc92 100644
--- a/meta-python/recipes-devtools/python/python-ujson_1.35.bb
+++ b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;startline=8;endline=9;md5=4f369b3c3c290b4aed
 SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
 SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"

-PYPI_PACKAGE = "ujson"
 inherit pypi setuptools

 RDEPENDS_${PN} += "\
diff --git a/meta-python/recipes-devtools/python/python-yappi_0.98.bb b/meta-python/recipes-devtools/python/python-yappi_0.98.bb
index 02ec7d0..51308c8 100644
--- a/meta-python/recipes-devtools/python/python-yappi_0.98.bb
+++ b/meta-python/recipes-devtools/python/python-yappi_0.98.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6b131c3041637f6a5175a43112dde05c"
 SRC_URI[md5sum] = "dc56240575c99938a924eaeb7c0d8beb"
 SRC_URI[sha256sum] = "5f657129e1b9b952379ffbc009357d0dcdb58c50f3bfe88ffbb992e4b27b263c"

-PYPI_PACKAGE = "yappi"
 inherit pypi setuptools

 RDEPENDS_${PN} += "\

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


