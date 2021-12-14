Return-Path: <hughsient@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D81C433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 14:41:42 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.26451.1639492901542339579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 06:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mIL+PuKo;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: hughsient@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id k9so14956269wrd.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t5kwwlpKB+1rGKF1QAJ+X7djrWrS9OhBcn9URcQTBCI=;
        b=mIL+PuKoGtg49HPVfKqIXlzLGqkjR0OE+uf2Pm+v+AvqdHrd0CxLkFZa2Z47LBQNcT
         sOC6uaK+4sNJygdASbj8wML6J77EFIBZJvQeo8FBPza9Oae7+Sa/r4LqmtSjrn9XIPJu
         ulUjWBTFd1WmkcjGtT96Mf/tE41Jw6Rw4Wdj7e//6M1Gx7tnP9ATi44qpfJZHq2X7ftA
         ZIu9NcKQZpMzVKW1ucQW3gOufW4fBQM5sZWNxrmwXrivThCjMbYzj89VMqEWOuYl7xHL
         lAXsl3uCyl7HUfiYNnRhGbYrrNOydBDn49sW8VkAUy5Qh12Blc4nqkVfB4wNbkSA/IzV
         MhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t5kwwlpKB+1rGKF1QAJ+X7djrWrS9OhBcn9URcQTBCI=;
        b=x9+mi5yLTEAFyECgx5V7J+74lqkZVwXaFYJoJBjhUnFf8F5keP9Yf5v4jWTt+MNySL
         M8kR3Ra9gSXucFXpnK4++hgifODgYD7vZuEa+RmxCYqU5rkSwXUP9O0pDdQNLPHEJYPm
         jKAenFT+ZtT6yHeHWrQVVsLf/5ijYaJmU8wWCqUPQ9iotn813MkpVYjkFchvwjrY3u+M
         ydQtWnjNNFmKavWSVBlZcTpVmgN4iX1hr1GB6uiuBjnnMzRE+OAgKr4PWf2QxpuhHQaB
         8BANCZ7OfA6mBFhEiFTaBNj03LOoRurn1iZeIxzJDT8bMWzEGFCAqbC+3KvwlUcqTqeY
         utiw==
X-Gm-Message-State: AOAM530mKZGDlyYwkQ3KijtyPT/rDa3T21j7OlqdjHAGIOFNqNFJG/oh
	CqOOtm/tsTGLWZ5GiKKXlY06h83rKGA=
X-Google-Smtp-Source: 
 ABdhPJzbaU3RyIRbjOfFEVdZBeiIz0caDJt2mcJUgv3RJbrhpUCsZVZ37eqyhEHydhBJ3zBGxslkTg==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr6058961wrq.17.1639492899930;
        Tue, 14 Dec 2021 06:41:39 -0800 (PST)
Received: from fedora.Hitronhub.home ([62.31.71.236])
        by smtp.gmail.com with ESMTPSA id
 f19sm2831657wmq.34.2021.12.14.06.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 06:41:39 -0800 (PST)
From: Richard Hughes <hughsient@gmail.com>
X-Google-Original-From: Richard Hughes <richard@hughsie.com>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Hughes <richard@hughsie.com>
Subject: [PATCH 4/4] fwupd: Update to 1.7.3
Date: Tue, 14 Dec 2021 14:41:06 +0000
Message-Id: <20211214144106.2492080-4-richard@hughsie.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214144106.2492080-1-richard@hughsie.com>
References: <20211214144106.2492080-1-richard@hughsie.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 14:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94358

New features:
 - Add a sync-bkc subcommand to ensure a known set of firmware versions
 - Make Upower and powerd support optional

Fixed bugs:
 - Check the value range when parsing the quirk keys
 - Do not wait for a USB runtime if will-disappear is set
 - Enable the MOTD integration when using pam_motd
 - Ignore a USB error for STM32 attach when the device goes away
 - Make the HSI tests optional for embedded targets
 - Make the plugin startup order deterministic
 - Use endian-safe version functions when enumerating Logitech hardware

Adding support for the following hardware:
 - Most Nordic Semiconductor nRF Secure devices

