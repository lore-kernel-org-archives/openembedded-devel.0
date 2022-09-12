Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF26EC6FA89
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 03:41:36 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.3706.1662954089890119046
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QXNOCBxK;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id t65so7084603pgt.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0QJ68ZG6YrU+GINsFXaBaCAKi/ougfqpRlrhCPdbjWw=;
        b=QXNOCBxKMY9iuPZAtGgEWLxcO7FbB1xYj6A/dQJjTqgmmg+etUFyIc3513edaWLdyp
         mU63tbmJHrWEDrKiWNDQcWZKjkDImgm2d2UtGyOAMGzWXaFX2+hlvwtljSbcc7jMmLcc
         ffwlUmFNcHiVvvendARHTv9T3u+ng+D8x7OfYGQdEG2EvUFepwAXGpoUWs+SFNIIE70+
         ZlmbF5Rwg+/eyCESdvZ3hYTDG/8AnNHyuzOAtGwaaYJ0ux5MrYu+jr9J5nhX3KFnxmz4
         RefbrnmGs84gTgDiiH8gddMi9oXVSdVoBEVyuelS36qTGvNUQyXkOfrg9dnzus6nqIiv
         bfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0QJ68ZG6YrU+GINsFXaBaCAKi/ougfqpRlrhCPdbjWw=;
        b=LgZZtRqc2Wse9DB72yMM4HUwG8CAhIScB4wI4Ptf7aJNw5MOXpLJSVerOsRKFrqvM8
         8l7kFwWPKXaJMukUhmWZ5CCkj+k0TMJ2oJh/jGCUCXkrO6iXyIVNahSJ+wdx1pkAV47D
         27lzIoJY1Z6n7jXpW76ipHtbNKQuFUzD6iF2/bCI3CQI00oycBWLW37UibO24158NfqW
         Ga1PL05EOeTHrxJ0f/QOBeA4BrAlp6l29QEABt7UIwi2KYyIGZu9C/k7AhTS7EMaQnEm
         B2Qd4ho2nyTqSSJ8PxxEd3nvqRRedIOd4sJeb7X7xWeH2I96uBq5pZuScB+RdUh/yO1d
         +Asw==
X-Gm-Message-State: ACgBeo2CeS3ElLYrdw2vZph2MjK70PlzMZdk0iQ6gY2Bi8pdwGMB9RaI
	PY/4IvSWpT3xdOTTB/jUjURMWlhv/yy0+Q==
X-Google-Smtp-Source: 
 AA6agR7t5AxCnor87s5tFt6+iC10RxBfOkeO5Vxb2MpIYwahtYJBhl9IHgWbl9V5yMduWJDvYRMYPg==
X-Received: by 2002:a63:3247:0:b0:434:6959:ba0e with SMTP id
 y68-20020a633247000000b004346959ba0emr21470885pgy.22.1662954088972;
        Sun, 11 Sep 2022 20:41:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b00176ea6ce0efsm4664940plg.109.2022.09.11.20.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 20:41:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] fwupd: Upgrade to 1.8.4
Date: Sun, 11 Sep 2022 20:41:19 -0700
Message-Id: <20220912034123.1885229-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912034123.1885229-1-raj.khem@gmail.com>
References: <20220912034123.1885229-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 03:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98743

Remove packageconfig for thunderbolt, its not a plugin anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-bsp/fwupd/{fwupd_1.8.1.bb => fwupd_1.8.4.bb}    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.8.1.bb => fwupd_1.8.4.bb} (95%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.1.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
similarity index 95%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.8.1.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
index 7576b846fb..4258652744 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.1.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib sqlite3 libjcat gcab vala-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "5756466442eb9134fb40cdc8a46f9e01003247c8eac82fa5d8b16f6420375b79"
+SRC_URI[sha256sum] = "adfa07434cdc29ec41c40fef460e8d970963fe0c7e849dec7f3932adb161f886"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
@@ -47,7 +47,6 @@ PACKAGECONFIG ??= "curl gnutls gudev gusb \
                    plugin_synaptics_mst \
                    plugin_synaptics_rmi \
                    plugin_scsi \
-                   plugin_thunderbolt \
                    plugin_uf2 \
                    plugin_upower \
                    sqlite"
@@ -99,7 +98,6 @@ PACKAGECONFIG[plugin_redfish] = "-Dplugin_redfish=true,-Dplugin_redfish=false"
 PACKAGECONFIG[plugin_scsi] = "-Dplugin_scsi=true,-Dplugin_scsi=false"
 PACKAGECONFIG[plugin_synaptics_mst] = "-Dplugin_synaptics_mst=true,-Dplugin_synaptics_mst=false"
 PACKAGECONFIG[plugin_synaptics_rmi] = "-Dplugin_synaptics_rmi=true,-Dplugin_synaptics_rmi=false"
-PACKAGECONFIG[plugin_thunderbolt] = "-Dplugin_thunderbolt=true,-Dplugin_thunderbolt=false"
 PACKAGECONFIG[plugin_tpm] = "-Dplugin_tpm=true,-Dplugin_tpm=false,tpm2-tss"
 # Turn off the capsule splash as it needs G-I at buildtime, which isn't currently supported
 PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=true -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=false,efivar fwupd-efi"
@@ -108,7 +106,7 @@ PACKAGECONFIG[plugin_uf2] = "-Dplugin_uf2=true,-Dplugin_uf2=false"
 PACKAGECONFIG[plugin_upower] = "-Dplugin_upower=true,-Dplugin_upower=false"
 
 # Always disable these plugins on non-x86 platforms as they don't compile or are useless
-DISABLE_NON_X86 = "plugin_amt plugin_intel_spi plugin_msr plugin_thunderbolt"
+DISABLE_NON_X86 = "plugin_amt plugin_intel_spi plugin_msr"
 DISABLE_NON_X86:x86 = ""
 DISABLE_NON_X86:x86-64 = ""
 PACKAGECONFIG:remove = "${DISABLE_NON_X86}"
-- 
2.37.3


