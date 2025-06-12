Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84A7C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 02:48:51 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.4028.1749696529624354323
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Jun 2025 19:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJQXUmhd;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e818a572828so351568276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jun 2025 19:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749696529; x=1750301329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CR+ZAVKUte2a4nQlaoRi2lRRaGlVtr3XipRlEa7mJHs=;
        b=gJQXUmhdpNH5k2otulQALToZ0pcCXbsbyH3ObQGxC/sIMOrJR1G+xeGQADOSa2jvAp
         e4QNlrA0sh26DeOQNzDtChbhvqYrqBr7ptIe6iErh5pLQJ4VqYU0qMMl8BoHAtTF6rnw
         TwxGQn+b+jjn5k4C9NaZRi6BT+TxxNuX4IXIcLlNr92SOSzqc8wTF5uyF5dECE6itS2Z
         G5Ij0F/VV1CFy0MeKdUPSfLeGXwBK4hYwulxN0rGHuScEIXu0lePYybu9QPH486dcxij
         ebKBcbze/pfokOzHARx8U4MznyjKK+wjWvw0KJBZZgwPtrFqK6IWv5Ge3StUETsW0zna
         9KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749696529; x=1750301329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR+ZAVKUte2a4nQlaoRi2lRRaGlVtr3XipRlEa7mJHs=;
        b=SDYsW31T/OKtEBNi6PlL8rdGQXFUt8FZIib/UOI7hukxTVCM93SOQrQ0Dld5EvrVS6
         7GbatKzU9uURV/FCMStcCgdrJBW8pTg5YhueVg4cqvDL8cRBcc0lXpNmbMtNJ22dZaSX
         riQwWouxmhaMW41E91fDcIHZs9iuU0rF3KRhosdYhN1fAocZhp1Fbk8ejSz7y3CnLo/R
         f4mzzfnIt50ctLZEMFwT836dLGVey/xvYn+duOVzLe0RP98RE49UTerU94+BirSxqfJ7
         bY/DZNgE6Wb7vanpzL4J6Q+8kOW//g/FWd1QcZCWYQMjxXcydBUC2XTsYQpB1pstNdNg
         J+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk5LLhejBA54ksoy9ErsnIMVTBj8D78U5PIVzBNCE8fqCBZGEuoC8kWdDeSN+4YDJwn3NE1KoqtmlEAID5qmRB4TQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YywaRz1xvl4LlPMCRpsDDegS6xCeCrKy4awEWIH2uVkEhqgYxdp
	naIQDRVK5cL/VXVuicDkWp9NZEsyJKRez0SKJOWa78NSvdi5B/2q9ducH6TFpYxV
X-Gm-Gg: ASbGncujmcC/UMFfb2LEP2dLHPL9WU0gOkXreMKknRMHjWIFptcxnKMBLl5PwGCIU0A
	a/uzAmnCIYarp19230bH/Qk49bQwKIU2tci0oKi+fl+LTFGjDHBQNXXhgxIV/FXuSO+JpUTJ+ag
	JPWrkwXUcLqbjHrJWY4QXZDX+qtT2dry9iufJShJP+QdPurc4MICrU9B5tpLR6sJc+0cAq7+sK4
	+H9Xnz5ZmsPEipm0qdeKvanYm7JJFP1FXyMswAa3w8YJuQnD36jlqRprSLoV8us7t34LuV7iQYB
	Ep0cpPrVOWOPDeLA0/WhK4FYWi+feboqKLoANvPEI9BFaw2UJKw2C7+qyI4qemUxclRwr8h/XTx
	Q0CCLToVE4yG3wAm/zsxO
X-Google-Smtp-Source: AGHT+IGWaKgR361zRx9vbhkcfhDggAPQ+K3rBtmKVDmXqIsq7ZfYfTWtcQ13HA5jZtWlNrjMTHJ15w==
X-Received: by 2002:a05:6902:2409:b0:e81:dc32:b685 with SMTP id 3f1490d57ef6-e820b64d02emr2729061276.16.1749696528186;
        Wed, 11 Jun 2025 19:48:48 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e33968csm180757276.55.2025.06.11.19.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 19:48:47 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][kirkstone][PATCH] xfce4 update HOMEPAGEs
Date: Wed, 11 Jun 2025 22:48:18 -0400
Message-ID: <20250612024818.9980-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 02:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117883

https://goodies.xfce.org/ states "Starting this month (November 2019), a project is starting
to migrate the goodies.xfce.org documentation to https://docs.xfce.org/start. The goal is to
remove deprecated projects and, eventually, de-commission the goodies.xfce.org URLs. Additional
information will be posted on https://wiki.xfce.org/projects/goodies-decomm/start as the project
proceeds."

