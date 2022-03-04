Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C924C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 08:50:30 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.5028.1646383829470616461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J15iwC3v;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id s8so2999576pfk.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 00:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5/KazRnGqF2Ow8M9Ic5C3+RE0fmeEvJ9/XQhTNgdm0g=;
        b=J15iwC3vnYDoV0ZJkPdrrPOdlKjmhzXq6LmORb2ftHD3vNfh8FqLj1gxKhE9eg9OWw
         LmkW4i7rRPbbi8MU36Q67QPrx9kTbwojNREbMRPEyk7T1DAD677WDYBGVzj6wCsGT2g6
         2jLvDI0sbACma6Uv4J7f3Yf8f72eqdt2h9JJz4U5zyO8gftgbVZYxqKmvIEM/64JEYgu
         q3sVTI+ptMR2bQJdM4+pJAM7GPGmB4S1e8iJI+H28SULm1iWIQbtU8dnK35hDGqD3B97
         FLHgoHL2++/Zp5+1KM8GjAvDpSFfbppFBLGXzzCYsShyMIHROrONDOTWM6lwBCKoC8L8
         tQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/KazRnGqF2Ow8M9Ic5C3+RE0fmeEvJ9/XQhTNgdm0g=;
        b=6dp73iryXVEBZYNn1+y3cfPg/dzQqV3h/4FhYEOOFba4/YymLhU+cx5uKtRlBMmUhD
         M1ykBz9NRglNLxXMncSXrL0dm87yldLz9r4ArsDyOST50e3zWzqVZDwlgI1f4mk0aLqs
         ZQjpdKv6QAN2eFH4KYV+v/dn8OlS6v3LCPGtVANQp4pqSsdOmzoxu6pCO5tlo7lSz19y
         X2qDzY13RPsLSZ8gH6VXzRX6hfTQEaFiX0xeRLsrvBQj43ujo3bKtbv6NgRDM6TMUuX3
         huHN2WI6hFEqkZBIlK0cenXL22AN0IL0f+xzcGJIM0Ln3c1b8nYWuPpFL9Sf9ib4Ifxw
         V0YQ==
X-Gm-Message-State: AOAM530GRpEu/MGuZcC6m9wMCDGdSUpPVWO9NDquUr7gyHnL5h6QGzj+
	mwPhZ+f4VHFVXQdJL7A3YBMzQlMPjHJ7FQ==
X-Google-Smtp-Source: 
 ABdhPJwwQ1k3r6ww0yUdp5nMpFTNT0SdyN7KNBZUOMpWCY2k2XGRmvsOP6TcCs/tosJOIbZ6d/ulgA==
X-Received: by 2002:a65:6255:0:b0:364:4513:67bf with SMTP id
 q21-20020a656255000000b00364451367bfmr33542473pgv.64.1646383828355;
        Fri, 04 Mar 2022 00:50:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm3912283pgm.75.2022.03.04.00.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 00:50:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 08/10] recipes: Update LICENSE variable to use
 SPDX license identifiers
