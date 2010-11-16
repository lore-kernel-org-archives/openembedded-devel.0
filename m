Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PIMIl-0002fg-EG
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 15:14:29 +0100
Received: by mail-fx0-f47.google.com with SMTP id 11so488609fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 06:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=WaDVSEZUsIgkSje/vyXxjNLROEFPVtDmZN4GuJUBBSc=;
	b=t9B4dc57h8jGEJuzuy2D961NzsFhsgrCQ9JOfuDee3InZdQNu6zxVeITzx+U9vaQPH
	LEOJRtNZmRjU6LbKoPGrNBbsl1Da/sYlt0jOcc1O/CZ6xp10OJxHMAn7QudlNATVmFH0
	ElTNn3e1sBC+SLh9xhmQzaAhQuOEq+xm4MoQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=frLeAvGmWi327FQ61701qY6gCm/pmllHnOGo+1F6yIxf4nUI47D/85jktqLXmRxWf1
	9ptI8FJ/iQ08s96nC97xqdxiYsdtgPwyNl19gczZAdbUhq6cGLJHUHkpy2lx+iH4+Af/
	jvbsR60lLKox4EqExutAGUeXBBg+c5P7VEyF8=
Received: by 10.223.102.141 with SMTP id g13mr889015fao.133.1289916804576;
	Tue, 16 Nov 2010 06:13:24 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm458123faa.5.2010.11.16.06.13.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 06:13:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Nov 2010 15:13:19 +0100
Message-Id: <1289916799-21803-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1289916799-21803-1-git-send-email-Martin.Jansa@gmail.com>
References: <1289916799-21803-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] jlime,dzen2,puzzles: use RDEPENDS_${PN}
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
X-List-Received-Date: Tue, 16 Nov 2010 14:14:29 -0000

* it was fixed in whole tree about half year ago
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-June/020384.html
  http://comments.gmane.org/gmane.comp.handhelds.openembedded/33440
* then again about month ago
  http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg11356.html
* please follow OE packaging guidelines in new recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/dzen2/dzen2_svn.bb          |    4 ++--
 recipes/jlime/fileselector_1.1.bb   |    4 ++--
 recipes/jlime/fnkey_1.0.bb          |    4 ++--
 recipes/jlime/jlime-extras_1.0.1.bb |    4 ++--
 recipes/puzzles/stppc2x_svn.bb      |    4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes/dzen2/dzen2_svn.bb b/recipes/dzen2/dzen2_svn.bb
index fa10724..1ad6e82 100644
--- a/recipes/dzen2/dzen2_svn.bb
+++ b/recipes/dzen2/dzen2_svn.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "dzen is a general purpose messaging, notification and menu program."
 LICENSE = "MIT"
 DEPENDS = "virtual/libx11 libxft"
-RDEPENDS = "ttf-dejavu-sans xrandr"
+RDEPENDS_${PN} = "ttf-dejavu-sans xrandr"
 
 SRCREV = "271"
 PV = "0.8.5+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "svn://dzen.googlecode.com/svn/;module=trunk;proto=http \
 	   file://dzen-extras.tar.gz \
diff --git a/recipes/jlime/fileselector_1.1.bb b/recipes/jlime/fileselector_1.1.bb
index 6a4929d..e5e01cc 100644
--- a/recipes/jlime/fileselector_1.1.bb
+++ b/recipes/jlime/fileselector_1.1.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Fileselector is an SDL-based file chooser dialog"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "virtual/libsdl libsdl-ttf"
-RDEPENDS = "ttf-dejavu-sans-condensed"
+RDEPENDS_${PN} = "ttf-dejavu-sans-condensed"
 
 SRC_URI = "http://jlime.com/downloads/development/software/fileselector-${PV}.tar.gz"
 
diff --git a/recipes/jlime/fnkey_1.0.bb b/recipes/jlime/fnkey_1.0.bb
index fc09eeb..6f24da4 100644
--- a/recipes/jlime/fnkey_1.0.bb
+++ b/recipes/jlime/fnkey_1.0.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Emulates Fn key by simulating multiple keypresses."
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
-RDEPENDS = "xdotool"
+RDEPENDS_${PN} = "xdotool"
 
 SRC_URI = "file://fnkey.c"
 
diff --git a/recipes/jlime/jlime-extras_1.0.1.bb b/recipes/jlime/jlime-extras_1.0.1.bb
index 9b7b907..c3dd483 100644
--- a/recipes/jlime/jlime-extras_1.0.1.bb
+++ b/recipes/jlime/jlime-extras_1.0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Various extras for the Jlime userlands"
-PR = "r0"
+PR = "r1"
 
-RRECOMMENDS = "jlime-extras-${MACHINE}"
+RRECOMMENDS_${PN} = "jlime-extras-${MACHINE}"
 
 PACKAGE_ARCH = "all"
 SRC_URI = "http://jlime.com/downloads/development/software/${PN}-${PV}.tar.gz"
diff --git a/recipes/puzzles/stppc2x_svn.bb b/recipes/puzzles/stppc2x_svn.bb
index 380a753..8e6d4f2 100644
--- a/recipes/puzzles/stppc2x_svn.bb
+++ b/recipes/puzzles/stppc2x_svn.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "stppc2x is an SDL port of Simon Tatham's Portable Puzzle Collecti
 LICENSE = "GPLv2"
 
 DEPENDS = "virtual/libsdl libsdl-image libsdl-ttf"
-RDEPENDS = "ttf-dejavu-sans-condensed"
+RDEPENDS_${PN} = "ttf-dejavu-sans-condensed"
 
 SRCREV = "185"
 PV = "1.0+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 FILES_${PN} = "/usr/bin /usr/share"
 
-- 
1.7.3.2



