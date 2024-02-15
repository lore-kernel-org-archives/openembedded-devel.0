Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CEBC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 14:09:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.14466.1708006150890932075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 06:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xy0KrCn1;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3d54555692so92346566b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 06:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708006148; x=1708610948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuaxwWii2I+r0i22tWD+r+T8ERyLYVqu7BSvZZl8AQg=;
        b=Xy0KrCn1ggAugOJEL+ezV65IbPHvFipKx6Z8wVw0F7vK1s8/2KZ4Rj0pedcQzhdKCo
         T+gMXb27Q9iFn7DbzjgJOuEntzwLmZxxY2EfUst6I+Et8ouswt4N7gIPDY7rT5y6sYdC
         nRKrU3ZWHZF1on5gXJuqs5zl4/6CsrIOMt7hI1npJVjHPf3vMxs2fn03DrQcqNEbqoFs
         zGAYbbCDMwHpjNPoq952DctJKCQj6Eb22WGnxRT2SdpP8yorROI1QtYlP6m13jX/LhMf
         3xhe8sHSHZSsdrASTcA+qwPBrfmnhcqBOMD+K5W9GcJ+nJOu7sLm+y7xvQIUqdeG1bvc
         yBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006148; x=1708610948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuaxwWii2I+r0i22tWD+r+T8ERyLYVqu7BSvZZl8AQg=;
        b=WSwBueu2Pze//rCW5D49KcjMp2DC9Mso1d5ldnfZkSqtoQJuV8CIpAAD3E4i+bdX1I
         S+cHEfQhMa5JhaPzmp6nwRtF/xoPYYCPacT98qaqcl3R7YRsiyF/EVvvlK27TDevlRJ/
         rysFNC6FJcNR3uH262TdIXL7Y6RMRmoiR/sqTlch5G6fySKaeajPth9ihbsiZzxU3Yu1
         Tv0VoqKai5hXlii0umZ6DoSA+mjxM+IZSj0g+LNB+aiPaKSGavyHiZOGvfXYsU0sgAQZ
         p44hRFGsSeXC6m+KA0nUzGSP2CfaZC77UN2QrOC/9B+Im5yDHwuXgrSNQEERWaeEa10k
         tq9Q==
X-Gm-Message-State: AOJu0YzXVSWxSHjyDGhuEwwgHJlXZO20l8pEqBm0TDMfiHNxJpAsiRFd
	XApRm9iU8FX1Xs5/nKeQdesEFwoLnMmAVV7ECB8ImeIW3OFyjkDzFwpXhPvo
X-Google-Smtp-Source: AGHT+IGVdAFraagwH4GxQ6mfGwewp+B+X4XJgSWCKhqpPPJRis9WYbVfWhuwHoGSdLlXyLxR2O4I3A==
X-Received: by 2002:a17:906:3b0b:b0:a3d:8366:e1eb with SMTP id g11-20020a1709063b0b00b00a3d8366e1ebmr1532472ejf.31.1708006148358;
        Thu, 15 Feb 2024 06:09:08 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id p19-20020a170906b21300b00a3dad483948sm238238ejz.182.2024.02.15.06.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:09:08 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 1/2] libusbgx: fix usbgx.service stop / restart
Date: Thu, 15 Feb 2024 15:07:13 +0100
Message-ID: <20240215140714.2106808-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 14:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108751

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