Date: Fri,  4 Mar 2022 00:50:16 -0800
Message-Id: <20220304085018.1255075-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304085018.1255075-1-raj.khem@gmail.com>
References: <20220304085018.1255075-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 08:50:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95775

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb | 2 +-
 meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-argh_0.26.2.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb | 2 +-
 meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-can_3.3.4.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb    | 2 +-
 .../recipes-devtools/python/python3-contextlib2_21.6.0.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb | 2 +-
 meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-dbussy_1.3.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb | 2 +-
 meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-gmpy2_2.1.2.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb   | 2 +-
 .../recipes-devtools/python/python3-html2text_2020.1.16.bb      | 2 +-
 .../recipes-devtools/python/python3-intervals_1.10.0.post1.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb | 2 +-
 meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb | 2 +-
 meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb | 2 +-
 meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb | 2 +-
 meta-python/recipes-devtools/python/python3-obd_0.7.1.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-portion_2.2.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb      | 2 +-
 .../recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-pybluez_0.23.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pyiface_git.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb    | 2 +-
 .../recipes-devtools/python/python3-python-vlc_3.0.12118.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-smbus_4.3.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-systemd_234.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-term_2.3.bb         | 2 +-
 .../python/python3-typing-extensions_3.10.0.0.bb                | 2 +-
 .../recipes-devtools/python/python3-versiontools_1.9.1.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb  | 2 +-
 .../python/python3-xstatic-font-awesome_4.7.0.0.bb              | 2 +-
 meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb  | 2 +-
 .../unattended-upgrades/unattended-upgrades_2.6.bb              | 2 +-
 .../recipes-extended/python-blivet/python3-blivet_3.4.3.bb      | 2 +-
 .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
 meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb   | 2 +-
 .../python-pykickstart/python3-pykickstart_3.34.bb              | 2 +-
 .../recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb | 2 +-
 .../python3-portalocker/python3-portalocker_2.3.2.bb            | 2 +-
 meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb     | 2 +-
 59 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
index 1e9ba9e140..f5e2f67b35 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Telepathy IM framework - Python package"
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
 
diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
index df50bc7a89..0a81ebdded 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
@@ -1,7 +1,7 @@
 DESCRPTION = "ansi2html - Convert text with ANSI color codes to HTML or to LaTeX"
 HOMEPAGE = "https://github.com/ralphbean/ansi2html"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3000208d539ec061b899bce1d9ce9404"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 
 PYPI_PACKAGE = "ansi2html"
 
diff --git a/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
index d07ccbbf90..c02e31a9a1 100644
--- a/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pattern matching and various utilities for file systems paths."
 
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=cede70b648dcc81baf5b431d38905bad"
 
 SRC_URI[sha256sum] = "e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65"
diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb
index 7bc93bf335..5828c24a23 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "An abstract syntax tree for Python with inference support."
 HOMEPAGE = "https://pypi.python.org/pypi/astroid"
 SECTION = "devel/python"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
 SRC_URI[sha256sum] = "1efdf4e867d4d8ba4a9f6cf9ce07cd182c4c41de77f23814feb27ca93ca9d877"
diff --git a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
index 6f67d28651..2314f72845 100644
--- a/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncio-glib_0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "An implementation of the Python 3 asyncio event loop on top of GLib"
 AUTHOR = "James Henstridge"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 inherit setuptools3 pypi
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
index 6566f8d664..46ceed8b80 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
 SRC_URI[sha256sum] = "4da790ab193e993107f3ff0aebc4f8d6ad5196a19071fbafad16b02898a44fd7"
diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.4.bb b/meta-python/recipes-devtools/python/python3-can_3.3.4.bb
index 760b5dde9c..4fe7bcbff0 100644
--- a/meta-python/recipes-devtools/python/python3-can_3.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-can_3.3.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Controller Area Network (CAN) interface module for Python"
 SECTION = "devel/python"
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI[md5sum] = "305075968c56bd85130b19d86e9e505d"
diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
index 8fa9797768..d6d96965eb 100644
--- a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Universal character encoding detector"
 HOMEPAGE = "https://github.com/PyYoshi/cChardet"
-LICENSE = "MPLv1.1"
+LICENSE = "MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
 
 SRC_URI[sha256sum] = "c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf"
diff --git a/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
index 8b3c8bbaaf..75fe4df8d7 100644
--- a/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-chardet_4.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Universal encoding detector for Python 2 and 3"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI[sha256sum] = "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
diff --git a/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb b/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
index f9900b134b..5a54c696f4 100644
--- a/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-contextlib2_21.6.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Backports and enhancements for the contextlib module"
 HOMEPAGE = "http://contextlib2.readthedocs.org/"
 SECTION = "devel/python"
