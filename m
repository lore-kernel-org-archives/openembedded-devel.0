Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8193B612E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 15:53:53 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id j2so16571215qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gksEdtpLL1ozayuVEtDxrHj3pbkLgvgHWqW4xwbOads=;
	b=HYXtglCWR3WAKeqgLOE2RqOzh4/UD0pDugAY3NQRf+E6sQZ1ihRCC8eT+ouFyzcLtg
	bIdlsnl8lqZ2l/C6iPqxC8RdlnNa2RWYFmjIk58Yu7FFMNrIW5CPiKLwNWr2YP0dhaJn
	P6gMWKMC666c1ovOGUmsF543i7n2mQLwBdW98iRhNudM5FJjZQukbnbMtKRMqZBOdGIU
	RRXIIlgWnCiryD1wC1H3vq9BUnlwCqIkeX3WlrZ9FVgVKjkQmbFxEO9W87z/Bs7FBKJJ
	cRExUhKZdesGrsC5oDJut9OwKzYeQSZmdC2HZzeZ9GMcab7DDRDe/CKivjJDgSlKiMY2
	8IMQ==
X-Gm-Message-State: ALyK8tL0v79IMUKZV2vkmJlB4/kGruZEBckLcrwEdw0pFnnM5HWCqhtDJmWGwHv87CIhww==
X-Received: by 10.55.90.135 with SMTP id o129mr46061280qkb.141.1466697234401; 
	Thu, 23 Jun 2016 08:53:54 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 29sm308296qtz.19.2016.06.23.08.53.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 08:53:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 11:53:43 -0400
