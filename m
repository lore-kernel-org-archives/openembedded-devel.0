Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6B4C54E65
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 00:24:05 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.37735.1747959834885233086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 17:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IvKMVZK1;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e694601f624so6389644276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 17:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747959834; x=1748564634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/T9TqlS+H0buItyfqsp5HNX0kIHkE3AKyWh+3NrFA0w=;
        b=IvKMVZK1mcbPxK5aJ+tBEeL4BeUNrAm7r7ysko5YODW6QKrrpGGA/PhEIzFX7RgXZ/
         8hVwRGD46P4JNhODiTQ15M1+p9V1VyQDb8a1nzIkG7Zo6/GjsOyDpjMfMDRxmchrZmxc
         rL7M9HAyAwUftLJLyyuKo5DAn76CqI0JW/feRAvN7IWrcgNBlVexWPOcUacPXZX7tqqf
         sQOwEZmnfLjKxGjhFvWQZyxJptQpO9jfYiTM+Ei6FalF5PyKC0zOq0iAs43dYkFaSCtw
         vxSu2jYvVg60REdxFat4jLZ52nlIvLg1goRBMj1JtRBIN8098NlPh4+egYRBbLkAQrWA
         A+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959834; x=1748564634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/T9TqlS+H0buItyfqsp5HNX0kIHkE3AKyWh+3NrFA0w=;
        b=hWwTRiBRWSJPbMfiuSrFYfTcfKN1GHqEhjIvqpiREubw8hf5ISzA2LQjouXPqpYbw1
         oJLEiWUpR1AsCWVo2si0L0IMZj6JtNZC75NU4ZNZiGP02ZzzFYI/H6Dcp14D1FRGh/UI
         W2yQHX2EzoYcKhxvrXbhDWrohZbijvq+EYtjbjG1MAEbvZv+GYZEoNdW7eV2HI1B1FrX
         0C8kH7w0ghmy2Uc5+Xg9O2wxeToWON56HokbEWlPJg6gbHh39pVYsf/a+Ct6pEUVHja0
         wDVkHZ2m74wfDLxnp9AcTLy5qmTnvdCgSwBmJpcTpw90gXuc3irhEoUleMf6R5SLWMRt
         UShg==
X-Gm-Message-State: AOJu0YxTFXmAeO94MKIqTck+z/9iHfZApyYSjb54t85XkecxGhWK7g3s
	9DB56f0lFCfa6rBzS+hQnqQbY4o4M6AHsu1zFEF39ET4KM9Imxy3VSUpsUpxcprb
X-Gm-Gg: ASbGncvzwixVQvJTzQk+L883CrsWl5O9YJ67b1BGNHWzy1PMax/0YMKh3UxSSWgmXFz
	irq/ExbHmX7NhX2PmQbAXqQ6odvGRT1ffOdnRozX+Cwy/KCS6UBRBKZHJtmBT7MTYbAFlFIhKMb
	5x8LM15JJrWTz5E2FDUzx8ZVQinDsMcsNYZXfCnBB6cTD4hTEg+yR76zbR6jats2Ip12I7V3CV1
	IsoUXxJDGKGPgRAlpFWoCoVc+rjpx7lRrtDM4wUdqI4sVHn90rQZHTsHbz2qgJEjPrFRZLKKCGN
	OPtQkuhuIu1+wOJIlOaI7PsVuqP6rnZN+7lGar03byGEUU2APBr/9ZhU
X-Google-Smtp-Source: AGHT+IGZwTF1YZh+g3IauYNNGbAC8su1kiK0+yxhtLN3xSKl7e+VOhuvMAnpF/oh5dAgGor7bM0ITA==
X-Received: by 2002:a05:6902:1507:b0:e7d:8116:46ca with SMTP id 3f1490d57ef6-e7d81164921mr413197276.18.1747959833292;
        Thu, 22 May 2025 17:23:53 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7d72635ae5sm597682276.30.2025.05.22.17.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 17:23:52 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][scarthgap][PATCH] xfce4 update HOMEPAGEs
Date: Thu, 22 May 2025 20:23:40 -0400
Message-ID: <20250523002340.314406-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 00:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117601

https://goodies.xfce.org/ states "Starting this month (November 2019), a project is starting
to migrate the goodies.xfce.org documentation to https://docs.xfce.org/start. The goal is to
remove deprecated projects and, eventually, de-commission the goodies.xfce.org URLs. Additional
information will be posted on https://wiki.xfce.org/projects/goodies-decomm/start as the project
proceeds."