-LICENSE = "PSF & Apache-2"
+LICENSE = "PSF-2.0 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d2b6be100f1002194122ec9bfee7b8b4"
 
 SRC_URI[sha256sum] = "ab1e2bfe1d01d968e1b7e8d9023bc51ef3509bba217bb730cee3827e1ee82869"
diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
index 040bbd320d..78e14e1d2f 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A python package implementing the crc32c algorithmin hardware and software"
 HOMEPAGE = "https://github.com/ICRAR/crc32c"
 
-LICENSE = "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0+"
+LICENSE = "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
     file://LICENSE.google-crc32c;md5=e9ed01b5e5ac9eae23fc2bb33701220c \
diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb
index 1bcf18ab6f..70e9831770 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Convex optimization package"
 HOMEPAGE = "http://cvxopt.org"
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ba1a8a73d8ebea5c47a1173aaf476ddd"
 
 SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https;branch=master"
diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
index 1911182fcd..b1ba953922 100644
--- a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "language bindings for libdbus, for Python 3.5 or later"
 HOMEPAGE = "https://github.com/ldo/dbussy"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI = "git://github.com/ldo/dbussy.git;branch=master;protocol=https \
diff --git a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
index e5790f478c..3396c7262d 100644
--- a/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-defusedxml_0.7.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "XML bomb protection for Python stdlib modules"
 DESCRIPTION = "Python package with modified subclasses of all stdlib XML \
 parsers that prevent any potentially malicious operation."
 
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=056fea6a4b395a24d0d278bf5c80249e"
 
 SRC_URI[sha256sum] = "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69"
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb b/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
index 40bc1868f4..8e17438262 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.6.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
 SRC_URI[md5sum] = "9f714324ca99eee98bb3c3cdbe838de6"
diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
index 3fdc1363c1..2fbc277139 100644
--- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python bindings for Fast Artificial Neural Networks 2.2.0 (FANN >= 2.2.0)"
 SECTION = "devel/python"
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c73b943dc75f6f65e007c56ac6515c8f"
 
 SRC_URI[md5sum] = "0b85b418018746d63ed66b55465697a9"
diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.2.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.2.bb
index d064ba5c07..274f24090b 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GMP/MPIR, MPFR, and MPC interface to Python 2.6+ and 3.x"
 SECTION = "devel/python"
-LICENSE = "GPL-3.0 | LGPL-3.0+"
+LICENSE = "GPL-3.0-only | LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
index 4a5b1d2c8b..d14987b1fe 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python lightweight in-process concurrent programming"
 HOMEPAGE = "https://greenlet.readthedocs.io/en/latest/"
-LICENSE = "MIT & PSF"
+LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
diff --git a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
index c5ef2ccd3a..64873d2464 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Convert HTML to Markdown-formatted text"
 HOMEPAGE = "https://github.com/Alir3z4/html2text"
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI[md5sum] = "c77b580c94d1a9e0145f23cc4472993d"
diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
index fd636421bd..d841f92343 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Interval arithmetic for Python"
 HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
 SECTION = "devel/python"
 
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 PYPI_PACKAGE := "python-intervals"
diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb
index 39819f4351..948f7651a0 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "langtable is used to guess reasonable defaults for locale,\
 keyboard, territory"
 HOMEPAGE = "https://github.com/mike-fabian/langtable/"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
index 9974326de6..673d32c2d4 100644
--- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python LR parsing library"
 SECTION = "devel/python"
-LICENSE = "AGPL-3.0"
+LICENSE = "AGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://agpl-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788"
 
 HOMEPAGE = "http://lrparsing.sourceforge.net/"
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
index 43f071281d..f3b7e0c6cd 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
@@ -6,7 +6,7 @@ significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
 C14N and much more."
 HOMEPAGE = "https://lxml.de/"
 SECTION = "devel/python"
-LICENSE = "BSD-3-Clause & GPLv2 & MIT & PSF"
+LICENSE = "BSD-3-Clause & GPL-2.0-only & MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
                     file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
