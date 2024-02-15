Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62186C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 19:17:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.1269.1708024661410151804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 11:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+X7zWdF;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5620595f743so1615059a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 11:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708024659; x=1708629459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuaxwWii2I+r0i22tWD+r+T8ERyLYVqu7BSvZZl8AQg=;
        b=C+X7zWdFVM/X7aYamfDVUOVicQJnhsluTTHDqi38eTyOgpkr1wNA6Zg3j6rjXP3gkN
         rJQgVPxeJjvRUJuQ6HcqlkI+kcry42xn1LTm0draibQuCrqJLR5YgBDfvRxX0ixfOzCN
         tvQOZedxwG8eBBUzmlNNf1J1sYvTtEt4FwjGBWePX+jc1sLSxhzFUGGOTmTMlxXXcIZq
         N37P/TIgrIbo8zQLnmYutP9sqY7bfQNrI8a/d/OlNXFKc672EVbzN1O8PLkFRzNJg/OG
         4gfHJdOR7sgCp9mMeXnnfVtqCOESs7FsYc4y8M9wvPQ7x/Z2aR1TQUMrcBb75P74VosN
         4Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708024659; x=1708629459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuaxwWii2I+r0i22tWD+r+T8ERyLYVqu7BSvZZl8AQg=;
        b=CDueCf5BYzJH9O2yuhmoHf4+sUp0EV7QdlnA0wkJSLazRUkLtDH4dSa07XkfYmOLZv
         CM8SNg4XVI+wih8oaEgrEe+sHrQ3fn6uEP8dXxUqz2A4GXT+BUWLZT/Y/2GbfV7wNxMK
         0/gCEm9EJGpxLYzROG/ObswpCWtdVaPIivJTLrFLP/Ov2mLmX4ITJPNYQjP4Pbr6q0fg
         kVPh3UdaW4Y+ri4CuM6cHlV/ez6L7RLHbCzAs8uqBJHtXPgqJZ4lTiYW3DOHsZZvpn2k
         rGZ6C/j4nRDsr/aPkGvEdOdmssX4IeLENU0qiixUOZV1Ko0Bu9G32bTigkdpvIz9wHk9
         trww==
X-Gm-Message-State: AOJu0YzjZdHR5FohUXWtxm6VTeo4kxKIJiGEd7TdIBXZ12uimbRdTWVx
	n/ncYbtQ7DljwnBGU9rH2l96V542PNcyRmTY+1SVF/CkCha6XDmWgoBDx/xi
X-Google-Smtp-Source: AGHT+IEZuXoJlTUBL7WU1FjrVU/ICp5jHd775fku9l3h+NkDLKm/Yj1JLzOzH8x56OFGuJNLnf+PWQ==
X-Received: by 2002:a50:ef0c:0:b0:55e:eb81:2db0 with SMTP id m12-20020a50ef0c000000b0055eeb812db0mr1944555eds.38.1708024658954;
        Thu, 15 Feb 2024 11:17:38 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id z9-20020aa7c649000000b00563819d224esm820920edr.21.2024.02.15.11.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 11:17:38 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH v3 1/2] libusbgx: fix usbgx.service stop / restart
Date: Thu, 15 Feb 2024 20:16:59 +0100
Message-ID: <20240215191700.213060-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 19:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108758

From: Max Krummenacher <max.krummenacher@toradex.com>

On start the usbgx service configures the usb gadget. However if
one stops the service nothing is done, a subsequent start then
tries to configure the gadget again and fails. `systemctl restart`
is implemented by doing a stop followed by a start and thus is
also affected.

Doing a start/stop/start results with the following reported in
status:

| systemd[1]: Starting Load USB gadget schemas...
| gadget-start[801]: usbg_create_gadget()  duplicate gadget name
| gadget-start[801]:
| gadget-start[801]: Error on import gadget
| gadget-start[801]: Error: USBG_ERROR_EXIST : Already exist
| gadget-start[812]: ls: write error: Device or resource busy

The run-postinsts service does execute a restart for each package
which uses the systemd class which creates a race condition that the
usbgx service is already started when run-postinsts restarts usbgx
and creates the above error output.

Fix that by unconfiguring the usb gadget on stop.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../recipes-support/libusbgx/libusbgx/gadget-stop   | 13 +++++++++++++
 .../recipes-support/libusbgx/libusbgx/usbgx.service |  2 ++
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb    |  3 +++
 3 files changed, 18 insertions(+)
 create mode 100755 meta-oe/recipes-support/libusbgx/libusbgx/gadget-stop

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-stop b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-stop
new file mode 100755
index 000000000..24b7caed5
--- /dev/null
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-stop
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+[ -r /etc/default/usbgx ] && . /etc/default/usbgx
+
+for i in $IMPORT_SCHEMAS; do
+    if [ -e /sys/kernel/config/usb_gadget/"$i"/idVendor ]; then
+        if [ -e /sys/kernel/config/usb_gadget/"$i"/idProduct ]; then
+            idVendor=$(cat /sys/kernel/config/usb_gadget/"$i"/idVendor)
+            idProduct=$(cat /sys/kernel/config/usb_gadget/"$i"/idProduct)
+            /usr/bin/gadget-vid-pid-remove ${idVendor}:${idProduct}
+        fi
+    fi
+done
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
index d7d394cfe..7210969d6 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
@@ -5,7 +5,9 @@ After=sys-kernel-config.mount
 
 [Service]
 Type=oneshot
+RemainAfterExit=yes
 ExecStart=/usr/bin/gadget-start
+ExecStop=/usr/bin/gadget-stop
 
 [Install]
 WantedBy=usb-gadget.target
diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index f8ebcc776..484110561 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://0001-libusbgx-Add-interface-name-for-NCM-Feature-Descript.patch \
     file://0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch \
     file://gadget-start \
+    file://gadget-stop \
     file://usbgx.initd \
     file://usbgx.service \
 "
@@ -39,6 +40,8 @@ INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '
 do_install:append() {
     install -Dm 0755 ${WORKDIR}/gadget-start ${D}${bindir}/gadget-start
     sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-start
+    install -m 0755 ${WORKDIR}/gadget-start ${D}${bindir}/gadget-stop
+    sed -i -e 's,/usr/bin,${bindir},g' -e 's,/etc,${sysconfdir},g' ${D}${bindir}/gadget-stop
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -Dm 0644 ${WORKDIR}/usbgx.service ${D}${systemd_system_unitdir}/usbgx.service
-- 
2.42.0


