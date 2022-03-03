Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD80BC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 13:07:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.10285.1646312834954940602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HQgsCo/p;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id bk29so7769988wrb.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B8BL/HcJi6o1aH+v4vU7gxAjAe/UqG28M9VV9t1N8sk=;
        b=HQgsCo/pkjC5VMgjxAFVO2fNeANlNumG4DHVt8cxOg+8Q79cNJnzSc/apN//1idee1
         BYtyr/F+EZ2QIfk3UIvIQvbpPVqSH4df4/ku4ynh8ZyLNjjMbQXNGYLEWQ1YTAT1bkwu
         3wXloDg+2hSFDh9RxqhX2kxR13Gd8NwmdjxDphz+yBNBj/NZyq9a8Y/fVDs2KM/fyrlY
         vryKAzg/eiH159ovMit2/5yo1Lj76s+Ht1T6P3B11E4rbI1CKE8Mg78RKeTQP1iAHQgT
         l9s8r4G+HT8tTL7oCNFl1f2KOQbRVRXswE2LIyMxBb38OLJpYYwGbz+NxGymhY4llfCu
         bsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B8BL/HcJi6o1aH+v4vU7gxAjAe/UqG28M9VV9t1N8sk=;
        b=Zs0jcx3kAaguk3joo/7fVEYExxnFvSVWYm+y7kL+VhUpfPzJIBf0dyBP2T9P6U55U5
         o9fswcLMO6c6foQZOME12SoxLzml1SnO1m5JByeKrz6LRJTm/4l5+C/TW8BxVU2FP6qE
         cHqKTgSbJQ/vVwC6bf89fbT929uvxHqrCe6jgt18e2Oy+uksl74v7n3mZz/FzGaoNblL
         dbUGmJKSpL4XVBovI521FKK+kH6Cn3WarhcV8kYHbAxrJp4siV9MVNtWkd+G4Y22EeBN
         TvmkvGwvMzm0gWYFl9+BSwHfJz08CFrT2DRMegjSBcVLUG0F08s+tRrzfSGQJMWgrwnb
         qduQ==
X-Gm-Message-State: AOAM532ps8H36d+y+yGJm+w1cAvpp8gi5mMlUzds+Jq7TgZePPxc+4N+
	zqVkcr9odqDgUwhVxVyOVfa9/ii0CGU=
X-Google-Smtp-Source: 
 ABdhPJyag822M7Y4AXUwR7O2fo4Acpj7wIjGWBYspMWqBhUPgZQhgQ817kO1GgpI21ywfBNDWULQRg==
X-Received: by 2002:a5d:64ed:0:b0:1ef:e1e2:1fcb with SMTP id
 g13-20020a5d64ed000000b001efe1e21fcbmr13613448wri.37.1646312832711;
        Thu, 03 Mar 2022 05:07:12 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003814673f202sm9612380wmr.47.2022.03.03.05.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 05:07:12 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 3/4] modemmanager: update 1.16.8 -> 1.18.6
Date: Thu,  3 Mar 2022 14:06:17 +0100
Message-Id: <20220303130618.1108977-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 13:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95742

Recipe changes:

* Switch to meson and git. From release notes of ModemManager:
  "The next major release will likely be a meson-only one, and will therefore
   not be based on a source release tarball any more, but on specific git tags
   instead. The tar archive does not even contain the meson.build file."
* Update licenses to -or-later (warning about deprecated licenses)
* Make vala dependecy optional
* Delete redundant package split lines
* add missing dbus dependency

