Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3059874C85
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 11:31:41 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id o78-v6so47175276wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0VbK6WsHqMW9AosjTBsAeujLelU9Ivv1yTDjWnl8Yfg=;
	b=h8wXOj+ZQXrF0yYuI4KaLkiHoPN/zHo4KLuc5uZGfl1R5hH5pG3ljbpugQ7FftOxUE
	bhUN0syIujuQt0WrZ8ftd/GlRcbLjbN9xqekMdI9SQwsauMOrP67bB5xTj2hMFyM99f6
	2aRaVd3FNRrZzlnq/x1/8+IldF5ZPIKdjAMtIimkpMj8acU6B7+fu/Gg3Km/FAejTGZ8
	CDXDlPt5YkDQadHhCS+glly/Toea8zAmYMo58pEWGsXUK9kpceQZM/mtHJyOUQchpXjn
	AM7KhJXvupABUIqT1boQRqbFDnHKUOUMIYzFp9xoh4uHjYa24Hzm3AdbTr2hO3m+yPWy
	Tp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0VbK6WsHqMW9AosjTBsAeujLelU9Ivv1yTDjWnl8Yfg=;
	b=ioB3xxR+Xh5fySj44HuNPalNea0nG6NX8w5I3RuAA61DYb/XbZKmB5EvFey7s1JmbG
	NBVkFv7O1LMaegPjaWHWw404G9Wkyy1nTIqcAbbNaoLeF/w24eyLgL2nbUZKJRCakB3r
	VSVI6U+P+BXcZbnGAsrIy2kOJtOVLLWIudnEo2+EypHUBlEbMl56DbhplUEZujfDlYpB
	BbwAReuQcIqqTZhxc6U96vbr7m8Z8VMahJ2j5JhqJdFv7fB3jIc6Gx8v71IxBT71Sv7R
	5NdwYc+40FyPLNm9QbWsT6pbvRcdZgzFr42BtwENodxmkhr8z7zWIFTUpbD7LqfwR/Lc
	TK3Q==
X-Gm-Message-State: ALKqPwcd8tUSc/K5vFekqQ7Zs0cTUU7PDqfr5ayxAfnYrzb+3NWMlczd
	fy6zj/AlBRH6eqfQNtNsN1rDpA==
X-Google-Smtp-Source: ADUXVKJSOtExF+Dj65cEapN6q9RccmZbl7izzm0RDHKCNSYfcXrI2Ln8R4dJs1NST5aEVTmjOf3ODA==
X-Received: by 2002:a1c:3391:: with SMTP id
	z139-v6mr1221368wmz.136.1527679902549; 
	Wed, 30 May 2018 04:31:42 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z8-v6sm40958391wrl.62.2018.05.30.04.31.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 04:31:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 11:31:26 +0000
Message-Id: <20180530113126.2954-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530113126.2954-1-Martin.Jansa@gmail.com>
References: <20180530113126.2954-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][resend][PATCH 2/2] android-tools: use fixed SRCREVs instead of tag name
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
X-List-Received-Date: Wed, 30 May 2018 11:31:42 -0000

* so that bitbake doesn't need to use git ls-remote during parsing to resolve tag name into SRCREV

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../android-tools/android-tools_5.1.1.r37.bb   | 18 ++++++++++++------
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
2.17.0


