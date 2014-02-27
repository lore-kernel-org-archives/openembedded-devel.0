Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD2F6F41C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:20:48 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id f8so39555wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AZKQMqSlYrqvb82jel1NzRDUFSLXyDXNrVaDUsL4oRU=;
	b=gBdxGn0nLT/jiELy8tO62uTj9lLi3VnB6Yn20y6JuedzMihmqUViTlEciKTeg5LDHr
	jhAJ6CFuvh3z9tC+/cEPwi7CsWmnJF2mEYlJkNlurlvmXXYjzNJ2DoP5GAChFfHiQKet
	C6j4ExhmZ+uPaR3kZmVHM14d61qKILJ9C1AJHCcbiX4Rjh+8hyWYmcYf5RbRrURQbV3K
	DjanjKo2vQjMeJo4WWjcDC/cxdMDmcdmUUD2v6srpOvI7YqOB8DZNXNkaIvQ1C6arjMW
	Bq2gLX/krK5GhsP29RgoXimGfwSzAh80tt/7DocLvxxfxz8/KGx12tIJFxGgB1S10YxW
	biDg==
X-Gm-Message-State: ALoCoQmx+TSu4zGEEE8rkX/7fcT2QRDrwj0DI12UKnxNQI8kXgJiIaqGh6S5sgPFfKxbEAsw0Gkv
X-Received: by 10.194.81.196 with SMTP id c4mr5060786wjy.57.1393539648921;
	Thu, 27 Feb 2014 14:20:48 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id ju6sm14526019wjc.1.2014.02.27.14.20.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 14:20:48 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 23:20:38 +0100
Message-Id: <1393539638-18126-4-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393539638-18126-3-git-send-email-nicolas.dechesne@linaro.org>
References: <1393539638-18126-1-git-send-email-nicolas.dechesne@linaro.org>
	<1393539638-18126-2-git-send-email-nicolas.dechesne@linaro.org>
	<1393539638-18126-3-git-send-email-nicolas.dechesne@linaro.org>
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
X-List-Received-Date: Thu, 27 Feb 2014 22:20:50 -0000

From: Andre McCurdy <armccurdy@gmail.com>

If qtbase is configured with openssl support then the
qtwebkit browser example apps require CA certificates.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
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


