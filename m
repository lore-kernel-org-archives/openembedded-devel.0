Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92F1C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 06:16:06 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.6471.1714716957460557010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 May 2024 23:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NRYR44V9;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso13561545e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 23:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714716955; x=1715321755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ziWWPrMBn8S3q4w5Cw1vHiAyoE9MeS4GIWT/dsIaxJA=;
        b=NRYR44V9R9SVy1PKifBBhbClWU7aOi+NVTmKjaYK92dsWS72V4TS9IPOgy+WacLW2D
         SHTj8/nXX6BtxLIabtcLEqEmBbPhIjduxZqO3rDbHQfo3p73d+cjZDFzitUpmkJu8ANh
         KokMO9TFMRoR2bCG1h+du02fLcP4WoTATwkuT2CAZzyO/VAzGheb1xjd99f8yrB2+XJR
         m7DrA9Oz9j0GZGbMofQbTd47rtId09aFxRzPk5qCvkATzTTiO4mPfnJjopyQTwVyYN9j
         1HkQMz3VEDrOTD+apkKv/Pjaep6gFGnzukvPz2eKAfO+q5pf59KhoCHJrhND84Z3en0O
         ielQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714716955; x=1715321755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziWWPrMBn8S3q4w5Cw1vHiAyoE9MeS4GIWT/dsIaxJA=;
        b=hyzlrOGamM3/XpJO3FIJa8NMkb0zv+dQvL5Z8NWDlbQy3S9wKDeGg1dL5vQLPQ5MvF
         zpECLxiPjOQNZ7Crvubhu+eVOWT9qZjAClYWjGna5X1ElkiMBYwE3B5oSQZWXlf2spcf
         fPPJxTzskymOiwduBAtighItJF/64eUllP686+Q1sQ+tk5vScyM9I6fhH4DxX1apoVjc
         zj777HYEFPVk3BdXaY3uFD3cKAb/12RX7Dm3SYDHfNGNUSdK6Wl9+HbcTqsSwOMxKhmZ
         pUZSrhbLwIzDZ+vkFy7R4urHOHhAlbTG/T7SHUH3OW+eCUojWFDcVT8yevpsciL7NyKD
         nAkg==
X-Gm-Message-State: AOJu0YyobSb1CMQtLP3W8MYcEkoPZGHT0E+84tMoDygc+j7zrNPzbSKH
	Cl5K1ShEZowuSz/ScGigqbnV0JKJi6XXnZzUdGbr4KDxlO6Oo+BUKYj/bMP77cZYWvc1iTUOWrO
	gmmk=
X-Google-Smtp-Source: AGHT+IHF0W4a8WiZks+PRhG80WrErDB6Ty2ZSFdSxVGMQODVhE/oy1+0bEbY1flCg0qrumbiXjQ+6A==
X-Received: by 2002:ac2:550e:0:b0:51f:3b4d:b087 with SMTP id j14-20020ac2550e000000b0051f3b4db087mr1350911lfk.63.1714716955521;
        Thu, 02 May 2024 23:15:55 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id a24-20020ac25218000000b0051cb5376788sm435291lfl.120.2024.05.02.23.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 23:15:54 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][PATCH] fwupd: fix uefi capsule update build error
Date: Fri,  3 May 2024 09:15:07 +0300
Message-Id: <20240503061507.585375-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 06:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110243

plugin_uefi_capsule_splash does not provide "enabled" or "disabled"
options but only basic bool "true" and "false". Fixes do_configure()
failure with
PACKAGECONFIG:append = " plugin_tpm plugin_uefi_pk plugin_uefi_capsule ":

| ../fwupd-1.9.18/meson.build:1:0: ERROR: Value disabled is not boolean (true or false).

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
index d20d5ed2a..e6c276ba4 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
@@ -104,7 +104,7 @@ PACKAGECONFIG[plugin_synaptics_mst] = "-Dplugin_synaptics_mst=enabled,-Dplugin_s
 PACKAGECONFIG[plugin_synaptics_rmi] = "-Dplugin_synaptics_rmi=enabled,-Dplugin_synaptics_rmi=disabled"
 PACKAGECONFIG[plugin_tpm] = "-Dplugin_tpm=enabled,-Dplugin_tpm=disabled,tpm2-tss"
 # Turn off the capsule splash as it needs G-I at buildtime, which isn't currently supported
-PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=enabled -Dplugin_uefi_capsule_splash=disabled,-Dplugin_uefi_capsule=disabled,efivar fwupd-efi"
+PACKAGECONFIG[plugin_uefi_capsule] = "-Dplugin_uefi_capsule=enabled -Dplugin_uefi_capsule_splash=false,-Dplugin_uefi_capsule=disabled,efivar fwupd-efi"
 PACKAGECONFIG[plugin_uefi_pk] = "-Dplugin_uefi_pk=enabled,-Dplugin_uefi_pk=disabled"
 PACKAGECONFIG[plugin_uf2] = "-Dplugin_uf2=enabled,-Dplugin_uf2=disabled"
 PACKAGECONFIG[plugin_upower] = "-Dplugin_upower=enabled,-Dplugin_upower=disabled"
-- 
2.34.1


