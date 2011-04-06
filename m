Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7RC8-0003bB-OV
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 13:46:44 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1044428fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=kN7nruDFFiXCidGY5ia1zPCKtnBpl931LvUFFkdL6w0=;
	b=ZYe8fWnEord76En0P/UKzHBufAu0J2JdN2VWDLW0ZzdLMw61J5BnKhGswWK5fS7gL3
	27QoBa8quYTTIKck6mMc1i5r440tuQ+whXt69Hx2G72pbqyyOXk98CwYNdZqNpYewIkZ
	GBehVwEzQ3YwZR/3xe4VZd0rcRYC+dejfT0n0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NM9XwzGmoU4G+rObgAp/b59O/JkOw8DPQ/7dij3kfqlUpCBzqBwIVIUCoR9iwFCHdP
	lIwL1lAR0iWxpMTqOqrdP/j+t0yvw4B1S+8wURqgGt2zQtwYU9LnTbEdnD0lbG4QGHdH
	cQcaIpq5WXJdBILPWa9Wekt1PFD3oUCbSE78o=
Received: by 10.223.58.72 with SMTP id f8mr909279fah.137.1302090279760;
	Wed, 06 Apr 2011 04:44:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l2sm161472fam.29.2011.04.06.04.44.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 04:44:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 13:44:07 +0200
Message-Id: <1302090248-16251-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
References: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] om-gta0*: drop xf86-input-tslib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2011 11:46:44 -0000

* not compatible with xserver-1.10 ABI
* needs PR bump in xserver-xorg-conf/task-x11

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/om-gta01.conf                         |    1 -
 conf/machine/om-gta02.conf                         |    1 -
 .../xserver-xorg-conf/om-gta01/xorg.conf           |    3 +--
 .../xserver-xorg-conf/om-gta02/xorg.conf           |    3 +--
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/conf/machine/om-gta01.conf b/conf/machine/om-gta01.conf
index 97ba716..3171797 100644
--- a/conf/machine/om-gta01.conf
+++ b/conf/machine/om-gta01.conf
@@ -22,7 +22,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "285"
 XSERVER ?= "xserver-xorg \
-           xf86-input-tslib \
            xf86-input-evdev \
            xf86-video-fbdev \
            xf86-input-keyboard \
diff --git a/conf/machine/om-gta02.conf b/conf/machine/om-gta02.conf
index 002fd64..e28b47f 100644
--- a/conf/machine/om-gta02.conf
+++ b/conf/machine/om-gta02.conf
@@ -24,7 +24,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "285"
 XSERVER ?= "xserver-xorg \
-           xf86-input-tslib \
            xf86-input-evdev \
            xf86-video-glamo \
            xf86-input-keyboard \
diff --git a/recipes/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf
index e957e41..edb5e0e 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf
+++ b/recipes/xorg-xserver/xserver-xorg-conf/om-gta01/xorg.conf
@@ -32,9 +32,8 @@ EndSection
 
 Section "InputDevice"
 	Identifier	"Touchscreen"
-	Driver		"tslib"
+	Driver		"evdev"
 	Option		"Device"	"/dev/input/event1"
-	Option		"EmulateRightButton"	"1"
 EndSection
 
 Section "ServerFlags"
diff --git a/recipes/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf
index 8b116fc..de6ed1c 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf
+++ b/recipes/xorg-xserver/xserver-xorg-conf/om-gta02/xorg.conf
@@ -38,9 +38,8 @@ EndSection
 
 Section "InputDevice"
 	Identifier	"Touchscreen"
-	Driver		"tslib"
+	Driver		"evdev"
 	Option		"Device"	"/dev/input/event1"
-	Option          "EmulateRightButton"    "1"
 EndSection
 
 Section "ServerFlags"
-- 
1.7.4.1



