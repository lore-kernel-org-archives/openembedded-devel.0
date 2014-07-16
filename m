Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 577D960703
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 11:55:04 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so783329wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3mMrQTjouFQOz3nQ9mjmSkNYBDtk3TI45z5fF4MSSYQ=;
	b=vt15hN3kZj6jRJy3/xSYe+r9CpLAZJozwuiN3FMWE8YdY3zTx2l22cGw+54LWcer74
	3OafFz7GAYx91l7PinhLLD+ft4NiCs76CTuVq+mj2jpXjZ/wu0SvQGAzLKNTW/3vYg59
	OwIHyI5Jkar228DJqTPAKTkvDxkUUzzlgvVGYLELNTtziUEz6RnRhiY08IyaptmhCtK4
	olu06MYBFBi1jZ7k2RdEsSrvZgvfUer6T09O1aV7YRev5/9rlIKTJ12TPR5zQEKQ/1ay
	GDcx1+vBVbEJLMhFDSKr1fX03EM5yiu2H5FoWhi1vqCBhbLvGlxb+z9qGfjN5VeOWl47
	Wwlw==
X-Received: by 10.194.62.110 with SMTP id x14mr35440110wjr.15.1405511705289;
	Wed, 16 Jul 2014 04:55:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cz4sm55635608wib.23.2014.07.16.04.55.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 04:55:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jul 2014 13:55:13 +0200
Message-Id: <1405511713-19324-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-xfce][PATCH] xfconf: add dependency on xfce4-dev-tools-native
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
X-List-Received-Date: Wed, 16 Jul 2014 11:55:06 -0000

* we need it to provide xdt-features.m4

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
index 8a3416c..30d0de3 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Xfce configuration daemon and utilities"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "dbus-glib libxfce4util perl intltool-native"
+DEPENDS = "dbus-glib libxfce4util perl intltool-native xfce4-dev-tools-native"
 
 inherit xfce gtk-doc
 
-- 
2.0.0


