Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C7DC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:54:04 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.14313.1645545243302559753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bG+UixbL;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id hw13so44035963ejc.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EuEH0EF19RuraibJvpmqEM7XiCdIQGsz8x6N8/4N0Vg=;
        b=bG+UixbLVHuonYhACyg3MR32uSecCnqd2cI3JMH+nRXcgd0KL5Fv6COrVvN4VuDY96
         /sNPVQpRfHHdxb4zK+26KznEE/wHg+EOHEyeEbihBSUq5/YegqwgOK9SpjNGjjA90jHL
         /5s/EpQJgwK1pzVwSODO+IerNTdZhk3/OVjOHuiw6S6Y+YI19GmzQwY6pb4dWUfaDdFw
         KgEgaN3n2Qvlv5X6T5/pK3c4LnqkNskfxWL476PFQhdpyVod0GsUvbudtbOPNm4+sl+H
         AVhZPn6W+pkRGS0243ZNcUtC3uewxk0DV0DJAgtHrcznNMq9l6sPezx849J85NZvbjWj
         WdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EuEH0EF19RuraibJvpmqEM7XiCdIQGsz8x6N8/4N0Vg=;
        b=ZAAZ8v0OftxBbcTVqMPhuUxQWzUgxY7uhGYsC28JRjJB6V98LUxIFt8dgLq6OqOOyB
         r2zdTpJW0Kqbw06aFh48yA3yrMrZITJh7+ywjDFzfjfrR5rDHG5d86XMVtsbSnFx1oyc
         Lj8pEbbJrcZIk4NH3UZrN1bmBxZAgppjHFP00MaGYyssT0Ma0ilcAQubmuItlDdbx++y
         G6NIf66ljqsW2/uIujQZ2xKuQLaHmmW1MmNq/KKRNVZ4kdLmagJ5SDjQgdYssluzuMiy
         CV2vho6RMy2quNWHv21xWWTOj5b0/mk3ixfL0kUvINDFbJTf//0fu5TVbOVg7peT3c0l
         FlPA==
X-Gm-Message-State: AOAM533fu51TyLkWVlI6KtoUOEDhwaGIGHno6V9R1NaW8s5i1f9CTJm9
	TAeaGDOSNSd3Fzk72c4ttuDYpD3MzkG4IQ==
X-Google-Smtp-Source: 
 ABdhPJwMO6NYEy9SZYog2RYauGJpJT0X4rKIVh8buJTcAfftAQ8NUDCyUKcMAvhbMDr7aI2UW4uGwQ==
X-Received: by 2002:a17:907:7613:b0:6d0:ee20:8a37 with SMTP id
 jx19-20020a170907761300b006d0ee208a37mr12328644ejc.316.1645545241288;
        Tue, 22 Feb 2022 07:54:01 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 l8sm6319715ejp.198.2022.02.22.07.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 07:54:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH 2/3] meta: update license names
Date: Tue, 22 Feb 2022 16:53:48 +0100
Message-Id: <20220222155349.2206837-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222155349.2206837-1-Martin.Jansa@gmail.com>
References: <20220222155349.2206837-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 15:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95446

