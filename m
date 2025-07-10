Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E44C83F18
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 08:55:02 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.4083.1752137698158924206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 01:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BSuwVimg;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553dceb342aso623641e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752137696; x=1752742496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RrlLvcrBqTQdr9XDdj+4IEUOW9CN7jy0e9qZ67FeJR0=;
        b=BSuwVimgURn55lrplmpt5h2Uf0Pu/FcsqQz7G7X6c9gyeSvBsjwDEoeDiIQb3xgSdD
         horO/nmtUxL5mfYxac2XQMFQrsDSWR5jSxoXrFLZh16Jo7/BiGn45/wbisY65fTyG2Bp
         5zKe1DbpqdBHI0HgaUA4dnBoxIS+DWOmGo6csvhfojLESrFWs2wWn18Ltr7WzdcoIqWa
         97tKoBU722jHyPbDTpjCeRjQKZGojAWfDvvG9q6+o0bO3U8udPBnZnFFuYHLVGCybyxM
         716lg0EMPMHoTmQl61ADGB4nSo5ZUYQnM/Kd9eK3mH02mmOtyCORAcbvhEzMGXCdjXHU
         ut3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137696; x=1752742496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrlLvcrBqTQdr9XDdj+4IEUOW9CN7jy0e9qZ67FeJR0=;
        b=w/EDhVsLK+cQKg8+jLWG/NZISm0p7OjHCt77y2GRQE5AGkjG4TKLiDBv2/GV+nxhyN
         0uUL7joD7rBuBZE13tfWEK32clgZfBzwftQOLnqA423V1f/lSXelqVuFFhuKy+229Xzx
         WLeZd5V29LW4JTlyu2Kijflby4AMd4pHlkU9Uz0ZMxu/uKbDtOLVL76Gk7XjC3VoyNUj
         RNRaHX92vHfzxZsh4j7cSxeXVPjT3CUddXS4KpYargYp9u3lCYj+2AolKCGeUYajCwmq
         lxxBaIBnlqwJZ/Jk9rIx9JWLsc0MtBvTd8sbJ5nNbhpPM8OKyMK7ebjAy8vm7ePCjRFa
         a5hA==
X-Gm-Message-State: AOJu0YxiftrzFp7APG7miN/cy40isKwhN2FS9RSJSUf5OXX9n8r2rrxB
	gHfWfsMEvRWV26b3X99SYmyw74jrnGc/ItQo2lXf12mm8pCbAMpAqExZh0ySKM48fuVYAnpRvC2
	PFHR7
X-Gm-Gg: ASbGncslad2LImblSRlLWBEjbYqpm4S0HkhWE0UW2toSwM5UfqTgxUthrl7SB5XP1Zr
	9W5feOR9jMICislEtEjVOjLDH8LZr3fDybc5AorEsg3QFACMq87JXQ8PLSW5dA3pLWxiZqXoYIB
	XLgwif8BA1DIczS8z9GramOV4ZUsEvG4pdpORydLuOH1lmyWGqCzORpBamhFpTTYZh2RJE6jogR
	lJJnr03GjYIjk1/9c4xUNt4iSBtLIu6w0+gL2rX8c599Nx81p8atCq3a1jtKo3AXXP4NVCyd4WK
	1xVUzHVm5LuNjIcNqRzBwiDR0wsnKOtZSK9HH8buyjECFd3GJdRTLpmiEazmUhgEqeNexYZuzUn
	exq/pFfD1RFzmcoLA5Crnkw8QvhbtziOx3wn7tSzcmYnTsQJZuA==
X-Google-Smtp-Source: AGHT+IGYVUXKRmJrMMI+H1bbeK06e0ImAfy3xfDX3zg6i4VzG7vMv9B86mDvJsRbfpfQTc77oMmhzQ==
X-Received: by 2002:a05:6512:32c5:b0:553:34c8:f6ca with SMTP id 2adb3069b0e04-559000c40b5mr928542e87.35.1752137696050;
        Thu, 10 Jul 2025 01:54:56 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6bb33sm282286e87.174.2025.07.10.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 01:54:55 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/4] fwupd: update from 1.9.25 to 1.9.30
Date: Thu, 10 Jul 2025 11:54:35 +0300
Message-ID: <20250710085438.270911-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 08:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118400

