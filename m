Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UCkex-00070B-UV
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Mar 2013 06:43:57 +0100
Received: by mail-ia0-f175.google.com with SMTP id k38so3523645iah.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2013 21:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ihs/MSmxLT6kdnlZ7s0Vj0kWnmfZ+g4ahra77aD7H00=;
	b=LlJ7FKoFeUwvC5Yz38QdegOV8fkFX1E2NQHsDzLhsglu83AlUZN+WUcyzTFoyvZc7k
	RALgd1NL1MCsJA/XSICVRfVBkJvDlD0JlIz5BTO+y6Sq8l/+VkJTFwFxbgNZJhO2uqrJ
	Fg33yd5xMV+822ilYAp4JEqgtN3HqvBzSifKR9xLj/hf8RMDWW/GS7dQJGbEFYzV0I7q
	gnwyNbeiltmWsfqvhqNl02xYxnoVSq3nRypEsxQIsPLNRMif3fyxDUjNsJbfepxX8Q6V
	8MTKGA4kBkfHX1BCIW3NDxGF1Fln+xSMjYowoeU/GxVRyw7l42fNfbYdNCAl6VR2JrQQ
	D1Fg==
X-Received: by 10.50.36.199 with SMTP id s7mr5048056igj.56.1362461222812;
	Mon, 04 Mar 2013 21:27:02 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ur12sm15319176igb.8.2013.03.04.21.27.01
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 21:27:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Mar 2013 21:26:38 -0800
Message-Id: <1362461198-11403-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1362461198-11403-1-git-send-email-raj.khem@gmail.com>
References: <1362461198-11403-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] bridge-utils: Upgrade to 1.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 05:44:04 -0000

Disable parallel make it does not work all the time
Fix build with kernel-headers from 3.8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../bridge-utils/bridge-utils/kernel-headers.patch |   22 ++++++++++++++++++++
 .../bridge-utils/bridge-utils_1.4.bb               |    6 ------
 .../bridge-utils/bridge-utils_1.5.bb               |   11 ++++++++++
 3 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils/kernel-headers.patch
 delete mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
 create mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.bb

diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils/kernel-headers.patch b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils/kernel-headers.patch
new file mode 100644
index 0000000..de36f05
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils/kernel-headers.patch
@@ -0,0 +1,22 @@
+include missing kernel header
+
+Fixes errors like
+
+| /b/kraj/jlinux-next/poky/build/tmp-eglibc/sysroots/re-64b/usr/include/linux/if_bridge.h:172:20: error: field 'ip6' has incomplete type
+| In file included from ../libbridge/libbridge.h:24:0,
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: bridge-utils-1.5/libbridge/libbridge.h
+===================================================================
+--- bridge-utils-1.5.orig/libbridge/libbridge.h	2011-03-28 17:52:54.000000000 -0700
++++ bridge-utils-1.5/libbridge/libbridge.h	2013-03-04 21:16:25.781188309 -0800
+@@ -20,6 +20,7 @@
+ #define _LIBBRIDGE_H
+ 
+ #include <sys/socket.h>
++#include <linux/in6.h>
+ #include <linux/if.h>
+ #include <linux/if_bridge.h>
+ 
diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
deleted file mode 100644
index 00a5815..0000000
--- a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require bridge-utils.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
-
-SRC_URI[md5sum] = "0182fcac3a2b307113bbec34e5f1c673"
-SRC_URI[sha256sum] = "876975e9bcc302aa8b829161ea3348b12b9b879f1db0dc98feaed8d0e5dd5933"
diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.bb b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.bb
new file mode 100644
index 0000000..04f863b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.bb
@@ -0,0 +1,11 @@
+require bridge-utils.inc
+
+SRC_URI += "file://kernel-headers.patch"
+
+PARALLEL_MAKE = ""
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
+
+SRC_URI[md5sum] = "ec7b381160b340648dede58c31bb2238"
+SRC_URI[sha256sum] = "42f9e5fb8f6c52e63a98a43b81bd281c227c529f194913e1c51ec48a393b6688"
+
-- 
1.7.9.5



