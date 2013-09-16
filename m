Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4E16C84E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:39 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so1871972ead.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=glX9FOcLu7HE3ZHWawppI0bmtOfgTNwpJ6AdZkp+sw8=;
	b=ps77WaDbd+SlvDQvKyIEd8fVDXKQquWhSn24AtJe961vCFTlCp9nFB+hundfbq+2B/
	ArKc9r4bpXY+CfdlPnKXhao0Dvh4vAzoRCNWvOCnEarPeM11DIvFljMd3YhGr0hbTXfu
	r+RuRhU+JCgiaZ5BaAzV7mcUQDk5BhZswS97PeqDF/gs0Qab81kjhTzODuE7wg/WGjwh
	AgH3NF3++g4kOUkXVOjs4DAmf1VbFD4bySkoF/KAswevV022IF1+2MPBkFx4Pib/Y+8P
	3QvSTgABwKFe3wdidl+pyErNz6ZUfGAv9Y+BhGDBupAUT2SE72jnJu9VQ2Js1MhTHg5F
	c39w==
X-Received: by 10.14.69.206 with SMTP id n54mr7437eed.118.1379322280711;
	Mon, 16 Sep 2013 02:04:40 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:17 +0200
Message-Id: <1379322259-3831-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 7/9] xfce4-weather-plugin: update to 0.8.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2013 09:04:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../weather/files/port-to-libxfce4ui.patch         |  104 --------------------
 .../weather/xfce4-weather-plugin_0.7.4.bb          |   23 -----
 .../weather/xfce4-weather-plugin_0.8.3.bb          |   11 ++
 3 files changed, 11 insertions(+), 127 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb

diff --git a/meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch
deleted file mode 100644
index 968d84f..0000000
--- a/meta-xfce/recipes-panel-plugins/weather/files/port-to-libxfce4ui.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 24da1964f72429b0b4d20e0805cbd8346179527f Mon Sep 17 00:00:00 2001
-From: Matias De lellis <mati86dl@gmail.com>
-Date: Mon, 5 Sep 2011 14:17:29 -0300
-Subject: [PATCH] Port xfce4-weather-plugin to libxfce4ui
-
----
- configure.ac                   |    2 +-
- panel-plugin/Makefile.am       |    4 ++--
- panel-plugin/weather-config.c  |    2 +-
- panel-plugin/weather-search.c  |    2 +-
- panel-plugin/weather-summary.c |    2 +-
- panel-plugin/weather.c         |    2 +-
- 6 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 04f466a..d1bb58e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -59,7 +59,7 @@ dnl ***********************************
- XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.6.0])
- XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.6.0])
- XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.3.90.2])
--XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.90.2])
-+XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.7.0])
- XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.99.1])
- XDT_CHECK_PACKAGE([LIBXML], [libxml-2.0], [2.4.0])
- 
-diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
-index 50fc962..ed06da1 100644
---- a/panel-plugin/Makefile.am
-+++ b/panel-plugin/Makefile.am
-@@ -33,7 +33,7 @@ xfce4_weather_plugin_SOURCES =						\
- 
- xfce4_weather_plugin_CFLAGS =						\
- 	$(LIBXFCE4PANEL_CFLAGS)						\
--	$(LIBXFCEGUI4_CFLAGS)						\
-+	$(LIBXFCE4UI_CFLAGS)						\
- 	$(LIBXFCE4UTIL_CFLAGS)						\
- 	$(GTK_CFLAGS)							\
- 	$(LIBXML_CFLAGS)
-@@ -41,7 +41,7 @@ xfce4_weather_plugin_CFLAGS =						\
- xfce4_weather_plugin_LDADD =						\
- 	$(LIBXFCE4PANEL_LIBS)						\
- 	$(LIBXFCE4UTIL_LIBS)						\
--	$(LIBXFCEGUI4_LIBS)						\
-+	$(LIBXFCE4UI_LIBS)						\
- 	$(GTK_LIBS)							\
- 	$(LIBXML_LIBS)							\
- 	$(LIBRESOLV)
-diff --git a/panel-plugin/weather-config.c b/panel-plugin/weather-config.c
-index 3023e11..d183e75 100644
---- a/panel-plugin/weather-config.c
-+++ b/panel-plugin/weather-config.c
-@@ -20,7 +20,7 @@
- #endif
- 
- #include <string.h>
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- #include "weather-parsers.h"
- #include "weather-data.h"
-diff --git a/panel-plugin/weather-search.c b/panel-plugin/weather-search.c
-index c43ad15..dba395f 100644
---- a/panel-plugin/weather-search.c
-+++ b/panel-plugin/weather-search.c
-@@ -21,7 +21,7 @@
- 
- #include <string.h>
- 
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- #include "weather-parsers.h"
- #include "weather-data.h"
-diff --git a/panel-plugin/weather-summary.c b/panel-plugin/weather-summary.c
-index 36eeb14..b584c7d 100644
---- a/panel-plugin/weather-summary.c
-+++ b/panel-plugin/weather-summary.c
-@@ -19,7 +19,7 @@
- #include <config.h>
- #endif
- 
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- #include "weather-parsers.h"
- #include "weather-data.h"
-diff --git a/panel-plugin/weather.c b/panel-plugin/weather.c
-index cd341aa..c6c918d 100644
---- a/panel-plugin/weather.c
-+++ b/panel-plugin/weather.c
-@@ -23,7 +23,7 @@
- #include <sys/stat.h>
- 
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- #include "weather-parsers.h"
- #include "weather-data.h"
--- 
-1.7.6
-
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
deleted file mode 100644
index 68307a8..0000000
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.7.4.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Panel plugin to display current temperature and weather condition"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r1"
-
-inherit xfce-panel-plugin
-
-SRC_URI += "file://port-to-libxfce4ui.patch"
-SRC_URI[md5sum] = "03c972d13eba5cd226432ff66e3ff282"
-SRC_URI[sha256sum] = "3f76207b8a845d15bfec6825bd5300aedd086c455259c4dd8670a89a3c8ab382"
-
-do_compile_prepend() {
-    # Switch to a working license key
-    # https://bugs.archlinux.org/task/26815
-    sed -i \
-        -e 's/^#define PARTNER_ID.*/#define PARTNER_ID "1003666583"/' \
-        -e 's/^#define LICENSE_KEY.*/#define LICENSE_KEY "4128909340a9b2fc"/' \
-        ${S}/panel-plugin/weather.h
-
-}
-
-FILES_${PN} += "${datadir}/xfce4/weather"
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
new file mode 100644
index 0000000..551faab
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Panel plugin to display current temperature and weather condition"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "755b33089c02afe88abb39253003a7f3"
+SRC_URI[sha256sum] = "40a6a22be7653b15a47174a430da89040f178695b48e5e01e77990050f715ce4"
+
+FILES_${PN} += "${datadir}/xfce4/weather"
-- 
1.7.6.5