index 84bec0b201..b9eab3c931 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
@@ -5,7 +5,7 @@ publication-quality figures in a variety of hardcopy formats \
 and interactive environments across platforms."
 HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "\
     file://setup.py;beginline=296;endline=296;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
index 952286d37c..591b9c6b8d 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A case-insensitive ordered dictionary for Python"
 HOMEPAGE = "https://github.com/pywbem/nocasedict"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
 
 SRC_URI[sha256sum] = "86e2dae49e34de7c31b65b486c8f9aa58b66dc2e8ee9b34c390c6c58885c85a0"
diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
index b3a78ad651..0cb1b85e5a 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "A python module for handling realtime sensor data from OBD-II vehicle ports"HOMEPAGE = "https://github.com/brendan-w/python-OBD"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=58ba896fa086c96ad23317cebfeab277"
 
 SRC_URI[md5sum] = "305efcb6c650db7b9583532355ebeb7c"
diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
index 0a54efde82..a02a7891a7 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.9.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "The leading native Python SSHv2 protocol library."
 HOMEPAGE = "https://github.com/paramiko/paramiko/"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
 SRC_URI[sha256sum] = "944a9e5dbdd413ab6c7951ea46b0ab40713235a9c4c5ca81cfe45c6f14fa677b"
diff --git a/meta-python/recipes-devtools/python/python3-portion_2.2.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.2.0.bb
index e712c8f1ed..0dad8b0ce9 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.2.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python data structure and operations for intervals"
 HOMEPAGE = "https://github.com/AlexandreDecan/portion"
 SECTION = "devel/python"
 
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index 28d94ba5bf..a45ef45f32 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -4,7 +4,7 @@ process' behaviour. Usage of the function is fairly messy though, due to \
 limitations in C and linux. This module provides a nice non-messy python(ic) \
 interface."
 SECTION = "devel/python"
-LICENSE = "GPLv3"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1475481f9ec754d758859bd2c75f6f6f"
 
 S = "${WORKDIR}/git"
diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
index c1e549bcb5..862c3d594e 100644
--- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "ALSA bindings"
 SECTION = "devel/python"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
 
 inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb
index d67975b52b..7c822ac23f 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.38.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for DBus AT-SPI2 accessibility"
 DESCRIPTION = "AT-SPI2 is a protocol over DBus, toolkit widgets use to provide content to screen readers such as Orca"
 SECTION = "devel/python"
 HOMEPAGE = "https://www.freedesktop.org/wiki/Accessibility/AT-SPI2/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
                     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index cc659ea678..b32f3a3627 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 
 DEPENDS = "bluez5"
 
-LICENSE = "GPL-2.0"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
 SRC_URI[md5sum] = "afbe8429bb82d2c46a3d0f5f4f898f9d"
diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
index a80fed62de..0f1ae3caca 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.44.1.bb
@@ -7,7 +7,7 @@ be used to fetch objects identified by a URL from a Python program \
 SECTION = "devel/python"
 HOMEPAGE = "http://pycurl.io/"
 
-LICENSE = "LGPLv2 | MIT"
+LICENSE = "LGPL-2.0-only | MIT"
 LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=75f131c591546fd1277ca49c9a81ab1b \
                     "
diff --git a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
index 188934ab97..a1b9fffea6 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus_0.6.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Pythonic DBus library"
 HOMEPAGE = "https://pypi.python.org/pypi/pydbus/"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a916467b91076e631dd8edb7424769c7"
 
 SRC_URI += "file://0001-Support-asynchronous-calls-58.patch \
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_git.bb b/meta-python/recipes-devtools/python/python3-pyiface_git.bb
index 847efd8cf8..5e0d2de916 100644
--- a/meta-python/recipes-devtools/python/python3-pyiface_git.bb
+++ b/meta-python/recipes-devtools/python/python3-pyiface_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Pyiface is a package that exposes the network interfaces of the operating system in a easy to use and transparent way"
 SECTION = "devel/python"
 HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
