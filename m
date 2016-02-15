Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE5A6731A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 04:05:28 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id e61so9842255qgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EuDxu4uOFPoH2T990xrIOcH4BR0bUvGeSHm5psTyGgk=;
	b=ZMSGiengfHm7Y1LLZCi0LqMSGWhvWtnADjgmEgmCyuN0hGvqDPo5SWPyD4sR55DPOg
	IJ4LgUWIu56ittMYuhtWtCo48FWwDuJz2wcSrTGJ3S4eHJDXVQNlk3rJ/u12mTuVwBgb
	2lKzSPtQLoTZIqFqvFIIu8xKFiMW0URsvttZzCn8yQIqieKnFaNMfquhOpseeXHeWliW
	5bpgf3NJ32CWpfnoGMHLfhLytBCI1pI+AE/jA7w1GP5VN3M/g+gccHUQEeSN/TpZCVRN
	9Iba7jJzRMNKj36m9MrQkZGDN8DovVk4ucxZiWaECq7hHO9gPpxmFow6PMvnV9MiinYq
	m5oQ==
X-Gm-Message-State: AG10YOTS9pU7xpCKrNuRzNfRKtc8Zk1mYCmaRlh2T//oGrWyWoVrsaLDhDgMZNtGyxWJOw==
X-Received: by 10.140.108.8 with SMTP id i8mr18032497qgf.83.1455509129594;
	Sun, 14 Feb 2016 20:05:29 -0800 (PST)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	s64sm10387543qgd.28.2016.02.14.20.05.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 20:05:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 23:05:18 -0500
Message-Id: <1455509118-16863-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455509118-16863-1-git-send-email-derek@asterius.io>
References: <1455509118-16863-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2 4/4] Update python recipes to use the common pypi package
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
X-List-Received-Date: Mon, 15 Feb 2016 04:05:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/pyrtm_0.2.bb            |  5 +----
 .../recipes-devtools/python/python-autobahn_0.8.6.bb        |  7 ++-----
 .../recipes-devtools/python/python-backports-ssl_3.4.0.2.bb | 11 ++---------
 .../recipes-devtools/python/python-bitarray_0.8.1.bb        | 11 +----------
 meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb |  9 ++-------
 meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb    | 11 +----------
 .../recipes-devtools/python/python-cryptography_1.1.bb      |  6 +-----
 meta-python/recipes-devtools/python/python-dateutil.inc     |  6 ++----
 meta-python/recipes-devtools/python/python-decorator.inc    |  9 ++-------
 .../recipes-devtools/python/python-django-south_1.0.2.bb    | 10 ++--------
 meta-python/recipes-devtools/python/python-django_1.8.8.bb  | 10 ++--------
 .../recipes-devtools/python/python-flufl-enum_4.0.1.bb      | 13 ++-----------
 meta-python/recipes-devtools/python/python-gevent_0.13.8.bb |  6 +-----
 .../recipes-devtools/python/python-greenlet_0.4.7.bb        |  9 +++------
 .../recipes-devtools/python/python-html5lib_0.999.bb        |  9 +--------
 meta-python/recipes-devtools/python/python-jinja2.inc       |  1 -
 .../recipes-devtools/python/python-jsonpatch_1.12.bb        | 11 +----------
 .../recipes-devtools/python/python-jsonpointer_1.10.bb      | 11 +----------
 meta-python/recipes-devtools/python/python-ldap_2.3.9.bb    |  7 +++----
 meta-python/recipes-devtools/python/python-ldap_2.4.10.bb   |  6 ++----
 meta-python/recipes-devtools/python/python-lxml.inc         |  7 ++-----
 .../recipes-devtools/python/python-m2crypto_0.21.1.bb       |  7 +++----
 meta-python/recipes-devtools/python/python-markupsafe.inc   |  7 ++-----
 meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb  | 11 +----------
 meta-python/recipes-devtools/python/python-mock_1.0.1.bb    | 12 +-----------
 meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb | 10 ++--------
 meta-python/recipes-devtools/python/python-paste_2.0.2.bb   | 12 ++++--------
 meta-python/recipes-devtools/python/python-pep8_1.4.6.bb    | 11 +----------
 meta-python/recipes-devtools/python/python-pip_7.1.2.bb     |  6 +-----
 .../recipes-devtools/python/python-prettytable_0.7.2.bb     | 12 ++----------
 meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb  |  7 +------
 .../recipes-devtools/python/python-pyflakes_0.7.3.bb        | 11 +----------
 meta-python/recipes-devtools/python/python-pygpgme_0.3.bb   |  9 ++-------
 meta-python/recipes-devtools/python/python-pyinotify.inc    |  8 ++------
 .../recipes-devtools/python/python-pyopenssl_0.15.1.bb      | 11 ++---------
 .../recipes-devtools/python/python-pyparsing_2.0.3.bb       | 12 ++----------
 meta-python/recipes-devtools/python/python-pytz_2015.4.bb   |  7 +------
 meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb |  8 +-------
 meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb  |  9 ++-------
 meta-python/recipes-devtools/python/python-snakefood_1.4.bb |  7 +------
 .../recipes-devtools/python/python-twisted_13.2.0.bb        |  8 +++-----
 meta-python/recipes-devtools/python/python-ujson_1.33.bb    | 13 +++----------
 .../recipes-devtools/python/python-vcversioner_2.14.0.0.bb  |  6 +-----
 .../recipes-devtools/python/python-zopeinterface_4.1.1.bb   |  8 ++------
 44 files changed, 75 insertions(+), 312 deletions(-)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.2.bb
