Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5C3C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 10:03:53 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.14936.1751969024262851325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 03:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Z13z0Tpc;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5551a770828so4134943e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751969022; x=1752573822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tN2OOp/fAwtmudHmbLUbTurBZYF7mlxHnr29mBAABLM=;
        b=Z13z0TpcYmNhLWQL8xeCAMzNO9WAfX92dHAX7+Xz14TXaANGvr2RWBlLQc0mOa+xSi
         PPJUCshRFmHPkxTwSJNwyn9LN66paIcgSIx/kHVCsgUfypWnB1H6qNjT1eNVZz1G5N9w
         L8iQNc9uy2qsKMMxKzby3nDv4Pw7FrVelw8pOdWExuwrTWjeYx2q+9Gg6r3KhBaaRF9H
         J25dh2VxGTv2bQACmljU2m08Pndbp9kQKuGlSpWF6bPTri74k+sgTNX2U4kDED9dy41F
         JCVHVx+KR5X9QunRn+D+wa5zH1q2zIil3GqGkWvmvBAqPNwMlX394E9NN9kzrnl4ytwp
         TQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969022; x=1752573822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tN2OOp/fAwtmudHmbLUbTurBZYF7mlxHnr29mBAABLM=;
        b=agRi2ziz8D0QPTIOlEBcEFjsLYeCqkADy/E13tuxyGhYa6YjNYbeKHfrbJgrhhtuNT
         AbTUuNN8mz9iDkcOxBkPzL9PbdrdSlppP39JitOSknwl35MidDUZqd8xHgWS4H9/Rm5e
         h9UeUJOZ7ziWB+H4M5YtUurcsX4x1awMHL5UztxPLBB+Fw8EgFYz/GyRD/8ZsEoEBmhc
         R0swxQyJOoMWRVR/OoYUMp6+/s2uG0+HW0OUB6I/0FdNEpS/0qS3ojzSSzu5CxDZPrHA
         c5HfWkt6CxGDz12zad1rHSsJ3NyO2UNHJPdQphkcefeApT0Yw4ErgNIzYyLdt/D+/OQO
         +f1A==
X-Gm-Message-State: AOJu0YyKIZyhE2CTg4dF6I9+MjfErnYgo2Fu5Sz8cGSlF1YDmuw9iHgJ
	G9ZtfWJJWhYTCbvdMm66g3HuQr5K25ULWtPmqUSzTpzg6kC/HyXMxtDqItVo6xjopuW9P0v53uh
	4Ue7z
X-Gm-Gg: ASbGncvLgOvqlpWPCVq0d1DjsV9SrFPPPqgPusmL9rZZpisw3kXt9+TYWn1lyKkf0OK
	1yiUewghlx0Cp7/fgBztEBMVIciy6iFNfoE8rdULmeNLTNbAgaizCNcF4dYnbQqg+leRYS5cI9a
	Y9WPEcBBLTpIcLGawX5r+/Q+E2WM93T1/NO3VPkmg1WCG3fKeiWIo9pC+jcHbOnuMt+ZVvYZjjJ
	22cHNlEWmgm/xIY5ohN6cLHXXNQjYThmY/QDUH3ZX3PEgrPWQdtnvqmJMvzouqDscofKOaNaH3O
	4YDotfU/HHvsooqNy7hxIgHTiPzd89awogYD0SkjVJzb+6KZpGbPtANp/7BOgOx2dE2SQl9Biaq
	C230dEbNdhWrpkabJlQWXHRCkqTIBI5M+wwxyxX4=
X-Google-Smtp-Source: AGHT+IEfMaRH0+o8kVwFc2VaMsVuSbXI3Farx3yQTRIsoQssAywQWEhzrwr+srCD6mPeR1T9F8cREA==
X-Received: by 2002:a05:6512:3e19:b0:553:af02:78db with SMTP id 2adb3069b0e04-557f83021f7mr712070e87.5.1751969022109;
        Tue, 08 Jul 2025 03:03:42 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d9013sm1623585e87.84.2025.07.08.03.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:03:40 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][PATCH 1/4] fwupd: update from 1.9.25 to 1.9.30
Date: Tue,  8 Jul 2025 13:03:26 +0300
Message-ID: <20250708100330.138561-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118303

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


