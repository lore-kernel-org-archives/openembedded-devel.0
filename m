Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RKeFk-0003MY-F4
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 23:53:20 +0100
Received: (qmail invoked by alias); 30 Oct 2011 22:47:12 -0000
Received: from p4FDF1C25.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.37]
	by mail.gmx.net (mp070) with SMTP; 30 Oct 2011 23:47:12 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+/G2Ijj0C/azRmx8l6JHzKQCXgYwDC8wpJJ3tkvX
	kPd8xteJYEsXNg
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Oct 2011 23:51:53 +0100
Message-Id: <1320015113-21219-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] xfce4-weather-plugin: initial add 0.7.4
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
X-List-Received-Date: Sun, 30 Oct 2011 22:53:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

port-to-libxfce4ui.patch was taken from [1]

[1] https://bugzilla.xfce.org/show_bug.cgi?id=7956

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../weather/files/port-to-libxfce4ui.patch         |  104 ++++++++++++++++++++
 .../weather/xfce4-weather-plugin_0.7.4.bb          |   12 +++
 2 files changed, 116 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb

diff --git a/meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch
new file mode 100644
index 0000000..968d84f
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch
@@ -0,0 +1,104 @@
+From 24da1964f72429b0b4d20e0805cbd8346179527f Mon Sep 17 00:00:00 2001
+From: Matias De lellis <mati86dl@gmail.com>
+Date: Mon, 5 Sep 2011 14:17:29 -0300
+Subject: [PATCH] Port xfce4-weather-plugin to libxfce4ui
+
+---
+ configure.ac                   |    2 +-
+ panel-plugin/Makefile.am       |    4 ++--
+ panel-plugin/weather-config.c  |    2 +-
+ panel-plugin/weather-search.c  |    2 +-
+ panel-plugin/weather-summary.c |    2 +-
+ panel-plugin/weather.c         |    2 +-
+ 6 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 04f466a..d1bb58e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -59,7 +59,7 @@ dnl ***********************************
+ XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.6.0])
+ XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.6.0])
+ XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.3.90.2])
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.90.2])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.7.0])
+ XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.99.1])
+ XDT_CHECK_PACKAGE([LIBXML], [libxml-2.0], [2.4.0])
+ 
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index 50fc962..ed06da1 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -33,7 +33,7 @@ xfce4_weather_plugin_SOURCES =						\
+ 
+ xfce4_weather_plugin_CFLAGS =						\
+ 	$(LIBXFCE4PANEL_CFLAGS)						\
+-	$(LIBXFCEGUI4_CFLAGS)						\
++	$(LIBXFCE4UI_CFLAGS)						\
+ 	$(LIBXFCE4UTIL_CFLAGS)						\
+ 	$(GTK_CFLAGS)							\
+ 	$(LIBXML_CFLAGS)
+@@ -41,7 +41,7 @@ xfce4_weather_plugin_CFLAGS =						\
+ xfce4_weather_plugin_LDADD =						\
+ 	$(LIBXFCE4PANEL_LIBS)						\
+ 	$(LIBXFCE4UTIL_LIBS)						\
+-	$(LIBXFCEGUI4_LIBS)						\
++	$(LIBXFCE4UI_LIBS)						\
+ 	$(GTK_LIBS)							\
+ 	$(LIBXML_LIBS)							\
+ 	$(LIBRESOLV)
+diff --git a/panel-plugin/weather-config.c b/panel-plugin/weather-config.c
+index 3023e11..d183e75 100644
+--- a/panel-plugin/weather-config.c
++++ b/panel-plugin/weather-config.c
+@@ -20,7 +20,7 @@
+ #endif
+ 
+ #include <string.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ #include "weather-parsers.h"
+ #include "weather-data.h"
+diff --git a/panel-plugin/weather-search.c b/panel-plugin/weather-search.c
+index c43ad15..dba395f 100644
+--- a/panel-plugin/weather-search.c
++++ b/panel-plugin/weather-search.c
+@@ -21,7 +21,7 @@
+ 
+ #include <string.h>
+ 
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ #include "weather-parsers.h"
+ #include "weather-data.h"
+diff --git a/panel-plugin/weather-summary.c b/panel-plugin/weather-summary.c
+index 36eeb14..b584c7d 100644
+--- a/panel-plugin/weather-summary.c
++++ b/panel-plugin/weather-summary.c
+@@ -19,7 +19,7 @@
+ #include <config.h>
+ #endif
+ 
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ #include "weather-parsers.h"
+ #include "weather-data.h"
+diff --git a/panel-plugin/weather.c b/panel-plugin/weather.c
+index cd341aa..c6c918d 100644
+--- a/panel-plugin/weather.c
++++ b/panel-plugin/weather.c
+@@ -23,7 +23,7 @@
+ #include <sys/stat.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ #include "weather-parsers.h"
+ #include "weather-data.h"
+-- 
+1.7.6
+
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
new file mode 100644
index 0000000..d75d51e
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Panel plugin to display current temperature and weather condition"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+SRC_URI += "file://port-to-libxfce4ui.patch"
+SRC_URI[md5sum] = "03c972d13eba5cd226432ff66e3ff282"
+SRC_URI[sha256sum] = "3f76207b8a845d15bfec6825bd5300aedd086c455259c4dd8670a89a3c8ab382"
+
+FILES_${PN} += "${datadir}/xfce4/weather"
-- 
1.7.4.4