index 706515b..3d382b9 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.2.bb
@@ -1,12 +1,9 @@
 SUMMARY = "Python interface for Remember The Milk API"
 AUTHOR = "Sridhar Ratnakumar / srid"
-HOMEPAGE = "http://pypi.python.org/pypi/pyrtm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
-DEPENDS = "python-native"
 
-inherit distutils
+inherit pypi distutils
 
-SRC_URI = "http://pypi.python.org/packages/source/p/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "34423f39caf7df8a9db8e243be9cf1a0"
 SRC_URI[sha256sum] = "d9d46d096a38cb692b55f4ee9f364d54348298e9497b11c1ef057539b5de1567"
diff --git a/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb b/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
index ac775c4..e64dd8f 100644
--- a/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
+++ b/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
@@ -2,18 +2,15 @@ DESCRIPTION = "AutobahnPython provides a WebSocket (RFC6455, Hybi-10 to -17, Hix
 AutobahnPython also includes an implementation of WAMP (The WebSockets Application Messaging Protocol), a light-weight,  \
 asynchronous RPC/PubSub over JSON/WebSocket protocol."
 HOMEPAGE = "http://autobahn.ws/python"
-SECTION = "console/network"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = " file://autobahn/__init__.py;beginline=1;endline=17;md5=1fdeccf6e5b70cda64cc1345597c18e3"
 
-SRC_URI = "https://pypi.python.org/packages/source/a/autobahn/autobahn-${PV}.zip"
 SRC_URI[md5sum] = "160429e7fb043940e79aa7f4ebbab57a"
 SRC_URI[sha256sum] = "94ae5c6f37f9fe7c9d3f12c170fcc273afed4104a1c5508b26d6014bb9e6373e"
 
-S = "${WORKDIR}/autobahn-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE_EXT = "zip"
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "python python-pprint python-twisted-protocols python-netserver python-twisted-web"
 
diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
index 9caae41..5e2d174 100644
--- a/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
@@ -5,19 +5,12 @@ that you are trying to reach. But the matching logic, defined in RFC2818, can be
 on your own. So the ssl package in the Standard Library of Python 3.2 and greater now includes a \
 match_hostname() function for performing this check instead of requiring every application to \
 implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
-HOMEPAGE = "https://pypi.python.org/pypi/backports.ssl_match_hostname"
-SECTION = "devel/python"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=77b684960b86b7a4bb4a450ffde08605"
 
-SRCNAME = "backports.ssl_match_hostname"
-
-SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "788214f20214c64631f0859dc79f23c6"
 SRC_URI[sha256sum] = "07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "backports.ssl_match_hostname"
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb b/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
index dd79e2c..145f1fb 100644
--- a/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
@@ -1,20 +1,11 @@
 SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
-SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3ba469353f9f2a244b2075902351e37d"
 
-SRCNAME = "bitarray"
-
-SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "3825184f54f4d93508a28031b4c65d3b"
 SRC_URI[sha256sum] = "7da501356e48a83c61f479393681c1bc4b94e5a34ace7e08cb29e7dd9290ab18"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-FILES_${PN} += "${datadir}/bitarray"
+inherit pypi setuptools
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
index e015d0b..20fc2fd 100644
--- a/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-python/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -1,16 +1,11 @@
 SUMMARY = "Python template engine and code generation tool"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aff1107514aa6aae948f9fe71fdc393b"
 
-SRCNAME = "Cheetah"
-
 PR = "r3"
 
-SRC_URI = "http://pypi.python.org/packages/source/C/Cheetah/Cheetah-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "Cheetah"
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "python-pickle python-pprint"
 RDEPENDS_${PN}_class-native = ""
diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb b/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
index fc7f024..0ae5c43 100644
--- a/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb
@@ -1,20 +1,11 @@
-# Imported from git://git.yoctoproject.org/meta-cloud-services
-
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "http://packages.python.org/cmd2/"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=21;endline=21;md5=a00047b7e92e0781452d0beba4e7b44e"
 
