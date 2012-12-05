Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN7v-0000Dx-DF
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:07:35 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3179783eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YZ1rhTYXVs87Zl/1O6mBy6gscAFPLznytCOAt0jq/Bg=;
	b=M3AaeCUZRFUGkPu+N4e8YDGSpPLRTKLyTSwFCPFDCynFTTRGH2Dj4CCeaK3uykpcS7
	xznJKyQFjKDh5SUxTNzIEwGOKQ9S+xhHMw+dzObBUm44QvH6LoQ8X2DKov8DphygNAKz
	6zxM3HbwmY4bkvdg433oLgoMRmJgNA97tcr0+4QgI0p/RgNYbXeemjxaO8UUKRk9gVg4
	d5UKbP/Pk6RvmG5LRUcxcfN+Y2eQzjudkA5o0iiAW4aPTfhEt7J3qO7hUW6mrhmFYoIw
	nVCq6rIEQs9bi5lAMU3q4cYh7qNipjww0aMPzy2prDZBAMqaa4DBiEweE8pkYxg7LWOF
	u4Yg==
Received: by 10.14.215.197 with SMTP id e45mr65398655eep.0.1354744393315;
	Wed, 05 Dec 2012 13:53:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm11750485eel.14.2012.12.05.13.53.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:53:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:07 +0100
Message-Id: <213be8edaaa91ac5f295bdb5debc27274f03f6de.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 84/85] libxml++: fix unpackaged files
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
X-List-Received-Date: Wed, 05 Dec 2012 22:07:36 -0000

* fixes:
libxml++-2.35.3: libxml++: Files/directories were installed but not shipped
  /usr/share/devhelp
  /usr/share/devhelp/books
  /usr/share/devhelp/books/libxml++-2.6
  /usr/share/devhelp/books/libxml++-2.6/libxml++-2.6.devhelp2
  /usr/lib/libxml++-2.6
  /usr/lib/libxml++-2.6/include
  /usr/lib/libxml++-2.6/include/libxml++config.h

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb b/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
index 9a33baa..fb9cdd9 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
@@ -4,15 +4,19 @@ HOMEPAGE = "http://libxmlplusplus.sourceforge.net"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml%2B%2B"
 SECTION = "libs"
 LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
+
+PR = "r1"
 
 SHRT_VER = "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',True).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz"
 
 SRC_URI[md5sum] = "196a2dcdc84ab987fe3852b3f29cafd7"
 SRC_URI[sha256sum] = "715a4214bbff90365cc8406a28e427febd90461006d608fbdcdcea7fc9891eaf"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
 
 DEPENDS = "libxml2 glibmm"
 
 inherit autotools pkgconfig
 
+FILES_${PN}-doc += "${datadir}/devhelp"
+FILES_${PN}-dev += "${libdir}/libxml++-2.6/include/libxml++config.h"
-- 
1.8.0



