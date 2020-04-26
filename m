Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8842.1587896866618965950
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2020 03:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,319,1583164800"; 
   d="scan'208";a="90476536"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 26 Apr 2020 18:27:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 635CF4BCC88D
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2020 18:16:57 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 26 Apr 2020 18:27:36 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sun, 26 Apr 2020 18:27:40 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] paho-mqtt-c: upgrade 1.3.1 -> 1.3.2
Date: Sun, 26 Apr 2020 11:27:25 -0700
Message-ID: <20200426182725.22728-1-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 635CF4BCC88D.A67BD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

add patches for resoving compile error with musl:
0001-Fix-bug-of-free-with-musl.patch

Eclipse Public License : update to v 2.0
-License-Update: updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../0001-Fix-bug-of-free-with-musl.patch      | 39 +++++++++++++++++++
 ...o-mqtt-c_1.3.1.bb => paho-mqtt-c_1.3.2.bb} | 15 ++++---
 2 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/files/0001-Fix-bug-of-free-with-musl.patch
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.1.bb => paho-mqtt-c_1.3.2.bb} (56%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/files/0001-Fix-bug-of-free-with-musl.patch b/meta-oe/recipes-connectivity/paho-mqtt-c/files/0001-Fix-bug-of-free-with-musl.patch
new file mode 100644
index 000000000..12f9e7abc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/files/0001-Fix-bug-of-free-with-musl.patch
@@ -0,0 +1,39 @@
+From 96233a8382b9520293a48b08dc3b204a21205800 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 24 Apr 2020 00:53:19 +0900
+Subject: [PATCH] Fix bug of free() with musl
+
+This fixes build error with musl C library:
+/ubinux-dev/ubinux001/contribution/build/tmp/work/armv7vet2hf-neon-poky-linux-musleabi/paho-mqtt-c/1.3.2-r0/git/src/Heap.h:55:24:
+error: expected declaration specifiers or '...' before string constant
+   55 | #define free(x) myfree(__FILE__, __LINE__, x)
+      |                        ^~~~~~~~
+/ubinux-dev/ubinux001/contribution/build/tmp/work/armv7vet2hf-neon-poky-linux-musleabi/paho-mqtt-c/1.3.2-r0/git/src/Heap.h:55:34:
+error: expected declaration specifiers or '...' before numeric constant
+   55 | #define free(x) myfree(__FILE__, __LINE__, x)
+      |                                  ^~~~~~~~
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ src/MQTTReasonCodes.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/MQTTReasonCodes.c b/src/MQTTReasonCodes.c
+index 416eab5..479dbac 100644
+--- a/src/MQTTReasonCodes.c
++++ b/src/MQTTReasonCodes.c
+@@ -16,10 +16,10 @@
+ 
+ #include "MQTTReasonCodes.h"
+ 
+-#include "Heap.h"
+ #include "StackTrace.h"
+ 
+ #include <memory.h>
++#include "Heap.h"
+ 
+ #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
similarity index 56%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.1.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
index fa249677e..fa8c714ce 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.2.bb
@@ -6,14 +6,15 @@ LICENSE = "EPL-1.0 | EDL-1.0"
 
 LIC_FILES_CHKSUM = " \
         file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
-        file://epl-v10;md5=659c8e92a40b6df1d9e3dccf5ae45a08 \
-        file://notice.html;md5=a00d6f9ab542be7babc2d8b80d5d2a4c \
-        file://about.html;md5=dcde438d73cf42393da9d40fabc0c9bc \
+        file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
+        file://notice.html;md5=943f861069889acecebf51dfa24478e2 \
+        file://about.html;md5=e5662cbb5f8fd5c9faac526e4077898e \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
+SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http \
+           file://0001-Fix-bug-of-free-with-musl.patch"
 
-SRCREV = "d34c51214f4172f2e12bb17532c9f44f72a57dd4"
+SRCREV = "fbe39064c4416f879308a8a5390b19d544970789"
 
 DEPENDS = "openssl"
 
@@ -28,3 +29,7 @@ do_install_append() {
 }
 
 EXTRA_OECMAKE = "-DPAHO_WITH_SSL=ON"
+
+do_configure_prepend_libc-musl() {
+    sed -i -e "s/SET(LIBS_SYSTEM c dl pthread anl rt)/SET(LIBS_SYSTEM c dl pthread rt)/g" ${S}/src/CMakeLists.txt 
+}
-- 
2.17.1