-SRCNAME = "cmd2"
-
-SRC_URI = "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "842df29ff2f72d64d7f0d917039c0e51"
 SRC_URI[sha256sum] = "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "python-pyparsing"
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
index 16806fb..ffc8fd9 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
@@ -1,14 +1,10 @@
 SUMMARY = "Provides cryptographic recipes and primitives to Python developers"
-SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 DEPENDS += " python-cffi-native python-cffi python-enum34 python-six python-pyasn1"
 SRCNAME = "cryptography"
 
-SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-           file://run-ptest \
-"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+SRC_URI = "file://run-ptest"
 
 SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
 SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index b38c448..9200afd 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -1,17 +1,15 @@
 SUMMARY = "Extensions to the standard Python datetime module"
 DESCRIPTION = "The dateutil module provides powerful extensions to the datetime module available in the Python standard library."
 HOMEPAGE = "https://dateutil.readthedocs.org"
-SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51430b33c900f45f999c459ee29ca493"
 PR = "r0"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "4ef68e1c485b09e9f034e10473e5add2"
 SRC_URI[sha256sum] = "3e95445c1db500a344079a47b171c45ef18f57d188dffdb0e4165c71bea8eb3d"
 
-SRCNAME = "python-dateutil"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+PYPI_PACKAGE = "python-dateutil"
+inherit pypi 
 
 PACKAGES =+ "${PN}-zoneinfo"
 FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index 2c230ff..a599fd8 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -1,5 +1,4 @@
 SUMMARY = "Python decorator utilities"
-HOMEPAGE = "http://pypi.python.org/pypi/decorator/"
 DESCRIPTION = "\
 The aim of the decorator module it to simplify the usage of decorators \
 for the average programmer, and to popularize decorators by showing \
@@ -7,14 +6,10 @@ various non-trivial examples. Of course, as all techniques, decorators \
 can be abused and you should not try to solve every problem with a \
 decorator, just because you can."
 
-SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
 
-SRCNAME = "decorator"
-
-SRC_URI = "https://pypi.python.org/packages/source/d/decorator/decorator-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 SRC_URI[md5sum] = "033c9563af492c4ce2680ee6ca481fa7"
 SRC_URI[sha256sum] = "1a089279d5de2471c47624d4463f2e5b3fc6a2cf65045c39bf714fc461a25206"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
index 9eab13d..4d071c4 100644
--- a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
@@ -1,19 +1,13 @@
 SUMMARY = "Migrations for Django"
 DESCRIPTION = "South is an intelligent database migrations library for the Django web framework. It is database-independent and DVCS-friendly, as well as a whole host of other features."
 HOMEPAGE = "http://south.aeracode.org/"
-SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"
 
-SRCNAME = "South"
-
-SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "c76a9758b2011bc3b6c39f881bba2f66"
 SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
+PYPI_PACKAGE = "South"
+inherit pypi distutils
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-django_1.8.8.bb b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
index 5e4c435..e56c555 100644
--- a/meta-python/recipes-devtools/python/python-django_1.8.8.bb
+++ b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
@@ -1,19 +1,13 @@
 SUMMARY = "A high-level Python Web framework"
 HOMEPAGE = "http://www.djangoproject.com/"
-SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRCNAME = "Django"
-
-SRC_URI = "https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "08ecf83b7e9d064ed7e3981ddc3a8a15"
 SRC_URI[sha256sum] = "8255242fa0d9e0bf331259a6bdb81364933acbe8863291661558ffdb2fc9ed70"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "Django"
+inherit pypi setuptools
 
 FILES_${PN} += "${datadir}/django"
 
diff --git a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb b/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
index a7376db..fe25fd7 100644
--- a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
@@ -2,24 +2,15 @@ SUMMARY  = "A Python enumeration package."
 DESCRIPTION = "The flufl.enum library is a Python enumeration package. Its goal is to provide simple, \
 specific, concise semantics in an easy to read and write syntax. flufl.enum has just enough of the \
 features needed to make enumerations useful, but without a lot of extra baggage to weigh them down. "
-HOMEPAGE = "https://pypi.python.org/pypi/flufl.enum"
-SECTION = "devel/python"
 
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1fa25baed15d3be23c902636379438e8"
 
-SRCNAME = "flufl.enum"
-
-SRC_URI = " \
-    http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-
 SRC_URI[md5sum] = "b3ad23761a78232bc78499ced7cb85d9"
 SRC_URI[sha256sum] = "4af7e7cf2dcc7517251570c7ef9ad194e30ee4b6f860eba500c03954ae95f9d8"
 