* openembedded-core/scripts/contrib/convert-spdx-licenses.py .
  ...
  All files processed with version 0.01

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-connectivity/gateone/gateone_git.bb                    | 2 +-
 recipes-connectivity/telepathy/telepathy-python_0.15.19.bb     | 2 +-
 recipes-devtools/python/python-astroid_2.3.3.bb                | 2 +-
 recipes-devtools/python/python-backports-abc_0.5.bb            | 2 +-
 recipes-devtools/python/python-backports-ssl_3.7.0.1.bb        | 2 +-
 recipes-devtools/python/python-bitarray_1.2.1.bb               | 2 +-
 recipes-devtools/python/python-can_3.3.2.bb                    | 2 +-
 recipes-devtools/python/python-chardet_3.0.4.bb                | 2 +-
 recipes-devtools/python/python-contextlib2_0.6.0.bb            | 2 +-
 recipes-devtools/python/python-cpuset_1.6.bb                   | 2 +-
 recipes-devtools/python/python-daemon_2.1.2.bb                 | 2 +-
 recipes-devtools/python/python-dbus_1.2.14.bb                  | 2 +-
 recipes-devtools/python/python-dbusmock_0.16.7.bb              | 2 +-
 recipes-devtools/python/python-distutils-extra_2.39.bb         | 2 +-
 recipes-devtools/python/python-docutils_0.15.2.bb              | 2 +-
 recipes-devtools/python/python-dominate_2.4.0.bb               | 2 +-
 recipes-devtools/python/python-functools32_3.2.3-2.bb          | 2 +-
 recipes-devtools/python/python-futures_3.3.0.bb                | 2 +-
 recipes-devtools/python/python-greenlet_0.4.15.bb              | 2 +-
 recipes-devtools/python/python-intervals_1.10.0.bb             | 2 +-
 recipes-devtools/python/python-ldap_3.2.0.bb                   | 2 +-
 recipes-devtools/python/python-lrparsing_1.0.16.bb             | 2 +-
 recipes-devtools/python/python-lxml_4.4.2.bb                   | 2 +-
 recipes-devtools/python/python-numeric_24.2.bb                 | 2 +-
 recipes-devtools/python/python-pip_19.3.1.bb                   | 2 +-
 recipes-devtools/python/python-pyalsaaudio_0.8.4.bb            | 2 +-
 recipes-devtools/python/python-pybluez_0.22.bb                 | 2 +-
 recipes-devtools/python/python-pycrypto_2.6.1.bb               | 2 +-
 recipes-devtools/python/python-pycurl_7.43.0.3.bb              | 2 +-
 recipes-devtools/python/python-pydbus_0.6.0.bb                 | 2 +-
 recipes-devtools/python/python-pygobject_3.34.0.bb             | 2 +-
 recipes-devtools/python/python-pygpgme_0.3.bb                  | 2 +-
 recipes-devtools/python/python-pyiface_0.0.11.bb               | 2 +-
 recipes-devtools/python/python-pylint_1.8.3.bb                 | 2 +-
 recipes-devtools/python/python-pyroute2_0.5.7.bb               | 2 +-
 recipes-devtools/python/python-pyudev_0.21.0.bb                | 2 +-
 recipes-devtools/python/python-pyzmq_17.1.0.bb                 | 2 +-
 recipes-devtools/python/python-rfc3987_1.3.8.bb                | 2 +-
 recipes-devtools/python/python-selectors34_1.2.bb              | 2 +-
 recipes-devtools/python/python-slip-dbus_0.6.5.bb              | 2 +-
 recipes-devtools/python/python-smbus_4.1.bb                    | 2 +-
 recipes-devtools/python/python-snakefood_1.4.bb                | 2 +-
 recipes-devtools/python/python-strict-rfc3339_0.7.bb           | 2 +-
 recipes-devtools/python/python-systemd_234.bb                  | 2 +-
 recipes-devtools/python/python-typing_3.7.4.1.bb               | 2 +-
 recipes-devtools/python/python-versiontools_1.9.1.bb           | 2 +-
 recipes-devtools/python/python-websocket-client_0.57.0.bb      | 2 +-
 recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb | 2 +-
 recipes-devtools/python/python.inc                             | 2 +-
 recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb      | 2 +-
 recipes-extended/python-pyparted/python-pyparted_git.bb        | 2 +-
 recipes-extended/pywbem/python-pywbem_0.15.0.bb                | 2 +-
 recipes-support/dnssec-conf/dnssec-conf_2.02.bb                | 2 +-
 53 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/recipes-connectivity/gateone/gateone_git.bb b/recipes-connectivity/gateone/gateone_git.bb
index 031a9c2..2a3b71a 100644
--- a/recipes-connectivity/gateone/gateone_git.bb
+++ b/recipes-connectivity/gateone/gateone_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
-LICENSE = "AGPL-3.0"
+LICENSE = "AGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=834cbc6995db88433db17cdf8953a428"
 HOMEPAGE = "http://liftoffsoftware.com/Products/GateOne"
 
diff --git a/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index c14acff..5f49548 100644
--- a/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Telepathy IM framework - Python package"
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
 