The most important features and changes in this release are the following:

 * Data session multiplexing can now be enabled in QMI and MBIM modems, e.g. so
   that multiple different APNs can be connected separately over a single
   network interface. The multiplexing is disabled by default in this release,
   except for cases where it's required (e.g. if non-multiplexed sessions aren't
   supported) like IPA based Qualcomm SoCs. Users can request the multiplexing
   support explicitly via settings when creating the connection bearer object.

   In order to allow easy testing of the multiplexing feature without requiring
   any additional change in the stack, a new '--test-multiplex-requested' option
   in the daemon allows to switch the default (when not explicitly given by the
   user) to attempt to use multiplexing.

   It is worth noting that when multiplexing is enabled, the data network
   interface used by the modem will be a virtual network interface created in
   runtime, and will therefore have a different name than the real network
   interface exposed by the modem. If there are additional settings in the
   system relying on the data network interface name (e.g. iptables rules), they
   may need to be updated.

 * The ModemManager daemon can run now in a 'quick suspend/resume' mode, in
   which no explicit data disconnection is triggered on suspend, and no explicit
   device re-probing from scratch is launched on resume. Instead, the daemon
   will try to refresh the state of all interfaces upon suspend, e.g. to see if
   the module keeps registered to the same operator, to see if it is still
   connected, and so on.

   This mode of operation is useful when the WWAN module stays awake while the
   host is suspended, and can be enabled with the '--test-quick-suspend-resume'
   option in the daemon.

 * API:
   ** New '3gppProfileManager' interface, providing operations on the list of
      connection profiles stored in the 3GPP module. This interface is
      implemented for all AT, QMI and MBIM protocols.
   ** New 'DisableFacilityLock()' method in the 3GPP interface, implemented for
      QMI and MBIM devices.
   ** The 'MaxBearers' property is now deprecated, as it didn't provide any
      additional information to what 'MaxActiveBearers' already provides.
   ** New 'MaxActiveMultiplexedBearers' property, listing how many bearers can
      be connected at the same time if multiplexing is enabled.
   ** New settings in the bearer properties, applicable to both the
      'Simple.Connect()' and 'Modem.CreateBearer()' methods:
      *** 'multiplex': which allows the user to specify whether multiplexing
          should be avoided ('none'), whether it should be mandatory
	  ('required') or whether it should be enabled if available or skipped
	  if unavailable ('requested').
      *** 'profile-id': which allows the user to request a connection attempt
          with an existing profile stored in the module.
      *** 'apn-type': which allows the user to specify the purpose of a given
          connection, e.g. the user could create a connection to an APN
	  providing default internet connectivity and another one to an APN
	  providing access to the MMS gateway. This setting may or may not be
	  stored in the module itself, it depends on the type of module.
   ** New 'Multiplexed' boolean property in the Bearer object, specifying
      whether the bearer is connected through a multiplexed interface.
   ** New 'ConnectionError' property in the bearer object, specifying the last
      error reported by the module during a failed connection attempt or during
      a network-initiated disconnection.
   ** Updated the list of enum values in the MMMobileEquipmentError' type,
      according to the error codes defined in v17.1.0 of 3GPP TS 27.007.

 * Core:
   ** iconv() features support is detected at runtime, and logged when the
      daemon starts.
   ** Updated the base modem object to allow plugins to specify the types of
      data ports they support, based on the specific plugin implementations,
      e.g. so that a modem supporting only AT+PPP can ignore NET ports and
      vice versa.
   ** Added support for modems exposing control ports via QRTR channels.

 * Modem interface:
   ** The Dual SIM logic that would iterate over all slots during initialization
      is updated, so that we only report the information that we can gather
      without any explicit slot change. E.g. with QMI we can know whether there
      is a SIM in the non-active slot, and the ICCID of that SIM, but we cannot
      know the MCCMNC or the operator name of the SIM unless we change to that
      slot. We must not do slot changes arbitrarily like that, and so that logic
      is removed, even if we lose some of the information that we were providing
      in the interface.

 * Location interface:
   ** The multi-sentence NMEA trace support is updated to include additional
      possible trace types in addition to GSV (e.g. ALM, GSV, RTE, SFI) and also
      when coming from other constellations, not just GPS.

 * SIM:
   ** New 'PreferredNetworks' property and 'SetPreferredNetworks' method,
      implemented using '+CPOL' for generic AT modems and 'NAS Get/Set Preferred
      Networks' for QMI modems. Several different modules and plugins (e.g.
      Sierra Wireless EM7345, Telit LN930, SIM7070, all Option and Iridium
      devices...) have this feature explicitly disabled due to '+CPOL' not
      behaving properly (even crashing the module sometimes).

 * QMI:
   ** The logic that decides which data mode (802.3 or raw-ip) is used in
      modules managed by the qmi_wwan driver changes in this release. Until now,
      if a module reported itself as configured in 802.3 mode on boot, that mode
      would be the one used in normal operation. Due to the new multiplexing
      feature, this is no longer true, and if possible the daemon will always
      try to switch the module to raw-ip, and fallback to 802.3 only if raw-ip
      is unsupported.
   ** Enabled both AT and QMI indications for the messaging and voice interfaces
      so that new SMS and call events are reported via both channels. This
      solves issues seen in the Pinephone when waking up from suspend.
   ** Enabled network reject indications.
   ** If operator name not updated through standard indications, it will be
      explicitly queried with 'NAS Get Plmn Name'.
   ** Added support for transfer-route MT messages.
   ** Increased the QMI open timeout to 45s, as required by the newest modules.
   ** Implemented additional logic to read the status of the different facility
      locks in the module.
   ** Updated ICCID reading logic to parse it as hex instead of BCD.
   ** Improved handling of the MNC PCS digit in the operations involving MCCMNC.
   ** Automatically run the 'DPM Open Port' logic on IPA based setups to bind
      the hardware tx/rx endpoints with the logical ones in the QMI protocol.
   ** Implemented support for the Voice interface and its operations, not only
      standard voice call management, but also support for the supplementary
      services. Voice call management will be done completely using QMI, even
      if the new call indications are notified via AT URCs.

 * MBIM:
   ** Implemented support for Dual SIM in non-QMI MBIM devices, using the
      Microsoft Basic Connect Extensions service.
   ** Increased the timeout for the MBIM_CID_HOME_PROVIDER query to 30s.
   ** Updated to load model string using QMI over MBIM if available.
   ** Increased the MBIM open timeout to 45s, as required by the newest modules.

 * SMS:
   ** Defined a common timeout of 180s for all send operations.

 * libmm-glib:
   ** Updated with new methods and types to handle all the DBus API updates.
   ** Extended with additional methods in the Location3gpp object to get/set the
      full operator MCCMNC string, instead of integers without MNC PCS digit
      info.
   ** Extended the 'ModemLocation' interface with methods to get the signaled
      location updates; i.e. without requiring an explicit GetLocation(), and
      obviously only supported when location signaling is explicitly enabled.
   ** Updated the way the internal monitored properties are handled in the
      different types, now using some handy helper macros to share the same
      logic among all.

 * Plugins:
   ** zte: disabled CIND/CMER support.
   ** qcom-soc: added support for QRTR+IPA based setups.
   ** qcom-soc: added support for the WWAN subsystem instead of RPMSG.
   ** quectel: enabled QGPSXTRA by default when starting the GNSS engine.
   ** quectel: add support for EM120/160 PCIe modules.
   ** quectel: added Firehose update method.
   ** ublox: added additional URAT combinations.
   ** ublox: flagged UBANDSEL as unsupported in the SARA-R4 and -N4 modules.
   ** cinterion: added new custom MBIM based modem with shared reset operation.
   ** cinterion: ignored the MBIM Intel Firmware Update service completely.
   ** foxconn: added custom carrier config setup for the T77W968 module.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...-shell-scripts-to-use-bin-sh-for-use.patch |  68 ++++++++++++
 ...-Make-scripts-POSIX-shell-compatible.patch | 100 ++++++++++++++++++
 .../modemmanager/modemmanager_1.16.8.bb       |  53 ----------
 .../modemmanager/modemmanager_1.18.6.bb       |  62 +++++++++++
 4 files changed, 230 insertions(+), 53 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.6.bb

