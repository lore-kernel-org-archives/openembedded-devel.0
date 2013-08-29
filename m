Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD036BDD4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:26 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so339019eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=gwzMNRviq25+DesG2e8oo72nZMmkxfYKGtFo2wRmS6A=;
	b=qeOra/dd1Pi51G4L7mDmyB2XlqXhPZUTroO7WHUAFz9anKfOuN4lDDZt8oNP6eCZAu
	xUIEQBVvlC3vbpu6+kjgo17ok3hgnqfLLq+ND87bmvvf6mmcZKXwrz3SmX7TMBbxjdSN
	ZzsilhFzcft+Hlmplf/pzT+E5WYTQWvpGo+u+qHxanbZHeZ2rv/mUM0mZUOslQiGKmKg
	i7ir0P3XXbTLEVB3eUYBup+aqc6Zvb/adDQGOpqrdLrH2W+uaLnhby+0O0WkxYJE4emQ
	kKL/4dunlQBq1hq89pW5Y8tS8Puw9YiaE/gAeSiuFPppPvic0r6GYcfjViSB+vjg1gVK
	qXqA==
X-Received: by 10.14.224.198 with SMTP id x46mr5375253eep.53.1377791486846;
	Thu, 29 Aug 2013 08:51:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47155261eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:21 +0200
Message-Id: <ba1db1162459e2e4827b588b15f3c3cc58728820.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 28/66] libwnck(3): Add dependency on libxres
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:26 -0000

* it's autodetected from sysroot and configure doesn't allow to explicitly disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb | 2 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
index 5171576..51a6ab7 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 BPN = "libwnck"
 
 SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native"
+DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native libxres"
 
 PR = "r1"
 
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
index 661bc42..6d23e27 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 PR = "r2"
 
 SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-stub gtk+ gdk-pixbuf-native"
+DEPENDS = "gobject-introspection-stub gtk+ gdk-pixbuf-native libxres"
 
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-- 
1.8.3.2