diff --git a/recipes-devtools/python/python-astroid_2.3.3.bb b/recipes-devtools/python/python-astroid_2.3.3.bb
index d97c18a..0cbdbba 100644
--- a/recipes-devtools/python/python-astroid_2.3.3.bb
+++ b/recipes-devtools/python/python-astroid_2.3.3.bb
@@ -13,7 +13,7 @@ also build partial trees by inspecting living objects."
 HOMEPAGE = "https://pypi.python.org/pypi/astroid"
 SECTION = "devel/python"
 
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI[md5sum] = "5f3d73d82d1753b59bb49a6bc6046dee"
diff --git a/recipes-devtools/python/python-backports-abc_0.5.bb b/recipes-devtools/python/python-backports-abc_0.5.bb
index 72ac95b..5aeb6ca 100644
--- a/recipes-devtools/python/python-backports-abc_0.5.bb
+++ b/recipes-devtools/python/python-backports-abc_0.5.bb
@@ -1,6 +1,6 @@
 SUMMARY = "collections.abc from Python 3.5"
 DESCRIPTION = "A backport of recent additions to the 'collections.abc' module"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
 PYPI_PACKAGE = "backports_abc"
diff --git a/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb b/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
index f174676..94445f3 100644
--- a/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
+++ b/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
@@ -6,7 +6,7 @@ on your own. So the ssl package in the Standard Library of Python 3.2 and greate
 match_hostname() function for performing this check instead of requiring every application to \
 implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
 
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b2adbe8bfdeb625c9a01afd9aaa66619"
 
 SRC_URI[md5sum] = "32d2f593af01a046bec3d2f5181a420a"
diff --git a/recipes-devtools/python/python-bitarray_1.2.1.bb b/recipes-devtools/python/python-bitarray_1.2.1.bb
index 10c272b..1151c27 100644
--- a/recipes-devtools/python/python-bitarray_1.2.1.bb
+++ b/recipes-devtools/python/python-bitarray_1.2.1.bb
@@ -11,7 +11,7 @@ encoding, you may find this module useful."
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 SECTION = "devel/python"
 
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae"
 
 SRC_URI[md5sum] = "a46bf869f6adf34f5b0dc82b469793b7"
diff --git a/recipes-devtools/python/python-can_3.3.2.bb b/recipes-devtools/python/python-can_3.3.2.bb
index dcde6d3..87d245e 100644
--- a/recipes-devtools/python/python-can_3.3.2.bb
+++ b/recipes-devtools/python/python-can_3.3.2.bb
@@ -6,7 +6,7 @@ cars, trucks, boats, wheelchairs and more."
 HOMEPAGE = "https://github.com/hardbyte/python-can"
 SECTION = "devel/python"
 
-LICENSE = "LGPL-3.0"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI[md5sum] = "b724553a330478270267380b4888a18e"
diff --git a/recipes-devtools/python/python-chardet_3.0.4.bb b/recipes-devtools/python/python-chardet_3.0.4.bb
index 1c6db0c..e9fc9fc 100644
--- a/recipes-devtools/python/python-chardet_3.0.4.bb
+++ b/recipes-devtools/python/python-chardet_3.0.4.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Character encoding auto-detection in Python. As smart as your \
 browser. Open source."
 HOMEPAGE = "https://github.com/chardet/chardet"
 
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI[md5sum] = "7dd1ba7f9c77e32351b0a0cfacf4055c"
diff --git a/recipes-devtools/python/python-contextlib2_0.6.0.bb b/recipes-devtools/python/python-contextlib2_0.6.0.bb
index 81e0796..8490515 100644
--- a/recipes-devtools/python/python-contextlib2_0.6.0.bb
+++ b/recipes-devtools/python/python-contextlib2_0.6.0.bb
@@ -4,7 +4,7 @@ module to earlier Python versions."
 HOMEPAGE = "http://contextlib2.readthedocs.org/"
 SECTION = "devel/python"
 
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
 
 SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
diff --git a/recipes-devtools/python/python-cpuset_1.6.bb b/recipes-devtools/python/python-cpuset_1.6.bb
index e3a0a31..0286441 100644
--- a/recipes-devtools/python/python-cpuset_1.6.bb
+++ b/recipes-devtools/python/python-cpuset_1.6.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier"
 SECTION = "devel/python"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 S = "${WORKDIR}/git"
diff --git a/recipes-devtools/python/python-daemon_2.1.2.bb b/recipes-devtools/python/python-daemon_2.1.2.bb
index a7048db..76bd87a 100644
--- a/recipes-devtools/python/python-daemon_2.1.2.bb
+++ b/recipes-devtools/python/python-daemon_2.1.2.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} = "python-docutils \
                   python-resource \
 "
 
-LICENSE = "Apache-2.0 & GPLv3"
+LICENSE = "Apache-2.0 & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=2695c853a2cafc33e68a1d972889ebd2"
 
 inherit pypi setuptools
