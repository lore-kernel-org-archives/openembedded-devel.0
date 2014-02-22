Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 235746B7AD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 14:33:54 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so2196829eei.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 06:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l0EAMIwRSQOwWOnIEwbGC0FyWCfICclSqvRnZIoOY4U=;
	b=pJ+3Jy/tjM4gB27YJyuOYhpVOrVUnvis9pPK4b1hp839MoYfnez1/uAfrTLQnG/Utu
	6E6thgnhyCi28lQMvkVtOHaLm7O4Fxvjzr9TqyHCNfHefelTkTyssCfDSoJwCq/ZZJ0f
	NZq7HIhPLPFsB0VTnsnx7wsCTGQ2rfokEVAJOsjq/36NUWjhd4afDJ/NOraql4NhCxsq
	o11k49DdaoCZUoRFBmZFysceHD3gstrK4EJ8fgNBq2ov33dpMPxfiS9jq43zLmKiZgzD
	ENzjxMrl5XibS0A18kxQQgr2CeqIGqqcDHcCBG9ml0GETI59J7YSioKfOFryMgLIuJpq
	tuAg==
X-Received: by 10.14.3.72 with SMTP id 48mr14889815eeg.34.1393079635197;
	Sat, 22 Feb 2014 06:33:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j42sm39524074eep.21.2014.02.22.06.33.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 06:33:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Feb 2014 15:34:29 +0100
Message-Id: <1393079669-10800-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <20140222133327.GO3854@jama>
References: <20140222133327.GO3854@jama>
Subject: [PATCH] rage, emprint, news: Move to nonworking
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
X-List-Received-Date: Sat, 22 Feb 2014 14:33:57 -0000

* if you want to use these modules with E18, then you need to update
  them to git recipes fetching newer sources from
  http://git.enlightenment.org/enlightenment/modules/news.git/
  http://git.enlightenment.org/apps/rage.git/
  http://git.enlightenment.org/apps/emprint.git/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/emprint_svn.bb | 12 ------------
 meta-efl/recipes-efl/e17/news_svn.bb    | 12 ------------
 meta-efl/recipes-efl/e17/rage_svn.bb    | 13 -------------
 3 files changed, 37 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/emprint_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/news_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/rage_svn.bb

diff --git a/meta-efl/recipes-efl/e17/emprint_svn.bb b/meta-efl/recipes-efl/e17/emprint_svn.bb
deleted file mode 100644
index 777e302..0000000
--- a/meta-efl/recipes-efl/e17/emprint_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Emprint is a utility for taking screenshots of the entire screen, a specific window, or a specific region."
-LICENSE = "MIT BSD"
-DEPENDS = "imlib2 virtual/libx11 ecore evas edje eina"
-PV = "0.0.1+svnr${SRCPV}"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
diff --git a/meta-efl/recipes-efl/e17/news_svn.bb b/meta-efl/recipes-efl/e17/news_svn.bb
deleted file mode 100644
index 9b89d80..0000000
--- a/meta-efl/recipes-efl/e17/news_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-PV = "0.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-do_configure_prepend() {
-    sed -i -e /po/d configure.ac 
-    sed -i -e s:\ po::g Makefile.am
-}
diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/e17/rage_svn.bb
deleted file mode 100644
index 3cf576f..0000000
--- a/meta-efl/recipes-efl/e17/rage_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Rage is a media center application based on EFL"
-AUTHOR = "Carsten 'The Rasterman' Haitzler"
-HOMEPAGE = "http://www.rasterman.com"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-DEPENDS = "emotion evas ecore edje"
-SECTION = "x11/multimedia"
-PV = "0.3.0.042+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-- 
1.8.5.3


