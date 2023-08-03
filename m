Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A845C41513
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:48:57 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.9666.1691052529095303683
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CE3WCkjw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C96B2000E;
	Thu,  3 Aug 2023 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691052526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cYjnfxYyQE14OaqhliK9NscdLPIibZxI6h5IcHqNKrw=;
	b=CE3WCkjwabb+JQPeKYBtjCLHy2K7+Vn4+Ge82osPjewNjhUHDjFAQJs7vZAV3hGiqpzrxq
	hfJN+WDGjW74H5xNvuvvkAHEwlcX2Cy9E9ykPNiID/s0ld6oPe5lonHNhpwjImVbyB+2sr
	IxlYLufz2fyYoTaYii0MOsdUdpaqiCjLpNuNh3tNUP+9Pf2g7pdfvEPv1qibaoUQZt4Qqs
	dTHLRxzEINfixZqHQyxiYEfEqn2CNmg3jWBdoGXSQaEWCI8wk5yNoKh6T3tz8TKJ6CUrb4
	L/KOVIiAu/TJ2FPHhJ8HtVkY4TzeVvjGS0T55bKwJTz+sWQt1/NOi2a7Cp6tGA==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/7] [meta-python] remove unused AUTHOR variable
Date: Thu,  3 Aug 2023 10:48:33 +0200
Message-Id: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 08:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104211

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-python/recipes-devtools/python/pyrtm_0.4.2.bb               | 1 -
 meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb  | 1 -
 meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb   | 1 -
 .../recipes-devtools/python/python3-google-api-core_2.11.1.bb    | 1 -
 .../recipes-devtools/python/python3-google-auth_2.22.0.bb        | 1 -
 .../python/python3-googleapis-common-protos_1.59.1.bb            | 1 -
 meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb       | 1 -
 meta-python/recipes-devtools/python/python3-inotify_git.bb       | 1 -
 meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb      | 1 -
 .../recipes-devtools/python/python3-ipython-genutils_0.2.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb       | 1 -
 .../recipes-devtools/python/python3-marshmallow_3.19.0.bb        | 1 -
 meta-python/recipes-devtools/python/python3-parso_0.8.3.bb       | 1 -
 meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb | 1 -
 meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb  | 1 -
 .../recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-rsa_4.9.bb           | 1 -
 .../recipes-devtools/python/python3-service-identity_21.1.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb   | 1 -
 meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb     | 1 -
 meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb      | 1 -
 .../recipes-devtools/python/python3-uefi-firmware_1.10.bb        | 1 -
 meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb | 1 -
 meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb  | 1 -
 26 files changed, 26 deletions(-)

diff --git a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index 71e932bb0..940758646 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Python interface for Remember The Milk API"
-AUTHOR = "Sridhar Ratnakumar / srid"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
 
diff --git a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
index 02ace02a3..01dfe5154 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
@@ -1,5 +1,4 @@
 SUMMARY = "An implementation of the Python 3 asyncio event loop on top of GLib"
-AUTHOR = "James Henstridge"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
index 434ab57c5..d1ac486c0 100644
--- a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Specifications for callback functions passed in to an API"
 HOMEPAGE = "https://github.com/takluyver/backcall"
-AUTHOR = "Thomas Kluyver <thomas@kluyver.me.uk>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40e56b724d016484a7f790ec826d3ffc"
 
diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
index a4d59913f..b2ad991f5 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Simple construction, analysis and modification of binary data."
 HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
-AUTHOR = "Scott Griffiths <dr.scottgriffiths@gmail.com>"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb
index 8ac34e639..de2bd3d12 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.11.1.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Google API client core library"
 HOMEPAGE = "https://github.com/googleapis/python-api-core"
-AUTHOR = "Google LLC"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
index ff3f422f3..23def6c52 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.22.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Google Authentication Library"
 HOMEPAGE = "https://github.com/googleapis/google-auth-library-python"
-AUTHOR = "Google Cloud Platform"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
index 802a43499..a6b3d4eac 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.59.1.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "Common protobufs used in Google APIs"
 HOMEPAGE = "https://github.com/googleapis/python-api-common-protos"
-AUTHOR = "Google LLC"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
index f833e6903..ea8c18562 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0.1.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Python bindings for libgpiod."
-AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 # The actual license files live in the upstream libgpiod from which the pypi
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b/meta-python/recipes-devtools/python/python3-inotify_git.bb
index 15fb92eed..9e35c7ba5 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
@@ -1,5 +1,4 @@
 SUMMARY = "An adapter to Linux kernel support for inotify directory-watching."
-AUTHOR = "Dustin Oprea"
 HOMEPAGE = "https://pypi.org/project/inotify/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://setup.py;md5=79b7ec72aa0d446a552d3cceb5799e41;beginline=28;endline=28"
diff --git a/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb b/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
index 9a8e6f7da..58af7b77a 100644
--- a/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
+++ b/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Python wrapper around iperf3"
 HOMEPAGE = "https://github.com/thiezn/iperf3-python"
