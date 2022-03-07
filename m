Return-Path: <hughsient@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4FDC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 15:02:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.27108.1646665356144542977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 07:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M4CDN/Hi;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: hughsient@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id q14so8204481wrc.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 07:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kTZjWGYWj6EOWF7/3c3ZHj9wG2nf917K7qNblgPf2yU=;
        b=M4CDN/HiBf5zw78QTfb/TgEOOkVl/z86sunluUxD+UmbWIROhOTskT3e/6Y+WsIMzX
         N0xpkEuvWvWhHOywWEyTiliq+UEzR3+pAzf6hJxl5xmk7w1xG7bmg5huLIL4VG4c/5Ty
         HRnPT6NbQLMjJLvjZ3lFo6VkXGz6kBoPMNO7S1JIIisgNZR2x96nPPg+inguSJnl3kc+
         2g6e80ealcsM1JT7LnqwG+YxzxrBO5NREE1qDYvvCizhNcJzW7WJM3pjWyWUG83Ay9th
         sInwhIcINLhQyMVYTR7R4so5H325+WQxGzdDJeZacVRT9n71nHgOFuYNovIKGK48qix+
         XPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kTZjWGYWj6EOWF7/3c3ZHj9wG2nf917K7qNblgPf2yU=;
        b=RWGSQSBgcRh1zmvOVBcszGfW1ia/q3NC7n+v6Dm+Kf8lTK5XL6D92wcNmUJ4+E5TOD
         K4sYb/5NO/99xd90/LI+VHvH0c7x0cGmARgBttD4N2cz222cILPtpwoTrLzkeCBwBAkP
         G0fSiTGHDOVW9TACFd/3mBGYWGsMs0FlJwaPHiYgxKPvKx7mouCC4e2egCxT/gkK8f/q
         2DDCaSLxj4EVTH1lls952UJINXUqtRweRYyzTux0ERpC63pEm0f0loou0wVqmHN2CzX8
         A54pich0/e2zFC62oL3LbwILERI3t4Gqzg6qhzEtDA1Z36NjzH5nYpRReFk4WmregJcY
         HU2A==
X-Gm-Message-State: AOAM53136QQhOgaN16VbjXwr2ZH9h7wl8fF15m027oGJYtuC0fRpN/8f
	e5aPC+KzuTvjZPcl+1K9QMbR4QX51CM=
X-Google-Smtp-Source: 
 ABdhPJypNg0ThKc/zPwe6HZILwHtDg9GSIh23CsbDBcXX5N4QTEeC2NDc0vTEX8xgRfZSV9z6hicMw==
X-Received: by 2002:adf:8122:0:b0:1e7:b111:3b92 with SMTP id
 31-20020adf8122000000b001e7b1113b92mr8822536wrm.695.1646665354322;
        Mon, 07 Mar 2022 07:02:34 -0800 (PST)
Received: from fedora.Hitronhub.home ([62.31.71.236])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a5d674b000000b001f047c49e99sm11719550wrw.2.2022.03.07.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 07:02:33 -0800 (PST)
From: Richard Hughes <hughsient@gmail.com>
X-Google-Original-From: Richard Hughes <richard@hughsie.com>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Hughes <richard@hughsie.com>
Subject: [PATCH] fwupd: New release
Date: Mon,  7 Mar 2022 15:02:19 +0000
Message-Id: <20220307150219.46506-1-richard@hughsie.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 15:02:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95860

New features:
- Add a flag to indicate the device has a signed or unsigned payload
- Add a plugin to set a GPIO pin for the duration of an update
- Add a simple plugin to enumerate (but not update) SCSI hardware
- Add two more instance IDs to the MTD devices
- Add X-BaseboardManagementController as an update category
- Allow assigning issues to devices for known high priority problems
- Parse the MTD firmware version using the defined GType

Fixed bugs:
- Modify the AT retry behavior to fix getting the firmware branch
- Do not show a warning if the TPM eventlog does not exist
- Do not show TSS2 warning messages by default
- Fix a critical warning when loading an empty TPM eventlog item
- Fix the error handling when updating USB4 retimers
- Show the user when devices are not updatable due to inhibits
- Skip probing the Dell DA300 device to avoid a warning
- Try harder to convert to a version into a correct semver
- Use multiple checksums when there are no provided artifacts

