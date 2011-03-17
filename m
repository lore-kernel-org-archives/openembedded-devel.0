Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0C26-0002Rx-Ii
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 13:10:26 +0100
Received: by fxm19 with SMTP id 19so2550619fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=M1575iXaFBs9lZRhAEQICvIHL1hpqByg6KK9gIFd0S0=;
	b=OM9BPJcXFKtoYCrrrzXCO0Ge4BPkLbU2U/pbAEI1aeR19DlDj2+pkgSTJzDhp15OL6
	cmrDRQGmPptWpEX85HqJZ4JG+heb8DposFNmgWTt6zhCZurrYGJUlQycAzrCiUdCV7l8
	upWTAtP+CcHKHhSfk2XYrDCfZNdLdP6AMDsn8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dQxJfRO2qEKgIk+9OAiwSkaVULW6rOJpALQtwv1SpOaKM+0cbdPyM8Y7Oa2U5iRq0c
	vLuzyf+JJvLb88zyHTcpJIminbD49Yh1q/5qXuT72fQspsQiWR969fcMIOwTMsqZ6Bul
	m4LP8cA3/pM/aeTEQC39n//WK3+PyOvdceEBs=
Received: by 10.223.112.83 with SMTP id v19mr1366392fap.122.1300363720525;
	Thu, 17 Mar 2011 05:08:40 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l3sm2038160fan.2.2011.03.17.05.08.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 05:08:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2011 13:08:36 +0100
Message-Id: <1300363716-32402-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] gtk+: define empty PACKAGES_DYNAMIC_virtclass-native
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
X-List-Received-Date: Thu, 17 Mar 2011 12:10:26 -0000

* otherwise couple of errors like this are shown
  NOTE: multiple providers are available for runtime gdk-pixbuf-loader-gif (gtk+-native, gtk+, gtk+-fastscaling)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match gdk-pixbuf-loader-gif
  ERROR: Trying to resolve runtime dependency gdk-pixbuf-loader-xpm resulted in conflicting PREFERRED_PROVIDER entries being found.
  The providers found were: ['/OE/dev/recipes/gtk+/gtk+_2.20.1.bb', 'virtual:native:/OE/dev/recipes/gtk+/gtk+_2.20.0.bb']
  The PREFERRED_PROVIDER entries resulting in this conflict were: ['PREFERRED_PROVIDER_gtk+ = gtk+', 'PREFERRED_PROVIDER_gdk-pixbuf-csource-native = gtk+-native']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gtk+/gtk+_2.14.1.bb |    1 +
 recipes/gtk+/gtk+_2.14.2.bb |    1 +
 recipes/gtk+/gtk+_2.16.4.bb |    1 +
 recipes/gtk+/gtk+_2.16.6.bb |    1 +
 recipes/gtk+/gtk+_2.18.0.bb |    1 +
 recipes/gtk+/gtk+_2.18.3.bb |    1 +
 recipes/gtk+/gtk+_2.18.6.bb |    1 +
 recipes/gtk+/gtk+_2.20.0.bb |    1 +
 recipes/gtk+/gtk+_2.20.1.bb |    1 +
 recipes/gtk+/gtk+_2.6.10.bb |    1 +
 recipes/gtk+/gtk-2.10.inc   |    1 +
 11 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/recipes/gtk+/gtk+_2.14.1.bb b/recipes/gtk+/gtk+_2.14.1.bb
index 149d2f7..2c2cd4c 100644
--- a/recipes/gtk+/gtk+_2.14.1.bb
+++ b/recipes/gtk+/gtk+_2.14.1.bb
@@ -5,6 +5,7 @@ PR = "${INC_PR}.0"
 EXTRA_OECONF = "--with-libtiff --disable-xkb --disable-glibtest --enable-display-migration gio_can_sniff=yes"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
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
diff --git a/recipes/gtk+/gtk+_2.16.4.bb b/recipes/gtk+/gtk+_2.16.4.bb
index 7a263ef..4c83832 100644
--- a/recipes/gtk+/gtk+_2.16.4.bb
+++ b/recipes/gtk+/gtk+_2.16.4.bb
@@ -5,6 +5,7 @@ PR = "${INC_PR}.0"
 EXTRA_OECONF = "--with-libtiff --disable-xkb --disable-glibtest --enable-display-migration gio_can_sniff=yes"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
diff --git a/recipes/gtk+/gtk+_2.16.6.bb b/recipes/gtk+/gtk+_2.16.6.bb
index fb07115..f2f10f2 100644
--- a/recipes/gtk+/gtk+_2.16.6.bb
+++ b/recipes/gtk+/gtk+_2.16.6.bb
@@ -5,6 +5,7 @@ PR = "${INC_PR}.0"
 EXTRA_OECONF = "--with-libtiff --disable-xkb --disable-glibtest --enable-display-migration gio_can_sniff=yes"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
diff --git a/recipes/gtk+/gtk+_2.18.0.bb b/recipes/gtk+/gtk+_2.18.0.bb
index 90f2469..caa2b7f 100644
--- a/recipes/gtk+/gtk+_2.18.0.bb
+++ b/recipes/gtk+/gtk+_2.18.0.bb
@@ -5,6 +5,7 @@ PR = "${INC_PR}.0"
 EXTRA_OECONF = "--with-libtiff --disable-xkb --disable-glibtest --enable-display-migration gio_can_sniff=yes"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
diff --git a/recipes/gtk+/gtk+_2.18.3.bb b/recipes/gtk+/gtk+_2.18.3.bb
index 1339a3d..fae9f69 100644
--- a/recipes/gtk+/gtk+_2.18.3.bb
+++ b/recipes/gtk+/gtk+_2.18.3.bb
@@ -9,6 +9,7 @@ XKBTOGGLE_angstrom = ""
 EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes"
 
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
diff --git a/recipes/gtk+/gtk+_2.6.10.bb b/recipes/gtk+/gtk+_2.6.10.bb
index 45eaf30..9d52745 100644
--- a/recipes/gtk+/gtk+_2.6.10.bb
+++ b/recipes/gtk+/gtk+_2.6.10.bb
@@ -97,6 +97,7 @@ fi
 }
 
 PACKAGES_DYNAMIC = "gdk-pixbuf-loader-* gtk-immodule-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
diff --git a/recipes/gtk+/gtk-2.10.inc b/recipes/gtk+/gtk-2.10.inc
index 3fa5d22..49e8c9e 100644
--- a/recipes/gtk+/gtk-2.10.inc
+++ b/recipes/gtk+/gtk-2.10.inc
@@ -69,6 +69,7 @@ fi
 }
 
 PACKAGES_DYNAMIC = "gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
 	import os.path
-- 
1.7.4.1



