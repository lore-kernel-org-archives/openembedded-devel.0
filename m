Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiER6-0007Ro-17
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 02:15:14 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1323106eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 17:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JHsjbjQQFhM+x2V/ECAQ9CwH2De9DvFoHNz6UnvHNrc=;
	b=GGnjG5laojrCwaEu5otRng6N/ukQxom0eRNDBxEEw4BRYNGLkZ5dMJyqjEakGKUIi2
	P2O2vkdeDHFFhi52II9bnoqiY6GXPQW7gvCZ46CL1aaf5+MIfax+YaHR02oDM7Py025+
	ALqm82y2hovMEb4XS3NoHuchCJtDatECEfANjC51C6HQykLtQcKevML89hISm6B+l1uO
	bxdNrfA1uIonvfm3JUSEN7SrGITDvwK6d7szDvuuk0xFgjETmv0eXMQn/SjM5E4eANWk
	irkADZbP0gqng42YeYY3C7f4RHUnrcpnr513vZHeyfU3bOGbrWlaPoAXG4Ya/Ji99fOn
	LlVw==
Received: by 10.14.204.198 with SMTP id h46mr46832945eeo.1.1355187632869;
	Mon, 10 Dec 2012 17:00:32 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 44sm46644628eek.0.2012.12.10.17.00.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 17:00:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 01:59:58 +0100
Message-Id: <c3494762a34fce44d9b0103047d864ad58c36d30.1355187290.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1355187290.git.Martin.Jansa@gmail.com>
Subject: [PATCH 86/90] vlc: disable kde-solid
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
X-List-Received-Date: Tue, 11 Dec 2012 01:15:14 -0000

* fixes:
  WARNING: QA Issue: vlc: Files/directories were installed but not shipped
  /usr/share/kde4
  /usr/share/kde4/apps
  /usr/share/kde4/apps/solid
  /usr/share/kde4/apps/solid/actions
  /usr/share/kde4/apps/solid/actions/vlc-opendvd.desktop
  /usr/share/kde4/apps/solid/actions/vlc-openvcd.desktop
  /usr/share/kde4/apps/solid/actions/vlc-opencda.desktop

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/vlc/vlc.inc       | 2 +-
 meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-multimedia/vlc/vlc.inc
index 7353f90..1ccda70 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc.inc
+++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
@@ -62,6 +62,7 @@ EXTRA_OECONF = "\
 	--enable-dbus \
 	--disable-hal \	
 	--without-contrib \
+	--without-kde-solid \
 	--disable-opengl --disable-glx \
 	--enable-realrtsp \
 	ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
@@ -82,4 +83,3 @@ do_configure() {
 	sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
 	sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
 }
-
diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
index 6ef0b6b..7bb6b16 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed7e492ee44e70125a5d42e118354a13"
 
 require vlc.inc
 
-PR = "r2"
+PR = "r3"
 
 # work around build failure
 EXTRA_OECONF += " --enable-libxml2=no"
-- 
1.8.0



