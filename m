Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E32CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 22:02:06 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.4619.1654552916288979040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYfu+THO;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id s12so24341091ejx.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y6NekRg5lnJxHHKXVUHPzcSdLy07zRNBkJxgsTfnwl8=;
        b=UYfu+THOUB9n0vCWcuagYuyNo4RB7yMn31fnbp4N4oCRFiyJGuh44UFuORy/C3UTH/
         Aus0EJw17bTdsCOBje0Gx0RjZD39iN5Iblx5njM2n8aFNqTF8M4hmH2wrFZhNBqgLhdI
         TFsUNjnJKwSiln69FqmxhpLj+lhpFX1BvUoatYCZoxkte7fdT2EGaol4hwxVGDzX4gdm
         hjukOh4wEWvuuKlgu7A8MSsGyDF9yMvydUu4GnKY0DIIC8ZewnfId5XPPqWqs1PoKLb4
         gYM6+YtdXzcvPeLnP0muz8s1m9B7kvmVxX/1YqyhbIFY7xJPdFI16ChJv9WbVGhO4ALc
         KAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y6NekRg5lnJxHHKXVUHPzcSdLy07zRNBkJxgsTfnwl8=;
        b=aiVq8QegHtwRtuX26ERd9s8sWhIhxpjH1kifbbdmh1azU3gqERFf7ayvZjfHf/yD6X
         hLn8Mpl+h8B8+EHzthDiOmmS/glLD5T5177oUNxgOEtrMex/jEd4KtNJqq7x3oiT/g0W
         Hp4vF4TE+AljwEOptndlYiOW4m1A751tqCnehHUUq5NxlB68jJpal1bC/MpCCoEGZ6a7
         I9jzJGChG5i6yobmmKhuuE0emtbnfa+7wKZdP6EwESfb8CR479FjMYaiKCZ3s2cg1jNI
         5FsyDj1xXxlA4hTKYT75kVT3i244SBH3ok9Zl45f8OsNp2hQ7jlNESoODVRhXjXea2Op
         kv9g==
X-Gm-Message-State: AOAM533AAj59srSrdPJVVVzKuqKfCbAI0JsphhnOe2kwLrA/RaphuhBP
	Y5kSh49ltdlPJ2MHId/cfG6Dqxce1j6aGQ==
X-Google-Smtp-Source: 
 ABdhPJz4TIDsTzuKmpemX6tFgx8jMygGerI6vhuAlQ7j0BPfYcGXS3P0CCHTESDzpHaZvshvS910Bg==
X-Received: by 2002:a17:906:7949:b0:6ff:27a9:f024 with SMTP id
 l9-20020a170906794900b006ff27a9f024mr23474963ejo.277.1654552914471;
        Mon, 06 Jun 2022 15:01:54 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b0042dd4ccccf5sm9134826edv.82.2022.06.06.15.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 15:01:53 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH 5/5] modemmanager: update to 1.18.8
Date: Tue,  7 Jun 2022 00:01:37 +0200
Message-Id: <20220606220137.1887491-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
References: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 22:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97436

* A new connection status dispatcher setup is provided, where users can
   provide custom scripts that will be called on bearer connect/disconnect
   events. This dispatcher will make the netifd integration in openwrt work
   much better, as we'll be able to report network-initiated disconnections
   cleanly to netifd.

   There are no default connection status dispatcher scripts installed, but
   it's suggested distributions make sure the following directories exist:
     - ${sysconfdir}/ModemManager/connection.d/
     - ${libdir}/ModemManager/connection.d/

 * API:
   ** Add missing Simple interface definitions in ModemManager-names.h.

 * Build:
   ** meson: fix daemon enums dependencies.
   ** meson: fix port enums includes.
   ** meson: fix 'export_packages' in GIR setup.
   ** meson: fix simtech plugin module name.
   ** systemd: don't run ModemManager in containers.

 * Core:
   ** serial: ensure the port object is valid after BUFFER_FULL handling.
   ** netlink: use unaligned netlink attribute length.
   ** netlink: only change IFF_UP flag.
   ** bearer: match unknown auth to chap in loose comparisons.
   ** charsets: return error if UTF-8 validation fails.
   ** fcc-unlock: make scripts POSIX shell compatible.
   ** modem-helpers: consider minimum ID when choosing best profile.
   ** modem-helpers: fix reading <Act> given in COPS=? responses.
   ** sms: prevent crash if date is out of range.
   ** profile-manager: fix copy-paste error on tags for quarks.

 * QMI:
   ** Ignore slot status indications until initial status is known.
   ** Return error when loading capabilities if none is found.

 * MBIM:
   ** Default initial EPS bearer's auth to chap when unknown.
   ** Update default error when network error is out of range.

 * mmcli:
   ** Fix key length when printing list of items.

 * Plugins:
   ** linktop: new port type hints.
   ** cinterion: add support for PLSx3w modems
   ** huawei: disable +CPOL based features in Huawei E226

 * Several other minor improvements and fixes.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...-shell-scripts-to-use-bin-sh-for-use.patch |  42 ++++----
 ...-Make-scripts-POSIX-shell-compatible.patch | 100 ------------------
 ...nager_1.18.6.bb => modemmanager_1.18.8.bb} |   5 +-
 3 files changed, 24 insertions(+), 123 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.6.bb => modemmanager_1.18.8.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch b/meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch
