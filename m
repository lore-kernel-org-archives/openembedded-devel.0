Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.251.1617899793975339753
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p137SG1M;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id s1-20020a4ac1010000b02901cfd9170ce2so643212oop.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7P+2vMLgyhaauX53L0q52VZDBeLWEhZg4tO+4AIJO1Y=;
        b=p137SG1MFbQj+jYm8MvTQ8Gh1ywWLRkh0JWuNCPKHPW7EKiOX3LCsRQ9xQM3r/UbdR
         dDsbGpk5TnqGJ3pjPxxA7ljnzGFjbB8jmVXA3m5GT/V7AvbY35MMBKYM4G237VenFj3y
         SGm+5LCmSzNJwIuXA63zxjr+/P4X+gvbiPpQ+gYYqrfK8GdRGeluUZR94nwca9Spmx7R
         vEfpBF3+jSyoboWeGlIMzOwuUlLEsiX+Ty/7fhO7qkkaTW1PwRgbi5t2A0e4aUvsK8hN
         6rDIaAVOkSTB3pAXNRggmPM8j2+RCPPP5MEJFVXGPSp6Z/OlSWJwmhjGFkOhY6K4Hanz
         2h8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7P+2vMLgyhaauX53L0q52VZDBeLWEhZg4tO+4AIJO1Y=;
        b=XkIZWGxQ1T6rQGz1iYsSZVVev4L3NvMdIytFldJP3hOqI79DTdDi0rvqcFx47hDjVp
         3TI+Lc+oVJy+issWN4JhMJhT/z8onCz4KBBnw/sf8j1sTxytqHUX9YxhMZ5pfLmN6sZA
         SCeTsutRuKawAwPOsVRpsB60JPiqfBOXIaLjcIvpYTpUXxkmlEXmmN0YbKmLbox6lYVI
         lg4sAO3RuUe8TtYyeTUOPGrRKCk68pv1qs6K3/KI9grRuGBgYbbRvnnUlqaeQULzcy5Z
         +ndRTpDYLUlIlX/4ksxyT2n9LeZCalmdcF/vCQ18QENmthUw6bMe1o0z8VTUy1FwB7Um
         F68g==
X-Gm-Message-State: AOAM530cTLCBnDpsTOkPY6k3IstWVSV+Dmb19TAptD6gJIXqDBUGQmmY
	OqaYuLK2x0RPtjnmbzrFOkLZN1f3IDY=
X-Google-Smtp-Source: ABdhPJxZ8dn43iMrt7i10AnPh2slGTR0E3hwHhjouEZaNpwkyI/tXsj9Sfx47oPRN/9wNHSCHl5drg==
X-Received: by 2002:a4a:e548:: with SMTP id s8mr2333791oot.63.1617899793146;
        Thu, 08 Apr 2021 09:36:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:32 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 22/64] gpsd: backport d-bus message time patch from upstream
Date: Thu,  8 Apr 2021 09:35:29 -0700
Message-Id: <cd14b3faa1aa029d7c067d7b342fff64215d58fc.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Hermes Zhang <chenhuiz@axis.com>

This patch is backport from 821c149d486c0e67c1bd35d7c044ede9348aeb8d of
upstream to fix the broken d-bus message time

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 285e4c9bfb5bee87f33193c455ce4962a0b927c3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...port.c-Fix-broken-d-bus-message-time.patch | 36 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch
new file mode 100644
index 00000000000..659865efe10
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch
@@ -0,0 +1,36 @@
+From c9cec2a888d4fea8534be78a0f46d920155ceae6 Mon Sep 17 00:00:00 2001
+From: Paul Fertser <fercerpav@gmail.com>
+Date: Wed, 4 Nov 2020 12:40:50 -0800
+Subject: [PATCH] gpsd/dbusexport.c: Fix broken d-bus message time.
+
+Change-Id: I4b9990ce4517a8feb29fc9e090c62f5a0c56ddd5
+---
+ dbusexport.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/dbusexport.c b/dbusexport.c
+index 40b35739e..5d08a8702 100644
+--- a/dbusexport.c
++++ b/dbusexport.c
+@@ -38,6 +38,7 @@ void send_dbus_fix(struct gps_device_t *channel)
+     /*DBusMessageIter   iter; */
+     dbus_uint32_t serial;	/* collected, but not used */
+     char *gpsd_devname;
++    double dtime;               // time as a double, loss of precision!
+ 
+     /* if the connection is non existent, return without doing anything */
+     if (connection == NULL)
+@@ -51,8 +52,9 @@ void send_dbus_fix(struct gps_device_t *channel)
+     /* the dbus/locationd doc fails to specify altitude as WGS84 or MSL.
+      * assume altMSL */
+     message = dbus_message_new_signal("/org/gpsd", "org.gpsd", "fix");
++    dtime = TSTONS(&gpsfix->time);
+     dbus_message_append_args(message,
+-			     DBUS_TYPE_DOUBLE, &(gpsfix->time),
++			     DBUS_TYPE_DOUBLE, &dtime,
+ 			     DBUS_TYPE_INT32, &(gpsfix->mode),
+ 			     DBUS_TYPE_DOUBLE, &(gpsfix->ept),
+ 			     DBUS_TYPE_DOUBLE, &(gpsfix->latitude),
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
index 3888ad8fa33..0989cc13987 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
@@ -8,6 +8,7 @@ PROVIDES = "virtual/gpsd"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
     file://0001-Revert-SConstruct-Add-test-for-sizeof-time_t-result-.patch \
+    file://0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch \
     file://gpsd.init \
 "
 SRC_URI[md5sum] = "cf7fdec7ce7221d20bee1a7246362b05"
-- 
2.17.1

