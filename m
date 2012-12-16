Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIhp-0005mv-0r
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:09 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1964761eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=S+NBFh9uVLO2p0NCKA0wrsfFnWZhpLXUG5an7J4152g=;
	b=oQQ0Jc0r8C0qH+gUwO4PjOgPdYbeuRRyTMQCx8hblWnIciXALnm4Rc4yeI6hOrQd4O
	7azzG1f8l6fCOQIWLQiK1f5fBr0YnXSMVaS98IXsZ/s1bhIdfenGmA7CVdIqsXunlF1x
	IVV0QXgcAqL/Pae9CSJcjjli1WFhFhWnkDXi7tTFgEibL9n8afuqLgXl9Ob3RUjwgCEF
	Toe3LIi8202oN/5eC+Zf3/2yfYtrbcfcjP35SK1wJ/zlAZjHiZPD/FNFFmV+NoIKMpAA
	PrSDzyCqLICxPSz6SbOmn81Oj5NqLcwfPu6o37f4cEBmurmwZKJur0wi6Lv6/cJ5o96b
	rMlQ==
Received: by 10.14.184.131 with SMTP id s3mr33702218eem.38.1355680693860;
	Sun, 16 Dec 2012 09:58:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q44sm23871922eep.5.2012.12.16.09.58.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:45 +0100
Message-Id: <3a188ed8136f7f7d2d78f72ee47ac9efb52adf47.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/26] modemmanager: update to 0.6.0.0
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

* All *.a files moved to -staticdev
* MJ: fixed *.la packaging

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../dont-include-private-glib-headers.patch        | 94 ----------------------
 ...modemmanager_0.5.bb => modemmanager_0.6.0.0.bb} | 16 ++--
 2 files changed, 9 insertions(+), 101 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch
 rename meta-oe/recipes-connectivity/networkmanager/{modemmanager_0.5.bb => modemmanager_0.6.0.0.bb} (59%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch b/meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch
deleted file mode 100644
index 71dffc0..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 28f64090dfa15097587bbea69209df10b8ab8593 Mon Sep 17 00:00:00 2001
-From: Aleksander Morgado <aleksander@lanedo.com>
-Date: Mon, 24 Oct 2011 19:09:11 +0000
-Subject: core: don't include private headers from glib
-
-The "glib/gtypes.h" is now considered private, and only "glib.h" should be
-included directly.
----
-diff --git a/src/mm-at-serial-port.h b/src/mm-at-serial-port.h
-index 5d5f13f..cec5dc3 100644
---- a/src/mm-at-serial-port.h
-+++ b/src/mm-at-serial-port.h
-@@ -18,7 +18,6 @@
- #define MM_AT_SERIAL_PORT_H
- 
- #include <glib.h>
--#include <glib/gtypes.h>
- #include <glib-object.h>
- 
- #include "mm-serial-port.h"
-diff --git a/src/mm-manager.h b/src/mm-manager.h
-index 1c98458..c6a64bd 100644
---- a/src/mm-manager.h
-+++ b/src/mm-manager.h
-@@ -17,7 +17,6 @@
- #ifndef MM_MANAGER_H
- #define MM_MANAGER_H
- 
--#include <glib/gtypes.h>
- #include <glib-object.h>
- #include <dbus/dbus-glib.h>
- #include "mm-modem.h"
-diff --git a/src/mm-modem-base.h b/src/mm-modem-base.h
-index 933aae1..be11af6 100644
---- a/src/mm-modem-base.h
-+++ b/src/mm-modem-base.h
-@@ -18,7 +18,6 @@
- #define MM_MODEM_BASE_H
- 
- #include <glib.h>
--#include <glib/gtypes.h>
- #include <glib-object.h>
- 
- #include "mm-port.h"
-diff --git a/src/mm-plugin-base.h b/src/mm-plugin-base.h
-index 4b0932c..5b049a4 100644
---- a/src/mm-plugin-base.h
-+++ b/src/mm-plugin-base.h
-@@ -17,7 +17,6 @@
- #define MM_PLUGIN_BASE_H
- 
- #include <glib.h>
--#include <glib/gtypes.h>
- #include <glib-object.h>
- 
- #define G_UDEV_API_IS_SUBJECT_TO_CHANGE
-diff --git a/src/mm-port.h b/src/mm-port.h
-index 4bcffd4..df935db 100644
---- a/src/mm-port.h
-+++ b/src/mm-port.h
-@@ -17,7 +17,6 @@
- #define MM_PORT_H
- 
- #include <glib.h>
--#include <glib/gtypes.h>
- #include <glib-object.h>
- 
- typedef enum {
-diff --git a/src/mm-qcdm-serial-port.h b/src/mm-qcdm-serial-port.h
-index 2786ee8..605016d 100644
---- a/src/mm-qcdm-serial-port.h
-+++ b/src/mm-qcdm-serial-port.h
-@@ -18,7 +18,6 @@
- #define MM_QCDM_SERIAL_PORT_H
- 
- #include <glib.h>
--#include <glib/gtypes.h>
- #include <glib-object.h>
- 
- #include "mm-serial-port.h"
-diff --git a/src/mm-serial-port.h b/src/mm-serial-port.h
-index eb12cbb..9450926 100644
---- a/src/mm-serial-port.h
-+++ b/src/mm-serial-port.h
-@@ -18,7 +18,6 @@
- #define MM_SERIAL_PORT_H
- 
- #include <glib.h>
--#include <glib/gtypes.h>
- #include <glib-object.h>
- 
- #include "mm-port.h"
---
-cgit v0.9.0.2-2-gbebe
diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.bb b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
similarity index 59%
rename from meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.bb
rename to meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
index 55e083a..60a5425 100644
--- a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.5.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
@@ -3,23 +3,25 @@ DEPENDS = "ppp udev glib-2.0"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r1"
+PR = "r0"
 
 inherit gnome gettext
 
-SRC_URI = "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/ModemManager-${PV}.tar.bz2 \
-file://dont-include-private-glib-headers.patch" 
+SRC_URI = "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/ModemManager-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "cd04109506e88bf4c4cd3e7ce0034c08"
-SRC_URI[sha256sum] = "108de70537b1193634883fa6b3642b130a23f4c04d901cb15caeceb486af6152"
+SRC_URI[md5sum] = "f32640f6672d997ec0887307186e9639"
+SRC_URI[sha256sum] = "d4468300cf4aa7baf21c8564fa515e578056f34de5a64f452b053331f89e8ae2"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
 FILES_${PN}-dbg += "${libdir}/ModemManager/.debug \
                     ${libdir}/pppd/*/.debug"
 FILES_${PN}-dev += "${datadir}/dbus-1/interfaces \
-                    ${libdir}/ModemManager/*a \
-                    ${libdir}/pppd/*/*a"
+                    ${libdir}/pppd/*/*.la \
+                    ${libdir}/ModemManager/*.la"
+FILES_${PN}-staticdev += "\
+                          ${libdir}/ModemManager/*.a \
+                          ${libdir}/pppd/*/*.a"
 FILES_${PN} += "${datadir}/dbus-1/*services/ \
                 ${libdir}/ModemManager/*.so \
                 ${libdir}/pppd/*/*.so \
-- 
1.8.0.2