diff --git a/meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch b/meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch
new file mode 100644
index 0000000000..7c3e7750af
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/files/0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch
@@ -0,0 +1,68 @@
+From f7a3292c1c753b29384e216693f51a4213fea7d0 Mon Sep 17 00:00:00 2001
+From: "Bruce A. Johnson" <waterfordtrack@gmail.com>
+Date: Wed, 22 Dec 2021 14:24:02 -0500
+Subject: [PATCH 1/2] core: switch bash shell scripts to use /bin/sh for use
+ w/Busybox.
+
+Fixes https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/issues/483
+---
+ data/fcc-unlock/105b           | 2 +-
+ data/fcc-unlock/1199           | 2 +-
+ data/fcc-unlock/1eac           | 2 +-
+ test/mmcli-test-sms            | 2 +-
+ tools/tests/test-wrapper.sh.in | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/data/fcc-unlock/105b b/data/fcc-unlock/105b
+index 21fe5329..f276050f 100644
+--- a/data/fcc-unlock/105b
++++ b/data/fcc-unlock/105b
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # SPDX-License-Identifier: CC0-1.0
+ # 2021 Aleksander Morgado <aleksander@aleksander.es>
+diff --git a/data/fcc-unlock/1199 b/data/fcc-unlock/1199
+index 0109c6ab..e1d3804c 100644
+--- a/data/fcc-unlock/1199
++++ b/data/fcc-unlock/1199
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # SPDX-License-Identifier: CC0-1.0
+ # 2021 Aleksander Morgado <aleksander@aleksander.es>
+diff --git a/data/fcc-unlock/1eac b/data/fcc-unlock/1eac
+index 1068d9c2..d9342852 100644
+--- a/data/fcc-unlock/1eac
++++ b/data/fcc-unlock/1eac
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # SPDX-License-Identifier: CC0-1.0
+ # 2021 Aleksander Morgado <aleksander@aleksander.es>
+diff --git a/test/mmcli-test-sms b/test/mmcli-test-sms
+index 18e0a7b4..7136ee0d 100755
+--- a/test/mmcli-test-sms
++++ b/test/mmcli-test-sms
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ print_usage () {
+     echo "usage: $0 [MODEM INDEX] [all|ucs2|gsm7|data] [NUMBER]"
+diff --git a/tools/tests/test-wrapper.sh.in b/tools/tests/test-wrapper.sh.in
+index d64ea4cb..fcdb56de 100644
+--- a/tools/tests/test-wrapper.sh.in
++++ b/tools/tests/test-wrapper.sh.in
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ # For debugging behavior of test-modemmanager-service.py, you can modify
+ # this line to add --log-file option
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch b/meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
new file mode 100644
index 0000000000..d911d54ce4
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/files/0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch
@@ -0,0 +1,100 @@
+From ddf634b92bf96b35f521db6da329628b4525c2eb Mon Sep 17 00:00:00 2001
+From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
+Date: Fri, 25 Feb 2022 21:37:13 +0100
+Subject: [PATCH 2/2] fcc-unlock: Make scripts POSIX shell compatible
+
+This allows us to not rely on bash which may not be available on
+constrained systems, e.g. Yocto-built embedded systems. The scripts now
+pass shellcheck.
+
+Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
+---
+ data/fcc-unlock/105b | 8 ++++----
+ data/fcc-unlock/1199 | 6 +++---
+ data/fcc-unlock/1eac | 8 ++++----
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/data/fcc-unlock/105b b/data/fcc-unlock/105b
+index f276050f..772c90f4 100644
+--- a/data/fcc-unlock/105b
++++ b/data/fcc-unlock/105b
+@@ -15,20 +15,20 @@ shift
+ # second and next arguments are control port names
+ for PORT in "$@"; do
+   # match port type in Linux 5.14 and newer
+-  grep -q MBIM /sys/class/wwan/${PORT}/type 2>/dev/null && {
++  grep -q MBIM "/sys/class/wwan/$PORT/type" 2>/dev/null && {
+     MBIM_PORT=$PORT
+     break
+   }
+   # match port name in Linux 5.13
+-  [[ $PORT == *"MBIM"* ]] && {
++  echo "$PORT" | grep -q MBIM && {
+     MBIM_PORT=$PORT
+     break
+   }
+ done
+ 
+ # fail if no MBIM port exposed
+-[ -n "${MBIM_PORT}" ] || exit 2
++[ -n "$MBIM_PORT" ] || exit 2
+ 
+ # run qmicli operation over MBIM
+-qmicli --device-open-proxy --device=/dev/${MBIM_PORT} --dms-foxconn-set-fcc-authentication=0
++qmicli --device-open-proxy --device="/dev/$MBIM_PORT" --dms-foxconn-set-fcc-authentication=0
+ exit $?
+diff --git a/data/fcc-unlock/1199 b/data/fcc-unlock/1199
+index e1d3804c..6dbf8d1b 100644
+--- a/data/fcc-unlock/1199
++++ b/data/fcc-unlock/1199
+@@ -19,15 +19,15 @@ shift
+ # second and next arguments are control port names
+ for PORT in "$@"; do
+   # match port name
+-  [[ $PORT == *"cdc-wdm"* ]] && {
++  echo "$PORT" | grep -q cdc-wdm && {
+     CDC_WDM_PORT=$PORT
+     break
+   }
+ done
+ 
+ # fail if no cdc-wdm port exposed
+-[ -n "${CDC_WDM_PORT}" ] || exit 2
++[ -n "$CDC_WDM_PORT" ] || exit 2
+ 
+ # run qmicli operation
+-qmicli --device-open-proxy --device=/dev/${CDC_WDM_PORT} --dms-set-fcc-authentication
++qmicli --device-open-proxy --device="/dev/$CDC_WDM_PORT" --dms-set-fcc-authentication
+ exit $?
+diff --git a/data/fcc-unlock/1eac b/data/fcc-unlock/1eac
+index d9342852..44ce46d7 100644
+--- a/data/fcc-unlock/1eac
++++ b/data/fcc-unlock/1eac
+@@ -15,20 +15,20 @@ shift
+ # second and next arguments are control port names
+ for PORT in "$@"; do
+   # match port type in Linux 5.14 and newer
+-  grep -q MBIM /sys/class/wwan/${PORT}/type 2>/dev/null && {
++  grep -q MBIM "/sys/class/wwan/$PORT/type" 2>/dev/null && {
+     MBIM_PORT=$PORT
+     break
+   }
+   # match port name in Linux 5.13
+-  [[ $PORT == *"MBIM"* ]] && {
++  echo "$PORT" | grep -q MBIM && {
+     MBIM_PORT=$PORT
+     break
+   }
+ done
+ 
+ # fail if no MBIM port exposed
+-[ -n "${MBIM_PORT}" ] || exit 2
++[ -n "$MBIM_PORT" ] || exit 2
+ 
+ # run mbimcli operation
+-mbimcli --device-open-proxy --device=/dev/${MBIM_PORT} --quectel-set-radio-state=on
++mbimcli --device-open-proxy --device="/dev/$MBIM_PORT" --quectel-set-radio-state=on
+ exit $?
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
deleted file mode 100644
index 5aaa55c7af..0000000000
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "ModemManager is a daemon controlling broadband devices/connections"
-DESCRIPTION = "ModemManager is a DBus-activated daemon which controls mobile broadband (2G/3G/4G) devices and connections"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ModemManager/"
-LICENSE = "GPL-2.0 & LGPL-2.1"
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-"
-
-inherit gnomebase gettext systemd vala gobject-introspection bash-completion
-
-DEPENDS = "glib-2.0 libgudev libxslt-native"
-
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "21fdfaf94171261ad9d99771894f5ade4bc39ef3d1ff1d421054d14713e97880"
-S = "${WORKDIR}/ModemManager-${PV}"
-
-PACKAGECONFIG ??= "mbim qmi \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)} \
-"
-
-PACKAGECONFIG[at] = "--with-at-command-via-dbus"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
-PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
-# Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
-PACKAGECONFIG[mbim] = "--with-mbim,--without-mbim,libmbim"
-# Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
-PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
-
-EXTRA_OECONF = " \
-    --with-udev-base-dir=${nonarch_base_libdir}/udev \
-"
-
-FILES:${PN} += " \
-    ${datadir}/icons \
-    ${datadir}/polkit-1 \
-    ${datadir}/dbus-1 \
-    ${datadir}/ModemManager \
-    ${libdir}/ModemManager \
-    ${systemd_unitdir}/system \
-"
-
-FILES:${PN}-dev += " \
-    ${libdir}/ModemManager/*.la \
-"
-
-FILES:${PN}-staticdev += " \
-    ${libdir}/ModemManager/*.a \
-"
-
-FILES:${PN}-dbg += "${libdir}/ModemManager/.debug"
-
-SYSTEMD_SERVICE:${PN} = "ModemManager.service"
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.6.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.6.bb
new file mode 100644
index 0000000000..14d9942c02
--- /dev/null
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.6.bb
@@ -0,0 +1,62 @@
+SUMMARY = "ModemManager is a daemon controlling broadband devices/connections"
+DESCRIPTION = "ModemManager is a DBus-activated daemon which controls mobile broadband (2G/3G/4G) devices and connections"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ModemManager/"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase gettext systemd gobject-introspection bash-completion
+
+DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
+
+SRCREV ?= "a7bcf2036b34d5043dbc33fee7d98bae5859c4d3"
+
+# Patches 0001, 0002 will be in ModemManager > 1.18.6
+SRC_URI = " \
+    git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-18 \
+    file://0001-core-switch-bash-shell-scripts-to-use-bin-sh-for-use.patch \
+    file://0002-fcc-unlock-Make-scripts-POSIX-shell-compatible.patch \
+"
+
+S = "${WORKDIR}/git"
+
+# strict, permissive
+MODEMMANAGER_POLKIT_TYPE ??= "permissive"
+
+PACKAGECONFIG ??= "vala mbim qmi \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)} \
+"
+
+PACKAGECONFIG[at] = "-Dat_command_via_dbus=true"
+PACKAGECONFIG[systemd] = " \
+    -Dsystemdsystemunitdir=${systemd_unitdir}/system/, \
+    -Dsystemdsystemunitdir=no -Dsystemd_journal=false -Dsystemd_suspend_resume=false \
+"
+PACKAGECONFIG[polkit] = "-Dpolkit=${MODEMMANAGER_POLKIT_TYPE},-Dpolkit=no,polkit"
+# Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
+PACKAGECONFIG[mbim] = "-Dmbim=true,-Dmbim=false -Dplugin_dell=disabled -Dplugin_foxconn=disabled,libmbim"
+# Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
+PACKAGECONFIG[qmi] = "-Dqmi=true,-Dqmi=false,libqmi"
+PACKAGECONFIG[qrtr] = "-Dqrtr=true,-Dqrtr=false,libqrtr-glib"
+PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
+
+EXTRA_OEMESON = " \
+    -Dudevdir=${nonarch_base_libdir}/udev \
+    -Dqrtr=false \
+"
+
+FILES:${PN} += " \
+    ${datadir}/icons \
+    ${datadir}/polkit-1 \
+    ${datadir}/dbus-1 \
+    ${datadir}/ModemManager \
+    ${libdir}/ModemManager \
+    ${systemd_unitdir}/system \
+"
+
+SYSTEMD_SERVICE:${PN} = "ModemManager.service"
-- 
2.34.1


