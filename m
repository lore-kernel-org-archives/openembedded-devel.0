Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1QldtU-0001Ki-0Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 11:25:40 +0200
X-Originating-IP: 217.70.178.134
Received: from mfilter4-d.gandi.net (mfilter4-d.gandi.net [217.70.178.134])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 08F53A808F;
	Tue, 26 Jul 2011 11:21:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter4-d.gandi.net
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by mfilter4-d.gandi.net (mfilter4-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id WQ7ZsrIAPT3g; Tue, 26 Jul 2011 11:21:27 +0200 (CEST)
X-Originating-IP: 87.241.57.98
Received: from localhost.localdomain (fireone.i3p.it [87.241.57.98])
	(Authenticated sender: a.sappia@biotechware.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 746AEA8081;
	Tue, 26 Jul 2011 11:21:27 +0200 (CEST)
From: Alessandro Sappia <a.sappia@biotechware.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2011 11:21:16 +0200
Message-Id: <1311672076-9599-1-git-send-email-a.sappia@biotechware.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Alessandro Sappia <a.sappia@biotechware.com>
Subject: [PATCH v4] dbus-glib: corrected native and cross recipe.
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
X-List-Received-Date: Tue, 26 Jul 2011 09:25:40 -0000

* dbus-glib require some source files generated during native build
  in order to build on target.

Signed-off-by: Alessandro Sappia <a.sappia@biotechware.com>
---
 recipes/dbus/dbus-glib.inc     |    8 ++++----
 recipes/dbus/dbus-glib_0.86.bb |    7 +------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc
index c1c1813..7208e91 100644
--- a/recipes/dbus/dbus-glib.inc
+++ b/recipes/dbus/dbus-glib.inc
@@ -21,19 +21,19 @@ inherit autotools pkgconfig gettext
 
 BBCLASSEXTEND = "native"
 
-do_configure_prepend() {
+do_configure() {
         install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml ${S}/tools/
         install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-glib-bindings.h ${S}/tools/
-
+        autotools_do_configure
 }
 
 do_configure_virtclass-native() {
         autotools_do_configure
 }
 
-do_install_virtclass-native() {
-        autotools_do_install
+do_install_append_virtclass-native() {
         install -d ${D}${datadir}/dbus
+        install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus
         install -m 0644 tools/dbus-glib-bindings.h ${D}${datadir}/dbus
 }
 
diff --git a/recipes/dbus/dbus-glib_0.86.bb b/recipes/dbus/dbus-glib_0.86.bb
index ce87d5d..ff9a2d6 100644
--- a/recipes/dbus/dbus-glib_0.86.bb
+++ b/recipes/dbus/dbus-glib_0.86.bb
@@ -1,14 +1,9 @@
 require dbus-glib.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI_virtclass-native += "file://run-with-tmp-session-bus.patch"
 
-do_install_virtclass-native_prepend() {
-        install -d ${D}${datadir}/dbus
-        install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus
-}
-
 SRC_URI[md5sum] = "cd0ab148fb0c786fc88be49d19971f50"
 SRC_URI[sha256sum] = "5351a6e7f38ffc641c34b4a4cdd9bed1c1dc7043a501096bac00a2876ea90bdc"
 
-- 
1.7.4.1