diff --git a/recipes-devtools/python/python-dbus_1.2.14.bb b/recipes-devtools/python/python-dbus_1.2.14.bb
index 7949199..ec2badf 100644
--- a/recipes-devtools/python/python-dbus_1.2.14.bb
+++ b/recipes-devtools/python/python-dbus_1.2.14.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python bindings for the DBus inter-process communication system"
 SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
-LICENSE = "MIT & AFL-2.1 | GPLv2"
+LICENSE = "MIT & AFL-2.1 | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4 \
 		    file://dbus-gmain/COPYING;md5=99fece6728a80737c8fd3e7c734c17c4 "
 DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
diff --git a/recipes-devtools/python/python-dbusmock_0.16.7.bb b/recipes-devtools/python/python-dbusmock_0.16.7.bb
index c98b237..4f1047b 100644
--- a/recipes-devtools/python/python-dbusmock_0.16.7.bb
+++ b/recipes-devtools/python/python-dbusmock_0.16.7.bb
@@ -3,7 +3,7 @@
 SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
 AUTHOR = "Martin Pitt <martin.pitt@ubuntu.com>"
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI[md5sum] = "80f8caa838fad96483a8751e11d384f9"
diff --git a/recipes-devtools/python/python-distutils-extra_2.39.bb b/recipes-devtools/python/python-distutils-extra_2.39.bb
index 7444464..7fccb0e 100644
--- a/recipes-devtools/python/python-distutils-extra_2.39.bb
+++ b/recipes-devtools/python/python-distutils-extra_2.39.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "python-distutils extension integrating gettext support, themed ic
 HOMEPAGE = "https://launchpad.net/python-distutils-extra"
 SECTION = "devel/python"
 
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4"
 
 SRC_URI = "https://launchpad.net/python-distutils-extra/trunk/${PV}/+download/python-distutils-extra-${PV}.tar.gz"
diff --git a/recipes-devtools/python/python-docutils_0.15.2.bb b/recipes-devtools/python/python-docutils_0.15.2.bb
index 6a2858b..7a8199b 100644
--- a/recipes-devtools/python/python-docutils_0.15.2.bb
+++ b/recipes-devtools/python/python-docutils_0.15.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Text processing system for documentation"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
-LICENSE = "PSF & BSD-2-Clause & GPLv3"
+LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
 
 inherit pypi setuptools
diff --git a/recipes-devtools/python/python-dominate_2.4.0.bb b/recipes-devtools/python/python-dominate_2.4.0.bb
index 7661425..6964a73 100644
--- a/recipes-devtools/python/python-dominate_2.4.0.bb
+++ b/recipes-devtools/python/python-dominate_2.4.0.bb
@@ -5,7 +5,7 @@ Python very concisely, which eliminates the need to learn another template \
 language, and lets you take advantage of the more powerful features of Python."
 HOMEPAGE = "https://github.com/Knio/dominate/"
 
-LICENSE = "LGPL-3.0"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 SRC_URI[md5sum] = "27d3aa7e0d67902c505e248e705e5e2e"
diff --git a/recipes-devtools/python/python-functools32_3.2.3-2.bb b/recipes-devtools/python/python-functools32_3.2.3-2.bb
index f0be384..d7ccef7 100644
--- a/recipes-devtools/python/python-functools32_3.2.3-2.bb
+++ b/recipes-devtools/python/python-functools32_3.2.3-2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy."
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=27cf2345969ed18e6730e90fb0063a10"
 
 SRC_URI[md5sum] = "09f24ffd9af9f6cd0f63cb9f4e23d4b2"
diff --git a/recipes-devtools/python/python-futures_3.3.0.bb b/recipes-devtools/python/python-futures_3.3.0.bb
index e3a30eb..6b5de39 100644
--- a/recipes-devtools/python/python-futures_3.3.0.bb
+++ b/recipes-devtools/python/python-futures_3.3.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "The concurrent.futures module provides a high-level interface for asynchronously executing callables."
 SECTION = "devel/python"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=834d982f973c48b6d662b5944c5ab567"
 HOMEPAGE = "https://github.com/agronholm/pythonfutures"
 DEPENDS = "python"
