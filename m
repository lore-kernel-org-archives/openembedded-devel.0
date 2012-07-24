Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1StaGe-0004CI-1a
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 10:14:56 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so4724362bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 01:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YGc6oUNvR0oklcgz5MkO+vBsKQeXnrA8vhhDJrqJFeU=;
	b=OjLUx7xlpPw50IcqD7I51kpkiGpp0D62Ma/7ffg62vgioRWNpZ+wdwkYdKNeqT9kno
	q1d28u+OhkF7nMmZHOKBAgSFK54JWbRMchRyPiop3jp+zHtHbtozllcLPkYlGIFwFjNn
	6RoPnrE6I8My2D/TmIFDpHDU06TMp7O+PDdMjQg0l7n4tOecSF6Mdgy9gNVxR4GcA1vJ
	L2DzGjh5guEZZ2CGj2kDn3gP84pmBi2RWj3PLBWDc6mQHJYKVljB+A7CGEMEhqwDBitm
	tLYZhaXwVong5/vUWI7fb/NCJadBKlMwt2UyHFO8BRihdZEI4FbkHHk1MmPZyMzX7Qnm
	h9KA==
Received: by 10.204.156.70 with SMTP id v6mr9393210bkw.66.1343117010219;
	Tue, 24 Jul 2012 01:03:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm9655881bkc.3.2012.07.24.01.03.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 01:03:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:02:57 +0200
Message-Id: <28f3d299e04a5996035db72bfcfc0c7794cf6470.1343116924.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] libbonoboui: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Tue, 24 Jul 2012 08:14:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/bonobo/libbonoboui_2.24.3.bb     |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
index cf37ccf..328183f 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
@@ -3,14 +3,14 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-inherit gnome pkgconfig
+inherit gnome pkgconfig gtk-doc
+
+PR = "r1"
 
 SRC_URI[archive.md5sum] = "3a754b1df0a4d5fd4836a05020a0bb4a"
 SRC_URI[archive.sha256sum] = "0be51ee3069a2ef21d98561ee28036dd263ac08b401776fe9164e084825ffd84"
 
-DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gtk-doc gconf libxml2 libglade"
-
-EXTRA_OECONF = "--disable-gtk-doc"
+DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gconf libxml2 libglade"
 
 FILES_${PN} += "${libdir}/libglade/2.0/*.so"
 FILES_${PN}-dev += "${libdir}/libglade/2.0/* ${datadir}/gnome-2.0/ui \
-- 
1.7.8.6