This patch updates the URLs being used in the HOMEPAGEs to reflect where the address is actually
resolving.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb                  | 2 +-
 .../recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb | 2 +-
 .../calculator/xfce4-calculator-plugin_0.7.2.bb                 | 2 +-
 .../recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb | 2 +-
 .../recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb | 2 +-
 .../cpugraph/xfce4-cpugraph-plugin_1.2.8.bb                     | 2 +-
 .../datetime/xfce4-datetime-plugin_0.8.3.bb                     | 2 +-
 .../diskperf/xfce4-diskperf-plugin_2.7.0.bb                     | 2 +-
 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb | 2 +-
 .../recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb | 2 +-
 .../recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb   | 2 +-
 .../mailwatch/xfce4-mailwatch-plugin_1.3.1.bb                   | 2 +-
 .../recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb     | 2 +-
 .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb | 2 +-
 .../recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb    | 2 +-
 .../recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb   | 2 +-
 .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb | 2 +-
 .../smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb           | 2 +-
 .../systemload/xfce4-systemload-plugin_1.3.2.bb                 | 2 +-
 .../time-out/xfce4-time-out-plugin_1.1.3.bb                     | 2 +-
 .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb     | 2 +-
 .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb     | 2 +-
 .../recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb | 2 +-
 .../weather/xfce4-weather-plugin_0.11.1.bb                      | 2 +-
 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb   | 2 +-
 .../archive/thunar-archive-plugin_0.5.2.bb                      | 2 +-
 .../xfce4-power-manager/xfce4-power-manager_4.18.1.bb           | 2 +-
 27 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb
index cd868c243b..2d4cdfa498 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Simple client plugin for Music Player Daemon"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-mpc-plugin/start"
 SECTION = "x11/application"
 LICENSE = "0BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3604d987e6dfdfc672c754d08953b0e0"
diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb
index ce119bb6da..16ebebf235 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-battery-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb
index 0c464930e1..d5ce9ad361 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A calculator plugin for the Xfce panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-calculator-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-calculator-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
 
diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
index 39a8f2edfe..59fb8578c1 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Clipman is a clipboard manager for Xfce"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-clipman-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-clipman-plugin/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb
index 8ddf48d6ef..1a19f488c0 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin to display frequency of all cpus"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-cpufreq-plugin/start"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb
index 8e58175615..b240eaad5e 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.8.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-cpugraph-plugin/start"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
index f292a6deaf..f025edd4c5 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin displaying date and time and a calendar when left-clicked"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-datetime-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
index 25a57f3233..583aa9a006 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.7.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin displaying instant disk/partition performance"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-diskperf-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-diskperf-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb
index 0c796534ab..6eaac70a09 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-eyes-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-eyes-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb
index 380d2e19e3..de8d6786c2 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "The FSGuard panel plugin checks free space on a chosen mount point frequently and displays a message when a limit is reached"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-fsguard-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
 
diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb
index 31ad5e7ced..6558a1492d 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.2.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "This plugin cyclically spawns the indicated script/program, captures its output (stdout) and displays the resulting string into the panel."
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-genmon-plugin/start"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
 
diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb
index 6ea260765f..d6b367c0da 100644
--- a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Multi-protocol, multi-mailbox mail watcher for the Xfce4 panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mailwatch-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-mailwatch-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
index 3a6baf21f9..f11e41f9bd 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Mount/umount utility for the xfce panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mount-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-mount-plugin/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
index c30f17a7d4..6ed4747565 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin displaying current load of the network interfaces"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-netload-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b6065ae7d3696cdad6869dd8627a9fe"
 
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb
index 8c9768b1e3..3895cb9bce 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.10.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Notes plugin for the Xfce Panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-notes-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb
index 6400e0d3e4..753dcae91e 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Menu for quick access to folders, documents and removable media"
 DESCRIPTION = "Panel plugin displaying menu with quick access to folders, documents and removable media"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-places-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
index eb1165c578..ba3c83a131 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Sensors plugin for the Xfce Panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-sensors-plugin/start"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
index fdec598190..68e9cbd3a3 100644
--- a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin allowing to send requests directly to browser"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-smartbookmark-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-smartbookmark-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
index e7a3e9936e..0b07bda32b 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Panel plugin displaying current CPU load, the memory in use, the swap space and the system uptime"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-systemload-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-systemload-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9acb172a93ff6c43cce2aff790a8aef8"
 
diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb
index 9fa287a1ca..1622cd4d2b 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "This plugin makes it possible to take periodical breaks"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-time-out-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-time-out-plugin/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb
index 33b60438d1..0f164b79c5 100644
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "XFCE panel plugin to generate alarm messages"
 DESCRIPTION = "This is a simple plugin that lets the user run an alarm at a specified time or at the end of a specified countdown period"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-timer-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-timer-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1c52159bdaebd029cb11927cbe709e4"
 
diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb
index 9dcaae8ceb..844d8caf17 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Verve panel plugin is a comfortable command line plugin for the Xfce panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-verve-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-verve-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb
index 530f52425a..64e7ea6a18 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin displaying stats from a wireless lan interface"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-wavelan-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
index 858bd5459b..87b826954c 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin to display current temperature and weather condition"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-weather-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-weather-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
index 3d935a3d71..0e482af353 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "XKB layout switching panel plug-in for the Xfce desktop environment"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-xkb-plugin/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb
index 91b3efa83e..0ba997b544 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Thunar Archive Plugin allows you to create and extract archive files using file context menus in Thunar"
-HOMEPAGE = "http://goodies.xfce.org/projects/thunar-plugins/thunar-archive-plugin"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/archive"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
index f7f72356d8..cfb7a26ab1 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.18.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Power manager for the Xfce desktop environment"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-power-manager"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-power-manager/start"
 SECTION = "x11"
 
 LICENSE = "GPL-2.0-or-later"
-- 
2.43.0


