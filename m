Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.12255.1588451737980404361
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2020 13:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=pw7zX7jw;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2371; q=dns/txt; s=axis-central1;
  t=1588451738; x=1619987738;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j799wBYjnu8WPtexSrYLXDmvTHf3CaGZdjTOuvtxT/w=;
  b=pw7zX7jws7osPuzhq74ByUrJ/84QOXAH37jgfTu2EUVTlTnXOjV36n8W
   zM+P3OTPdZud70rriQuH9nXLhSNnJKybR6k4dUZCb/SSzlstlSwhNp3Tk
   axtR1h/OrsbpIBsEvcRCRNcAoz+P5nQrqmW3GIwTy1WRUDOns5kgqLPzE
   rXyFJJ9cgXCg/UaooDC18gUjWRrRDLuqpM7DuiXjqxu86boutexeiAPXa
   a7uwa+IvwIXEMD8mphAn9weck4jOeR8VGe7gnX2Toqju/rkJ+KJ2aYCpR
   ywHJ0SRRbrKNru/KM22tNt+rh5MEYcUm5tQDl6l3CbzKme82Li1hS+CWZ
   Q==;
IronPort-SDR: LZBIqkPuxjGeKrVtHCIY+XzjxnhZpIs+c/KuWL7WfhRitO9CUfY0BcESAGIXsTvZ3f9S40xNGd
 L5JgW9yadZesYrnjwHrKSvcAs29M6kGp6hEzoyEVSOpIFbcerguT+7B6/XEd2BHeQM3GJNZ6xi
 KRJJ76ggShp/TydhMdhfC13C3iHkueh1J5T5tVPL88Ql89gVJ2vp0G7r9S8IJm9lsVaJjcp0TG
 +IKYnj2gc9dPn05Q3qZYgS+rXhqpdz4NN4An/sHyldqhRBlO9r20+35j3SnHmRfELxNftaxnmX
 MYQ=
X-IronPort-AV: E=Sophos;i="5.73,345,1583190000"; 
   d="scan'208";a="8092956"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][dunfell][PATCH v2] paho-mqtt-c: Update to the real 1.3.2, and correct the license
Date: Sat, 2 May 2020 22:35:33 +0200
Message-ID: <20200502203533.15390-1-pkj@axis.com>
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

Remove do_configure_prepend_libc-musl() as this has now been fixed
upstream.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCH v2: Add notice as to why do_configure_prepend_libc-musl() is
removed.

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