diff --git a/recipes-devtools/python/python-greenlet_0.4.15.bb b/recipes-devtools/python/python-greenlet_0.4.15.bb
index 78c4681..83e8ca6 100644
--- a/recipes-devtools/python/python-greenlet_0.4.15.bb
+++ b/recipes-devtools/python/python-greenlet_0.4.15.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python lightweight in-process concurrent programming"
-LICENSE = "MIT & PSF"
+LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
diff --git a/recipes-devtools/python/python-intervals_1.10.0.bb b/recipes-devtools/python/python-intervals_1.10.0.bb
index 6a8c8d5..3500cef 100644
--- a/recipes-devtools/python/python-intervals_1.10.0.bb
+++ b/recipes-devtools/python/python-intervals_1.10.0.bb
@@ -4,7 +4,7 @@ intervals in Python 2.7+ and Python 3.4+."
 HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
 SECTION = "devel/python"
 
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 SRC_URI[md5sum] = "8955317ff4e42590c90ba6247b1caaed"
diff --git a/recipes-devtools/python/python-ldap_3.2.0.bb b/recipes-devtools/python/python-ldap_3.2.0.bb
index 677ed24..33864ff 100644
--- a/recipes-devtools/python/python-ldap_3.2.0.bb
+++ b/recipes-devtools/python/python-ldap_3.2.0.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "This module provides access to the LDAP \
 instead of C API. The module mainly acts as a wrapper for the \
 OpenLDAP 2.x libraries. Errors will appear as exceptions."
 
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 HOMEPAGE = "http://www.python-ldap.org/"
 DEPENDS = "python openldap cyrus-sasl"
 
diff --git a/recipes-devtools/python/python-lrparsing_1.0.16.bb b/recipes-devtools/python/python-lrparsing_1.0.16.bb
index 7c3f78d..6eebe1e 100644
--- a/recipes-devtools/python/python-lrparsing_1.0.16.bb
+++ b/recipes-devtools/python/python-lrparsing_1.0.16.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python LR parsing library"
 HOMEPAGE = "http://lrparsing.sourceforge.net/"
 BUGTRACKER = "https://sourceforge.net/p/lrparsing/tickets/"
 SECTION = "devel/python"
-LICENSE = "AGPL-3.0"
+LICENSE = "AGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lrparsing/lrparsing-${PV}.tar.gz"
diff --git a/recipes-devtools/python/python-lxml_4.4.2.bb b/recipes-devtools/python/python-lxml_4.4.2.bb
index 2e21639..29bace5 100644
--- a/recipes-devtools/python/python-lxml_4.4.2.bb
+++ b/recipes-devtools/python/python-lxml_4.4.2.bb
@@ -6,7 +6,7 @@ significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
 C14N and much more."
 HOMEPAGE = "http://codespeak.net/lxml"
 SECTION = "devel/python"
-LICENSE = "BSD & GPLv2 & MIT & PSF"
+LICENSE = "BSD & GPL-2.0-only & MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
                     file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
diff --git a/recipes-devtools/python/python-numeric_24.2.bb b/recipes-devtools/python/python-numeric_24.2.bb
index a0679fa..cdeac9a 100644
--- a/recipes-devtools/python/python-numeric_24.2.bb
+++ b/recipes-devtools/python/python-numeric_24.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
-LICENSE = "PSF & LLNL"
+LICENSE = "PSF-2.0 & LLNL"
 LIC_FILES_CHKSUM = "file://Legal.htm;md5=e3ce75dedd4043918d15979ae43e312e"
 
 PR = "ml3"
diff --git a/recipes-devtools/python/python-pip_19.3.1.bb b/recipes-devtools/python/python-pip_19.3.1.bb
index 64f5d61..714796c 100644
--- a/recipes-devtools/python/python-pip_19.3.1.bb
+++ b/recipes-devtools/python/python-pip_19.3.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "PIP is a tool for installing and managing Python packages"
 HOMEPAGE = "https://pip.pypa.io/"
-LICENSE = "MIT & LGPL-2.1"
+LICENSE = "MIT & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 SRC_URI[md5sum] = "1aaaf90fbafc50e7ba1e66ffceb00960"
diff --git a/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb b/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
index 831a27f..17f7e51 100644
--- a/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
+++ b/recipes-devtools/python/python-pyalsaaudio_0.8.4.bb
@@ -1,7 +1,7 @@
 
 SUMMARY = "Support for the Linux 2.6.x ALSA Sound System"
 SECTION = "devel/python"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 
 SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