Changes:

https://github.com/fwupd/fwupd/releases/tag/1.9.30

This release fixes the following bugs:

    Add several devices with broken firmware to the UEFI dbx blocklist
    Add /sys/firmware/efi/efivars to ReadWritePaths
    Do not export Redfish backup partitions as devices
    Do not show messages or prompt for answers in fwupdtool --json mode
    Fix a crash when installing some Wacom firmware types
    Fix deploying RMM updates on the Dell Kestrel dock
    Fix SMBIOS parsing for SPI ROM size >= 16MiB
    Never allow updating updatable-hidden devices with fwupdtool
    Recognize a very old dbx hash to allow upgrades to continue
    Reduce the Dell dock HID timeout, as retries already cover it

https://github.com/fwupd/fwupd/releases/tag/1.9.29

This release adds the following features:

    Prepend the missing capsule header also when using CoD
    Support cabinet archives greater in size than 2GB

This release fixes the following bugs:

    Do not add a Redfish release date if set to 00:00:00Z
    Do not add invalid CoSWID entities
    Fix creating the Redfish user when the ETAG is set
    Fix dbx deployment by ignoring missing PE/COFF sections
    Fix writing EFI variables on new kernel versions
    Include a SHA-256 checksum when using fwupdtool self-sign
    Include the length in Wacom USB scaler update for future hardware support
    Increase the timeout for RMM ack when updating Dell Kestrel docks
    Mark the Redfish progress as finished even if the update never got to 100%
    Set the Redfish MIME form-data filename correctly
    Use the metadata version format to set the lowest possible version

This release adds support for the following hardware:

    Lenovo USB-C Dual Display Travel Dock

https://github.com/fwupd/fwupd/releases/tag/1.9.28

Released: 2025-01-28

This release adds the following features:

    Add support for intel-csme19 version format

This release fixes the following bugs:

    Avoid downstream port resets of Parade USB hubs
    Cleanup Dell dock devices when disconnected
    Correctly parse PE files with zero sized sections
    Correctly set the package version of the Dell dock
    Run the FwupdClient::changed callback in the correct thread
    Run the UEFI capsule reboot cleanup action when required
    Split up the AMD GPU VBIOS P/N for the version
    Use the ISO date as a dbx version number

This release adds support for the following hardware:

    HP 400/405
    More ELAN fingerprint readers

https://github.com/fwupd/fwupd/releases/tag/1.9.27

This release fixes the following bugs:

    Add a power quirk for Framework systems
    Allow cros-ec repair the device after flush failure
    Check the VLI USB3 firmware size before erasing
    Disallow DBX updates on the Samsung Galaxy Book2 360
    Do not show 'Device has been removed' as a dock error
    Do not use a CMSE11 function when using CSME18
    Fix an unlikely memory leak when using ModemManger Sahara devices
    Fix a tiny memory leak in algoltek-usb when checking status
    Mark UEFI dbx updates as affecting full disk encryption
    Parse FDTs with missing END tokens
    Rename the dell-k2 plugin to dell-kestrel and rework the update flow

This release adds support for the following hardware:

    Google GID8 Headset
    Parade PS188
    Primax Ryder Mouse

https://github.com/fwupd/fwupd/releases/tag/1.9.26

This release fixes the following bugs:

    Add HSI tests for Arrow and Meteor Lake CSME
    Allow UEFI capsule config values to be set with fwupdmgr modify-config
    Check for the logitech-bulkcontroller response packet length correctly
    Fix using ID_LIKE for fallback when ESP isn't mounted
    Fix various Coverity-reported overflowed constants
    Only compare the first 10 characters of the AMD GPU part number

This release adds support for the following hardware:

    Jabra PanaCast
    Some Lenovo Legion HID devices

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-bsp/fwupd/{fwupd_1.9.25.bb => fwupd_1.9.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.25.bb => fwupd_1.9.30.bb} (98%)

v2: no changes

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
similarity index 98%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
index a098bf8eea5a..52d80be05b41 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-na
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "a1d484778ae87c69b38f417659b33fe3d689373ce0831d1f95617b8aa76e8c37"
+SRC_URI[sha256sum] = "a69de9a494a364095cc820faa10a68ec38d31f55eed5388322182048b81d10b3"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


