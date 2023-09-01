Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F49CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 09:04:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.2162.1693559093540828152
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Sep 2023 02:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gZRg5f0C;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-401ceda85cdso17868255e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693559092; x=1694163892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fhB0KwupXHgU/tt7DyaamxWvcNko8qYhg0F9scw+P0Q=;
        b=gZRg5f0Cxqxtz1psan6iOMynkd0ogbo2hs2P9K1+KXFOv4nUDUuQ4LcP/ebrz8ToXR
         P8iylBqyjit4QUNBJi6zyl75P8datA+ejeegZZIt7tN8YsevoPVLemfXq5z9yITsk9gB
         3v3UgmsVp4XLex2I6Q6KT3cg+dAkx9rbBJ7xP4Q8+ZTnAiuJQYIkztiMkL3fIl19xutT
         p1rHUCF217aG/5Z0EqQgUVDJ3pHDFixyTgKVXBN9U3gd8foyECwUhQUA1XZaW1WIxIHE
         w668m1aez2ZzNq4ZCDpXWzJorf5PXla9LwMcKoLl832owRvwwOSaWoMpYlhOmlKUZf5+
         uo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693559092; x=1694163892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhB0KwupXHgU/tt7DyaamxWvcNko8qYhg0F9scw+P0Q=;
        b=MtqiXzWv1r7zuR69sTfJ+YXIQNmzeshUGJw/KxAWPpgs6o4Thz0zuzj8kKDV8Gddbo
         GiiFkukSde8u0mv+OzQBYhWzeZpnFntL0QRBRY8Ai9Ksa19umuiL7V8QwA0gl36rNSPw
         0/Xavtf/Lh/phEDTmC44f+3sfhlSLXIS7twXvEX7R1/JtHgrm9vJVLoObiErNGtu0Nof
         nomD0Hpz+R3ddb11Hm1Poc1t9y3xT6DstCAmckk3EV3yKbtJk9kyT8f/87BETC8klZc9
         aW8n5whVHL6f7Tvq0A8arlNkdZ2KPxYjCOP1Ka2cF30rCfcft/ciSyXok41n+LN5MDZY
         AY/g==
X-Gm-Message-State: AOJu0YyQRr5Pf2/nOBzOsXnWultPm4zfLsBA8PgJOU78IBMgkQl3Dwli
	gdwXKEDaceVI9b7kJ1n1u7ixow1Ijcw=
X-Google-Smtp-Source: AGHT+IHrC8hAV2MNCUiTlzyF/yx0ijZQ5I9V+8bQLk/rt/PidajMc9Rvm/rprPXBvixkvA/H7L2DXw==
X-Received: by 2002:a05:600c:ad8:b0:400:2dc5:2006 with SMTP id c24-20020a05600c0ad800b004002dc52006mr1307620wmr.36.1693559091515;
        Fri, 01 Sep 2023 02:04:51 -0700 (PDT)
Received: from localhost.localdomain ([5.13.128.0])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c260900b003fff96bb62csm4154162wma.16.2023.09.01.02.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 02:04:50 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: upgrade 1.17.1 -> 1.18.0
Date: Fri,  1 Sep 2023 12:04:33 +0300
Message-Id: <20230901090433.1770836-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 09:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104689

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 ...rib-add-yocto-compatible-init-script.patch | 80 -------------------
 .../{unbound_1.17.1.bb => unbound_1.18.0.bb}  |  8 +-
 2 files changed, 3 insertions(+), 85 deletions(-)
 delete mode 100644 meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
 rename meta-networking/recipes-support/unbound/{unbound_1.17.1.bb => unbound_1.18.0.bb} (87%)

diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
deleted file mode 100644
index 7bcf97261..000000000
--- a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Fri, 20 Nov 2020 23:00:20 +0200
-Subject: [PATCH] contrib: add yocto compatible init script
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
-Upstream-Status: Pending
-
- contrib/unbound.init | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/contrib/unbound.init b/contrib/unbound.init
-index c5bb52bb..4eba752b 100644
---- a/contrib/unbound.init
-+++ b/contrib/unbound.init
-@@ -19,11 +19,11 @@
- ### END INIT INFO
- 
- # Source function library.
--. /etc/rc.d/init.d/functions
-+. /etc/init.d/functions
- 
- exec="/usr/sbin/unbound"
- prog="unbound"
--config="/var/unbound/unbound.conf"
-+config="/etc/unbound/unbound.conf"
- pidfile="/var/unbound/unbound.pid"
- rootdir="/var/unbound"
- 
-@@ -54,14 +54,14 @@ start() {
- 	[ -e ${rootdir}/dev/log ] || touch ${rootdir}/dev/log
- 	mount --bind -n /dev/log ${rootdir}/dev/log >/dev/null 2>&1;
-     fi;
--    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
-+    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' /proc/mounts; then
- 	[ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/dev ;
--	[ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/dev/urandom
--	mount --bind -n /dev/urandom ${rootdir}/dev/urandom >/dev/null 2>&1;
-+	[ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev/random
-+	mount --bind -n /dev/random ${rootdir}/dev/random >/dev/null 2>&1;
-     fi;
- 
-     # if not running, start it up here
--    daemon $exec
-+    daemonize $exec
-     retval=$?
-     echo
-     [ $retval -eq 0 ] && touch $lockfile
-@@ -71,15 +71,15 @@ start() {
- stop() {
-     echo -n $"Stopping $prog: "
-     # stop it here, often "killproc $prog"
--    killproc -p $pidfile $prog
-+    killproc $prog
-     retval=$?
-     echo
-     [ $retval -eq 0 ] && rm -f $lockfile
-     if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/log' /proc/mounts; then
- 	umount ${rootdir}/dev/log >/dev/null 2>&1
-     fi;
--    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
--	umount ${rootdir}/dev/urandom >/dev/null 2>&1
-+    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' /proc/mounts; then
-+	umount ${rootdir}/dev/random >/dev/null 2>&1
-     fi;
-     return $retval
- }
-@@ -99,7 +99,7 @@ force_reload() {
- 
- rh_status() {
-     # run checks to determine if the service is running or use generic status
--    status -p $pidfile $prog
-+    status $prog
- }
- 
- rh_status_q() {
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb b/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
similarity index 87%
rename from meta-networking/recipes-support/unbound/unbound_1.17.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.18.0.bb
index ff3d879ea..179af8050 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
@@ -9,10 +9,8 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
-	file://0001-contrib-add-yocto-compatible-init-script.patch \
-"
-SRCREV = "90831af981221bbce1cd7b15055562336760e484"
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master"
+SRCREV = "3795e374107ac7a5a977c516e144a3cd9b0da998"
 
 inherit autotools pkgconfig systemd update-rc.d
 
@@ -39,7 +37,7 @@ do_install:append() {
 	install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
 
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/unbound
+	install -m 0755 ${S}/contrib/unbound.init_yocto ${D}${sysconfdir}/init.d/unbound
 }
 
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
-- 
2.25.1