diff --git a/recipes-devtools/python/python-pybluez_0.22.bb b/recipes-devtools/python/python-pybluez_0.22.bb
index e4f7ff8..f022ee9 100644
--- a/recipes-devtools/python/python-pybluez_0.22.bb
+++ b/recipes-devtools/python/python-pybluez_0.22.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 DEPENDS = "bluez5"
 
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
 SRC_URI[md5sum] = "49dab9d5a8f0b798c8125c7f649be3cd"
diff --git a/recipes-devtools/python/python-pycrypto_2.6.1.bb b/recipes-devtools/python/python-pycrypto_2.6.1.bb
index 53971f5..e76785f 100644
--- a/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -6,7 +6,7 @@ This section is essentially complete, and the software interface will almost \
 certainly not change in an incompatible way in the future; all that remains to \
 be done is to fix any bugs that show up."
 HOMEPAGE = "http://www.pycrypto.org/"
-LICENSE = "PSFv2"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-pycrypto:"
diff --git a/recipes-devtools/python/python-pycurl_7.43.0.3.bb b/recipes-devtools/python/python-pycurl_7.43.0.3.bb
index 440ea19..cc9ae10 100644
--- a/recipes-devtools/python/python-pycurl_7.43.0.3.bb
+++ b/recipes-devtools/python/python-pycurl_7.43.0.3.bb
@@ -8,7 +8,7 @@ be used to fetch objects identified by a URL from a Python program \
 SECTION = "devel/python"
 HOMEPAGE = "http://pycurl.io/"
 
-LICENSE = "LGPLv2 | MIT"
+LICENSE = "LGPL-2.0-only | MIT"
 LIC_FILES_CHKSUM = " \
     file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
     file://COPYING-MIT;md5=2df767ed35d8ea83de4a93feb55e7815 \
diff --git a/recipes-devtools/python/python-pydbus_0.6.0.bb b/recipes-devtools/python/python-pydbus_0.6.0.bb
index 2eb1453..fb558b6 100644
--- a/recipes-devtools/python/python-pydbus_0.6.0.bb
+++ b/recipes-devtools/python/python-pydbus_0.6.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Pythonic DBus library"
 DESCRIPTION = "Pythonic DBus library"
 HOMEPAGE = "https://pypi.python.org/pypi/pydbus/"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI[md5sum] = "c6abd44862322679bd4e907bebc3e0d0"
diff --git a/recipes-devtools/python/python-pygobject_3.34.0.bb b/recipes-devtools/python/python-pygobject_3.34.0.bb
index eb572a2..c68517b 100644
--- a/recipes-devtools/python/python-pygobject_3.34.0.bb
+++ b/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python GObject bindings"
 HOMEPAGE = "http://www.pygtk.org/"
 SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/recipes-devtools/python/python-pygpgme_0.3.bb b/recipes-devtools/python/python-pygpgme_0.3.bb
index a55d808..3f3d107 100644
--- a/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "PyGPGME is a Python module that lets you sign, verify, \
                encrypt and decrypt messages using the OpenPGP format."
 HOMEPAGE = "https://launchpad.net/pygpgme"
 
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
 SRC_URI = "file://run-ptest \
diff --git a/recipes-devtools/python/python-pyiface_0.0.11.bb b/recipes-devtools/python/python-pyiface_0.0.11.bb
index 57d856f..fdc5eba 100644
--- a/recipes-devtools/python/python-pyiface_0.0.11.bb
+++ b/recipes-devtools/python/python-pyiface_0.0.11.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Pyiface is a package that exposes the network interfaces of the operating system in a easy to use and transparent way"
 SECTION = "devel/python"
 HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
diff --git a/recipes-devtools/python/python-pylint_1.8.3.bb b/recipes-devtools/python/python-pylint_1.8.3.bb
index 293cee3..dde8120 100644
--- a/recipes-devtools/python/python-pylint_1.8.3.bb
+++ b/recipes-devtools/python/python-pylint_1.8.3.bb
@@ -1,6 +1,6 @@
 SUMMARY="Pylint is a Python source code analyzer"
 HOMEPAGE= "http://www.pylint.org/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
 SRC_URI[md5sum] = "2eb5f3cb8fe567eaf5420dd415012202"
