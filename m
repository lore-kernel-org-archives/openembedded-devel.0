Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC5DC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:26 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11209.1784859256245939414
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pdXyqN+8;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1236886a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859256; x=1785464056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZYhGjohYXdnI3SPH6uITkT46B4m6TT5ZrlYHckQHII=;
        b=pdXyqN+8kPZ60a+DMGP0DzOMuAO3MDEFdefKLuagN9iGsVOeW3inA/ba9ak8eKFwHe
         2rcUtESxyOaZctjhH593UMvTR172T7mM0394DDPhk53nygN0kWMQuja4aPxEWydMwHZ5
         9ss94cHmCIHaEFp9az3uOObn8gb71V/b/3RKcGYomSu5NCzvmJ0QIlPjg/9KikyXrcNG
         V3+4s6WYTHoQIOE8Xka9CFW6GV9c2/8Jaf0y1htYyrwOpaQI0NJZ19FChxyjNAp9GAbo
         ihUk6wPRghvFGxzQOEM9XCdm1sNjLYUMRr3bk+p82iUlAeAvMZH+xJeyjCuaRjgr7G1Q
         LkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859256; x=1785464056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZYhGjohYXdnI3SPH6uITkT46B4m6TT5ZrlYHckQHII=;
        b=bcU9rpaFubGyXfTgu8s4ViyiDUH2DLjW4yXoPtWbrWRDxmjKpgRruSs+eqzHvJHi7z
         YzXJSnUu27gyEpMZj8Axk3H3K13OaGzkz+DBAML5O7Xir4DX2z9+dZ6wp7MoNPoi/LDG
         GtYysvpOTynl7nl/48BFJYbVQ2a/CJYdSLNR4gDjIRxlPZ4zf/iDPZWnVzYXbigqufCI
         Xp8lwqW4cEbIg31S/TKhkjXcr3poG7TRFjIrRFhitBZQMv35qGjvExrZwy/wfB2lBVZ/
         2KX7JXqb8dkD/LF3OybSkeRqG13ZWkSHN3jNs7BXsi8v7/S9biK+DkfrczrE0s4ebo/8
         AIAA==
X-Gm-Message-State: AOJu0YxNkla+utnqsWrwi3cJ6/LgqdjUXZ7Huz0bwr6ZR9fSQeHfbbTT
	BS83dWnH3OhitKm3/wrc+jeByd8UDt+XAgbV0imBv3GDZ7621QUZNYNTdWwc18RB
X-Gm-Gg: AR+sD11jIyGhiIyT7crJHG2QrR+66cm2T41hh81lOcjWZ2dL/gbXGLHVHcG+YkFLBvI
	5J6lvoML4av+ijm8AxYf6zQ4K6BtBkqMTLpDzpA+7qNkCCR19RiHg2VA07errQe/Sd9G2chpEf7
	k6f6RKUcKhhn/Roa+II1p/dPKJlHyCpgulGqKGK4OK/5gT5HVOxRuFeeqaet5/Rod7LIUsQyJtP
	4fx/O8B0T1gzqPYCw8Q49sXtURf6g8YZ0kJR/bCzgoSjh2xJouxjkzjNbF405TW3FwQNfXs/jxP
	fZH4xB59BNEcJdSZevXIYAwH9YN2dSOuu8bdseKt9/fqs8AhXL9sfbamukpuDr4kr8STiBW8UDw
	ku7WWS/nw4HRfO7ny46aySfwvEdqetUAB3LpIiXrVRsWIQD7ejMUSBpsDlsfpjOmgiDZoavq6zM
	jvS+U/L2UoU3ezmW2eWtEwCvDIyA==
X-Received: by 2002:a17:90b:4f8b:b0:38e:5701:644a with SMTP id 98e67ed59e1d1-38ec6650522mr5013150a91.27.1784859255582;
        Thu, 23 Jul 2026 19:14:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/13] colord: upgrade 1.4.7 -> 1.4.8
Date: Fri, 24 Jul 2026 14:13:55 +1200
Message-ID: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128423

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch which is included in this version and resolved QA issues.

