Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id ADA4060167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:25 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id bs8so9838279wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=bHRx7i/Iv3n9xvgiLpMJeXKWODV71z1Lzn7q7Mpo0yU=;
	b=Af5D2HzFzZGcrP/cUl9JAdKpC42qk2c4xXYqHrtJtSSVuJdyD1GdARGWvuX9njKdFZ
	sChqaMkteULRB2bm8NNNpa/7o8Ebebm6E8ez91AW0JaTSTNMNuWR4uBmBdmjn/ez0oLy
	jp6BIHTW2fo8te6UB5igGkHdA4W3N3xT+YD1NNdjJoWc/yX4EFFFqT7aLtQdK1hMQLHu
	ncb8PN2BjghH5EkLeGVs2t1yaiB7Qp+PgsjC5S4yHpBqRQSYfNTsY3Za9/8Ea8Knk/PW
	tdJJH0ygbMJrvbSvOoduHHsC2/Isd5EH48J/kpqI5tnWKYU8UPKIZpV6FJIyv4TltNxd
	pyZA==
X-Received: by 10.194.237.34 with SMTP id uz2mr14575428wjc.157.1423810946658; 
	Thu, 12 Feb 2015 23:02:26 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:49 +0100
Message-Id: <1423810919-9857-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 09/19] xfce4-weather-plugin: update to 0.8.5
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