diff --git a/recipes-devtools/python/python-pyroute2_0.5.7.bb b/recipes-devtools/python/python-pyroute2_0.5.7.bb
index 1855b04..a09571e 100644
--- a/recipes-devtools/python/python-pyroute2_0.5.7.bb
+++ b/recipes-devtools/python/python-pyroute2_0.5.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A pure Python netlink and Linux network configuration library"
-LICENSE = "GPLv2 & Apache-2.0"
+LICENSE = "GPL-2.0-only & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
diff --git a/recipes-devtools/python/python-pyudev_0.21.0.bb b/recipes-devtools/python/python-pyudev_0.21.0.bb
index 1489a1c..fbff22e 100644
--- a/recipes-devtools/python/python-pyudev_0.21.0.bb
+++ b/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -1,6 +1,6 @@
 
 SUMMARY = "A libudev binding"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
diff --git a/recipes-devtools/python/python-pyzmq_17.1.0.bb b/recipes-devtools/python/python-pyzmq_17.1.0.bb
index 888f302..daec75b 100644
--- a/recipes-devtools/python/python-pyzmq_17.1.0.bb
+++ b/recipes-devtools/python/python-pyzmq_17.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
 HOMEPAGE = "http://zeromq.org/bindings:python"
-LICENSE = "BSD & LGPL-3.0"
+LICENSE = "BSD & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
                     file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
 DEPENDS = "zeromq"
diff --git a/recipes-devtools/python/python-rfc3987_1.3.8.bb b/recipes-devtools/python/python-rfc3987_1.3.8.bb
index 021c32a..18d5922 100644
--- a/recipes-devtools/python/python-rfc3987_1.3.8.bb
+++ b/recipes-devtools/python/python-rfc3987_1.3.8.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
 
 SRC_URI[md5sum] = "b6c4028acdc788a9ba697e1c1d6b896c"
diff --git a/recipes-devtools/python/python-selectors34_1.2.bb b/recipes-devtools/python/python-selectors34_1.2.bb
index 771e74a..a1b3dbc 100644
--- a/recipes-devtools/python/python-selectors34_1.2.bb
+++ b/recipes-devtools/python/python-selectors34_1.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Backport of the selectors module from Python 3.4"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2fae0222c31d6c10488d4ab93a863af7"
 
 SRC_URI[md5sum] = "bc855a1c8839a811476c019dc07d92dd"
diff --git a/recipes-devtools/python/python-slip-dbus_0.6.5.bb b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
index c9bf7da..abd3673 100644
--- a/recipes-devtools/python/python-slip-dbus_0.6.5.bb
+++ b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
@@ -10,7 +10,7 @@ there are no clients anymore on the message bus, as well as convenience \
 functions and decorators for integrating a dbus service with PolicyKit."
 
 SECTION = "devel/python"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 SRCNAME = "python-slip"
 
diff --git a/recipes-devtools/python/python-smbus_4.1.bb b/recipes-devtools/python/python-smbus_4.1.bb
index ddef63e..02929c2 100644
--- a/recipes-devtools/python/python-smbus_4.1.bb
+++ b/recipes-devtools/python/python-smbus_4.1.bb
@@ -1,6 +1,6 @@
 
 SUMMARY = "Set of i2c tools for linux - Python module"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb045901ab25e0f92c28c80055"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
diff --git a/recipes-devtools/python/python-snakefood_1.4.bb b/recipes-devtools/python/python-snakefood_1.4.bb
index c73aea7..c68a1b8 100644
--- a/recipes-devtools/python/python-snakefood_1.4.bb
+++ b/recipes-devtools/python/python-snakefood_1.4.bb
@@ -35,7 +35,7 @@ given the trade-offs, 99% is good enough for 99% of the uses.\
 "
 AUTHOR = "Martin Blais <blais@furius.ca>"
 HOMEPAGE = "http://furius.ca/snakefood"
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI[md5sum] = "56c88667a33d8909b0aabf2ab6903bdf"
diff --git a/recipes-devtools/python/python-strict-rfc3339_0.7.bb b/recipes-devtools/python/python-strict-rfc3339_0.7.bb
index 897f2b0..d3c3e25 100644
--- a/recipes-devtools/python/python-strict-rfc3339_0.7.bb
+++ b/recipes-devtools/python/python-strict-rfc3339_0.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Strict, simple, lightweight RFC3339 function.s"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 
 SRC_URI[md5sum] = "4d9b635b4df885bc37bc1189d66c9abc"