index 7c3e7750af..914760512a 100644
--- a/meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch
+++ b/meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch
@@ -1,42 +1,44 @@
-From f7a3292c1c753b29384e216693f51a4213fea7d0 Mon Sep 17 00:00:00 2001
+From 35173fa04d0116ba30a86dc1a19f859f2be14a24 Mon Sep 17 00:00:00 2001
 From: "Bruce A. Johnson" <waterfordtrack@gmail.com>
 Date: Wed, 22 Dec 2021 14:24:02 -0500
-Subject: [PATCH 1/2] core: switch bash shell scripts to use /bin/sh for use
+Subject: [PATCH] core: switch bash shell scripts to use /bin/sh for use
  w/Busybox.
 
 Fixes https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/issues/483
+
+%% original patch: 0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch
 ---
- data/fcc-unlock/105b           | 2 +-
- data/fcc-unlock/1199           | 2 +-
- data/fcc-unlock/1eac           | 2 +-
- test/mmcli-test-sms            | 2 +-
- tools/tests/test-wrapper.sh.in | 2 +-
+ data/dispatcher-fcc-unlock/105b | 2 +-
+ data/dispatcher-fcc-unlock/1199 | 2 +-
+ data/dispatcher-fcc-unlock/1eac | 2 +-
+ test/mmcli-test-sms             | 2 +-
+ tools/tests/test-wrapper.sh.in  | 2 +-
  5 files changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/data/fcc-unlock/105b b/data/fcc-unlock/105b
-index 21fe5329..f276050f 100644
---- a/data/fcc-unlock/105b
-+++ b/data/fcc-unlock/105b
+diff --git a/data/dispatcher-fcc-unlock/105b b/data/dispatcher-fcc-unlock/105b
+index 444bd51f..772c90f4 100644
+--- a/data/dispatcher-fcc-unlock/105b
++++ b/data/dispatcher-fcc-unlock/105b
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  
  # SPDX-License-Identifier: CC0-1.0
  # 2021 Aleksander Morgado <aleksander@aleksander.es>
-diff --git a/data/fcc-unlock/1199 b/data/fcc-unlock/1199
-index 0109c6ab..e1d3804c 100644
---- a/data/fcc-unlock/1199
-+++ b/data/fcc-unlock/1199
+diff --git a/data/dispatcher-fcc-unlock/1199 b/data/dispatcher-fcc-unlock/1199
+index 83ab2c9e..6dbf8d1b 100644
+--- a/data/dispatcher-fcc-unlock/1199
++++ b/data/dispatcher-fcc-unlock/1199
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
  
  # SPDX-License-Identifier: CC0-1.0
  # 2021 Aleksander Morgado <aleksander@aleksander.es>
-diff --git a/data/fcc-unlock/1eac b/data/fcc-unlock/1eac
-index 1068d9c2..d9342852 100644
---- a/data/fcc-unlock/1eac
-+++ b/data/fcc-unlock/1eac
+diff --git a/data/dispatcher-fcc-unlock/1eac b/data/dispatcher-fcc-unlock/1eac
+index 1a048dc8..44ce46d7 100644
+--- a/data/dispatcher-fcc-unlock/1eac
++++ b/data/dispatcher-fcc-unlock/1eac
 @@ -1,4 +1,4 @@
 -#!/bin/bash
 +#!/bin/sh
@@ -64,5 +66,5 @@ index d64ea4cb..fcdb56de 100644
  # For debugging behavior of test-modemmanager-service.py, you can modify
  # this line to add --log-file option
 -- 
-2.34.1
+2.35.3
 