patches were applied mainline

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-ready-for-met.no-locationforecast-1.2-AP.patch | 162 ---------------------
 ...et.no-locationforecastLTS-1.2-API-bug-109.patch |  27 ----
 ...ugin_0.8.3.bb => xfce4-weather-plugin_0.8.5.bb} |   8 +-
 3 files changed, 2 insertions(+), 195 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.3.bb => xfce4-weather-plugin_0.8.5.bb} (53%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch b/meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
deleted file mode 100644
index d4ad240..0000000
--- a/meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From 1ff71669644a0b824a8a5ba9b40771ee4fb8a76b Mon Sep 17 00:00:00 2001
-From: Harald Judt <h.judt@gmx.at>
-Date: Wed, 28 May 2014 20:08:02 +0200
-Subject: [PATCH 1/2] Make plugin ready for met.no locationforecast-1.2 API
- (bug #10916).
-
-http://api.yr.no/weatherapi/locationforecastlts/1.1/documentation#version_1_2___2014_05_20
-
-The updated API version uses CamelCase symbol names instead of UPPERCASE
-ones and has added some new names (like 'Drizzle'), which unfortunately
-have not been documented (yet?).
-
-What's more, the typo 'celcius' has been replaced by the fixed 'celsius',
-but luckily the plugin will not be affected by that change.
-
-What's a bit more unfortunate is that the existing icon themes do not
-cover the new symbol names, so one would have to create quite a lot of
-new icons. Also, new translations would have to be added for the symbols,
-and maybe existing ones would have to be altered. To prevent this, we're
-simply going to map the new symbols to existing ones as good as possible.
-This should be good enough for the time being.
-
-Upstream-Status: Applied
----
- panel-plugin/weather-parsers.c   |  3 +-
- panel-plugin/weather-translate.c | 70 +++++++++++++++++++++++++++++++++++++++-
- panel-plugin/weather-translate.h |  2 ++
- 3 files changed, 73 insertions(+), 2 deletions(-)
-
-diff --git a/panel-plugin/weather-parsers.c b/panel-plugin/weather-parsers.c
-index 0f321ba..5a9b30a 100644
---- a/panel-plugin/weather-parsers.c
-+++ b/panel-plugin/weather-parsers.c
-@@ -28,6 +28,7 @@
- #define _XOPEN_SOURCE
- #define _XOPEN_SOURCE_EXTENDED 1
- #include "weather-parsers.h"
-+#include "weather-translate.h"
- #include "weather-debug.h"
- 
- #include <time.h>
-@@ -220,8 +221,8 @@ parse_location(xmlNode *cur_node,
-         }
-         if (NODE_IS_TYPE(child_node, "symbol")) {
-             g_free(loc->symbol);
--            loc->symbol = PROP(child_node, "id");
-             loc->symbol_id = strtol(PROP(child_node, "number"), NULL, 10);
-+            loc->symbol = g_strdup(get_symbol_for_id(loc->symbol_id));
-         }
-     }
- 
-diff --git a/panel-plugin/weather-translate.c b/panel-plugin/weather-translate.c
-index 0c1606d..c38919a 100644
---- a/panel-plugin/weather-translate.c
-+++ b/panel-plugin/weather-translate.c
-@@ -29,6 +29,7 @@
- #include "weather-translate.h"
- 
- #define DAY_LOC_N (sizeof(gchar) * 100)
-+#define NODATA "NODATA"
- 
- 
- static const gchar *moon_phases[] = {
-@@ -117,7 +118,7 @@ static const symbol_desc symbol_to_desc[] = {
- 
-     { 15, "FOG",                 N_("Fog"),                        N_("Fog")                        },
- 
--    /* Symbols 16-19 are used for polar days */
-+    /* Symbols 16-19 are used for polar days (unused beginning with API version 1.2) */
-     { 16, "SUN",                 N_("Sunny"),                      N_("Clear")                      },
-     { 17, "LIGHTCLOUD",          N_("Lightly cloudy"),             N_("Lightly cloudy")             },
-     { 18, "LIGHTRAINSUN",        N_("Rain showers"),               N_("Rain showers")               },
-@@ -133,6 +134,73 @@ static const symbol_desc symbol_to_desc[] = {
- #define NUM_SYMBOLS (sizeof(symbol_to_desc) / sizeof(symbol_to_desc[0]))
- 
- 
-+/*
-+ * API version 1.2, published in May 2014, introduced new symbols. We
-+ * try to match these with existing symbols, in order to be compatible
-+ * with existing icon themes and to maintain translation completeness.
-+ *
-+ * See http://api.met.no/weatherapi/weathericon/1.1/documentation
-+ * for a list of symbols. For a list of symbols with descriptions,
-+ * see http://om.yr.no/forklaring/symbol.
-+ */
-+gint
-+replace_symbol_id(gint id)
-+{
-+    /* Symbol ids greater than 100 are used for indicating polar
-+     * night. These ids are over the ordinary id + 100. Since we
-+     * don't support polar icons, we can simply subtract 100 to
-+     * get the non-polar symbol ids.
-+     */
-+    if (id > 100)
-+        id -= 100;
-+
-+    switch (id) {
-+    case 24: return 22; /* Light rain showers and thunder */
-+    case 25: return 6;  /* Heavy rain showers and thunder */
-+    case 26: return 20; /* Light sleet showers and thunder */
-+    case 27: return 20; /* Heavy sleet showers and thunder */
-+    case 28: return 21; /* Light snow showers and thunder */
-+    case 29: return 21; /* Heavy snow showers and thunder */
-+    case 30: return 22; /* Light rain and thunder */
-+    case 31: return 23; /* Light sleet and thunder */
-+    case 32: return 23; /* Heavy sleet and thunder */
-+    case 33: return 14; /* Light snow and thunder */
-+    case 34: return 14; /* Heavy snow and thunder */
-+
-+    /* symbols 35-39 are unused */
-+
-+    case 40: return 5;  /* Light rain showers */
-+    case 41: return 5;  /* Heavy rain showers */
-+    case 42: return 7;  /* Light sleet showers */
-+    case 43: return 7;  /* Heavy sleet showers */
-+    case 44: return 8;  /* Light snow showers */
-+    case 45: return 8;  /* Heavy snow showers */
-+    case 46: return 9;  /* Light rain */
-+    case 47: return 12; /* Light sleet */
-+    case 48: return 12; /* Heavy sleet */
-+    case 49: return 13; /* Light snow */
-+    case 50: return 13; /* Heavy snow */
-+    default: return id;
-+    }
-+}
-+
-+
-+const gchar *
-+get_symbol_for_id(gint id)
-+{
-+    if (G_UNLIKELY(id < 1))
-+        return NODATA;
-+
-+    if (id >= NUM_SYMBOLS)
-+        id = replace_symbol_id(id);
-+
-+    if (id < NUM_SYMBOLS)
-+        return symbol_to_desc[id-1].symbol;
-+
-+    return NODATA;
-+}
-+
-+
- const gchar *
- translate_desc(const gchar *desc,
-                const gboolean nighttime)
-diff --git a/panel-plugin/weather-translate.h b/panel-plugin/weather-translate.h
-index 2116795..854e24f 100644
---- a/panel-plugin/weather-translate.h
-+++ b/panel-plugin/weather-translate.h
-@@ -24,6 +24,8 @@
- 
- G_BEGIN_DECLS
- 
-+const gchar *get_symbol_for_id(gint id);
-+
- const gchar *translate_desc(const gchar *desc,
-                             gboolean nighttime);
- 
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch b/meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch
deleted file mode 100644
index 4c385a4..0000000
--- a/meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7df303bc5fa649299e18efeb5d4b801614030488 Mon Sep 17 00:00:00 2001
-From: Harald Judt <h.judt@gmx.at>
-Date: Tue, 3 Jun 2014 19:59:05 +0200
-Subject: [PATCH 2/2] Switch to met.no locationforecastLTS-1.2 API (bug
- #10916).
-
-Upstream-Status: Applied
----
- panel-plugin/weather.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/panel-plugin/weather.c b/panel-plugin/weather.c
-index efa8559..63451fd 100644
---- a/panel-plugin/weather.c
-+++ b/panel-plugin/weather.c
-@@ -660,7 +660,7 @@ update_handler(plugin_data *data)
-         /* build url */
-         url =
-             g_strdup_printf("http://api.yr.no/weatherapi"
--                            "/locationforecastlts/1.1/?lat=%s;lon=%s;msl=%d",
-+                            "/locationforecastlts/1.2/?lat=%s;lon=%s;msl=%d",
-                             data->lat, data->lon, data->msl);
- 
-         /* start receive thread */
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.5.bb
similarity index 53%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.5.bb
index 6e4c86d..3fc5eae 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.5.bb
@@ -7,11 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI += " \
-    file://0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch \
-    file://0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch \
-"
-SRC_URI[md5sum] = "755b33089c02afe88abb39253003a7f3"
-SRC_URI[sha256sum] = "40a6a22be7653b15a47174a430da89040f178695b48e5e01e77990050f715ce4"
+SRC_URI[md5sum] = "cc6d9039540a71e57102ae75224a3f5e"
+SRC_URI[sha256sum] = "be8ac0e5635355d568e4095a3459f53efd5f10a8ef46976a43dc30cbb277e5cd"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
1.9.3


