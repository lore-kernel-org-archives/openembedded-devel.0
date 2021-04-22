Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.12497.1619098419158247153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 06:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=edlYUzsz;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id q10so32819956pgj.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=v4pl5LMrkO2//1Ha3jNJxl8txKHJiNC1VkUI6Z4j1IA=;
        b=edlYUzszyMbcPiN0zrGddygEKUT3/FxSPcwGMvjc4hUl6RxFjwG+WLWp18mtQzN0GZ
         sOFRcUXSZ3nIG9dZx70I1ZPuNOx9bRMHThdWPRKm4B/2WKKUtvPg4fSQTNA5v/KUTycC
         qG5Aesfz/1VCpvNnaVbcMkvx1c/2PI7VjNTYBECSwumO4OpiQ0fTSmHwlGbSCvbgAU6C
         4Ahv7FH5My10BahBbEZ6wswd6h+fFDh1bc7W6jkH0Wm43dCJ81k9uHISMhxF1rMGSQBU
         b1EyKrd8Hz23BSDtbRpLs19n/dBULR9zpIOrXb+Kb7R9Tud68+KG0rCShKfBqXR8xf/o
         ZfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=v4pl5LMrkO2//1Ha3jNJxl8txKHJiNC1VkUI6Z4j1IA=;
        b=bbKaoGjB3JVrSM55ORm4W5114fEJQ/q9B36ESlYocVNkSbo49WHG3ChmaC3GuazSCq
         odNqhiU6l/jPxET3fI1XKd1JcVUw3+o7zzvO3gfJ3H40kh8zy1DzKlnKE+YhomCNjPj0
         VcXsaIYTjPnV+PApAt8Fougm8mX70OFOvaKEddT+lSf331yj4cXyeAc6m9lSgeULB4DD
         y4lUxDWnDeL3ul0MdHZl+rLB93pDv+AkBIyZ8L2tIkLrocSeMgagUHU0Rq+NwNzdsNlf
         l59Cq9mvAzk5+CWl6uoDB70r/SA/JBxeFTGhJqte/A2N1JsmSsZ8GiZqz3shC41ERJ2l
         yTag==
X-Gm-Message-State: AOAM533bIgzJYO3MwFbqLlWTEq06TeTMWhYQ1ol9BfNyWyXqmHgvisAH
	vRkk9CrZMiIWUp6omyf5r0qB9xp2UkqXNg==
X-Google-Smtp-Source: ABdhPJypqK3Yk0c6B8ECP+NsnL2/sdFO3cCjLVBLsGpTIc0/AKnKtgcIM9i5cMY3MAYJQfykVGtPYA==
X-Received: by 2002:a63:4758:: with SMTP id w24mr3614239pgk.33.1619098418569;
        Thu, 22 Apr 2021 06:33:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e183:e120:a0a1:83e4])
        by smtp.gmail.com with ESMTPSA id gd1sm2376182pjb.49.2021.04.22.06.33.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:33:38 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 4/4] gpsd: backport d-bus message time patch from upstream
Date: Thu, 22 Apr 2021 06:33:20 -0700
Message-Id: <29ca52c7826ad3044b53ccb5224016bd73abdb5c.1619098298.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619098298.git.akuster808@gmail.com>
References: <cover.1619098298.git.akuster808@gmail.com>

From: Hermes Zhang <chenhuiz@axis.com>

This patch is backport from 821c149d486c0e67c1bd35d7c044ede9348aeb8d of
upstream to fix the broken d-bus message time

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 285e4c9bfb5bee87f33193c455ce4962a0b927c3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit cd14b3faa1aa029d7c067d7b342fff64215d58fc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...port.c-Fix-broken-d-bus-message-time.patch | 36 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-gpsd-dbusexport.c-Fix-broken-d-bus-message-time.patch
new file mode 100644
index 0000000000..659865efe1
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
index 3888ad8fa3..0989cc1398 100644
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