Release Notes:
https://github.com/hughsie/colord/blob/1.4.8/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/colord/colord.bb      |  3 +-
 meta-oe/recipes-support/colord/colord.inc     |  4 +--
 ...2b2379fb5582f4312e59bf51a2823df56276.patch | 28 -------------------
 3 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/colord/colord/08a32b2379fb5582f4312e59bf51a2823df56276.patch

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
index 6eb9db8dab..19d2ac3211 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -21,7 +21,6 @@ RDEPENDS:${PN} += "hwdata"
 
 SRC_URI += " \
 	file://0001-Run-native-cd_idt8-cd_create_profile.patch \
-	file://08a32b2379fb5582f4312e59bf51a2823df56276.patch \
 "
 
 EXTRA_OEMESON += " \
@@ -40,10 +39,12 @@ FILES:${PN} += " \
     ${datadir}/polkit-1 \
     ${datadir}/glib-2.0 \
     ${datadir}/color \
+    ${datadir}/metainfo \
     ${systemd_user_unitdir} \
     ${nonarch_libdir}/tmpfiles.d \
     ${libdir}/colord-plugins \
     ${libdir}/colord-sensors \
+    ${libdir}/sysusers.d \
 "
 
 USERADD_PACKAGES = "${PN}"
diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index 447531f312..0f239f36ce 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
 "
 
-PV = "1.4.7"
+PV = "1.4.8"
 SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "de02d9910634ae159547585cec414e450f711c27235453b4f9b38a9f2361a653"
+SRC_URI[sha256sum] = "21500bd68975312a7f0f3ce6019d9f75f42aacaa75ca7115ec720b5445406896"
 
diff --git a/meta-oe/recipes-support/colord/colord/08a32b2379fb5582f4312e59bf51a2823df56276.patch b/meta-oe/recipes-support/colord/colord/08a32b2379fb5582f4312e59bf51a2823df56276.patch
deleted file mode 100644
index 860e6ab4af..0000000000
--- a/meta-oe/recipes-support/colord/colord/08a32b2379fb5582f4312e59bf51a2823df56276.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 08a32b2379fb5582f4312e59bf51a2823df56276 Mon Sep 17 00:00:00 2001
-From: Richard Hughes <richard@hughsie.com>
-Date: Mon, 29 Jan 2024 10:37:11 +0000
-Subject: [PATCH] Fix writing to the database with ProtectSystem=strict
-
-Fixes https://github.com/hughsie/colord/issues/166
-
-Upstream-Status: Backport [https://github.com/hughsie/colord/commit/08a32b2379fb5582f4312e59bf51a2823df56276]
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- data/colord.service.in | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/data/colord.service.in b/data/colord.service.in
-index 6825d944..c358dc4b 100644
---- a/data/colord.service.in
-+++ b/data/colord.service.in
-@@ -17,6 +17,10 @@ ProtectControlGroups=true
- RestrictRealtime=true
- RestrictAddressFamilies=AF_UNIX
- 
-+ConfigurationDirectory=colord
-+StateDirectory=colord
-+CacheDirectory=colord
-+
- # drop all capabilities
- CapabilityBoundingSet=~CAP_SETUID CAP_SETGID CAP_SETPCAP CAP_SYS_ADMIN CAP_SYS_PTRACE CAP_CHOWN CAP_FSETID CAP_SETFCAP CAP_DAC_OVERRIDE CAP_DAC_READ_SEARCH CAP_FOWNER CAP_IPC_OWNER CAP_NET_ADMIN CAP_SYS_RAWIO CAP_SYS_TIME CAP_AUDIT_CONTROL CAP_AUDIT_READ CAP_AUDIT_WRITE CAP_KILL CAP_MKNOD CAP_NET_BIND_SERVICE CAP_NET_BROADCAST CAP_NET_RAW CAP_SYS_NICE CAP_SYS_RESOURCE CAP_MAC_ADMIN CAP_MAC_OVERRIDE CAP_SYS_BOOT CAP_LINUX_IMMUTABLE CAP_IPC_LOCK CAP_SYS_CHROOT CAP_BLOCK_SUSPEND CAP_LEASE CAP_SYS_PACCT CAP_SYS_TTY_CONFIG CAP_WAKE_ALARM
- 

