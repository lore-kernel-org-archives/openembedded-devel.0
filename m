Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SropB-0002Fy-2S
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 13:23:17 +0200
Received: by weyr6 with SMTP id r6so1603440wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=NIt4C9PIXmQgfNbaZucR4BAkqi0ph9IS8JT4IhsOxoU=;
	b=0zfeTds5Oao7NWw/ga3DxhDgBWgV5uovGFWLR6bof8LH5ozYvEPADhKr7oivGLKqAR
	ZcRtQ5vhy/I4n13Bjs3CWSCrco0TjONCu419kcHtaX3i25jnXa0UMJS7Txwx/BHQ/Xtg
	K+FOzriRq4vCdiaUinfKBpuH+8cGw1mS6GChZ6TOy3VIyJi5cmBJp6Cg2myjYQFDpIZh
	73ss/px5UgsTYFZq+kJ2nJDJTzekBPTt8zwft+pUvSh42GDG7UEUf+J/I4BRsXHWDwXR
	vn89UngY+2x+XlhH6Z8M2xR0twYivccOhcZ6m5+b+1EObDfWY1mm6G+JzusV+cRxR3Kc
	ZuSw==
Received: by 10.216.36.71 with SMTP id v49mr923957wea.70.1342696315320;
	Thu, 19 Jul 2012 04:11:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm37926504wib.2.2012.07.19.04.11.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 04:11:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:11:56 +0200
Message-Id: <1342696316-8537-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342696316-8537-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342696316-8537-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][RFC 2/2] e/efl/gpe.bbclass: convert tabs to 4 spaces also in bash tasks
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
X-List-Received-Date: Thu, 19 Jul 2012 11:23:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e.bbclass   |    4 ++--
 meta-efl/classes/efl.bbclass |    8 ++++----
 meta-oe/classes/gpe.bbclass  |    4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
index 375f914..4bcc2bc 100644
--- a/meta-efl/classes/e.bbclass
+++ b/meta-efl/classes/e.bbclass
@@ -3,12 +3,12 @@ SECTION = "e/apps"
 inherit e-base autotools pkgconfig binconfig
 
 do_prepsources () {
-	make clean distclean || true
+    make clean distclean || true
 }
 addtask prepsources after do_patch before do_configure
 
 do_configure_append() {
-	find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
 }
 
 export CURL_CONFIG = "${STAGING_BINDIR_CROSS}/curl-config"
diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index 792343b..7cf8556 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -10,13 +10,13 @@ inherit e-base autotools
 # evas-native looks at this var, so keep it
 
 do_configure_prepend() {
-	autopoint || touch config.rpath
+    autopoint || touch config.rpath
 }
 
 do_install_prepend () {
-	for i in `find ${S}/ -name "*.pc" -type f` ; do \
-		sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i
-	done
+    for i in `find ${S}/ -name "*.pc" -type f` ; do \
+        sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i
+    done
 }
 
 PACKAGES =+ "${PN}-themes"
diff --git a/meta-oe/classes/gpe.bbclass b/meta-oe/classes/gpe.bbclass
index 7e042ee..2adbd48 100644
--- a/meta-oe/classes/gpe.bbclass
+++ b/meta-oe/classes/gpe.bbclass
@@ -7,11 +7,11 @@ SECTION ?= "gpe"
 inherit gettext
 
 gpe_do_compile() {
-	oe_runmake PREFIX=${prefix}
+    oe_runmake PREFIX=${prefix}
 }
 
 gpe_do_install() {
-	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
1.7.8.6