-inherit setuptools
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+PYPI_PACKAGE = "flufl.enum"
+inherit pypi setuptools
 
 PACKAGES =+ "\  
     ${PN}-test \
diff --git a/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb b/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
index 3fd3e7c..d1c0a3c 100644
--- a/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
+++ b/meta-python/recipes-devtools/python/python-gevent_0.13.8.bb
@@ -2,18 +2,14 @@ SUMMARY = "A coroutine-based Python networking library"
 DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
 a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
-SECTION = "devel/python"
 LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2 \
                     file://LICENSE.pyevent;md5=718070c63de243053e2c616268b00fdd"
 DEPENDS += "python-greenlet libevent"
 RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
 
-SRC_URI = "http://pypi.python.org/packages/source/g/gevent/gevent-${PV}.tar.gz"
 SRC_URI[md5sum] = "ca9dcaa7880762d8ebbc266b11252960"
 SRC_URI[sha256sum] = "54b8d26300ce408c0916a3e63ef6cd3e6aca76230833558deb7de15196ed955e"
 
-S = "${WORKDIR}/gevent-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb
index 97d64d0..a69eb64 100644
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python-greenlet_0.4.7.bb
@@ -1,14 +1,11 @@
 SUMMARY = "Python lightweight in-process concurrent programming"
-HOMEPAGE = "http://pypi.python.org/pypi/greenlet"
-SECTION = "devel/python"
 LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
-SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
+
 SRC_URI[md5sum] = "c2333a8ff30fa75c5d5ec0e67b461086"
 SRC_URI[sha256sum] = "f32c4fa4e06443e1bdb0d32b69e7617c25ff772c3ffc6d0aa63d192e9fd795fe"
 
-S = "${WORKDIR}/greenlet-${PV}"
-
-inherit distutils
+PYPI_PACKAGE_EXT = "zip"
+inherit pypi distutils
 
diff --git a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
index 34a8b30..d4f1f8d 100644
--- a/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
+++ b/meta-python/recipes-devtools/python/python-html5lib_0.999.bb
@@ -1,15 +1,8 @@
 DESCRIPTION = "HTML parser based on the WHATWG HTML specifcation"
-HOMEPAGE = "https://github.com/html5lib/html5lib-python"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"
 
-SRCNAME = "html5lib"
-SRC_URI = "http://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "acb8ba4d6db5637360a07859192eb7f8"
 SRC_URI[sha256sum] = "c3887f7e2875d7666107fa8bee761ff95b9391acdcc7cd1b5fd57a23b5fbc49e"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index 879550b..f6ee79b 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -1,5 +1,4 @@
 DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
-HOMEPAGE = "https://pypi.python.org/pypi/Jinja2"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
 
diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
index 504bb99..bb5a5ff 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.12.bb
@@ -1,21 +1,12 @@
 SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
 HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
-SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
-SRCNAME = "jsonpatch"
-
-SRC_URI = " \
-    https://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-
-inherit setuptools
+inherit pypi setuptools
 
 SRC_URI[md5sum] = "76ae3183db5f2a8f85dd7705e9b6f278"
 SRC_URI[sha256sum] = "2e1eb457f9c8dd5dae837ca93c0fe5bd2522c9d44b9b380fb1aab2ab4dec04b1"
 
 RDEPENDS_${PN} += "python-re python-json python-jsonpointer"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
index 1af13a9..9b23fb0 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.10.bb
@@ -1,20 +1,11 @@
 DESCRIPTION = "Resolve JSON Pointers in Python"
 HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
-SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
-SRCNAME = "jsonpointer"
-
-SRC_URI = " \
-    https://pypi.python.org/packages/source/j/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-
-inherit setuptools
+inherit pypi setuptools
 
 SRC_URI[md5sum] = "d68c0c6ad6889e9c94ec0feba719e45e"
 SRC_URI[sha256sum] = "9fa5dcac35eefd53e25d6cd4c310d963c9f0b897641772cd6e5e7b89df7ee0b1"
 
 RDEPENDS_${PN} += "python-re python-json"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
diff --git a/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
index bc4993b..a1b9cf7 100644
--- a/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
+++ b/meta-python/recipes-devtools/python/python-ldap_2.3.9.bb
@@ -1,13 +1,12 @@
 DESCRIPTION = "LDAP client API for Python, C wrapper module around OpenLDAP 2.x with an object-oriented API" 
-SECTION = "devel/python" 
 LICENSE = "Python-style" 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
 HOMEPAGE = "http://www.python-ldap.org/" 
 DEPENDS = "python openldap" 
 