-AUTHOR = "Mathijs Mortimer <mathijs@mortimer.nl>"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f7d0900b3d30647cdda002c9549ca40f"
 
diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
index 2a28cf9ec..8725150e4 100644
--- a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Vestigial utilities from IPython"
 HOMEPAGE = "http://ipython.org"
-AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35"
 
diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
index 83af99a4a..dece1d7e3 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.14.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "IPython: Productive Interactive Computing"
 HOMEPAGE = "https://ipython.org"
-AUTHOR = "The IPython Development Team <ipython-dev@python.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb
index 41063d2ad..884928084 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb
@@ -1,6 +1,5 @@
 SUMMARY = "An autocompletion tool for Python that can be used for text editors."
 HOMEPAGE = "https://github.com/davidhalter/jedi"
-AUTHOR = "David Halter <davidhalter88@gmail.com>"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
index 91f6462b3..f6ea2e184 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.19.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Simplified object serialization in python"
 DESCRIPTION = "Marshmallow is an ORM/ODM/framework-agnostic library for converting complex datatypes, such as objects, to and from native Python datatypes."
-AUTHOR = "Marius Kriegerowski <mk@quakesaver.net>"
 HOMEPAGE = "https://github.com/marshmallow-code/marshmallow"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "\
diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
index e14f28ad0..ce3471da6 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.3.bb
@@ -1,6 +1,5 @@
 SUMMARY = "A Python Parser"
 HOMEPAGE = "https://github.com/davidhalter/parso"
-AUTHOR = "David Halter <davidhalter88@gmail.com>"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
diff --git a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
index 826091308..bb16c78ce 100644
--- a/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pickleshare_0.7.5.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Tiny 'shelve'-like database with concurrency support"
 HOMEPAGE = "https://github.com/pickleshare/pickleshare"
-AUTHOR = "Ville Vainio <vivainio@gmail.com>"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=905c08218089ffebea3a64c82fc4d7d0"
 
diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb b/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb
index d88790144..7c1675004 100644
--- a/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Python wrapper for Linux fanotify."
 HOMEPAGE = "https://github.com/baskiton/pyfanotify"
-AUTHOR = "Alexander Baskikh"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=636a36c9df04efcfacf839b8866d9a37"
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
index 466e01d91..2534c1c62 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_1.0.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A utility belt for advanced users of python-requests."
 HOMEPAGE = "https://toolbelt.readthedocs.org"
-AUTHOR = "Ian Cordasco, Cory Benfield"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.9.bb b/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
index ed5018f49..0a1e359e1 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.9.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Pure-Python RSA implementation"
 SECTION = "devel/python"
-AUTHOR = "Sybren A. Stuvel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index 2d4145ef1..c3c26dda3 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "The tools for verifying whether a certificate is valid for the intended purposes."
 HOMEPAGE = "https://pypi.org/project/service-identity"
-AUTHOR = "Hynek Schlawack"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb
index ee4ac64c3..fc2527144 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Traitlets Python config system"
 HOMEPAGE = "http://ipython.org"
-AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
diff --git a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
index 6f31aea0e..6622f6220 100644
--- a/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trustme_0.9.0.bb
@@ -1,6 +1,5 @@
 DESCRIPTION = "A utility provides a fake certificate authority (CA)"
 HOMEPAGE = "https://pypi.org/project/trustme"
-AUTHOR = "Nathaniel J. Smith"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5a7af1a4b73e57431e25d15a2da745a"
diff --git a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
index a117f1720..d579ca044 100644
--- a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
@@ -1,5 +1,4 @@
 SUMMARY = "A native Python implementation of the DBus protocol for Twisted applications."
-AUTHOR = "Tom Cocagne"
 HOMEPAGE = "https://pypi.org/project/txdbus/"
 SECTION = "devel/python"
 LICENSE = "MIT"
diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
index 7db7c8059..539366c0d 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.10.bb
@@ -4,7 +4,6 @@ UEFI firmware parser is a simple module and set of scripts for parsing, \
 extracting, and recreating UEFI firmware volumes. This includes parsing \
 modules for BIOS, OptionROM, Intel ME and other formats too."
 HOMEPAGE = "https://github.com/theopolis/uefi-firmware-parser"
-AUTHOR = "Teddy Reed <teddy@prosauce.org>"
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://setup.py;md5=90fa5bae1547550f1c1993f651eda955"
 
diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb b/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
index eaf8bda84..3c41b1eb4 100644
--- a/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
@@ -2,7 +2,6 @@
 # https://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/meta-openstack/recipes-devtools/python/python3-uritemplate_3.0.0.bb?h=master
 
 SUMMARY = "Simple python library to deal with URI Templates."
-AUTHOR = "Ian Cordasco"
 LICENSE = "Apache-2.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6d769bdcfacac3c1a1ffa568937fe0"
 
diff --git a/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
index aadf8b7f4..a1f3957ad 100644
--- a/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Makes working with XML feel like you are working with JSON"
-AUTHOR = "Martin Blech"
 HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
-- 
2.34.1


