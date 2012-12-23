Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkrF-0001uz-FK
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:40:49 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so3251827eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2BDrgSWBhKRtaC7zHLzAbl5WN+8KQzj6PBIVC+YIxuU=;
	b=oyHUFL3qKJH3Pge0F0+j+ncV+g+TuyAwqWwQoU30G0l6U3Sis4Go5ii+GFWYDoHuGb
	NpWHzdT4Vhts0t1DxyxJ2M8Ifdcdb6eK6jyFUaXzieLddAdV/eg56zkMwOZ87TCXOKG3
	vZ7DK/PP+N6AHq6TQeg57fkhxIxscH6mV8pO4861Aqvecs0zXNrujuX1djBDC3NHyBkh
	z/EI61lnDcCONthv2vrEFOOEFDs/f7qSADhEhGqfX8vjw8oeL1gk05ptuZhp6r+QcpyH
	tBUDZTrTpPK4ExyKaiHKCPfl6TfTJC1Fqc/IhXgBkUmOiGLVt/O9/DUrcVHG0K2oiDuO
	wh8Q==
X-Received: by 10.14.219.72 with SMTP id l48mr48001092eep.37.1356265557194;
	Sun, 23 Dec 2012 04:25:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm34563633eep.9.2012.12.23.04.25.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:25:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:52 +0100
Message-Id: <e2a119f3366ebfa26406562a816683da9d959a32.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 27/30] libgnomeprint: fix packaging issues
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:55 -0000

* modules/transports/.debug is already included in modules/*/.debug => drop
* package .a files to PN-staticdev, fixes a lot of QA warnings

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
index 328da68..4a3ba05 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 SECTION = "x11/gnome/libs"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common"
 
@@ -14,6 +14,11 @@ SRC_URI += "file://fix.includes.patch"
 SRC_URI[archive.md5sum] = "d66b81ee8aa3b3a33f5efc9a47ce07e3"
 SRC_URI[archive.sha256sum] = "8b34f81599423ef3da9c43775495da602f83cbbee069c9e760ffeae6aa4768e6"
 
-FILES_${PN}-dbg += "${libdir}/libgnomeprint/${PV}/modules/transports/.debug \
-		    ${libdir}/libgnomeprint/${PV}/modules/.debug  ${libdir}/libgnomeprint/${PV}/modules/*/.debug"
-
+FILES_${PN}-dbg += "\
+  ${libdir}/${PN}/${PV}/modules/.debug \
+  ${libdir}/${PN}/${PV}/modules/*/.debug \
+"
+FILES_${PN}-staticdev += "\
+  ${libdir}/${PN}/${PV}/modules/.a \
+  ${libdir}/${PN}/${PV}/modules/*/.a \
+"
-- 
1.8.0.2



