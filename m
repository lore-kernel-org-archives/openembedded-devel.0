Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id CE43C7C51E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 15:47:19 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x2IFlJSF022088
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 18 Mar 2019 16:47:19 +0100
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x2IFlILe000526;
	Mon, 18 Mar 2019 16:47:19 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A5A5D95182D;
	Mon, 18 Mar 2019 16:47:17 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Mar 2019 16:47:07 +0100
Message-Id: <20190318154707.20242-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190318144440.11580-1-andrej.valek@siemens.com>
References: <20190318144440.11580-1-andrej.valek@siemens.com>
Cc: vkc@connectedcars.dk
Subject: [OE-core][PATCH v2] nodejs: fix target ldflags using
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
X-List-Received-Date: Mon, 18 Mar 2019 15:47:20 -0000

 - do not drop target LDFLAGS
  - even if the target LDFLAGS have been specified, tools like torque was
    linked with system libraries

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../nodejs/nodejs/0006-Use-target-ldflags.patch    | 24 ++++++++++++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb  |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
new file mode 100644
index 000000000..c6d0cec4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
@@ -0,0 +1,24 @@
+The target LDFLAGS have been ignored. Tools like torque
+have been loaded from system libraries, even if a native
+one was the target.
+|$ ldd torque 
+|    libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1
+|    libcrypto.so.1.1 => /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
+|    libssl.so.1.1 => /usr/lib/x86_64-linux-gnu/libssl.so.1.1
+|    libicui18n.so.63 => not found
+|    libicuuc.so.63 => not found
+...
+
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff -Naur node-v10.15.1/deps/v8/gypfiles/common.gypi node-v10.15.1/deps/v8/gypfiles/common.gypi
+--- node-v10.15.1/deps/v8/gypfiles/common.gypi	2019-03-18 15:01:39.000000000 +0100
++++ node-v10.15.1/deps/v8/gypfiles/common.gypi	2019-03-18 15:04:08.628361308 +0100
+@@ -1106,6 +1106,7 @@
+             'cflags': [ '-fno-strict-aliasing' ],
+           }],
+         ],  # conditions
++        'ldflags+': [ '$(LDFLAGS)' ],
+       }],
+       ['OS=="solaris"', {
+         'defines': [ '__C99FEATURES__=1' ],  # isinf() etc.
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
index 17c9bb0c4..672cd8440 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0003-Crypto-reduce-memory-usage-of-SignFinal.patch \
            file://0004-Make-compatibility-with-gcc-4.8.patch \
            file://0005-Link-atomic-library.patch \
+           file://0006-Use-target-ldflags.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-torque.patch \
-- 
2.11.0