Signed-off-by: Richard Hughes <richard@hughsie.com>
---
 .../fwupd/{fwupd_1.7.2.bb => fwupd_1.7.3.bb}  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.7.2.bb => fwupd_1.7.3.bb} (83%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.3.bb
similarity index 83%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.7.3.bb
index 939f1c929..b02e8caa2 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.7.2.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.7.3.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "8632df69c3bafc59387cdcb517c3ce31a597a09026e44f5907d8384671b9f834"
+SRC_URI[sha256sum] = "109dacc16ed0db71eb08b852e96b070b8c2c53516a3071b9d0683acd8ecd42d9"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
@@ -24,22 +24,30 @@ PACKAGECONFIG ??= "curl gnutls gudev gusb \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd offline', '', d)} \
                    ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'plugin_uefi_capsule plugin_uefi_pk', '', d)} \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests plugin_dummy', '', d)} \
+                   hsi \
+                   plugin_acpi_phat \
                    plugin_amt \
+                   plugin_bcm57xx \
                    plugin_emmc \
+                   plugin_ep963x \
                    plugin_fastboot \
                    plugin_flashrom \
                    plugin_intel_spi \
                    plugin_logitech_bulkcontroller \
                    plugin_modem_manager \
                    plugin_msr \
+                   plugin_nitrokey \
                    plugin_nvme \
                    plugin_parade_lspcon \
+                   plugin_pixart_rf \
                    plugin_platform_integrity \
                    plugin_realtek_mst \
                    plugin_redfish \
                    plugin_synaptics_mst \
                    plugin_synaptics_rmi \
-                   plugin_thunderbolt"
+                   plugin_thunderbolt \
+                   plugin_upower \
+                   sqlite"
 
 PACKAGECONFIG[bluetooth] = "-Dbluez=true,-Dbluez=false"
 PACKAGECONFIG[compat-cli] = "-Dcompat_cli=true,-Dcompat_cli=false"
@@ -50,28 +58,38 @@ PACKAGECONFIG[fish-completion] = "-Dfish_completion=true,-Dfish_completion=false
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
 PACKAGECONFIG[gusb] = "-Dgusb=true,-Dgusb=false,libgusb"
+PACKAGECONFIG[hsi] = "-Dhsi=true,-Dhsi=false"
 PACKAGECONFIG[libarchive] = "-Dlibarchive=true,-Dlibarchive=false,libarchive"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
 PACKAGECONFIG[metainfo] = "-Dmetainfo=true,-Dmetainfo=false"
 PACKAGECONFIG[offline] = "-Doffline=true,-Doffline=false"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false,polkit"
+PACKAGECONFIG[sqlite] = "-Dsqlite=true,-Dsqlite=false,sqlite3"
 PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
 
+
 # TODO plugins-all meta-option that expands to all plugin_*?
+PACKAGECONFIG[plugin_acpi_phat] = "-Dplugin_acpi_phat=true,-Dplugin_acpi_phat=false"
 PACKAGECONFIG[plugin_amt] = "-Dplugin_amt=true,-Dplugin_amt=false"
+PACKAGECONFIG[plugin_bcm57xx] = "-Dplugin_bcm57xx=true,-Dplugin_bcm57xx=false"
+PACKAGECONFIG[plugin_cfu] = "-Dplugin_cfu=true,-Dplugin_cfu=false"
 PACKAGECONFIG[plugin_dell] = "-Dplugin_dell=true,-Dplugin_dell=false,libsmbios"
 PACKAGECONFIG[plugin_dummy] = "-Dplugin_dummy=true,-Dplugin_dummy=false"
 PACKAGECONFIG[plugin_emmc] = "-Dplugin_emmc=true,-Dplugin_emmc=false"
+PACKAGECONFIG[plugin_ep963x] = "-Dplugin_ep963x=true,-Dplugin_ep963x=false"
 PACKAGECONFIG[plugin_fastboot] = "-Dplugin_fastboot=true,-Dplugin_fastboot=false"
 PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=true,-Dplugin_flashrom=false,flashrom"
 PACKAGECONFIG[plugin_intel_spi] = "-Dplugin_intel_spi=true -Dlzma=true,-Dplugin_intel_spi=false -Dlzma=false,xz"
 PACKAGECONFIG[plugin_logitech_bulkcontroller] = "-Dplugin_logitech_bulkcontroller=true,-Dplugin_logitech_bulkcontroller=false,protobuf-c-native protobuf-c"
 PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=true,-Dplugin_modem_manager=false,libqmi modemmanager"
 PACKAGECONFIG[plugin_msr] = "-Dplugin_msr=true,-Dplugin_msr=false,cpuid"
+PACKAGECONFIG[plugin_nitrokey] = "-Dplugin_nitrokey=true,-Dplugin_nitrokey=false"
 PACKAGECONFIG[plugin_nvme] = "-Dplugin_nvme=true,-Dplugin_nvme=false"
 PACKAGECONFIG[plugin_parade_lspcon] = "-Dplugin_parade_lspcon=true,-Dplugin_parade_lspcon=false"
+PACKAGECONFIG[plugin_pixart_rf] = "-Dplugin_pixart_rf=true,-Dplugin_pixart_rf=false"
 PACKAGECONFIG[plugin_platform_integrity] = "-Dplugin_platform_integrity=true,-Dplugin_platform_integrity=false"
+PACKAGECONFIG[plugin_powerd] = "-Dplugin_powerd=true,-Dplugin_powerd=false"
 PACKAGECONFIG[plugin_realtek_mst] = "-Dplugin_realtek_mst=true,-Dplugin_realtek_mst=false"
 PACKAGECONFIG[plugin_redfish] = "-Dplugin_redfish=true,-Dplugin_redfish=false"
 PACKAGECONFIG[plugin_synaptics_mst] = "-Dplugin_synaptics_mst=true,-Dplugin_synaptics_mst=false"
@@ -81,6 +99,7 @@ PACKAGECONFIG[plugin_tpm] = "-Dplugin_tpm=true,-Dplugin_tpm=false,tpm2-tss"
 # Turn off the capsule splash as it needs G-I at buildtime, which isn't currently supported
 PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=true -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=false,efivar fwupd-efi"
 PACKAGECONFIG[plugin_uefi_pk] = "-Dplugin_uefi_pk=true,-Dplugin_uefi_pk=false"
+PACKAGECONFIG[plugin_upower] = "-Dplugin_upower=true,-Dplugin_upower=false"
 
 # Always disable these plugins on non-x86 platforms as they don't compile or are useless
 DISABLE_NON_X86 = "plugin_amt plugin_intel_spi plugin_msr plugin_thunderbolt"
-- 
2.33.1


