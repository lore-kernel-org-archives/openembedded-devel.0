Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0Csq-0004Y5-WF
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:04:57 +0100
Received: by fxm19 with SMTP id 19so2599766fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=gh9CYEOcleViLZkmhCRok3BIoS+joLT+LraknV1NV7I=;
	b=Rp4KY/dM9JmvgFOHSoCtEX/Ak7lt1vEjCCXqNwxFFDshaqHLs+WU0gMrYdJnW9wYbw
	GAFFmPsAjNKApso5yQZB0UKc4xwiRf08MVNtJvab+WPVTuDVKEfMtJkwLMW1RGLnxZjd
	ivxTRQj42D24SIkN2yifCfjeEyq1ZyYxulE6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WHtRgU2642rRY5a2ws7AE1XcTgJeRqumdWlewXFAYw1wMthl37tLxCCX0Ovn+sFCj2
	rfudIHD0uNI7HOQACcNt2D/Umei/xMMEbOfsMGGACP9Hw6cDlgUSFS8TpofcLddy9fV7
	SrcDyoNKyOnlPv3zH4o92Eyb0bcjyGTWUORzY=
Received: by 10.223.98.75 with SMTP id p11mr1495348fan.15.1300366992984;
	Thu, 17 Mar 2011 06:03:12 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm909843fav.26.2011.03.17.06.03.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 06:03:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2011 14:03:04 +0100
Message-Id: <1300366984-4526-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <20110317125759.GA3585@jama.jama.net>
References: <20110317125759.GA3585@jama.jama.net>
Subject: [PATCHv2] gtk+: define empty PACKAGES_DYNAMIC_virtclass-native in recipes with native BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Mar 2011 13:04:57 -0000

* otherwise couple of errors like this are shown
  NOTE: multiple providers are available for runtime gdk-pixbuf-loader-gif (gtk+-native, gtk+, gtk+-fastscaling)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match gdk-pixbuf-loader-gif
  ERROR: Trying to resolve runtime dependency gdk-pixbuf-loader-xpm resulted in conflicting PREFERRED_PROVIDER entries being found.
  The providers found were: ['/OE/dev/recipes/gtk+/gtk+_2.20.1.bb', 'virtual:native:/OE/dev/recipes/gtk+/gtk+_2.20.0.bb']
  The PREFERRED_PROVIDER entries resulting in this conflict were: ['PREFERRED_PROVIDER_gtk+ = gtk+', 'PREFERRED_PROVIDER_gdk-pixbuf-csource-native = gtk+-native']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gtk+/gtk+_2.14.2.bb |    1 +
 recipes/gtk+/gtk+_2.18.6.bb |    1 +
 recipes/gtk+/gtk+_2.20.0.bb |    1 +
 recipes/gtk+/gtk+_2.20.1.bb |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/gtk+/gtk+_2.14.2.bb b/recipes/gtk+/gtk+_2.14.2.bb
index acf8624..bcf538a 100644
--- a/recipes/gtk+/gtk+_2.14.2.bb
+++ b/recipes/gtk+/gtk+_2.14.2.bb
@@ -19,6 +19,7 @@ EXTRA_OECONF = "--with-libtiff --disable-xkb --disable-glibtest --enable-display
 EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --without-libjasper --disable-cups"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
diff --git a/recipes/gtk+/gtk+_2.18.6.bb b/recipes/gtk+/gtk+_2.18.6.bb
index 864f4ba..b84ce74 100644
--- a/recipes/gtk+/gtk+_2.18.6.bb
+++ b/recipes/gtk+/gtk+_2.18.6.bb
@@ -19,6 +19,7 @@ EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes
 EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
diff --git a/recipes/gtk+/gtk+_2.20.0.bb b/recipes/gtk+/gtk+_2.20.0.bb
index 1e07e83..cf20117 100644
--- a/recipes/gtk+/gtk+_2.20.0.bb
+++ b/recipes/gtk+/gtk+_2.20.0.bb
@@ -23,6 +23,7 @@ EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes
 EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index 9cffee1..d65a0db 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -27,6 +27,7 @@ EXTRA_OECONF = " --enable-introspection=no --with-libtiff ${XKBTOGGLE} --disable
 EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
-- 
1.7.4.1