Message-Id: <1466697223-11813-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] pypi: update the base pypi url to use the package info without requiring the hash
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
X-List-Received-Date: Thu, 23 Jun 2016 15:53:56 -0000

  * Things have finally settled on a URL structure without needing the hash
     (See https://bitbucket.org/pypa/pypi/issues/438/backwards-compatible-un-hashed-package)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/classes/pypi.bbclass                                    | 6 +-----
 .../recipes-connectivity/python-thrift/python-thrift_0.9.3.bb       | 1 -
 meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb | 1 -
 meta-python/recipes-devtools/python/python-cffi_1.6.0.bb            | 1 -
 meta-python/recipes-devtools/python/python-dateutil.inc             | 1 -
 meta-python/recipes-devtools/python/python-enum34_1.1.6.bb          | 1 -
 meta-python/recipes-devtools/python/python-flask-login.inc          | 1 -
 meta-python/recipes-devtools/python/python-flask-pymongo.inc        | 1 -
 meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb        | 1 -
 meta-python/recipes-devtools/python/python-mock_2.0.0.bb            | 1 -
 meta-python/recipes-devtools/python/python-monotonic_1.1.bb         | 1 -
 meta-python/recipes-devtools/python/python-pip_8.1.2.bb             | 1 -
 meta-python/recipes-devtools/python/python-psutil_4.2.0.bb          | 1 -
 meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb        | 1 -
 meta-python/recipes-devtools/python/python-pymisp.inc               | 2 --
 meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb      | 1 -
 meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb       | 1 -
 meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb       | 1 -
 meta-python/recipes-devtools/python/python-pytz_2016.4.bb           | 1 -
 meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb         | 1 -
 meta-python/recipes-devtools/python/python-requests.inc             | 2 --
 meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb        | 1 -
 22 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 5b96c01..cd27cd2 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -12,12 +12,8 @@ PYPI_PACKAGE_EXT ?= "tar.gz"
 def pypi_src_uri(d):
     package = d.getVar('PYPI_PACKAGE', True)
     package_ext = d.getVar('PYPI_PACKAGE_EXT', True)
-    package_hash = d.getVar('PYPI_PACKAGE_HASH', True)
     pv = d.getVar('PV', True)
-    if package_hash:
-        return 'https://pypi.python.org/packages/%s/%s/%s/%s-%s.%s' % ( package_hash[:2], package_hash[2:4], package_hash[4:], package, pv, package_ext)
-    else:
-        return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
+    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
 
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb
index a8a8ff8..652de95 100644
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.9.3.bb
@@ -4,6 +4,5 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1203b6a05c3bff3229710e3f063ddca7"
 
 SRC_URI[md5sum] = "b519551d7a086bb0b4f222a8f566b7e8"
 SRC_URI[sha256sum] = "dfbc3d3bd19d396718dab05abaf46d93ae8005e2df798ef02e32793cd963877e"
-PYPI_PACKAGE_HASH = "ae5835e3f0cd290039ff862c2c9d8ae8a76896665d70343d833bdc2f748b8e55"
 
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
index 3d0f21c..313ed4a 100644
--- a/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95a5ee8fd779fbeca8b4cbca64433c87"
 
 SRC_URI[md5sum] = "c03fc5e2c7b3da46b81acf5cbacfe1e6"
 SRC_URI[sha256sum] = "502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2"
-PYPI_PACKAGE_HASH = "76212dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23"
 
 PYPI_PACKAGE = "backports.ssl_match_hostname"
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.6.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.6.0.bb
index bd42abb..7a02514 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.6.0.bb
@@ -5,7 +5,6 @@ DEPENDS = "libffi python-pycparser"
 
 SRC_URI[md5sum] = "2fae9160991afefb20ff0fbde3b14faf"
 SRC_URI[sha256sum] = "a7f75c4ef2362c0a0e54657add0a6c509fecbfa3b3807bc0925f5cb1c9f927db"
-PYPI_PACKAGE_HASH = "b69811feff87072e2e640fb8320712b781eccdef05d588618915236b32289d5a"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 797234b..b754bb7 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -9,7 +9,6 @@ SRC_URI[md5sum] = "05ffc6d2cc85a7fd93bb245807f715ef"
 SRC_URI[sha256sum] = "1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed"
 
 PYPI_PACKAGE = "python-dateutil"
-PYPI_PACKAGE_HASH = "3ef5aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902"
 inherit pypi 
 
 PACKAGES =+ "${PN}-zoneinfo"
diff --git a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
index 26293ee..e9d075f 100644
--- a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
+++ b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
@@ -4,6 +4,5 @@ LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
 
 SRC_URI[md5sum] = "5f13a0841a61f7fc295c514490d120d0"
 SRC_URI[sha256sum] = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"
-PYPI_PACKAGE_HASH = "bf3e31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876"
 
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-flask-login.inc b/meta-python/recipes-devtools/python/python-flask-login.inc
index f5b111b..6d4db48 100644
--- a/meta-python/recipes-devtools/python/python-flask-login.inc
+++ b/meta-python/recipes-devtools/python/python-flask-login.inc
@@ -10,6 +10,5 @@ SRC_URI[md5sum] = "d95c2275d3e1c755145910077366dc45"
 SRC_URI[sha256sum] = "e72eff5c35e5a31db1aeca1db5d2501be702674ea88e8f223b5d2b11644beee6"
 
 PYPI_PACKAGE = "Flask-Login"
-PYPI_PACKAGE_HASH = "06e661ed90ed8ce6752b745ed13fac3ba407dc9db95dfa2906edc8dd55dde454"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
index 535ddfc..6d54837 100644
--- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
@@ -9,6 +9,5 @@ SRC_URI[md5sum] = "cbf5fbcd22719d8393e481bcac36be05"
 SRC_URI[sha256sum] = "75862daece1c979a9eab5f9d1e32eb781775842273b629ae5d1cb28e6953df78"
 
 PYPI_PACKAGE = "Flask-PyMongo"
-PYPI_PACKAGE_HASH = "04417070930eb72f79c69efaa7289635160b20e568b873428304e19dff235244"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
index 703a151..c1bc214 100644
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
+++ b/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
 
 SRC_URI[md5sum] = "c6659cdb2a5e591723e629d2eef22e82"
 SRC_URI[sha256sum] = "58b2f3a2e7075c655616bf95e82868db4980f3bb6661db70ad02a51e4ddd2252"
-PYPI_PACKAGE_HASH = "4e3d9d421539b74e33608b245092870156b2e171fb49f2b51390aa4641eecb4a"
 
 PYPI_PACKAGE_EXT = "zip"
 inherit pypi distutils
diff --git a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
index eb473d2..863048b 100644
--- a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=de9dfbf780446b18aab11f00baaf5b7e"
 
 SRC_URI[md5sum] = "0febfafd14330c9dcaa40de2d82d40ad"
 SRC_URI[sha256sum] = "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"
-PYPI_PACKAGE_HASH = "0c53014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-monotonic_1.1.bb b/meta-python/recipes-devtools/python/python-monotonic_1.1.bb
index 8c5f86c..c514313 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_1.1.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
 SRC_URI[md5sum] = "8271b79de174dc3ef00535caef38be85"
 SRC_URI[sha256sum] = "255c31929e1a01acac4ca709f95bd6d319d6112db3ba170d1fe945a6befe6942"
-PYPI_PACKAGE_HASH = "3f3b7ee821b1314fbf35e6f5d50fce1b853764661a7f59e2da1cb58d33c3fdd9"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-pip_8.1.2.bb b/meta-python/recipes-devtools/python/python-pip_8.1.2.bb
index 18bb4ce..8bb052e 100644
--- a/meta-python/recipes-devtools/python/python-pip_8.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-pip_8.1.2.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=25fba45109565f87de20bae85bc39452"
 
 SRC_URI[md5sum] = "87083c0b9867963b29f7aba3613e8f4a"
 SRC_URI[sha256sum] = "4d24b03ffa67638a3fa931c09fd9e0273ffa904e95ebebe7d4b1a54c93d7b732"
-PYPI_PACKAGE_HASH = "e7a87556133689add8d1a54c0b14aeff0acb03c64707ce100ecd53934da1aa13"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb b/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
index c3533be..a5703da 100644
--- a/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-psutil_4.2.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
 
 SRC_URI[md5sum] = "713f259f917a0c26acfbb7e6ae632ef7"
 SRC_URI[sha256sum] = "544f013a0aea7199e07e3efe5627f5d4165179a04c66050b234cc3be2eca1ace"
-PYPI_PACKAGE_HASH = "a6bf5ce23dc9f50de662af3b4bf54812438c298634224924c4e18b7c3b57a2aa"
 
 RDEPENDS_${PN} += " \
     python-subprocess \
diff --git a/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb b/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb
index 35906bd..05e3413 100644
--- a/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python-pyflakes_1.2.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://README.rst;md5=eb48916870306ef34a061cec727ccae5"
 
 SRC_URI[md5sum] = "995747589e97c75055cf5b4e1e031e0b"
 SRC_URI[sha256sum] = "2e4a1b636d8809d8f0a69f341acf15b2e401a3221ede11be439911d23ce2139e"
-PYPI_PACKAGE_HASH = "54806a641f832eb6c6a8f7e151e7087aff7a7c04dd8b4aa6134817942cdda1b6"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index b9141e2..d765f4d 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -7,6 +7,4 @@ PR = "r0"
 SRC_URI[md5sum] = "9da2b395cf6d00368d0a6b5b11f706dd"
 SRC_URI[sha256sum] = "22a05d2b442991df82eeadfd36b0f54e4e9514e228fdb0a01598184335fe3f4d"
 
-PYPI_PACKAGE_HASH = "0e63006ef2af33c142c16f3d3d2886236bd6c6a026699639758d8fa2c72356be"
-
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
index d1d8f63..8173858 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_16.0.0.bb
@@ -6,7 +6,6 @@ DEPENDS = "openssl python-cryptography"
 
 SRC_URI[md5sum] = "9587d813dcf656e9f2760e41a3682dc3"
 SRC_URI[sha256sum] = "363d10ee43d062285facf4e465f4f5163f9f702f9134f0a5896f134cbb92d17d"
-PYPI_PACKAGE_HASH = "77f2bccec75ca4280a9fa762a90a1b8b152a22eac5d9c726d7da1fcbfe0a20e6"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb
index 48caa40..9aa5473 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.1.4.bb
@@ -5,6 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
 
 SRC_URI[md5sum] = "322059c57f0c9f11da1c6c06a2ba2197"
 SRC_URI[sha256sum] = "a9234dea79b50d49b92a994132cd1c84e873f3936db94977a66f0a4159b1797c"
-PYPI_PACKAGE_HASH = "ae0cb6ce7eea7ccf020ae68db1119bacaa07ad91fedaefaf8f3265e8dd156813"
 
 inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
index 065cafb..79d3bdd 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
 SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14a1a50ebdffbd50d4e30ffda62c0a05d7b3"
-PYPI_PACKAGE_HASH = "cde6f040ef0926f84ae7cbe89a883b58a04aa9415f91fd9f12496ab793698ec2"
 
 SRC_URI += "file://import-simplejson-as-json.patch"
 
diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.4.bb b/meta-python/recipes-devtools/python/python-pytz_2016.4.bb
index 4c30f9c..6cbea28 100644
--- a/meta-python/recipes-devtools/python/python-pytz_2016.4.bb
+++ b/meta-python/recipes-devtools/python/python-pytz_2016.4.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
 
 SRC_URI[md5sum] = "a3316cf3842ed0375ba5931914239d97"
 SRC_URI[sha256sum] = "c823de61ff40d1996fe087cec343e0503881ca641b897e0f9b86c7683a0bfee1"
-PYPI_PACKAGE_HASH = "ad305ab2298c902ac92fdf649cc07d1b7d491a241c5cac8be84dd84464db7d8b"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb
index 5557fe8..e403d4e 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI[md5sum] = "30c19f94dba43b6f5a010285838a3f45"
 SRC_URI[sha256sum] = "14d85bc9611dbf798732996cb7107858f58a3a1b9d246e4063c7a20ade65842a"
-PYPI_PACKAGE_HASH = "786a2fc9ed0ffbcdb480a026274ca221b959de6c549a67753ff4b3c790db0d8a"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 6f9e85c..e00b257 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -6,6 +6,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7f5"
 SRC_URI[md5sum] = "a36f7a64600f1bfec4d55ae021d232ae"
 SRC_URI[sha256sum] = "63f1815788157130cee16a933b2ee184038e975f0017306d723ac326b5525b54"
 
-PYPI_PACKAGE_HASH = "496f183063f01aae1e025cf0130772b55848750a2f3a89bfa11b385b35d7329d"
-
 RDEPENDS_${PN} = "${PYTHON_PN}-email ${PYTHON_PN}-json ${PYTHON_PN}-netserver"
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb b/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb
index 8e1b950..10b31c5 100644
--- a/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb
+++ b/meta-python/recipes-devtools/python/python-urllib3_1.15.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
 SRC_URI[md5sum] = "5be254b0dbb55d1307ede99e1895c8dd"
 SRC_URI[sha256sum] = "d0a1dc60433f7e9b90b4f085f1d45753174b4594558b29eda0009abe0b82da4c"
-PYPI_PACKAGE_HASH = "4926a7d12ea00cb4b9fa1e13b5980e5a04a1fe7c477eb8f657ce0b757a7a497d"
 
 inherit pypi setuptools
 
-- 
1.9.1


