Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKotu-00073s-Pr
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 11:43:14 +0200
Received: by fxm19 with SMTP id 19so1839303fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=8CmsCVZycDPP3bjpBYGxinc947t5PuLajwU/6J5pUNc=;
	b=ULfMyghMo5/kX2VxsZjo69bMnOFy0NMg10QVoPKpw1+HaGRTq3Y+1U4cjPoaV5qRtN
	pjZuiJ5OaB7QD3fvPvo62YLi1c781RvdAFF1ugkar9Z2gvw6H8U+fXorWIzoZuMgovEN
	s/6o6guNJzI/fHF+DKGyDSkC7W7Bl50/4SuIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DROR36eIAWE3HRNonENB17QSxJ8FiTcDsGieEyAKr9uKx9ZuSXRn0eYb0+sAmWFZ1m
	CPrnt4YyXcwqvmqoyb/1FtcwUQIfxfEB+/6DIyt9cb7X1iCnTNVfVttLfvOqSAm8//KO
	NbkPBu7hwZTug+zbWUUaC0eks9xUK6ZH1G+7Q=
Received: by 10.223.75.133 with SMTP id y5mr1425875faj.136.1305279623441;
	Fri, 13 May 2011 02:40:23 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j11sm770152faa.44.2011.05.13.02.40.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 02:40:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 11:40:06 +0200
Message-Id: <1305279609-31395-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] om-gta0*: drop xf86-input-tslib
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
X-List-Received-Date: Fri, 13 May 2011 09:43:14 -0000

* not compatible with xserver-1.10 ABI
* elfe is not compatible with EmulateRightButton option too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/om-gta01.conf                         |    1 -
 conf/machine/om-gta02.conf                         |    1 -
 recipes/tasks/task-x11.bb                          |    2 +-
 .../xserver-xorg-conf/om-gta01/xorg.conf           |    3 +--
 .../xserver-xorg-conf/om-gta02/xorg.conf           |    3 +--
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 6 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/conf/machine/om-gta01.conf b/conf/machine/om-gta01.conf
index d952ad7..d14b0fd 100644
--- a/conf/machine/om-gta01.conf
+++ b/conf/machine/om-gta01.conf
@@ -21,7 +21,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "285"
 XSERVER ?= "xserver-xorg \
-           xf86-input-tslib \
            xf86-input-evdev \
            xf86-video-fbdev \
            xf86-input-keyboard \
diff --git a/conf/machine/om-gta02.conf b/conf/machine/om-gta02.conf
index d7a968a..033190c 100644
--- a/conf/machine/om-gta02.conf
+++ b/conf/machine/om-gta02.conf
@@ -23,7 +23,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "285"
 XSERVER ?= "xserver-xorg \
-           xf86-input-tslib \
            xf86-input-evdev \
            xf86-video-glamo \
            xf86-input-keyboard \
diff --git a/recipes/tasks/task-x11.bb b/recipes/tasks/task-x11.bb
index 1021bfb..107f0d1 100644
--- a/recipes/tasks/task-x11.bb
+++ b/recipes/tasks/task-x11.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The X Window System -- install this task to get a client/server b
 SECTION = "x11/server"
 LICENSE = "MIT"
 PV = "1.0"
-PR = "r7"
+PR = "r8"
 
 # WORK IN PROGRESS
 
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
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 5de24be..7cc8a5d 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r46"
+PR = "r47"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.5.rc3



