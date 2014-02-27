Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 96C796F301
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:16:11 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so3403949wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FUAuZkGYV0uqXVn5ErNTkTlT18AaucCJeskTB4rQ4OE=;
	b=J112urR4mTHxA/wQZ4d6T4pFnml1hBWcLgH+G/j5yM0vvkxMygMlfgmMooUJnAtOtU
	H7e+3WEy2SNVQk/ldsKcQI2hfFdoVvhIIlwnvLYB3GLkNkhyp0kT+YtrxRs8vi6jjkWz
	+W2qQUIBSbAIoIi8/UpeiDBepziBGhoE1JIpGZP2I+oQOsV4YrDQrpJSLwJ0r1mvOfZ6
	PucWi79hIzLQs8qsCxtwvcEwmKZVZa2pRV/GjEi4lOJD+g8EyLJ8m7WrGGBAkSusKjxQ
	UR+d+zfClL1BbPPKcbTSXuP3bUhSXxX4ffgbK/wDD8e8yWrmND/reWuPH3faPuTaItHt
	eg8w==
X-Gm-Message-State: ALoCoQnZNOzDHP6MExTrBQ0s0DbyDbOJsJpEWBOg9PrPCfuhMh365lbuUQKDYDiqq6A0b2MLfljK
X-Received: by 10.194.91.232 with SMTP id ch8mr10286570wjb.13.1393539371968;
	Thu, 27 Feb 2014 14:16:11 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63]) by mx.google.com with ESMTPSA id
	bj3sm14499950wjb.14.2014.02.27.14.16.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 14:16:11 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 23:16:00 +0100
Message-Id: <1393539360-17923-4-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393539360-17923-3-git-send-email-nicolas.dechesne@linaro.org>
References: <1393539360-17923-1-git-send-email-nicolas.dechesne@linaro.org>
	<1393539360-17923-2-git-send-email-nicolas.dechesne@linaro.org>
	<1393539360-17923-3-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH dora v2 3/3] qtwebkit-examples: add RDEPENDS for ca-certificates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2014 22:16:12 -0000

From: Andre McCurdy <armccurdy@gmail.com>

If qtbase is configured with openssl support then the
qtwebkit browser example apps require CA certificates.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Conflicts:
	recipes-qt/qt5/qtbase.inc

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 recipes-qt/qt5/qt5.inc               | 2 ++
 recipes-qt/qt5/qtbase.inc            | 4 +++-
 recipes-qt/qt5/qtwebkit-examples.inc | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 7669efc..d9ebbff 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -7,6 +7,8 @@ inherit qmake5
 ICU = "icu "
 ICU_powerpc = "pango"
 
+PACKAGECONFIG_OPENSSL ?= "openssl"
+
 QT_MODULE ?= "${BPN}"
 
 # we don't want conflicts with qt4
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 4f81f8e..eb22e40 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -43,6 +43,8 @@ PACKAGECONFIG_FONTS ?= ""
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
 PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG_DISTRO ?= ""
+# This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
+# PACKAGECONFIG_OPENSSL ?= "openssl"
 
 PACKAGECONFIG ??= " \
     release \
@@ -50,7 +52,7 @@ PACKAGECONFIG ??= " \
     udev \
     evdev \
     widgets \
-    openssl \
+    ${PACKAGECONFIG_OPENSSL} \
     ${PACKAGECONFIG_GL} \
     ${PACKAGECONFIG_FB} \
     ${PACKAGECONFIG_X11} \
diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebkit-examples.inc
index 50c28cd..84f16a4 100644
--- a/recipes-qt/qt5/qtwebkit-examples.inc
+++ b/recipes-qt/qt5/qtwebkit-examples.inc
@@ -10,3 +10,4 @@ SRC_URI += " \
 
 DEPENDS += "qtwebkit"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
+RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
-- 
1.9.0