-SRC_URI = "http://pypi.python.org/packages/source/p/${BPN}/${BP}.tar.gz \
-           file://setup.cfg.patch"
+SRC_URI = "file://setup.cfg.patch"
 SRC_URI[md5sum] = "a9f9f16338288d118a1ae6266c993247"
 SRC_URI[sha256sum] = "62f75b21c5ee744408c9d8b59878328b3bdf47899d30e8abf0c09b3ffb893ed4"
 
-inherit setuptools  
+PYPI_PACKAGE = "python-ldap"
+inherit pypi setuptools  
diff --git a/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb b/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
index e95da9d..0a6ae7e 100644
--- a/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
+++ b/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
@@ -7,14 +7,12 @@ DESCRIPTION = "This module provides access to the LDAP \
 instead of C API. The module mainly acts as a wrapper for the \
 OpenLDAP 2.x libraries. Errors will appear as exceptions."
 
-SECTION = "devel/python"
 LICENSE = "PSF"
 HOMEPAGE = "http://www.python-ldap.org/"
 DEPENDS = "python openldap cyrus-sasl"
 
-SRC_URI = "http://pypi.python.org/packages/source/p/${PN}/${BPN}-${PV}.tar.gz"
-
-inherit setuptools
+PYPI_PACKAGE = "python-ldap"
+inherit pypi setuptools  
 
 LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
 SRC_URI[md5sum] = "a15827ca13c90e9101e5e9405c1d83be"
diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 337da1b..cb9986e 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -15,17 +15,12 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
                     file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;startline=2;endline=24;md5=96976dcc66249c51e8026b159ca5e755 \
                     file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;startline=2;endline=7;md5=5cac4ad4b5e131a10e9af755b10fbbb7 \
                     "
-SRCNAME = "lxml"
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "9f0c5f1eb43ff44d5455dab4b4efbe73"
 SRC_URI[sha256sum] = "349f93e3a4b09cc59418854ab8013d027d246757c51744bf20069bc89016f578"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
                      --with-xml2-config='pkg-config libxml-2.0' \
@@ -36,6 +31,8 @@ DISTUTILS_INSTALL_ARGS += " \
                      --with-xml2-config='pkg-config libxml-2.0' \
 "
 
+inherit pypi
+
 do_configure_prepend() {
     sed -i -e 's/--version/--modversion/' ${B}/setupinfo.py
 }
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
index ff6203f..a3f9a09 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -6,16 +6,15 @@ DEPENDS = "openssl swig-native python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
-SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
+SRC_URI = " \
            file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
            file://0001-M2Crypto-Error-fix.patch"
 
 SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
 SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
 
-S = "${WORKDIR}/M2Crypto-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "M2Crypto"
+inherit pypi setuptools
 
 SWIG_FEATURES_x86-64 = "-D__x86_64__"
 SWIG_FEATURES ?= ""
diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
index 1b3e0a0..fd7d9bd 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
@@ -1,17 +1,14 @@
 DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
 HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
-SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
 
 PR = "r0"
-SRCNAME = "MarkupSafe"
-
-SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "f5ab3deee4c37cd6a922fb81e730da6e"
 SRC_URI[sha256sum] = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+PYPI_PACKAGE = "MarkupSafe"
+inherit pypi
 
 RDEPENDS_${PN} += "${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb b/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb
index a056c09..4541994 100644
--- a/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb
@@ -1,21 +1,12 @@
-# Imported from git://git.yoctoproject.org/meta-cloud-services
-
 SUMMARY = "McCabe checker, plugin for flake8"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
 
-SRCNAME = "mccabe"
-
-SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
 SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} += " \
     python-prettytable \
diff --git a/meta-python/recipes-devtools/python/python-mock_1.0.1.bb b/meta-python/recipes-devtools/python/python-mock_1.0.1.bb
index a23b552..d336f61 100644
--- a/meta-python/recipes-devtools/python/python-mock_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-mock_1.0.1.bb
@@ -1,21 +1,11 @@
-# Imported from git://git.yoctoproject.org/meta-cloud-services
-
 SUMMARY = "A Python Mocking and Patching Library for Testing"
-HOMEPAGE = "https://pypi.python.org/pypi/mock"
-SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e5ba73891255687dff3bee2b4cbb16"
 
-SRCNAME = "mock"
-
-SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "c3971991738caa55ec7c356bbc154ee2"
 SRC_URI[sha256sum] = "b839dd2d9c117c701430c149956918a423a9863b48b09c90e30a6013e7d2f44f"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} += " \
     python-prettytable \
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
index 206b03d..c1d6705 100644
--- a/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
+++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.5.bb
@@ -1,17 +1,11 @@
 DESCRIPTION = "MessagePack (de)serializer"
-HOMEPAGE = "https://pypi.python.org/pypi/msgpack-python/"
-SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
 PR = "r0"
