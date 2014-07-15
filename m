Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 52EAD70596
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:19:51 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so4370674wib.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j8ocjcLaO39MAL9MBjIZgDFA91JW+Ce7uNLwQbB3SMI=;
	b=mTg9Fx81IAI6CgcO5V8jrkho6FQtbREZlV9ZFndX1+PyOTyeoxMnE5dRTphwogd0Xr
	ncWgIhw2suA60I1kEAAafSoeHjqikTF1fHxNblOKoykfAictA1OTUZpJDJA/MXHLpdZb
	07I8w5BEO8ehhaZqcuJYfkYLim4xLypJV5CbO5kVswj1ihOQGN9G5FOd5/hCH/gCSMnN
	uaN84XfXhOUt4C1RfaBtk2S5Sf28ifMsDKEMNBayQhGf5CUjWYk2FV5YlelotZdnbwFG
	0s8EmQ4TlwK1H0zds/QO6HtCzbjEraFs6t5JfgeNOKPOjNYLEaTqrdzzcv0sjsuWCm4Y
	bFWw==
X-Received: by 10.194.187.101 with SMTP id fr5mr4967239wjc.125.1405430392386; 
	Tue, 15 Jul 2014 06:19:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wd7sm31521971wjc.36.2014.07.15.06.19.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 06:19:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 15:19:58 +0200
Message-Id: <1405430398-32283-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405430398-32283-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405430398-32283-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] navit, usbpath: add missing pkgconfig inherit
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
X-List-Received-Date: Tue, 15 Jul 2014 13:19:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/navit/navit.inc     | 2 +-
 meta-oe/recipes-support/usbpath/usbpath_svn.bb | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index eb8f43a..4347436 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -15,7 +15,7 @@ RSUGGESTS_${PN} = "flite-alsa espeak ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-q
 PE = "1"
 INC_PR = "r11"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 PACKAGECONFIG ?= "qt"
 PACKAGECONFIG[fribidi] = "--enable-fribidi,--disable-fribidi,fribidi"
diff --git a/meta-oe/recipes-support/usbpath/usbpath_svn.bb b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
index 001683e..0ec9324 100644
--- a/meta-oe/recipes-support/usbpath/usbpath_svn.bb
+++ b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
@@ -15,5 +15,4 @@ SRC_URI = "svn://svn.openmoko.org/trunk/src/host;module=usbpath;protocol=http"
 
 S = "${WORKDIR}/usbpath"
 
-inherit autotools
-
+inherit autotools pkgconfig
-- 
2.0.0


