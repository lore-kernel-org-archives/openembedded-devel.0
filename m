Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFACC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 23:51:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.118099.1680652255084745890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 16:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=AkeJpbOH;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680652258;
  x=1712188258;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6jOoVnyF1/T7uD47Jmc0pp9aMWpXfdvOSdm39mE7eIY=;
  b=AkeJpbOHe0+opyMY1pgdA1TmVosgCSOCTd7/wM4svMhVBaITuXcBblWc
   nIbEdicxJ8MNd30d/j6EG+3RmmKZOW9PGok8bSzFRv3JWOgDr+W53Hm4F
   3IMpoCJ87y6v8brK1C1Ddv51Qu2CKym/0h8X7dkGFZz9dlLIvprZxfeNY
   5hTIAN1HDBIRbmrtzUBr74sU+9ApHOT49cdW2yU9TwOj1DxjtRd/axJO0
   lHYSsyrLol7aTBc74i2ivU64mwHqLr2zTkt4HQ4Rj1dZw8SoMSrvriSJs
   Udf+vVxCWdbQsQNTtNn+zCLxbuQA0wpY+J8ThfffkSkXMiCTphlaG0s5n
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][meta-networking][PATCH 5/5] recipes: Remove double protocol= from SRC_URIs
Date: Wed, 5 Apr 2023 01:50:47 +0200
Message-ID: <20230404235047.601178-5-pkj@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404235047.601178-1-pkj@axis.com>
References: <20230404235047.601178-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 23:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101957

With the exception of paho-mqtt-cpp, the double protocol= attributes
were added to the SRC_URIs when protocol=https was added to all SRC_URIs
fetching from github.com in commit b402a3076f (recipes: Update SRC_URI
branch and protocols).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-support/unbound/unbound_1.17.1.bb       | 2 +-
 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb  | 2 +-
 .../recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb   | 2 +-
 meta-oe/recipes-core/emlog/emlog.inc                            | 2 +-
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb                       | 2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb                   | 2 +-
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb   | 2 +-
 meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb         | 2 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb                       | 2 +-
 meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb               | 2 +-
 meta-oe/recipes-extended/upm/upm_git.bb                         | 2 +-
 meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb            | 2 +-
 meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb      | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
index caa1bb339..24ac6012b 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
@@ -9,7 +9,7 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
 SRCREV = "90831af981221bbce1cd7b15055562336760e484"
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
index 7a65582db..6578bcfeb 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http;branch=master;protocol=https"
+SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master"
 
 SRCREV = "4157a27d39f1dd5b95750ecb6acd1481432785d8"
 
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
index d0441b844..bb5aa6907 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
     file://epl-v10;md5=659c8e92a40b6df1d9e3dccf5ae45a08 \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master \
            file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
 "
 SRCREV = "33921c8b68b351828650c36816e7ecf936764379"
diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 824787083..208b39acd 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -3,7 +3,7 @@ most recent (and only the most recent) output from a process"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=http;branch=master;protocol=https"
+SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=https;branch=master"
 SRCREV = "aee53e8dee862f35291242ba41b0ca88010f6c71"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
index 07c5cc939..c6db78b4a 100644
--- a/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
+++ b/meta-oe/recipes-core/mdbus2/mdbus2_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "readline"
 
 PV = "2.3.3+git${SRCPV}"
 
-SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/freesmartphone/mdbus.git;protocol=https;branch=master \
            file://0001-Fix-arguments-in-GLib.DBusSignalCallback-for-Vala-0..patch \
            "
 SRCREV = "28202692d0b441000f4ddb8f347f72d1355021aa"
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 976bb482a..d690dd4f0 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -14,7 +14,7 @@ PV = "7.91+git${SRCPV}"
 SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
-SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http;protocol=https \
+SRC_URI = "git://github.com/sparkleholic/ltrace.git;protocol=https;branch=master \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
            file://0001-Use-correct-enum-type.patch \
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
index 464d25ad0..3b7453536 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b19ee058d2d5f69af45da98051d91064"
 SECTION = "Development/Libraries"
 DEPENDS = "swig-native python3 sblim-cmpi-devel"
 
-SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=master \
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
            file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
            file://cmpi-bindings-0.9.5-python-lib-dir.patch \
diff --git a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
index d00327996..39d645922 100644
--- a/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
+++ b/meta-oe/recipes-extended/jpnevulator/jpnevulator_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 PV = "2.3.6+git${SRCPV}"
 
-SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=http;branch=master;protocol=https"
+SRC_URI = "git://github.com/snarlistic/jpnevulator.git;protocol=https;branch=master"
 SRCREV = "bc1d4f6587a4a4829b5d55e3ca7ad584da6de545"
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 2a50550a0..f1cdf66fc 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=91e7de50a8d3cf01057f318d72460acd"
 SRCREV = "7786c7ded5c9ce7773890d0e3dc27632898fc6b1"
 PV = "2.2.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch \
            file://0001-include-Declare-gVERSION-global-as-extern.patch \
            "
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
index 961fe7cef..f0c083c6d 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
@@ -10,7 +10,7 @@ SRCREV = "3af04acd38bbc61bbdcdd931dcf234c971aa5336"
 PV = "1.8.0"
 
 SRC_URI = "\
-    git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http;;protocol=https \
+    git://github.com/oetiker/rrdtool-1.x.git;protocol=https;branch=master \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 0ae7760bd..0695f9969 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libjpeg-turbo mraa"
 SRCREV = "5cf20df96c6b35c19d5b871ba4e319e96b4df72d"
 PV = "2.0.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=http;branch=master;protocol=https \
+SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \
            file://0001-Use-stdint-types.patch \
            file://0001-initialize-local-variables-before-use.patch \
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
index 0bc03941f..ceff54f46 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5486c0df458c74c85828e0cdbffd499e"
 
 SRCREV = "cc05b288b6d1660ab04c6cf01173f1bb62e6f5dd"
 SRC_URI = " \
-    git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x;protocol=https \
+    git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
     file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
 "
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
index 2db16e114..53882b2f3 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/js-cookie/js-cookie"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e16cf0e247d84f8999bf55865a9c98cf"
 
-SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=http;branch=master;protocol=https"
+SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=master"
 
 SRCREV = "0ba77141dd215782cc7770347a457906908c66ff"
 

