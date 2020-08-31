Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.44323.1598838332342993696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 18:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,373,1592841600"; 
   d="scan'208";a="98715791"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Aug 2020 09:45:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B3F5148990DA
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 09:45:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 31 Aug 2020 09:45:31 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] paho-mqtt-c: upgrade 1.3.4 -> 1.3.5
Date: Mon, 31 Aug 2020 21:45:26 +0800
Message-ID: <1598881526-68512-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598881526-68512-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598881526-68512-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B3F5148990DA.A4B03
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-Fix-bug-of-free-with-musl.patch      | 39 -------------------
 ...o-mqtt-c_1.3.4.bb => paho-mqtt-c_1.3.5.bb} |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/files/0001-Fix-bug-of-free-with-musl.patch
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.4.bb => paho-mqtt-c_1.3.5.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/files/0001-Fix-bug-of-free-with-musl.patch b/meta-oe/recipes-connectivity/paho-mqtt-c/files/0001-Fix-bug-of-free-with-musl.patch
deleted file mode 100644
index 12f9e7abc..000000000
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/files/0001-Fix-bug-of-free-with-musl.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 96233a8382b9520293a48b08dc3b204a21205800 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Fri, 24 Apr 2020 00:53:19 +0900
-Subject: [PATCH] Fix bug of free() with musl
-
-This fixes build error with musl C library:
-/ubinux-dev/ubinux001/contribution/build/tmp/work/armv7vet2hf-neon-poky-linux-musleabi/paho-mqtt-c/1.3.2-r0/git/src/Heap.h:55:24:
-error: expected declaration specifiers or '...' before string constant
-   55 | #define free(x) myfree(__FILE__, __LINE__, x)
-      |                        ^~~~~~~~
-/ubinux-dev/ubinux001/contribution/build/tmp/work/armv7vet2hf-neon-poky-linux-musleabi/paho-mqtt-c/1.3.2-r0/git/src/Heap.h:55:34:
-error: expected declaration specifiers or '...' before numeric constant
-   55 | #define free(x) myfree(__FILE__, __LINE__, x)
-      |                                  ^~~~~~~~
-
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
----
- src/MQTTReasonCodes.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/MQTTReasonCodes.c b/src/MQTTReasonCodes.c
-index 416eab5..479dbac 100644
---- a/src/MQTTReasonCodes.c
-+++ b/src/MQTTReasonCodes.c
-@@ -16,10 +16,10 @@
- 
- #include "MQTTReasonCodes.h"
- 
--#include "Heap.h"
- #include "StackTrace.h"
- 
- #include <memory.h>
-+#include "Heap.h"
- 
- #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.4.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.5.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.4.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.5.bb
index 2d4e39bf9..673a24742 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.4.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.5.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = " \
     file://about.html;md5=e5662cbb5f8fd5c9faac526e4077898e \
 "
 
-SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http \
-           file://0001-Fix-bug-of-free-with-musl.patch"
+SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
 
-SRCREV = "2d3d0941a9233889d4d5cc37f5182bbefea261ad"
+SRCREV = "153dfd3a4a1d510697c5d55e169fa158db16e04a"
 
 DEPENDS = "openssl"
 
-- 
2.25.1



