Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.4744.1588308314924802242
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2020 21:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=nUw9+LNv;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2208; q=dns/txt; s=axis-central1;
  t=1588308315; x=1619844315;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BhYV704KAhIdzZZBJbqRq+SBhKODMWpOQFd2NCVbZNI=;
  b=nUw9+LNvXWblJJO+0MuYq5amF40G99TMz7T55Xq/6S2xZJeMICohnt+T
   Wg16aZcw2rtac8A3QS8uMMCY3zVzXv6mSfyHtfsA9nIApAaMiy8ldDDEE
   Bbbu6Q00RnQlpaNYN/WeJEl4SRk6yTaEpEdY2Ub2mnJT7rLeVQ5jt4P8b
   MvTakPMWoGGjStAWEsRTeMZesIfwFbALlEz1mu+7gW+UbXoMSkgJDnun4
   hHKI7NWsyN7/ZtkyEwmTZQ2NjgTz2ojc6EdHwSQtpO/B7oeMtKN+3fF9E
   IGGw5/0uGLX08RN+sS9vnZH9xWoy/yNgyutMlefYo52ywCsY2dWP0XROe
   w==;
IronPort-SDR: 7qdHSpMUbeukKJjvEOS5wz6GJ4NWx/nEQMicszU79QEZBq+8+tdaJWCi+sxJKQPiQLAC+nDVyF
 yartLTAE6d/D4CPr/nRzIhbkaKb3j5oXWVfgmgB4VbUPaj1Fq/6v+a6QFzi5Pz+NwwoSbyNk7+
 ALznE6aQW60QkyIMSR3BsYGFWJoO/Rx1ZfRbbCb9jrNHO0cCb9NHKCfXs//7Ibxw3y7MpZb/OE
 Tc326THhw34R5GVSR7AuScBM2ms39l0MpXFhfC95nBsHHScZb6aZy0IQZX2X5P+EWyGoQZ8rYk
 Q0g=
X-IronPort-AV: E=Sophos;i="5.73,338,1583190000"; 
   d="scan'208";a="8290132"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][dunfell][PATCH] paho-mqtt-c: Update to the real 1.3.2, and correct the license
Date: Fri, 1 May 2020 06:45:09 +0200
Message-ID: <20200501044509.13144-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In commit b0345e3f (paho-mqtt-c: upgrade 1.3.1 -> 1.3.2), paho-mqtt-c
was supposedly updated to 1.3.2. However, the SRCREV did not match the
v1.3.2 tag.

With the update to 1.3.2, the license was changed from EPL-1.0 | EDL-1.0
to EPL-2.0 | EDL-1.0. This was updated in commit b0345e3f for
LIC_FILES_CHKSUM, but not in LICENSE.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../paho-mqtt-c/paho-mqtt-c_1.3.2.bb             | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
index fa8c714ce..071d51fc6 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
@@ -2,19 +2,19 @@ SUMMARY = "Paho MQTT - C libraries for the MQTT and MQTT-SN protocols"
 DESCRIPTION = "Client implementation of open and standard messaging protocols for Machine-to-Machine (M2M) and Internet of Things (IoT)."
 HOMEPAGE = "http://www.eclipse.org/paho/"
 SECTION = "console/network"
-LICENSE = "EPL-1.0 | EDL-1.0"
+LICENSE = "EPL-2.0 | EDL-1.0"
 
 LIC_FILES_CHKSUM = " \
-        file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
-        file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
-        file://notice.html;md5=943f861069889acecebf51dfa24478e2 \
-        file://about.html;md5=e5662cbb5f8fd5c9faac526e4077898e \
+    file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
+    file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
+    file://notice.html;md5=943f861069889acecebf51dfa24478e2 \
+    file://about.html;md5=e5662cbb5f8fd5c9faac526e4077898e \
 "
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http \
            file://0001-Fix-bug-of-free-with-musl.patch"
 
-SRCREV = "fbe39064c4416f879308a8a5390b19d544970789"
+SRCREV = "3148fe2d5f4b87e16266dfe559c0764e16ca0546"
 
 DEPENDS = "openssl"
 
@@ -29,7 +29,3 @@ do_install_append() {
 }
 
 EXTRA_OECMAKE = "-DPAHO_WITH_SSL=ON"
-
-do_configure_prepend_libc-musl() {
-    sed -i -e "s/SET(LIBS_SYSTEM c dl pthread anl rt)/SET(LIBS_SYSTEM c dl pthread rt)/g" ${S}/src/CMakeLists.txt 
-}
-- 
2.21.1

