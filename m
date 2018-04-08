Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB5FC7423E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 20:14:34 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l49so6671854wrl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 13:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dlDQ004J+bX5KxPgrn7HJJQ0LVRwI5NibFPBooL0e5k=;
	b=GudQ4OtvGiamuhTBBOI85AjsfXPPL6hr16K2EUkaPY+4sqXO0yy0Ex5g6ployxF07Y
	Bi7NyHXOsMf00vK/2u+2Eu2inssExStQrLSsqAtafwfyFAJfLAWsFnZYahExBOOz9vWI
	gRzwN/JjEx9zMhk+aQ1UlVfXmcNbX8cDF85LieVomZiTCPIow6YE72GZVgNlY3z7kZV5
	HX0Jm5ZGr9BaXYoB6+IHG/RzzpAk85RqhSj12oFAm3Ozbg1qXTP/pmhsck5oQQs0zkS4
	05arpdLczj0y28uxOWugklwBFyKN6tLeNR8L9AZTTIpsUUZc7XdpbszN66l1O+xP1Lhs
	AHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dlDQ004J+bX5KxPgrn7HJJQ0LVRwI5NibFPBooL0e5k=;
	b=FEclQCUsflozQJbLenVgj060QlkOYsiEYZpmUtiYFZfjAe1nJI9C/y72MD2k3zFb8E
	dJ07bL8NEvYgNNNwT4UvHScLTBs1t5FVP7AVQYupVOGMKaKiqBh1ZX4P1lhbtqXTgoiP
	jJmXJqAhJkH/AsHp4R2RFdSWtSvMJ+LWBtiFr9ZlGARWwzqGq6i47LXqyCH6rFybLUan
	15z8U/l/ncqaToihU9/YBemOogMCsW2R9jv9JL1T9gJlZH6xC+uUTF83AuQimNzokIKd
	E5nIzLjo7MzRQ7J6PGReL8Zz3ERB1sMXVd+D5KSqqU8FKpcDPlJ+0pfl+dFYsn2uQbvl
	dMdA==
X-Gm-Message-State: AElRT7GBz2hs/7/Dhyz7UpFS/9PZo6L9x0ept+nm1sn1D2iQ/ilyBYwG
	7Q0bEHyHq49TSEc3NTDfTxLwPQ==
X-Google-Smtp-Source: AIpwx4/go1vlrzohoCyB8bZ9KaXVfS1+C3kRcp7OBqWo4eBF90mwAgR/k7JEl1VU0/PyOEAMduDXQQ==
X-Received: by 10.223.195.142 with SMTP id p14mr26127480wrf.32.1523218475423; 
	Sun, 08 Apr 2018 13:14:35 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e8sm39728797wmf.15.2018.04.08.13.14.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 08 Apr 2018 13:14:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Apr 2018 20:14:40 +0000
Message-Id: <20180408201440.31986-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180408201440.31986-1-Martin.Jansa@gmail.com>
References: <20180408201440.31986-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] android-tools: use fixed SRCREVs instead of tag name
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
X-List-Received-Date: Sun, 08 Apr 2018 20:14:35 -0000

* so that bitbake doesn't need to use git ls-remote during parsing to resolve tag name into SRCREV

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../android-tools/android-tools_5.1.1.r37.bb           | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 5d8f8a8435..780ecaa11a 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = " \
 "
 DEPENDS = "libbsd libpcre openssl zlib libcap"
 
-ANDROID_TAG = "android-5.1.1_r37"
 ANDROID_MIRROR = "android.googlesource.com"
 CORE_REPO = "${ANDROID_MIRROR}/platform/system/core"
 EXTRAS_REPO = "${ANDROID_MIRROR}/platform/system/extras"
@@ -17,12 +16,19 @@ LIBHARDWARE_REPO = "${ANDROID_MIRROR}/platform/hardware/libhardware"
 LIBSELINUX_REPO = "${ANDROID_MIRROR}/platform/external/libselinux"
 BUILD_REPO = "${ANDROID_MIRROR}/platform/build"
 
+# matches with android-5.1.1_r37
+SRCREV_core = "2314b110bdebdbfd2d94c502282f9e57c849897e"
+SRCREV_extras = "3ecbe8d841df96127d7855661293e5ab6ba6c205"
+SRCREV_libhardware = "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
+SRCREV_libselinux = "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
+SRCREV_build = "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
+
 SRC_URI = " \
-    git://${CORE_REPO};name=core;protocol=https;nobranch=1;destsuffix=git/system/core;tag=${ANDROID_TAG} \
-    git://${EXTRAS_REPO};name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras;tag=${ANDROID_TAG} \
-    git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware;tag=${ANDROID_TAG} \
-    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux;tag=${ANDROID_TAG} \
-    git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build;tag=${ANDROID_TAG} \
+    git://${CORE_REPO};name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
+    git://${EXTRAS_REPO};name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
+    git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware \
+    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux \
+    git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build \
     file://remove-selinux-android.patch \
     file://use-capability.patch \
     file://use-local-socket.patch \
-- 
2.15.1


