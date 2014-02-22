Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id D11EE6F171
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 05:31:24 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kp14so4381298pab.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uzyGpwZG0eMepha4h6iV2Kz8hV2cmusmo88ZDnmGGnI=;
	b=GOlJmcLGT5w8DRWmmz+iYlC3dfB7lP15d+NHaZtyv4MIlb1wS0UACt+Zlo1byc+Ryt
	ZEHa4xtCERrIAr780h5cIXsSiXW8Md/Y/kI0c/tcUsPGbHrmdhptC7jHabI6ndtiquD1
	LE+Ne1hQoyDpRv+YAMBlfn1/uaa6XO3mW/YSUcj1/gsvyibDs2KmEdgv0rl9QlXYmQbB
	OxUHdvCzPfyq1qAi1V2jwnUIaL1Jgfd6+kBWS6ZwfaGo6VdseU0/CsmMkvw49l9Ny7qk
	a7+qis+JQMYoDrSXbUzlc3qwbdPQF5qSosfUwcKuzwGcy0dJ5pkdLG/Mc87ZO7Slwke+
	o7Zg==
X-Received: by 10.66.182.199 with SMTP id eg7mr13341805pac.135.1393047085544; 
	Fri, 21 Feb 2014 21:31:25 -0800 (PST)
Received: from t420s.entropic-communications.com ([12.199.200.26])
	by mx.google.com with ESMTPSA id
	yg4sm64397153pab.19.2014.02.21.21.31.24 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 21:31:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2014 21:30:07 -0800
Message-Id: <1393047007-20507-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
References: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-qt5][PATCH v2 2/2] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Sat, 22 Feb 2014 05:31:26 -0000

If qtbase is configured with openssl support then the
qtwebkit browser example apps require CA certificates.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qt5.inc               | 2 ++
 recipes-qt/qt5/qtbase.inc            | 2 +-
 recipes-qt/qt5/qtwebkit-examples.inc | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 7e739c5..e2a1662 100644
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
index 6a0149a..d805c47 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -47,7 +47,7 @@ PACKAGECONFIG ??= " \
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
1.8.1.2


