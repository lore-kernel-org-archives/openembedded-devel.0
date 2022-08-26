Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CEFECAADD
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.34201.1661494316759564892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E4hyrBeY;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id r22so540290pgm.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YAMCGheDSkgYERclr56aW5GAA4eZQnqqtgwozHK1AcU=;
        b=E4hyrBeYmv5EcX6iEz/F4CrChLRzPp7mlKHQwk9+uG5xXGqjb3Qnua9dfEiOy+9GPo
         At49aXKyuTVPcNw+cVSE0Gu/5SF/9f0VU3OzDaUlrGKOeIDa9ZQ87/P31LD+ERSAw1bt
         uNR7z2uARipHufUCQn0PqYfMEh7G9yhdk4MxhJcwIlJlTQcAHCOoJo9vJaIQmAp1Nn9k
         tpVG34n/Jr8j8frEgZpATw3KSwtBjaDUE+6ePJp0dIZj3pltiKMFKcP5l8mpIEwLDtsJ
         26j/NCAtErF8YaaIogcMRGlFyXbceAsniRBOl8c884AnyDGoZnBtCqysuR2vk6tW7B8N
         nenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YAMCGheDSkgYERclr56aW5GAA4eZQnqqtgwozHK1AcU=;
        b=oIPTeS4UXqU1/crQhswm4qjjLDRNB3oDKhOLPIPg2UavfHSJ9MoVLnzRVDhRT54fRA
         T9sczEmen/eAq6Z4c9dVUeJ2sBhSYUOoGa6j5w4o5yXcsNtDn638UkmVRxqnJzkQbpb6
         W5dMu+He5IRTA4hYdj8KwRk3TNe9Wi32FTTCfV6/yZkMq+xWa4czigqbASdRqwmtgs+1
         XC02D4LVDgGNjApeKlgor9hflxRK1n1NO5VhBgQHcYEeCrA+JpPCGrSE4uLAVETkTb6X
         +vQPLyiMZFpwV9b0t4UE6PMRnWXleSqNcVbnJbncr/u2LcSYJpjBX1Bak6owvSrYr47+
         et6w==
X-Gm-Message-State: ACgBeo01kBD9XmSyvZJmGg4ZV4SZV/565A8T3Wby11yKRXrJ7hup6zdd
	UUjPjeQjff/lbv5RaLLJTL70ELN4Dpht6g==
X-Google-Smtp-Source: 
 AA6agR4DlIaYBYWuYZbw9iQd2HpHVRRHoOHONUvKK4DJ4Vb3IDaRPOeAmj79FxxJCBrw4rJsmscpiQ==
X-Received: by 2002:a63:1857:0:b0:41c:4217:426e with SMTP id
 23-20020a631857000000b0041c4217426emr2061717pgy.285.1661494315896;
        Thu, 25 Aug 2022 23:11:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:11:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 4/9] rygel: Upgrade to 0.40.4
Date: Thu, 25 Aug 2022 23:11:45 -0700
Message-Id: <20220826061150.3030485-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826061150.3030485-1-raj.khem@gmail.com>
References: <20220826061150.3030485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98467

Switch to meson build system
Fix build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{rygel_0.38.3.bb => rygel_0.40.4.bb}      | 49 +++++++++++++------
 1 file changed, 35 insertions(+), 14 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.38.3.bb => rygel_0.40.4.bb} (60%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
similarity index 60%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
index ec7824b60d..8bc8767d8f 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
@@ -8,34 +8,55 @@ HOMEPAGE = "http://live.gnome.org/Rygel"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
+DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 \
+           gstreamer1.0-plugins-base libgee libsoup-2.4 libmediaart-2.0 \
+           libunistring sqlite3 intltool-native gst-editing-services"
+
 RDEPENDS:${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS:${PN} = "rygel-plugin-media-export"
 
-inherit gnomebase vala gobject-introspection gettext systemd features_check
+inherit gnomebase features_check vala gobject-introspection gettext systemd meson
 
 # gobject-introspection is mandatory for libmediaart-2.0 and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-SRC_URI[archive.md5sum] = "7f95401903a3f855b464d5152b9d4c07"
-SRC_URI[archive.sha256sum] = "08c21a577f7bdad26446a75ffa32778b26842c3b1188165f0b19818559747d00"
-
-EXTRA_OECONF = "--disable-tracker-plugin --with-media-engine=gstreamer"
+SRC_URI[archive.sha256sum] = "736d8adbe8615f6cbc8fcfff9845dc985fd10e16629da236b4b52dbedf0a348b"
 
-PACKAGECONFIG ?= "external mpris ruih media-export gst-launch"
+GNOMEBASEBUILDCLASS = "meson"
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
 
+EXTRA_OEMESON = "-Dengines=gstreamer -Dplugins=${@strip_comma('${RYGEL_PLUGINS}')}"
 PACKAGECONFIG:append = "${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk+3", "", d)}"
 
-PACKAGECONFIG[external] = "--enable-external-plugin,--disable-external-plugin"
-PACKAGECONFIG[mpris] = "--enable-mpris-plugin,--disable-mpris-plugin"
-PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
-PACKAGECONFIG[media-export] = "--enable-media-export-plugin,--disable-media-export-plugin"
-PACKAGECONFIG[gst-launch] = "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
-PACKAGECONFIG[gtk+3] = ",--without-ui,gtk+3"
-PACKAGECONFIG[lms] = "--enable-lms-plugin,--disable-lms-plugin"
+PACKAGECONFIG ?= "external mpris ruih media-export gst-launch"
+
+PACKAGECONFIG[external] = ""
+PACKAGECONFIG[mpris] = ""
+PACKAGECONFIG[ruih] = ""
+PACKAGECONFIG[media-export] = ""
+PACKAGECONFIG[gst-launch] = ""
+PACKAGECONFIG[lms] = ""
+PACKAGECONFIG[tracker3] = ""
+PACKAGECONFIG[gtk+3] = ",-Dgtk=false,gtk+3"
+
+RYGEL_PLUGINS = ""
+RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'external', ',external', '', d)}"
+RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'mpris', ',mpris', '', d)}"
+RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'ruih', ',ruih', '', d)}"
+RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gst-launch', ',gst-launch', '', d)}"
+RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'lms', ',lms', '', d)}"
+RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'media-export', ',media-export', '', d)}"
+RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'tracker3', ',tracker3', '', d)}"
+RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'playbin', ',playbin', '', d)}"
 
 LIBV = "2.6"
 
+CFLAGS:append:toolchain-clang = " -Wno-error=int-conversion"
+
+def strip_comma(s):
+    return s.strip(',')
+
 do_install:append() {
        # Remove .la files for loadable modules
        rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
-- 
2.37.2