diff --git a/recipes-devtools/python/python-systemd_234.bb b/recipes-devtools/python/python-systemd_234.bb
index d19e9b0..05d3fea 100644
--- a/recipes-devtools/python/python-systemd_234.bb
+++ b/recipes-devtools/python/python-systemd_234.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python interface for libsystemd"
 HOMEPAGE = "https://github.com/systemd/python-systemd"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
 
 PYPI_PACKAGE = "systemd-python"
diff --git a/recipes-devtools/python/python-typing_3.7.4.1.bb b/recipes-devtools/python/python-typing_3.7.4.1.bb
index 30ce0db..0895ab0 100644
--- a/recipes-devtools/python/python-typing_3.7.4.1.bb
+++ b/recipes-devtools/python/python-typing_3.7.4.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Simple Python module defined by PEP 484."
 HOMEPAGE = "https://github.com/python/typing"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
 SRC_URI[md5sum] = "0a1ebd4af65b4769e33459004eb20345"
diff --git a/recipes-devtools/python/python-versiontools_1.9.1.bb b/recipes-devtools/python/python-versiontools_1.9.1.bb
index 995622c..f0c0c0a 100644
--- a/recipes-devtools/python/python-versiontools_1.9.1.bb
+++ b/recipes-devtools/python/python-versiontools_1.9.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Smart replacement for plain tuple used in __version__"
 SECTION = "devel/python"
 HOMEPAGE = "https://launchpad.net/versiontools"
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=20;md5=02193721a38fd8a05a4ddeb7df8e294d"
 
 inherit pypi setuptools
diff --git a/recipes-devtools/python/python-websocket-client_0.57.0.bb b/recipes-devtools/python/python-websocket-client_0.57.0.bb
index f465e32..b5999d9 100644
--- a/recipes-devtools/python/python-websocket-client_0.57.0.bb
+++ b/recipes-devtools/python/python-websocket-client_0.57.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "WebSocket client for python. hybi13 is supported."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
-LICENSE = "LGPL-3.0"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
 
 inherit pypi setuptools
diff --git a/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb b/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
index cc073b8..4d01241 100644
--- a/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
+++ b/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
-LICENSE = "Apache-2"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
 
 PYPI_PACKAGE = "XStatic-Font-Awesome"
diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/python.inc
index 62ec754..c65199d 100644
--- a/recipes-devtools/python/python.inc
+++ b/recipes-devtools/python/python.inc
@@ -1,6 +1,6 @@
 SUMMARY = "The Python Programming Language"
 HOMEPAGE = "http://www.python.org"
-LICENSE = "PSFv2"
+LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
diff --git a/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb b/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
index eef0b3e..35ac076 100644
--- a/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
+++ b/recipes-extended/python-pyephem/python-pyephem_3.7.7.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "PyEphem astronomical calculations"
 HOMEPAGE = "http://rhodesmill.org/pyephem/"
 
-LICENSE = "LGPL-3.0"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f288303760f6e5ceaafe3aaa32186ab1"
 
 SRC_URI[md5sum] = "46c035b4a903ff26e0d8ad0f1fe6cc35"
diff --git a/recipes-extended/python-pyparted/python-pyparted_git.bb b/recipes-extended/python-pyparted/python-pyparted_git.bb
index 841b8be..5273334 100644
--- a/recipes-extended/python-pyparted/python-pyparted_git.bb
+++ b/recipes-extended/python-pyparted/python-pyparted_git.bb
@@ -5,7 +5,7 @@ filesystem manipulation."
 HOMEPAGE = "https://github.com/rhinstaller/pyparted"
 SECTION = "devel/python"
 
-LICENSE = "GPL-2.0+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
     file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
diff --git a/recipes-extended/pywbem/python-pywbem_0.15.0.bb b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
index 040d46b..020cd82 100644
--- a/recipes-extended/pywbem/python-pywbem_0.15.0.bb
+++ b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
@@ -15,7 +15,7 @@ way to write providers on the planet."
 HOMEPAGE = "http://pywbem.github.io"
 SECTION = "devel/python"
 
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
 inherit pypi setuptools update-alternatives
diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
index 38eb132..0ba5fdb 100644
--- a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
+++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -10,7 +10,7 @@ and harvested keys, as well a script to harvest DNSKEY's from DNS. \
 See also: system-config-dnssec"
 HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
 SECTION = "net"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
 DEPENDS += "xmlto-native docbook-xml-dtd4-native \
             docbook-xsl-stylesheets-native libxslt-native"
-- 
2.35.1