This patch updates the URLs being used in the HOMEPAGEs to reflect where the address is actually
resolving.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb     | 2 +-
 .../xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb           | 2 +-
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb                  | 2 +-
 .../recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb | 2 +-
 .../calculator/xfce4-calculator-plugin_0.7.1.bb                 | 2 +-
 .../recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.2.bb | 2 +-
 .../recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb | 2 +-
 .../cpugraph/xfce4-cpugraph-plugin_1.2.6.bb                     | 2 +-
 .../datetime/xfce4-datetime-plugin_0.8.1.bb                     | 2 +-
 .../diskperf/xfce4-diskperf-plugin_2.7.0.bb                     | 2 +-
 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.6.0.bb | 2 +-
 .../recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb | 2 +-
 .../recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb   | 2 +-
 .../mailwatch/xfce4-mailwatch-plugin_1.3.0.bb                   | 2 +-
 .../recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb     | 2 +-
 .../recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb | 2 +-
 .../recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb     | 2 +-
 .../recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb   | 2 +-
 .../recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb | 2 +-
 .../smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb           | 2 +-
 .../systemload/xfce4-systemload-plugin_1.3.1.bb                 | 2 +-
 .../time-out/xfce4-time-out-plugin_1.1.2.bb                     | 2 +-
 .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb     | 2 +-
 .../recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb     | 2 +-
 .../recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb | 2 +-
 .../weather/xfce4-weather-plugin_0.11.0.bb                      | 2 +-
 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.2.bb   | 2 +-
 .../archive/thunar-archive-plugin_0.4.0.bb                      | 2 +-
 .../xfce4-power-manager/xfce4-power-manager_4.16.0.bb           | 2 +-
 29 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb
index 6086608110..3702e5c211 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.6.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Easily themable notification daemon with transparency effects"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-notifyd"
+HOMEPAGE = "https://docs.xfce.org/apps/notifyd/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = " \
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb
index bb44ec7829..5a1aa5d416 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.10.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Application to take screenshots"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-screenshooter"
+HOMEPAGE = "https://docs.xfce.org/apps/screenshooter/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
index 4a7ed93ebc..6a2c6fa2eb 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Simple client plugin for Music Player Daemon"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-mpc-plugin/start"
 SECTION = "x11/application"
 LICENSE = "0BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3604d987e6dfdfc672c754d08953b0e0"
diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
index 0f8489b18c..fe7e2aef20 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-battery-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
index 8fd2bd0d29..a70c4b8703 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.1.bb
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
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb
index c98fe4a5c3..003b09fe76 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin to display frequency of all cpus"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-cpufreq-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.6.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.6.bb
index a9ac08989e..60ef1e9f1c 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.6.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.6.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-cpugraph-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
index c029ac1c0f..1d7906ef05 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.1.bb
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
 
diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
index 5585a4f0aa..d2ae5101b8 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "The FSGuard panel plugin checks free space on a chosen mount point frequently and displays a message when a limit is reached"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-fsguard-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3434d79d62df09abf5f78bb76d6cd21b"
 
diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
index d792bc047b..9fbce56ab6 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.1.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "This plugin cyclically spawns the indicated script/program, captures its output (stdout) and displays the resulting string into the panel."
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-genmon-plugin/start"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
index a5c98efc1c..ccfee7b944 100644
--- a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Multi-protocol, multi-mailbox mail watcher for the Xfce4 panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-mailwatch-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-mailwatch-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
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
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
index 834f5cfaae..267d11b44b 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin displaying current load of the network interfaces"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-netload-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
index dc0fc2c60e..f6ca702aa2 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Notes plugin for the Xfce Panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-notes-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
index e8e133035d..c0f90131a4 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Menu for quick access to folders, documents and removable media"
 DESCRIPTION = "Panel plugin displaying menu with quick access to folders, documents and removable media"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-places-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb
index 13933b6cd9..142f98eef1 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.4.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Sensors plugin for the Xfce Panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-sensors-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b94789bed9aec03b9656a9cc5398c706"
 
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
 
diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb
index 151ce3849c..3737394bbf 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Panel plugin displaying current CPU load, the memory in use, the swap space and the system uptime"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-systemload-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-systemload-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9acb172a93ff6c43cce2aff790a8aef8"
 
diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
index 5b7f62471d..0ab9cbf6f0 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "This plugin makes it possible to take periodical breaks"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-time-out-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-time-out-plugin/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
index 1231e084cd..3e511df796 100644
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "XFCE panel plugin to generate alarm messages"
 DESCRIPTION = "This is a simple plugin that lets the user run an alarm at a specified time or at the end of a specified countdown period"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-timer-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-timer-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae39271267fd63eb7619432ff24e7ff1"
 
diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
index 21bbda331a..600546046b 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Verve panel plugin is a comfortable command line plugin for the Xfce panel"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-verve-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-verve-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
index c52b35d02f..dbfba926da 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Panel plugin displaying stats from a wireless lan interface"
-HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-wavelan-plugin/start"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
index ede98e9926..84967da51d 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
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
diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
index 0a1098db56..d6f63c931f 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Thunar Archive Plugin allows you to create and extract archive files using file context menus in Thunar"
-HOMEPAGE = "http://goodies.xfce.org/projects/thunar-plugins/thunar-archive-plugin"
+HOMEPAGE = "https://docs.xfce.org/xfce/thunar/archive"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
index 34de7a7086..75ba6857d1 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.16.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Power manager for the Xfce desktop environment"
-HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-power-manager"
+HOMEPAGE = "https://docs.xfce.org/xfce/xfce4-power-manager/start"
 SECTION = "x11"
 
 LICENSE = "GPL-2.0-or-later"
-- 
2.43.0


