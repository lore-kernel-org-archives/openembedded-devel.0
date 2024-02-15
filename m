Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60905C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 14:17:47 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.14902.1708006657535594698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 06:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OeiAabz8;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a26f73732c5so122310166b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708006656; x=1708611456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuaxwWii2I+r0i22tWD+r+T8ERyLYVqu7BSvZZl8AQg=;
        b=OeiAabz8p5pNG7iLOkk0PuWwhapiD7KmYerNBFHDaycmZwbJCiLQs8HN6DOpeTaQgW
         a/N704q89ZZrY7Osl66BbeDKphdTWXsqMQtfw3NF91WzzDtvN8uAQyYqKQknyAEVZE/C
         zPX/j1YrqVqSRBzkHijPoUTFriaDKBnbASQkK4vzZ8vfFoHD9k8CrdIIekAt35fiokd2
         bzMNdANR2kg3N/SNYBWrVIhNmz6hi7vyHjBAShyNXcHHop40D8/W8e1z0xbBciN9Nbyl
         5/Gv0EWnfcFU8IUStXt34Vtq+xHDroaL67l+ppymJgog/1gxMw6wFn1wPVg5IEar/Em5
         wfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006656; x=1708611456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuaxwWii2I+r0i22tWD+r+T8ERyLYVqu7BSvZZl8AQg=;
        b=N0JfTgH3jEt1ZtDtqQwER5o/J4MrliGZ67GW9veeDhnPSbpcVnbW77w1PDfXV5PGml
         tbocuIGyo4rJ+Gmd9mdhHSZ1o5bn4UlNldysWUMvGQAJIE+Qax+F4iVkU3qiNJzwR502
         ZBD9Nfj9YrYy99QQvoJDF8hDX0YlI+tKtRk1XX3yoxdLMlJ0ggEuMbIr79/amWkxb6pr
         11YqVvqZLt0kosVXj4KMuRFjuM6TFECVc5jNYwe634/QPIKq5nzLx1Y4K4VrfVTrN+s+
         Yz+xUhD1fdRQv5a7YmWsnQrFzoreMHMLHKTb9GE5SvpXCLHKK+AOo73ArzsRWs5/9Q8H
         4FfQ==
X-Gm-Message-State: AOJu0YylEqpnfmLOOm2BGfgOqnRlwX8vtbuyDaXqYT9VK7CcObhPu/lu
	uoUg0ebj27L3CkSl8IrdaozRgeQY6pfe+lS8I/T1LStN++x2N+G29pbFv2dM
X-Google-Smtp-Source: AGHT+IHbDd1Y/sinsUMjiOwvxoJPzumilKMFMybyfUJWcy1Z13FjwxZ6Ll8CiZ4YdZq+YrjKNCyv+g==
X-Received: by 2002:a17:906:1c52:b0:a3d:aa05:25fe with SMTP id l18-20020a1709061c5200b00a3daa0525femr715091ejg.71.1708006655586;
        Thu, 15 Feb 2024 06:17:35 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id st8-20020a170907c08800b00a3cf6edb590sm594209ejc.26.2024.02.15.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:17:35 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 1/2] libusbgx: fix usbgx.service stop / restart
Date: Thu, 15 Feb 2024 15:17:07 +0100
Message-ID: <20240215141708.2108422-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108754

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


