Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLUpH-0006pl-5g
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 10:06:03 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 25BE7D22DD;
	Tue,  9 Oct 2012 09:52:50 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 09:52:34 +0200
Message-Id: <1349769155-12643-14-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 13/14] modemmanager: do not include glib private headers
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
X-List-Received-Date: Tue, 09 Oct 2012 08:06:03 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../dont-include-private-glib-headers.patch        |   94 ++++++++++++++++++++
 .../networkmanager/modemmanager_0.5.bb             |    6 +-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch b/meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch
new file mode 100644
index 0000000..71dffc0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch
@@ -0,0 +1,94 @@
+From 28f64090dfa15097587bbea69209df10b8ab8593 Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@lanedo.com>
+Date: Mon, 24 Oct 2011 19:09:11 +0000
+Subject: core: don't include private headers from glib
+
+The "glib/gtypes.h" is now considered private, and only "glib.h" should be
+included directly.
+---
+diff --git a/src/mm-at-serial-port.h b/src/mm-at-serial-port.h
+index 5d5f13f..cec5dc3 100644
+--- a/src/mm-at-serial-port.h
++++ b/src/mm-at-serial-port.h
+@@ -18,7 +18,6 @@
+ #define MM_AT_SERIAL_PORT_H
+ 
+ #include <glib.h>
+-#include <glib/gtypes.h>
+ #include <glib-object.h>
+ 
+ #include "mm-serial-port.h"
+diff --git a/src/mm-manager.h b/src/mm-manager.h
+index 1c98458..c6a64bd 100644
+--- a/src/mm-manager.h
++++ b/src/mm-manager.h
+@@ -17,7 +17,6 @@
+ #ifndef MM_MANAGER_H
+ #define MM_MANAGER_H
+ 
+-#include <glib/gtypes.h>
+ #include <glib-object.h>
+ #include <dbus/dbus-glib.h>
+ #include "mm-modem.h"
+diff --git a/src/mm-modem-base.h b/src/mm-modem-base.h
+index 933aae1..be11af6 100644
+--- a/src/mm-modem-base.h
++++ b/src/mm-modem-base.h
+@@ -18,7 +18,6 @@
+ #define MM_MODEM_BASE_H
+ 
+ #include <glib.h>
+-#include <glib/gtypes.h>
+ #include <glib-object.h>
+ 
+ #include "mm-port.h"
+diff --git a/src/mm-plugin-base.h b/src/mm-plugin-base.h
+index 4b0932c..5b049a4 100644
+--- a/src/mm-plugin-base.h
++++ b/src/mm-plugin-base.h
+@@ -17,7 +17,6 @@
+ #define MM_PLUGIN_BASE_H
+ 
+ #include <glib.h>
+-#include <glib/gtypes.h>
+ #include <glib-object.h>
+ 
+ #define G_UDEV_API_IS_SUBJECT_TO_CHANGE
+diff --git a/src/mm-port.h b/src/mm-port.h
+index 4bcffd4..df935db 100644
+--- a/src/mm-port.h
++++ b/src/mm-port.h
+@@ -17,7 +17,6 @@
+ #define MM_PORT_H
+ 
+ #include <glib.h>
+-#include <glib/gtypes.h>
+ #include <glib-object.h>
+ 
+ typedef enum {
+diff --git a/src/mm-qcdm-serial-port.h b/src/mm-qcdm-serial-port.h
+index 2786ee8..605016d 100644
+--- a/src/mm-qcdm-serial-port.h
++++ b/src/mm-qcdm-serial-port.h
+@@ -18,7 +18,6 @@
+ #define MM_QCDM_SERIAL_PORT_H
+ 
+ #include <glib.h>
+-#include <glib/gtypes.h>
+ #include <glib-object.h>
+ 
+ #include "mm-serial-port.h"
+diff --git a/src/mm-serial-port.h b/src/mm-serial-port.h
+index eb12cbb..9450926 100644
+--- a/src/mm-serial-port.h
++++ b/src/mm-serial-port.h
+@@ -18,7 +18,6 @@
+ #define MM_SERIAL_PORT_H
+ 
+ #include <glib.h>
+-#include <glib/gtypes.h>
+ #include <glib-object.h>
+ 
+ #include "mm-port.h"
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.bb b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.bb
index 29c2575..55e083a 100644
--- a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.bb
@@ -3,9 +3,13 @@ DEPENDS = "ppp udev glib-2.0"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+PR = "r1"
+
 inherit gnome gettext
 
-SRC_URI = "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/ModemManager-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/ModemManager-${PV}.tar.bz2 \
+file://dont-include-private-glib-headers.patch" 
+
 SRC_URI[md5sum] = "cd04109506e88bf4c4cd3e7ce0034c08"
 SRC_URI[sha256sum] = "108de70537b1193634883fa6b3642b130a23f4c04d901cb15caeceb486af6152"
 
-- 
1.7.10.4



