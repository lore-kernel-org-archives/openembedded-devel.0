Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4C13060E79
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 17:25:44 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id im17so1724115vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 10:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XwHLFehl9aYgKzK5f6DcE44rbM9eliyUy6gIkKKqWZs=;
	b=PTNq0ZP8fcO4Y4ILX6s60/H2gXj4+tLPTAFnXVLWhOleRXFvZJhxI4PTSUPpuk2UC1
	j8bQpQfYIDZo1j1Ij8PbyBaNZNPgBlLiKqIaHSHxF9mEb9slQjn/xkh9sOIF3BXSAD0h
	/U1xqqe+YyQRNgPxWe99xWJuOVdUf0rHZhPoYb/ZDLaeLlsHX1RVTPyHwr/ibPLRjp7l
	4vxVkgmsuryvz6IoA+elKGizsBY/o8T8ri8ltYV1ZCKZtmuUyaZDykz9RPKNIkMAKDi8
	56BOpRMdhDzW5s8GrU6hn8u47SzHi1ymzHIbVi/nNPP/EzmXQibqS9GjVk6hWtcMSPsw
	AKsQ==
X-Received: by 10.58.104.229 with SMTP id gh5mr11952405veb.8.1399483545819;
	Wed, 07 May 2014 10:25:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q6sm2430666vew.15.2014.05.07.10.25.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 10:25:45 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 19:26:04 +0200
Message-Id: <1399483564-18525-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-oe][WIP][PATCH] qtbase: add xcb-util-renderutil to xcb PACKAGECONFIG
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
X-List-Received-Date: Wed, 07 May 2014 17:25:45 -0000

* also force xcb-xlib and system-xcb just for consistency (configure script
  will disable xcb-xlib when compile-test fails)
* fixes test-dependencies issue:
  qtbase/qtbase-plugins/latest lost dependency on  libxcb-render xcb-util-renderutil

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index d6b45b7..1a25aa4 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -83,7 +83,7 @@ PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
-PACKAGECONFIG[xcb] = "-xcb,-no-xcb,xcb-util-wm xcb-util-image xcb-util-keysyms"
+PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
 PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
 PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql"
 PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
-- 
1.9.2


