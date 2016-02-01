Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9672B731C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 15:01:09 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l66so74408395wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 07:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mUdmxaUbIt0hVrxOSDYtxoDV32EJ3FQMYrbVYMZznEQ=;
	b=fOvY/fVuaWOOGg4RdG+btZCFtL37P5UhKlx24l5rB/M1aGvwvVGAvMboc/SoRjAyD0
	nzylcIUkQDH5rVGnRl9cQho2wuigoVACXokaPsUMLtw0p05qCWxXz9vP37wMeNhfjxYr
	nrXhk9Ck0ChSCaRVh3aY4IMcyuGU6T5NLbC/ecpXpUCF39yWrTfp/ew4VXoTN4GxKXvD
	REEb1VfWogCOUPzPgdsso9WnutGQ4MeCsE2UweVpH0Mx7lC8+6Jy4M4PTsKUFKKxQfTT
	Zs/AA9cSnUojxyxJzs1HrljeQOEUMfEr2+aO6sbbfyt/HDiSJhjq+//voCm5Ihys/AEb
	qPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mUdmxaUbIt0hVrxOSDYtxoDV32EJ3FQMYrbVYMZznEQ=;
	b=e3TPLL8EN+DmUieLyD8fPRubDPIEgYCA9VwpKicxufVzNVEOWvijYnk6ebsXp8vvTY
	Q4BIITfDJZ3ywsaqqzOdV2/2VuCBH84fP3WhBXK+s46siXd2uYVb23Oabj4tt+m6VEs1
	KbIp0TMIpTt5hQ+hxc8jmHYE2tOX7b/lLZqFx9GPsBVHyDEvqpCZdQsW7CLQJpL+Ccu7
	sh2dLSU3EDSkNkGkNMJLjMBEpAH7iw8AEGHbFzKsPoZ9tGbiskuxSUPBdlLWaX7BO6va
	wA7Ttdv6xB9PS4Jd3V15/Dhm/zgKG7HqDQf2mI3xL0+TX02WIrMR3AzxcSdK1bvj+Zi3
	wb+g==
X-Gm-Message-State: AG10YOSxp7DHQERLYTP5pPAPyChb9DCjtAUCX2NsSIHQ3uWpa5t8jP/1Olms3ZdJ3fIzXw==
X-Received: by 10.28.175.209 with SMTP id y200mr11716835wme.70.1454338869757; 
	Mon, 01 Feb 2016 07:01:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jc7sm15037676wjb.33.2016.02.01.07.01.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 07:01:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Feb 2016 16:03:52 +0100
Message-Id: <1454339032-25564-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][meta-efl] webkit-efl: fix build with newer CMake 3.4 from oe-core
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
X-List-Received-Date: Mon, 01 Feb 2016 15:01:10 -0000

* cmake was upgraded in:
  commit 2a6e061712cfe9cb4738806a0c351a64e0d30144
  Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
  Date:   Fri Jan 22 15:37:32 2016 +0200

    cmake: update to 3.4.2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...sEfl.cmake-Fix-build-with-newer-CMake-3.4.patch | 30 ++++++++++++++++++++++
 meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch
new file mode 100644
index 0000000..0562634
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch
@@ -0,0 +1,30 @@
+From 993882f81fe991b8baf1099392703337cc13fac0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 27 Jan 2016 18:40:23 +0100
+Subject: [PATCH] OptionsEfl.cmake: Fix build with newer CMake 3.4
+
+* otherwise it fails with:
+  | CMake Error at Source/cmake/OptionsEfl.cmake:251 (CHECK_INCLUDE_FILES):
+  |   Unknown CMake command "CHECK_INCLUDE_FILES".
+* https://bugs.webkit.org/show_bug.cgi?id=150117
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/cmake/OptionsEfl.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/cmake/OptionsEfl.cmake b/Source/cmake/OptionsEfl.cmake
+index 1aa9002..05216d0 100644
+--- a/Source/cmake/OptionsEfl.cmake
++++ b/Source/cmake/OptionsEfl.cmake
+@@ -253,6 +253,7 @@ if (ENABLE_WEBGL OR WTF_USE_TILED_BACKING_STORE)
+         set(WTF_USE_EGL 1)
+         add_definitions(-DWTF_USE_EGL=1)
+     else ()
++        include(CheckIncludeFiles)
+         CHECK_INCLUDE_FILES("GL/glx.h" OPENGLX_FOUND)
+         add_definitions(-DWTF_USE_GLX=1)
+     endif ()
+-- 
+2.7.0
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb b/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
index 07cbd89..96ad830 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
@@ -6,6 +6,7 @@ SRC_URI += "\
     file://0003-FEBlendNEON.h-fix-missing-semicolon.patch \
     file://0004-Fix-the-build-with-EFL-1.12-https-bugs.webkit.org-sh.patch \
     file://0005-Fix-the-build-with-cmake-3.patch \
+    file://0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch \
 "
 SRC_URI[md5sum] = "90fa970ebf8646319d292c2bb5bff5db"
 SRC_URI[sha256sum] = "d8d21e27f4a21cd77c41914548c184ddb98693ba23851aa66c8e51c0be4b90b7"
-- 
2.7.0


