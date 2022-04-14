Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E85C54EFD
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.7697.1649908976575207554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 21:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QlwnGf9R;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id r66so3711270pgr.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMKniLbMYkxVmA2nUGEJ9WWf2FKlBhYKyzP4gYkypi0=;
        b=QlwnGf9RvoET1gw/QUycUgB1i1ox4LAYe+wN/Bp7Mt0MDPeokdNuef1zNFqUwEyF8w
         /lmmTvXzCy1iQaFXPx56GMLxqWRLXmJbGmR6sdFDePVR2glgvxP/YG4GLy3iXHa0n+9z
         q3eReO4Z1aor5sG+94n1EtLfbfk5+4PVFCltMoj4johdN82GCVpp08hyvzQuMQZSvmgJ
         pHoehLA/l5dXabpTV+ddjxOxua80a1G+YJ4UgicFFIFANEbliPbBUlQp3H1FB9PiG7Oc
         I6RnwUtlJin+PaU7Hb4pz4HuLlQglkO8h86D4ihWcnvFStD6UkQCG4STffQwXUl7tl9+
         6iRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMKniLbMYkxVmA2nUGEJ9WWf2FKlBhYKyzP4gYkypi0=;
        b=8HQSctC4KRcX8+aiVj1+e2tfSW6xj8wKf4xB5V6Ulwmff9VEVzdkVgt0KcJoAH0+ZE
         TgaCnmzAuSh1QzmFsSmrGUitnuqf9qslOwdMLB2txeIoPIRP/jCh+IVgPsUZhK3/lG5k
         GWS8bnkG1sVlMaDYuFY+U1HOvUEhv7rh3lFF6/oSpmeVzcxkg/i1w66xVXeqy0jd++Ss
         NvQjaygG1p8mdwpMmbGOH9HiUmIXu0rY217oz/nZIoVLe4GEgdkt9ar9snl8YA1ucgEW
         AYT4mX+UCnRRHOusA7Yt6Qu3CoRmqbOlW/X5H/9Hv56meM2++BW4DXzt3MFLAek3JglP
         WIUQ==
X-Gm-Message-State: AOAM530aqTrqZmRpSQu5HlP2ThNRZ3v2qBhsUTFniG3NPxWWMuny/qf4
	qsofKZQDpyzEDNeMy5NHkdzWg+QWFRycAg==
X-Google-Smtp-Source: 
 ABdhPJyFO2COAzvm0938nri8yPhhBVRJHRFhPSzExO/+GpC6OL3QzSfo9Vdg+JEgm7ybACnuzmErKQ==
X-Received: by 2002:a63:5525:0:b0:39d:40ed:5e3c with SMTP id
 j37-20020a635525000000b0039d40ed5e3cmr765833pgb.20.1649908975852;
        Wed, 13 Apr 2022 21:02:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 w4-20020a056a0014c400b004fb0c7b3813sm551555pfu.134.2022.04.13.21.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 21:02:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-oe][PATCH] linuxconsole: Fix makefile issue found with clang
Date: Wed, 13 Apr 2022 21:02:53 -0700
Message-Id: <20220414040253.2542507-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96645

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
---
 ...me-of-the-first-prerequisite-in-rule.patch | 37 +++++++++++++++++++
 .../linuxconsole/linuxconsole_1.7.1.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/linuxconsole/linuxconsole/0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch

diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole/0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch b/meta-oe/recipes-extended/linuxconsole/linuxconsole/0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch
new file mode 100644
index 0000000000..bbfed0fd82
--- /dev/null
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole/0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch
@@ -0,0 +1,37 @@
+From 25f54c3359a0fa34890030662e9b02e0a9745f4f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Apr 2022 20:57:38 -0700
+Subject: [PATCH] utils: Use name of the first prerequisite in rule
+
+Use $< instead of $^ because the latter will specify both pre-requisite
+inputattach.c serio-ids.h files on same compiler cmdline and clang does
+not like that and errors out like below
+
+clang-14: error: cannot specify -o when generating multiple output files
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/utils/Makefile b/utils/Makefile
+index 1fc51ab..a7434a9 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -46,10 +46,10 @@ endif
+ evdev-joystick: evdev-joystick.c
+ 
+ inputattach: inputattach.c serio-ids.h
+-	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $^ $(LDFLAGS) $(SYSTEMDFLAGS) -lm -o $@
++	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $< $(LDFLAGS) $(SYSTEMDFLAGS) -lm -o $@
+ 
+ ffcfstress: ffcfstress.c bitmaskros.h
+-	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $^ $(LDFLAGS) -lm -o $@
++	$(CC) $(CFLAGS) $(CPPFLAGS) -funsigned-char $< $(LDFLAGS) -lm -o $@
+ 
+ ffmvforce.o: ffmvforce.c
+ 	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^ -o $@ `$(PKG_CONFIG) --cflags sdl2`
+-- 
+2.35.2
+
diff --git a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
index f213b7859e..5716817e95 100644
--- a/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
+++ b/meta-oe/recipes-extended/linuxconsole/linuxconsole_1.7.1.bb
@@ -12,6 +12,7 @@ DEPENDS = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/linuxconsole/linuxconsoletools-${PV}.tar.bz2 \
+    file://0001-utils-Use-name-of-the-first-prerequisite-in-rule.patch \
     file://51-these-are-not-joysticks-rm.rules \
     file://60-joystick.rules \
     file://inputattachctl \
-- 
2.35.2