Signed-off-by: Richard Hughes <richard@hughsie.com>
---
 .../recipes-bsp/fwupd/{fwupd_1.7.3.bb => fwupd_1.7.6.bb}  | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.7.3.bb => fwupd_1.7.6.bb} (94%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.3.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
similarity index 94%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.7.3.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
index 93c0e741e..53f1720b0 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.3.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "109dacc16ed0db71eb08b852e96b070b8c2c53516a3071b9d0683acd8ecd42d9"
+SRC_URI[sha256sum] = "7ebe1514acb688d2649cecc392db929094da3f03cfc98a9c0faccabb084912fa"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
@@ -32,6 +32,7 @@ PACKAGECONFIG ??= "curl gnutls gudev gusb \
                    plugin_ep963x \
                    plugin_fastboot \
                    plugin_flashrom \
+                   plugin_gpio \
                    plugin_intel_spi \
                    plugin_logitech_bulkcontroller \
                    plugin_modem_manager \
@@ -45,7 +46,9 @@ PACKAGECONFIG ??= "curl gnutls gudev gusb \
                    plugin_redfish \
                    plugin_synaptics_mst \
                    plugin_synaptics_rmi \
+                   plugin_scsi \
                    plugin_thunderbolt \
+                   plugin_uf2 \
                    plugin_upower \
                    sqlite"
 
@@ -80,6 +83,7 @@ PACKAGECONFIG[plugin_emmc] = "-Dplugin_emmc=true,-Dplugin_emmc=false"
 PACKAGECONFIG[plugin_ep963x] = "-Dplugin_ep963x=true,-Dplugin_ep963x=false"
 PACKAGECONFIG[plugin_fastboot] = "-Dplugin_fastboot=true,-Dplugin_fastboot=false"
 PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=true,-Dplugin_flashrom=false,flashrom"
+PACKAGECONFIG[plugin_gpio] = "-Dplugin_gpio=true,-Dplugin_gpio"
 PACKAGECONFIG[plugin_intel_spi] = "-Dplugin_intel_spi=true -Dlzma=true,-Dplugin_intel_spi=false -Dlzma=false,xz"
 PACKAGECONFIG[plugin_logitech_bulkcontroller] = "-Dplugin_logitech_bulkcontroller=true,-Dplugin_logitech_bulkcontroller=false,protobuf-c-native protobuf-c"
 PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=true,-Dplugin_modem_manager=false,libqmi modemmanager"
@@ -92,6 +96,7 @@ PACKAGECONFIG[plugin_platform_integrity] = "-Dplugin_platform_integrity=true,-Dp
 PACKAGECONFIG[plugin_powerd] = "-Dplugin_powerd=true,-Dplugin_powerd=false"
 PACKAGECONFIG[plugin_realtek_mst] = "-Dplugin_realtek_mst=true,-Dplugin_realtek_mst=false"
 PACKAGECONFIG[plugin_redfish] = "-Dplugin_redfish=true,-Dplugin_redfish=false"
+PACKAGECONFIG[plugin_scsi] = "-Dplugin_scsi=true,-Dplugin_scsi=false"
 PACKAGECONFIG[plugin_synaptics_mst] = "-Dplugin_synaptics_mst=true,-Dplugin_synaptics_mst=false"
 PACKAGECONFIG[plugin_synaptics_rmi] = "-Dplugin_synaptics_rmi=true,-Dplugin_synaptics_rmi=false"
 PACKAGECONFIG[plugin_thunderbolt] = "-Dplugin_thunderbolt=true,-Dplugin_thunderbolt=false"
@@ -99,6 +104,7 @@ PACKAGECONFIG[plugin_tpm] = "-Dplugin_tpm=true,-Dplugin_tpm=false,tpm2-tss"
 # Turn off the capsule splash as it needs G-I at buildtime, which isn't currently supported
 PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=true -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=false,efivar fwupd-efi"
 PACKAGECONFIG[plugin_uefi_pk] = "-Dplugin_uefi_pk=true,-Dplugin_uefi_pk=false"
+PACKAGECONFIG[plugin_uf2] = "-Dplugin_uf2=true,-Dplugin_uf2=false"
 PACKAGECONFIG[plugin_upower] = "-Dplugin_upower=true,-Dplugin_upower=false"
 
 # Always disable these plugins on non-x86 platforms as they don't compile or are useless
-- 
2.35.1