-SRCNAME = "msgpack-python"
-
-SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "3b82bc542d5599896695512e7c32f42d"
 SRC_URI[sha256sum] = "a07cd6615a6bf38cfa2f010b121c7e77b74a3e7b971ef3e475c3d33308014cbb"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "msgpack-python"
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-paste_2.0.2.bb b/meta-python/recipes-devtools/python/python-paste_2.0.2.bb
index 6338def..4edd038 100644
--- a/meta-python/recipes-devtools/python/python-paste_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-paste_2.0.2.bb
@@ -1,18 +1,14 @@
 SUMMARY = "Tools for using a Web Server Gateway Interface stack"
 HOMEPAGE = "http://pythonpaste.org/"
-SECTION = "devel/python"
 LICENSE = "MIT"
-SRCNAME = "Paste"
 RDEPENDS_${PN} = "python-six"
 
 LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-SRC_URI = "http://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=paste"
-SRC_URI[paste.md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
-SRC_URI[paste.sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
+SRC_URI[md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
+SRC_URI[sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "Paste"
+inherit pypi setuptools
 
 FILES_${PN} += "/usr/lib/*"
diff --git a/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb b/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb
index b3c743e..e3a421e 100644
--- a/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb
+++ b/meta-python/recipes-devtools/python/python-pep8_1.4.6.bb
@@ -1,21 +1,12 @@
-# Imported from git://git.yoctoproject.org/meta-cloud-services
-
 SUMMARY = "Python style guide checker"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=b0d37793ab91ca25ad5c200e9ea22331"
 
-SRCNAME = "pep8"
-
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "a03bb494859e87b42601b61b1b043a0c"
 SRC_URI[sha256sum] = "603a46e5c358ce20ac4807a0eeafac7505d1125a4c1bd8378757ada06f61bed8"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} += " \
     python-prettytable \
diff --git a/meta-python/recipes-devtools/python/python-pip_7.1.2.bb b/meta-python/recipes-devtools/python/python-pip_7.1.2.bb
index 895cf6f..33e5ee2 100644
--- a/meta-python/recipes-devtools/python/python-pip_7.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-pip_7.1.2.bb
@@ -2,14 +2,10 @@ SUMMARY = "PIP is a tool for installing and managing Python packages"
 LICENSE = "MIT & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=45665b53032c02b35e29ddab8e61fa91"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "3823d2343d9f3aaab21cf9c917710196"
 SRC_URI[sha256sum] = "ca047986f0528cfa975a14fb9f7f106271d4e0c3fe1ddced6c1db2e7ae57a477"
 
-S = "${WORKDIR}/pip-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 # Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
 RDEPENDS_${PN} = "python-modules python-distribute"
diff --git a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
index fdc13eb..14edb03 100644
--- a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -1,21 +1,13 @@
-# Imported from git://git.yoctoproject.org/meta-cloud-services
-
 SUMMARY = "Python library for displaying tabular data in a ASCII table format"
 HOMEPAGE = "http://code.google.com/p/prettytable"
-SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
 
-SRCNAME = "prettytable"
-
-SRC_URI = "http://pypi.python.org/packages/source/P/PrettyTable/${SRCNAME}-${PV}.zip"
-
 SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
 SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE_EXT = "zip"
+inherit pypi setuptools
 
 do_install_append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
index 202e4dc..9c0e878 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
+++ b/meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb
@@ -1,16 +1,11 @@
 DESCRIPTION = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
-SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=425e62320d430219736139b134db2fc4"
-DEPENDS = "python"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/pyasn1/pyasn1-${PV}.tar.gz"
 SRC_URI[md5sum] = "f00a02a631d4016818659d1cc38d229a"
 SRC_URI[sha256sum] = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f"
 
-S = "${WORKDIR}/pyasn1-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "python-lang python-shell"
diff --git a/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb b/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb
index ce48cd7..d4d19cc 100644
--- a/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb
+++ b/meta-python/recipes-devtools/python/python-pyflakes_0.7.3.bb
@@ -1,21 +1,12 @@
-# Imported from git://git.yoctoproject.org/meta-cloud-services
-
 SUMMARY = "passive checker of Python programs"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
-SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
 
-SRCNAME = "pyflakes"
-
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
 SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} += " \
     python-prettytable \
diff --git a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
index 39a7ada..03c4790 100644
--- a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -2,24 +2,19 @@ SUMMARY = "A Python module for working with OpenPGP messages"
 DESCRIPTION = "PyGPGME is a Python module that lets you sign, verify, \
                encrypt and decrypt messages using the OpenPGP format."
 HOMEPAGE = "https://launchpad.net/pygpgme"
-SECTION = "devel/python"
 
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/pygpgme/pygpgme-${PV}.tar.gz \
-           file://run-ptest \
-          "
+SRC_URI = "file://run-ptest"
 
 SRC_URI[md5sum] = "d38355af73f0352cde3d410b25f34fd0"
 SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1"
 
-S = "${WORKDIR}/pygpgme-${PV}"
-
 DEPENDS += "gpgme"
 RDEPENDS_${PN} += "gnupg"
 
-inherit setuptools ptest
+inherit pypi setuptools ptest
 
 do_install_ptest(){
     install ${S}/test_all.py ${D}${PTEST_PATH}
diff --git a/meta-python/recipes-devtools/python/python-pyinotify.inc b/meta-python/recipes-devtools/python/python-pyinotify.inc
index 285fe33..a9edb2c 100644
--- a/meta-python/recipes-devtools/python/python-pyinotify.inc
+++ b/meta-python/recipes-devtools/python/python-pyinotify.inc
@@ -1,15 +1,11 @@
 DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
-HOMEPAGE = "https://pypi.python.org/pypi/pyinotify"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
 
 RDEPENDS_${PN} += "python-threading python-io python-subprocess python-misc python-shell"
 
-SRCNAME = "pyinotify"
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
 SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+PYPI_PACKAGE = "pyinotify"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb b/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
index d80e666..5027c6d 100644
--- a/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb
@@ -1,22 +1,15 @@
 SUMMARY = "Simple Python wrapper around the OpenSSL library"
-SECTION = "devel/python"
-
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCNAME = "pyOpenSSL"
-
 DEPENDS = "openssl python-cryptography"
 PE = "1"
 
-SRC_URI = "http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "f447644afcbd5f0a1f47350fec63a4c6"
 SRC_URI[sha256sum] = "f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984bc0d672"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "pyOpenSSL"
+inherit pypi setuptools
 
 PACKAGES =+ "${PN}-tests"
 FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
index ab4d584..18a3077 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python-pyparsing_2.0.3.bb
@@ -1,18 +1,10 @@
-# Imported from git://git.yoctoproject.org/meta-cloud-services
-
 SUMMARY = "Python parsing module"
 HOMEPAGE = "http://pyparsing.wikispaces.com/"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
 
-SRCNAME = "pyparsing"
-
-SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.zip"
-
 SRC_URI[md5sum] = "0a5ec41bb650aed802751a311b5d820d"
 SRC_URI[sha256sum] = "43d7710fdaa194a3bccf3127d06dec8e2de99a7efe6c47f01d4b748a1d04b192"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
+PYPI_PACKAGE_EXT = "zip"
+inherit pypi distutils
diff --git a/meta-python/recipes-devtools/python/python-pytz_2015.4.bb b/meta-python/recipes-devtools/python/python-pytz_2015.4.bb
index eb790f7..dedd864 100644
--- a/meta-python/recipes-devtools/python/python-pytz_2015.4.bb
+++ b/meta-python/recipes-devtools/python/python-pytz_2015.4.bb
@@ -1,14 +1,9 @@
 SUMMARY = "World timezone definitions, modern and historical"
 HOMEPAGE = " http://pythonhosted.org/pytz"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
-SRCNAME = "pytz"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
     python-core \
diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb b/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
index 9c77f83..1ec9944 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
@@ -1,17 +1,11 @@
 SUMMARY = "A libudev binding"
-HOMEPAGE = "http://pypi.python.org/pypi/pyudev"
-SECTION = "devel/python"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRCNAME = "pyudev"
-SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "4034de584b6d9efcbfc590a047c63285"
 SRC_URI[sha256sum] = "765d1c14bd9bd031f64e2612225621984cb2bbb8cbc0c03538bcc4c735ff1c95"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 do_configure_prepend() {
     sed -i "/import pyudev/d" ${S}/setup.py
diff --git a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
index 949b7e1..b5baf82 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb
@@ -1,19 +1,14 @@
 SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
 HOMEPAGE = "http://zeromq.org/bindings:python"
-SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e"
 DEPENDS = "zeromq"
 
-SRC_URI = "https://pypi.python.org/packages/source/p/pyzmq/pyzmq-${PV}.tar.gz \
-           file://club-rpath-out.patch \
-"
+SRC_URI = "file://club-rpath-out.patch"
 SRC_URI[md5sum] = "87e3abb33af5794db5ae85c667bbf324"
 SRC_URI[sha256sum] = "77994f80360488e7153e64e5959dc5471531d1648e3a4bff14a714d074a38cc2"
 
-S = "${WORKDIR}/pyzmq-${PV}"
-
-inherit setuptools pkgconfig
+inherit pypi setuptools pkgconfig
 
 RDEPENDS_${PN} += "python-multiprocessing"
 
diff --git a/meta-python/recipes-devtools/python/python-snakefood_1.4.bb b/meta-python/recipes-devtools/python/python-snakefood_1.4.bb
index 1af33d4..e4a6d76 100644
--- a/meta-python/recipes-devtools/python/python-snakefood_1.4.bb
+++ b/meta-python/recipes-devtools/python/python-snakefood_1.4.bb
@@ -35,18 +35,13 @@ given the trade-offs, 99% is good enough for 99% of the uses.\
 "
 AUTHOR = "Martin Blais <blais@furius.ca>"
 HOMEPAGE = "http://furius.ca/snakefood"
-SECTION = "devel/python"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-SRCNAME = "snakefood"
 
-SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "56c88667a33d8909b0aabf2ab6903bdf"
 SRC_URI[sha256sum] = "295784668032254e7391ca99ba7060edd3ae4eca1a330ac11627b18ab5923b77"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} = " python-logging python-compiler python-shell"
 # the above modules do not have a -native counterpart
diff --git a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
index 2b433f7..ac88ac9 100644
--- a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
@@ -2,19 +2,17 @@ DESCRIPTION = "Twisted is an event-driven networking framework written in Python
 Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
 (including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
 HOMEPAGE = "http://www.twistedmatrix.com"
-SECTION = "console/network"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5602d7228daf59a16f0f1b2640c46bca"
 
-SRC_URI = "https://pypi.python.org/packages/source/T/Twisted/Twisted-${PV}.tar.bz2"
 SRC_URI[md5sum] = "83fe6c0c911cc1602dbffb036be0ba79"
 SRC_URI[sha256sum] = "095175638c019ac7c0604f4c291724a16ff1acd062e181b01293bf4dcbc62cf3"
 
-S = "${WORKDIR}/Twisted-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "Twisted"
+PYPI_PACKAGE_EXT = "tar.bz2"
+inherit pypi setuptools
 
 do_install_append() {
     # remove some useless files before packaging
diff --git a/meta-python/recipes-devtools/python/python-ujson_1.33.bb b/meta-python/recipes-devtools/python/python-ujson_1.33.bb
index 8fdd2b8..dbe432a 100644
--- a/meta-python/recipes-devtools/python/python-ujson_1.33.bb
+++ b/meta-python/recipes-devtools/python/python-ujson_1.33.bb
@@ -1,21 +1,14 @@
 SUMMARY  = "Ultra fast JSON encoder and decoder for Python"
 DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pure C with bindings for Python 2.5+ and 3."
-HOMEPAGE = "https://pypi.python.org/pypi/ujson"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5b206f6ba5e41c60df8cdcddf79a3d82"
 
-SRCNAME = "ujson"
-
-SRC_URI = " \
-    http://pypi.python.org/packages/source/u/ujson/${SRCNAME}-${PV}.zip \
-"
-
 SRC_URI[md5sum] = "8148a2493fff78940feab1e11dc0a893"
 SRC_URI[sha256sum] = "68cf825f227c82e1ac61e423cfcad923ff734c27b5bdd7174495d162c42c602b"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "ujson"
+PYPI_PACKAGE_EXT = "zip"
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "python-numbers"
diff --git a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
index 6c96875..84b556f 100644
--- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
@@ -4,14 +4,10 @@ HOMEPAGE = "https://github.com/habnabit/vcversioner"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=260625d695c5e0c9dd2c2ef898833c7d"
 
-SRC_URI = "https://pypi.python.org/packages/source/v/vcversioner/vcversioner-${PV}.tar.gz"
 SRC_URI[md5sum] = "7848a365ced9941053bc25d9a9f8f4b4"
 SRC_URI[sha256sum] = "acd43686e92e6c8bbeb4f2eef54408567a7adea9692fa72d591eec5357c03b86"
 
-S = "${WORKDIR}/vcversioner-${PV}"
-
-inherit setuptools
-
+inherit pypi setuptools
 
 do_compile_append() {
     export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
diff --git a/meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb b/meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb
index 4151f58..15f8e20 100644
--- a/meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python-zopeinterface_4.1.1.bb
@@ -1,16 +1,12 @@
 SUMMARY = "Interface definitions for Zope products"
-SECTION = "console/network"
-
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI = "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
 SRC_URI[md5sum] = "edcd5f719c5eb2e18894c4d06e29b6c6"
 SRC_URI[sha256sum] = "91cba7b7cd7cb82f6f4e023fe77f94dc3df4ae5287fd55def2148dc232d0c7da"
 
-S = "${WORKDIR}/zope.interface-${PV}"
-
-inherit setuptools
+PYPI_PACKAGE = "zope.interface"
+inherit pypi setuptools
 
 RPROVIDES_${PN} += "zope-interfaces"
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"
-- 
1.9.1