diff --git a/meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch b/meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
deleted file mode 100644
index d911d54ce4..0000000000
--- a/meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From ddf634b92bf96b35f521db6da329628b4525c2eb Mon Sep 17 00:00:00 2001
-From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
-Date: Fri, 25 Feb 2022 21:37:13 +0100
-Subject: [PATCH 2/2] fcc-unlock: Make scripts POSIX shell compatible
-
-This allows us to not rely on bash which may not be available on
-constrained systems, e.g. Yocto-built embedded systems. The scripts now
-pass shellcheck.
-
-Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
----
- data/fcc-unlock/105b | 8 ++++----
- data/fcc-unlock/1199 | 6 +++---
- data/fcc-unlock/1eac | 8 ++++----
- 3 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/data/fcc-unlock/105b b/data/fcc-unlock/105b
-index f276050f..772c90f4 100644
---- a/data/fcc-unlock/105b
-+++ b/data/fcc-unlock/105b
-@@ -15,20 +15,20 @@ shift
- # second and next arguments are control port names
- for PORT in "$@"; do
-   # match port type in Linux 5.14 and newer
--  grep -q MBIM /sys/class/wwan/${PORT}/type 2>/dev/null && {
-+  grep -q MBIM "/sys/class/wwan/$PORT/type" 2>/dev/null && {
-     MBIM_PORT=$PORT
-     break
-   }
-   # match port name in Linux 5.13
--  [[ $PORT == *"MBIM"* ]] && {
-+  echo "$PORT" | grep -q MBIM && {
-     MBIM_PORT=$PORT
-     break
-   }
- done
- 
- # fail if no MBIM port exposed
--[ -n "${MBIM_PORT}" ] || exit 2
-+[ -n "$MBIM_PORT" ] || exit 2
- 
- # run qmicli operation over MBIM
--qmicli --device-open-proxy --device=/dev/${MBIM_PORT} --dms-foxconn-set-fcc-authentication=0
-+qmicli --device-open-proxy --device="/dev/$MBIM_PORT" --dms-foxconn-set-fcc-authentication=0
- exit $?
-diff --git a/data/fcc-unlock/1199 b/data/fcc-unlock/1199
-index e1d3804c..6dbf8d1b 100644
---- a/data/fcc-unlock/1199
-+++ b/data/fcc-unlock/1199
-@@ -19,15 +19,15 @@ shift
- # second and next arguments are control port names
- for PORT in "$@"; do
-   # match port name
--  [[ $PORT == *"cdc-wdm"* ]] && {
-+  echo "$PORT" | grep -q cdc-wdm && {
-     CDC_WDM_PORT=$PORT
-     break
-   }
- done
- 
- # fail if no cdc-wdm port exposed
--[ -n "${CDC_WDM_PORT}" ] || exit 2
-+[ -n "$CDC_WDM_PORT" ] || exit 2
- 
- # run qmicli operation
--qmicli --device-open-proxy --device=/dev/${CDC_WDM_PORT} --dms-set-fcc-authentication
-+qmicli --device-open-proxy --device="/dev/$CDC_WDM_PORT" --dms-set-fcc-authentication
- exit $?
-diff --git a/data/fcc-unlock/1eac b/data/fcc-unlock/1eac
-index d9342852..44ce46d7 100644
---- a/data/fcc-unlock/1eac
-+++ b/data/fcc-unlock/1eac
-@@ -15,20 +15,20 @@ shift
- # second and next arguments are control port names
- for PORT in "$@"; do
-   # match port type in Linux 5.14 and newer
--  grep -q MBIM /sys/class/wwan/${PORT}/type 2>/dev/null && {
-+  grep -q MBIM "/sys/class/wwan/$PORT/type" 2>/dev/null && {
-     MBIM_PORT=$PORT
-     break
-   }
-   # match port name in Linux 5.13
--  [[ $PORT == *"MBIM"* ]] && {
-+  echo "$PORT" | grep -q MBIM && {
-     MBIM_PORT=$PORT
-     break
-   }
- done
- 
- # fail if no MBIM port exposed
--[ -n "${MBIM_PORT}" ] || exit 2
-+[ -n "$MBIM_PORT" ] || exit 2
- 
- # run mbimcli operation
--mbimcli --device-open-proxy --device=/dev/${MBIM_PORT} --quectel-set-radio-state=on
-+mbimcli --device-open-proxy --device="/dev/$MBIM_PORT" --quectel-set-radio-state=on
- exit $?
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.6.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.6.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb
index 14d9942c02..28f81ba6e5 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.6.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.8.bb
@@ -12,13 +12,12 @@ inherit gnomebase gettext systemd gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 
-SRCREV ?= "a7bcf2036b34d5043dbc33fee7d98bae5859c4d3"
+SRCREV ?= "0d8b5e93fc62eb0f41e18a2d9d845331d7af36ec"
 
-# Patches 0001, 0002 will be in ModemManager > 1.18.6
+# Patch 0001 will be in ModemManager > 1.19
 SRC_URI = " \
     git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-18 \
     file://0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch \
-    file://0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.35.3