-LICENSE = "GPLv3+"
+LICENSE = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb b/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
index 47a40fdce2..60726df09d 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_1.8.3.bb
@@ -1,6 +1,6 @@
 SUMMARY="Pylint is a Python source code analyzer"
 HOMEPAGE= "http://www.pylint.org/"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
 SRC_URI[md5sum] = "2eb5f3cb8fe567eaf5420dd415012202"
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
index a85b0929d4..fa5b3a522a 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A pure Python netlink and Linux network configuration library"
-LICENSE = "GPLv2 & Apache-2.0"
+LICENSE = "GPL-2.0-only & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
index cdfb7d3b0c..0056a794f9 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python bindings for interacting with systemd over DBus"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI[md5sum] = "f993739eca645749f18d4ccfd4a0fbf3"
diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb
index 3e799cf622..147e3bf6aa 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb
@@ -1,6 +1,6 @@
 SUMMARY = "This module provides ctypes-based bindings for the native libvlc API of the VLC video player."
 HOMEPAGE = "wiki.videolan.org/PythonBinding"
-LICENSE = "LGPL-2.0"
+LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI[sha256sum] = "566f2f7c303f6800851cacc016df1c6eeec094ad63e0a49d87db9d698094f1fb"
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
index 183bf7273c..4c4c959eba 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A libudev binding"
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI[sha256sum] = "32ae3585b320a51bc283e0a04000fd8a25599edb44541e2f5034f6afee5d15cc"
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
index 87605c2b3e..09e7341877 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pyzmq provides Zero message queue access for the Python language"
 HOMEPAGE = "http://zeromq.org/bindings:python"
-LICENSE = "BSD-3-Clause & LGPL-3.0"
+LICENSE = "BSD-3-Clause & LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=11c65680f637c3df7f58bbc8d133e96e \
                     file://COPYING.LESSER;md5=12c592fa0bcfff3fb0977b066e9cb69e"
 DEPENDS = "zeromq"
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
index 57a9185289..ae4e6f72da 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -10,7 +10,7 @@ there are no clients anymore on the message bus, as well as convenience \
 functions and decorators for integrating a dbus service with PolicyKit."
 
 SECTION = "devel/python"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 SRCNAME = "python-slip"
 
diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
index a9ba24fdbc..3e14736b2d 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Set of i2c tools for linux - Python module"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://py-smbus/smbusmodule.c;beginline=1;endline=18;md5=46e424fb045901ab25e0f92c28c80055"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz \
diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
index 7401e039bf..be0bafd33f 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "SMPP library for python"
 SECTION = "devel/python"
-LICENSE = "GPLv3.0"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 
 PYPI_PACKAGE = "smpplib"
diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
index 1aecb375bf..10614fe374 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python interface for libsystemd"
 HOMEPAGE = "https://github.com/systemd/python-systemd"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
 
 PYPI_PACKAGE = "systemd-python"
diff --git a/meta-python/recipes-devtools/python/python3-term_2.3.bb b/meta-python/recipes-devtools/python/python3-term_2.3.bb
index 723f1db512..6b62eb02ce 100644
--- a/meta-python/recipes-devtools/python/python3-term_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-term_2.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "An enhanced version of the tty module"
 SECTION = "devel/python"
-LICENSE = "Python-2"
+LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d90e2d280a4836c607520383d1639be1"
 
 SRC_URI[md5sum] = "ab0c1bce381b1109fe4390c56aa06237"
diff --git a/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb b/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
index a8e632487d..a5f491c770 100644
--- a/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
@@ -1,5 +1,5 @@
 HOMEPAGE = "https://github.com/python/typing"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
 # The name on PyPi is slightly different.
