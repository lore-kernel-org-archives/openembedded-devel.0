Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id C7CEF72228
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:43 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id et14so10047293pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=5btc+tCS50g5Q9p4wunyhY7kQaAb+v+WsCLZZpBcpzs=;
	b=svxxZkR8lNP5tpRSt/w1gpsFqbAkqCjfO5hmU5B56UyBKXRqJjXc/FoZ8XJLqxUyBC
	CTB2CYab/dzFC1hDpcjLNQznjKyR3FIlcsnQ2FL/CyAkoZ+qsl2oDKHkPY8M+WgQfHHt
	cKv04oYcvdXYcuYMVWihoVZVSbUshmPTfFxsmjUCn4xtf4lVfdfDUTdoY1tCS0ODdDAa
	d24aa9nOJNe89NmkCubXZp64mDXXwBIwmjZUhXSiavFLASz3Uwumk5yzk3/hpfKQ/SOD
	R3cdHlrP/+/PqNK4Nsx0EFRHPqp+AGptVSBzcZ3DBdQe5lVz7FTxSIMFYC4Rc8yyeqX9
	Qx/g==
X-Received: by 10.68.200.231 with SMTP id jv7mr3979223pbc.126.1417395884620;
	Sun, 30 Nov 2014 17:04:44 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:13 -0800
Message-Id: <55cf5c61be219e9990f8a1f42e0af95ecb53cd80.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
MIME-Version: 1.0
Cc: otavio@ossystems.com.br
Subject: [PATCH 11/15] xfce4-weather-plugin: make work properly after met.no API change
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
X-List-Received-Date: Mon, 01 Dec 2014 01:04:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

see [1] for more information

https://bugzilla.xfce.org/show_bug.cgi?id=10916

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-ready-for-met.no-locationforecast-1.2-AP.patch | 162 +++++++++++++++++++++
 ...et.no-locationforecastLTS-1.2-API-bug-109.patch |  27 ++++
 .../weather/xfce4-weather-plugin_0.8.3.bb          |   4 +
 3 files changed, 193 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch

diff --git a/meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch b/meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
new file mode 100644
index 0000000..d4ad240
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
@@ -0,0 +1,162 @@
+From 1ff71669644a0b824a8a5ba9b40771ee4fb8a76b Mon Sep 17 00:00:00 2001
+From: Harald Judt <h.judt@gmx.at>
+Date: Wed, 28 May 2014 20:08:02 +0200
+Subject: [PATCH 1/2] Make plugin ready for met.no locationforecast-1.2 API
+ (bug #10916).
+
+http://api.yr.no/weatherapi/locationforecastlts/1.1/documentation#version_1_2___2014_05_20
+
+The updated API version uses CamelCase symbol names instead of UPPERCASE
+ones and has added some new names (like 'Drizzle'), which unfortunately
+have not been documented (yet?).
+
+What's more, the typo 'celcius' has been replaced by the fixed 'celsius',
+but luckily the plugin will not be affected by that change.
+
+What's a bit more unfortunate is that the existing icon themes do not
+cover the new symbol names, so one would have to create quite a lot of
+new icons. Also, new translations would have to be added for the symbols,
+and maybe existing ones would have to be altered. To prevent this, we're
+simply going to map the new symbols to existing ones as good as possible.
+This should be good enough for the time being.
+
+Upstream-Status: Applied
+---
+ panel-plugin/weather-parsers.c   |  3 +-
+ panel-plugin/weather-translate.c | 70 +++++++++++++++++++++++++++++++++++++++-
+ panel-plugin/weather-translate.h |  2 ++
+ 3 files changed, 73 insertions(+), 2 deletions(-)
+
+diff --git a/panel-plugin/weather-parsers.c b/panel-plugin/weather-parsers.c
+index 0f321ba..5a9b30a 100644
+--- a/panel-plugin/weather-parsers.c
++++ b/panel-plugin/weather-parsers.c
+@@ -28,6 +28,7 @@
+ #define _XOPEN_SOURCE
+ #define _XOPEN_SOURCE_EXTENDED 1
+ #include "weather-parsers.h"
++#include "weather-translate.h"
+ #include "weather-debug.h"
+ 
+ #include <time.h>
+@@ -220,8 +221,8 @@ parse_location(xmlNode *cur_node,
+         }
+         if (NODE_IS_TYPE(child_node, "symbol")) {
+             g_free(loc->symbol);
+-            loc->symbol = PROP(child_node, "id");
+             loc->symbol_id = strtol(PROP(child_node, "number"), NULL, 10);
++            loc->symbol = g_strdup(get_symbol_for_id(loc->symbol_id));
+         }
+     }
+ 
+diff --git a/panel-plugin/weather-translate.c b/panel-plugin/weather-translate.c
+index 0c1606d..c38919a 100644
+--- a/panel-plugin/weather-translate.c
++++ b/panel-plugin/weather-translate.c
+@@ -29,6 +29,7 @@
+ #include "weather-translate.h"
+ 
+ #define DAY_LOC_N (sizeof(gchar) * 100)
++#define NODATA "NODATA"
+ 
+ 
+ static const gchar *moon_phases[] = {
+@@ -117,7 +118,7 @@ static const symbol_desc symbol_to_desc[] = {
+ 
+     { 15, "FOG",                 N_("Fog"),                        N_("Fog")                        },
+ 
+-    /* Symbols 16-19 are used for polar days */
++    /* Symbols 16-19 are used for polar days (unused beginning with API version 1.2) */
+     { 16, "SUN",                 N_("Sunny"),                      N_("Clear")                      },
+     { 17, "LIGHTCLOUD",          N_("Lightly cloudy"),             N_("Lightly cloudy")             },
+     { 18, "LIGHTRAINSUN",        N_("Rain showers"),               N_("Rain showers")               },
+@@ -133,6 +134,73 @@ static const symbol_desc symbol_to_desc[] = {
+ #define NUM_SYMBOLS (sizeof(symbol_to_desc) / sizeof(symbol_to_desc[0]))
+ 
+ 
++/*
++ * API version 1.2, published in May 2014, introduced new symbols. We
++ * try to match these with existing symbols, in order to be compatible
++ * with existing icon themes and to maintain translation completeness.
++ *
++ * See http://api.met.no/weatherapi/weathericon/1.1/documentation
++ * for a list of symbols. For a list of symbols with descriptions,
++ * see http://om.yr.no/forklaring/symbol.
++ */
++gint
++replace_symbol_id(gint id)
++{
++    /* Symbol ids greater than 100 are used for indicating polar
++     * night. These ids are over the ordinary id + 100. Since we
++     * don't support polar icons, we can simply subtract 100 to
++     * get the non-polar symbol ids.
++     */
++    if (id > 100)
++        id -= 100;
++
++    switch (id) {
++    case 24: return 22; /* Light rain showers and thunder */
++    case 25: return 6;  /* Heavy rain showers and thunder */
++    case 26: return 20; /* Light sleet showers and thunder */
++    case 27: return 20; /* Heavy sleet showers and thunder */
++    case 28: return 21; /* Light snow showers and thunder */
++    case 29: return 21; /* Heavy snow showers and thunder */
++    case 30: return 22; /* Light rain and thunder */
++    case 31: return 23; /* Light sleet and thunder */
++    case 32: return 23; /* Heavy sleet and thunder */
++    case 33: return 14; /* Light snow and thunder */
++    case 34: return 14; /* Heavy snow and thunder */
++
++    /* symbols 35-39 are unused */
++
++    case 40: return 5;  /* Light rain showers */
++    case 41: return 5;  /* Heavy rain showers */
++    case 42: return 7;  /* Light sleet showers */
++    case 43: return 7;  /* Heavy sleet showers */
++    case 44: return 8;  /* Light snow showers */
++    case 45: return 8;  /* Heavy snow showers */
++    case 46: return 9;  /* Light rain */
++    case 47: return 12; /* Light sleet */
++    case 48: return 12; /* Heavy sleet */
++    case 49: return 13; /* Light snow */
++    case 50: return 13; /* Heavy snow */
++    default: return id;
++    }
++}
++
++
++const gchar *
++get_symbol_for_id(gint id)
++{
++    if (G_UNLIKELY(id < 1))
++        return NODATA;
++
++    if (id >= NUM_SYMBOLS)
++        id = replace_symbol_id(id);
++
++    if (id < NUM_SYMBOLS)
++        return symbol_to_desc[id-1].symbol;
++
++    return NODATA;
++}
++
++
+ const gchar *
+ translate_desc(const gchar *desc,
+                const gboolean nighttime)
+diff --git a/panel-plugin/weather-translate.h b/panel-plugin/weather-translate.h
+index 2116795..854e24f 100644
+--- a/panel-plugin/weather-translate.h
++++ b/panel-plugin/weather-translate.h
+@@ -24,6 +24,8 @@
+ 
+ G_BEGIN_DECLS
+ 
++const gchar *get_symbol_for_id(gint id);
++
+ const gchar *translate_desc(const gchar *desc,
+                             gboolean nighttime);
+ 
+-- 
+1.8.3.1
+
diff --git a/meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch b/meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch
new file mode 100644
index 0000000..4c385a4
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch
@@ -0,0 +1,27 @@
+From 7df303bc5fa649299e18efeb5d4b801614030488 Mon Sep 17 00:00:00 2001
+From: Harald Judt <h.judt@gmx.at>
+Date: Tue, 3 Jun 2014 19:59:05 +0200
+Subject: [PATCH 2/2] Switch to met.no locationforecastLTS-1.2 API (bug
+ #10916).
+
+Upstream-Status: Applied
+---
+ panel-plugin/weather.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/panel-plugin/weather.c b/panel-plugin/weather.c
+index efa8559..63451fd 100644
+--- a/panel-plugin/weather.c
++++ b/panel-plugin/weather.c
+@@ -660,7 +660,7 @@ update_handler(plugin_data *data)
+         /* build url */
+         url =
+             g_strdup_printf("http://api.yr.no/weatherapi"
+-                            "/locationforecastlts/1.1/?lat=%s;lon=%s;msl=%d",
++                            "/locationforecastlts/1.2/?lat=%s;lon=%s;msl=%d",
+                             data->lat, data->lon, data->msl);
+ 
+         /* start receive thread */
+-- 
+1.8.3.1
+
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
index d03a259..6e4c86d 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.8.3.bb
@@ -7,6 +7,10 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
+SRC_URI += " \
+    file://0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch \
+    file://0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch \
+"
 SRC_URI[md5sum] = "755b33089c02afe88abb39253003a7f3"
 SRC_URI[sha256sum] = "40a6a22be7653b15a47174a430da89040f178695b48e5e01e77990050f715ce4"
 
-- 
1.9.1


