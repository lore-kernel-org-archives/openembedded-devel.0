Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi88-0002oS-J1
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:21:05 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0/Ks9qlDycIsGmbM0cxIC8DxZOtajVAeLZ1F0rYN6nc=;
	b=XwQsxqe7zl3He5em+ZiAyXveQjNXhpvbpNJkmlPZOs+0lw7NJNM53VjZNfaGH/m4vK
	e+SicUXXIQrCb+vGISJy29oeOrxqjlqfxfw38SPgKbb1CZb+CIgk34n56g1eUDk76+V5
	v/GYygAo5doEbAJnvezrpU9ZL1tTMSKWUqdveHCbdYvI2wZ46+1Yx/E3UoDZo0pJzTLG
	uo2RuYjEgdC36D8E3PV0xgnNFtXYZwTYqjSmnBiTkQRcpCp6TZC/V5y4t7VzJH8Gb8/p
	K8NcTV3ZBK7pk9wPxdE85Z3T4SaCuW7OAGKVOCNIDsnrbRB613QfbBKbDsjZUg9gqOyK
	446Q==
Received: by 10.14.225.194 with SMTP id z42mr36046788eep.22.1354586804985;
	Mon, 03 Dec 2012 18:06:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm34824815eem.3.2012.12.03.18.06.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:06:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:25 +0100
Message-Id: <869b25081cd005ae8d5fd9b06d0062bc16439f7f.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 52/58] lightmediascaner: move .a files from PN-dev to PN-staticdev
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
X-List-Received-Date: Tue, 04 Dec 2012 02:39:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index 4b5a750..891b625 100644
--- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 DEPENDS = "gtk+"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://tap.c;beginline=1;endline=20;md5=71756eeb144e9eeb177c69aa672b1635"
-PR = "r3"
+PR = "r4"
 
 inherit autotools
 
@@ -23,5 +23,5 @@ GTKVER = "2.10.0"
 FILES_${PN} = "${sysconfdir} \
                ${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.so.*"
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/${GTKVER}/modules/.debug"
-FILES_${PN}-dev += "${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.so \
-                    ${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.*a"
+FILES_${PN}-dev += "${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.so"
+FILES_${PN}-staticdev += "${libdir}/gtk-2.0/${GTKVER}/modules/libgtkstylus.*a"
-- 
1.8.0



