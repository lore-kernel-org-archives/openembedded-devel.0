Received: from slow3-v.mail.gandi.net ([217.70.178.89])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a.sappia@biotechware.com>) id 1QeQoW-0001By-4L
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 14:02:44 +0200
X-WhiteListed: mail was accepted with no delay
X-WhiteListed: mail was accepted with no delay
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id ECB3839450
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2011 13:57:03 +0200 (CEST)
X-Originating-IP: 217.70.178.137
Received: from mfilter8-d.gandi.net (mfilter8-d.gandi.net [217.70.178.137])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id 69A55A8084;
	Wed,  6 Jul 2011 13:57:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter8-d.gandi.net
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by mfilter8-d.gandi.net (mfilter8-d.gandi.net [10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id eH0A+8XjRtXv; Wed,  6 Jul 2011 13:57:03 +0200 (CEST)
X-Originating-IP: 87.241.57.98
Received: from localhost.localdomain (fireone.i3p.it [87.241.57.98])
	(Authenticated sender: a.sappia@biotechware.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E89A6A807B;
	Wed,  6 Jul 2011 13:57:02 +0200 (CEST)
From: Alessandro Sappia <a.sappia@biotechware.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jul 2011 13:56:57 +0200
Message-Id: <1309953417-8572-1-git-send-email-a.sappia@biotechware.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1309951927.4583.2.camel@mattotaupa>
References: <1309951927.4583.2.camel@mattotaupa>
Subject: [PATCH v2] dbus-glib: install required files for target on native build
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
X-List-Received-Date: Wed, 06 Jul 2011 12:02:44 -0000

dbus-glib-native and dbus-glib were not compiling. This patch corrects
dbus-glib-native to install required files in order to let dbus-glib
to compile on target.

Signed-off-by: Alessandro Sappia <a.sappia@biotechware.com>
---
 recipes/dbus/dbus-glib.inc     |    4 ++--
 recipes/dbus/dbus-glib_0.86.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/dbus/dbus-glib.inc b/recipes/dbus/dbus-glib.inc
index c1c1813..d3db9f0 100644
--- a/recipes/dbus/dbus-glib.inc
+++ b/recipes/dbus/dbus-glib.inc
@@ -21,10 +21,10 @@ inherit autotools pkgconfig gettext
 
 BBCLASSEXTEND = "native"
 
-do_configure_prepend() {
+do_configure() {
         install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml ${S}/tools/
         install -m 0644 ${STAGING_DATADIR_NATIVE}/dbus/dbus-glib-bindings.h ${S}/tools/
-
+        autotools_do_configure
 }
 
 do_configure_virtclass-native() {
diff --git a/recipes/dbus/dbus-glib_0.86.bb b/recipes/dbus/dbus-glib_0.86.bb
index ce87d5d..1cef831 100644
--- a/recipes/dbus/dbus-glib_0.86.bb
+++ b/recipes/dbus/dbus-glib_0.86.bb
@@ -1,10 +1,10 @@
 require dbus-glib.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI_virtclass-native += "file://run-with-tmp-session-bus.patch"
 
-do_install_virtclass-native_prepend() {
+do_install_append_virtclass-native() {
         install -d ${D}${datadir}/dbus
         install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus
 }
-- 
1.7.4.1



