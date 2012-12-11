Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiER7-0007Rq-Ao
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 02:15:14 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1323108eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 17:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7QixNVbLbLTOS+po5XkxbH4PULWaW/w47KW8WSh/vbM=;
	b=tJvIJBwwiAMaTvAFV6R8xEvciNfn1J6VKn32oh3yYJ86zsPjxWtMBz1vbygqmL4BWI
	5JOxYYwN39x5+a4q4iSENQnxETBAcAWhA0McvYG8OliLipzCOfkzEmdeuuIXYconQnhR
	wye5axCEQ42Ur7DJsbql7DfxlkGRNuN9Zob4Au/JOgdC1cm76v7l+kE3LoOIPYQ7ZyvG
	JUobLYh2xUDddRpVIH8P9wl+ADGmI2y1jlZeVC+29GKrczHLoA5tIekXc22o2WJ2P2DL
	Lx3UrXFtr8tAaLGVfBXfdpqfILi4t41flCIZC5tNl6QqauOCJOgZQypzferjiTHfKIpi
	fkrQ==
Received: by 10.14.221.9 with SMTP id q9mr55660813eep.3.1355187634126;
	Mon, 10 Dec 2012 17:00:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q44sm46640410eep.5.2012.12.10.17.00.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 17:00:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 01:59:59 +0100
Message-Id: <0d1d39da74e6b73c5b070f551373d21e2a15f98a.1355187290.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1355187290.git.Martin.Jansa@gmail.com>
Subject: [PATCH 87/90] vlc: add fluidsynth and alsa-lib to DEPENDS for reproducible builds
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

* fluidsynth can be autodetected

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/vlc/vlc.inc       | 2 +-
 meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-multimedia/vlc/vlc.inc
index 1ccda70..00d8663 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc.inc
+++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.videolan.org"
 LICENSE = "GPLv2"
 SECTION = "multimedia"
 
-DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm \
+DEPENDS = "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynth alsa-lib \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
index 7bb6b16..11ecaa4 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed7e492ee44e70125a5d42e118354a13"
 
 require vlc.inc
 
-PR = "r3"
+PR = "r4"
 
 # work around build failure
 EXTRA_OECONF += " --enable-libxml2=no"
-- 
1.8.0



