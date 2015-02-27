Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 52F7C737C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:56:18 +0000 (UTC)
Received: by wivr20 with SMTP id r20so2997994wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3cGuUqS7Cs6Xlhc1wnC57dWxb+NdhVGV/cgm+ozhAwE=;
	b=cszQabYoyCUPY9oEemvW9YPRS0TcYgaFUUH0/vU14gN6OaHlLPXzJ62jIVHGOambEy
	tj0LQnFa9BX0WusvGg/2f+9Hh9fdIG4sXG9uTLVkGc7LBXV6vwOQtrTRhLgaGWq+zhBL
	CsEAEOEVJ5DRyMfcgHfUHD9fWZJ96qH90FoNQaAmcgonuDO5bQ6e7wAuEmUnSxUmsrE8
	nP5OSNO/yFKkbg7UOY5WzdzGAU5RVwvYBUhc5dEbPri980vuMfZn5DnT1W8oXBG9BlfC
	6QNJiuBUfI2kHEyeIYcoTcJmzcm+Ru1lHxqgRtv7lE9fut+dV4PEk3kotzWUuBAY9+Oz
	8Rqg==
X-Received: by 10.194.97.139 with SMTP id ea11mr4980037wjb.108.1425070579913; 
	Fri, 27 Feb 2015 12:56:19 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch6sm7562360wjc.3.2015.02.27.12.56.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 12:56:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:56:29 +0100
Message-Id: <1425070591-28158-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 5/7] qtdeclarative, qtmultimedia, qtscript, qtsvl: Drop GPLv2
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
X-List-Received-Date: Fri, 27 Feb 2015 20:56:19 -0000

* LICENSE.GPLv2 was removed in 5.4.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtdeclarative.inc | 3 ---
 recipes-qt/qt5/qtmultimedia.inc  | 3 ---
 recipes-qt/qt5/qtscript.inc      | 3 ---
 recipes-qt/qt5/qtsvg.inc         | 3 ---
 4 files changed, 12 deletions(-)

diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
index 6969c23..4a186fd 100644
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ b/recipes-qt/qt5/qtdeclarative.inc
@@ -16,6 +16,3 @@ do_configure_prepend() {
 }
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 30e5ed0..68ae33d 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -23,6 +23,3 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gst
 SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtscript.inc b/recipes-qt/qt5/qtscript.inc
index 40e1d5c..bbb05a6 100644
--- a/recipes-qt/qt5/qtscript.inc
+++ b/recipes-qt/qt5/qtscript.inc
@@ -1,6 +1,3 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsvg.inc b/recipes-qt/qt5/qtsvg.inc
index 40e1d5c..bbb05a6 100644
--- a/recipes-qt/qt5/qtsvg.inc
+++ b/recipes-qt/qt5/qtsvg.inc
@@ -1,6 +1,3 @@
 require qt5.inc
 
 DEPENDS += "qtbase"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
-- 
2.3.1