diff --git a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
index cf0fa30a32..ea40d5f6bb 100644
--- a/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-versiontools_1.9.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Smart replacement for plain tuple used in __version__"
 SECTION = "devel/python"
 HOMEPAGE = "https://launchpad.net/versiontools"
-LICENSE = "LGPLv3"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=20;md5=02193721a38fd8a05a4ddeb7df8e294d"
 
 SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
diff --git a/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb b/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
index 7e7b5235ee..e81e4dabee 100644
--- a/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
@@ -1,6 +1,6 @@
 SUMMARY = "unittest-based test runner with Ant/JUnit like XML reporting"
 HOMEPAGE = "https://github.com/pycontribs/xmlrunner"
-LICENSE = "LGPL-3.0"
+LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fa964f202b6ae067ed5828fe43c77c1a"
 
 SRC_URI[md5sum] = "7b0b152ed2d278516aedbc0cac22dfb3"
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
index b45e96d387..ccd1cd787d 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
-LICENSE = "Apache-2"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
 
 PYPI_PACKAGE = "XStatic-Font-Awesome"
diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
index c49782e426..bc06618c1e 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)"
 HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
-LICENSE = "LGPL-2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
 SRC_URI[sha256sum] = "10c501b25d8881b656e56c34674d98fe6bc752240a572e74f918bc849c93ba9c"
diff --git a/meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
index 0629bf6db1..22d9a196db 100644
--- a/meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
+++ b/meta-python/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
@@ -1,7 +1,7 @@
 SUMMARY = "This script upgrades packages automatically and unattended."
 DESCRIPTION = "The purpose of unattended-upgrades is to keep the computer current with the latest security (and other) updates automatically."
 HOMEPAGE = "https://wiki.debian.org/UnattendedUpgrades"
-LICENSE = "GPLv2"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://debian/copyright;md5=62b5f2ac0ede901fb245eefbe54c181f"
 
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
index 85575df7b5..fcadf130c9 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A python module for system storage configuration"
 HOMEPAGE = "http://fedoraproject.org/wiki/blivet"
-LICENSE = "LGPLv2+"
+LICENSE = "LGPL-2.0-or-later"
 SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
index 4bcb45ebd6..89f1c700f4 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GUI tool for storage configuration using blivet library"
 HOMEPAGE = "https://github.com/rhinstaller/blivet-gui"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
index 96dba96123..16596596a6 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "A python library for handling exceptions"
 DESCRIPTION = "The python-meh package is a python library for handling, saving, and reporting \
 exceptions."
 HOMEPAGE = "http://git.fedorahosted.org/git/?p=python-meh.git"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit setuptools3
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
index 7aa0758400..6bf9ada581 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A python library for manipulating kickstart files"
 HOMEPAGE = "http://fedoraproject.org/wiki/pykickstart"
-LICENSE = "GPLv2+"
+LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
index 66cd27d447..2cdf82365a 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
@@ -3,7 +3,7 @@ an interface to libparted, the GNU parted library for disk partitioning and \
 filesystem manipulation."
 SUMMARY = "Python bindings for libparted"
 HOMEPAGE = "https://github.com/rhinstaller/pyparted"
-LICENSE = "GPL-2.0+"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
     file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb
index bf9304cdd1..2d23017c88 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.3.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Cross-platform locking library"
 DESCRIPTION = "Portalocker is a library to provide an easy API to file locking"
-LICENSE = "PSF"
+LICENSE = "PSF-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9273424c73af966635d66eb53487e14"
 
diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb
index 26758427a2..676c654b52 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.3.0.bb
@@ -13,7 +13,7 @@ at http://www.dmtf.org/standards/wbem. \
 It also provides a Python provider interface, and is the fastest and easiest \
 way to write providers on the planet."
 HOMEPAGE = "http://pywbem.github.io"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
 SRC_URI[sha256sum] = "5df0af28f81891a3914a12f3a30b11b1981f7b30e09c5a42c011797e7fce9b6a"
-- 
2.35.1


