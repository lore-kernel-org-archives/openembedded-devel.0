Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7424CC83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:15:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.1128.1752077733665926100
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 09:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LIRj0Mdj;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23694cec0feso647345ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 09:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077733; x=1752682533; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWJwjP5JhXB4E4jhBRzQOBoSBpIWzHh5dZu6sOpyxcc=;
        b=LIRj0MdjwR6EHlzFJRmcCi9UyerUZaCsaEudVozbWWt/hJADvrSlIrdr6GMtPe9/Z5
         88lFVBvruNmxpEFcR5gxDv7eSpi50SB/lG8RLMHy1D4p0j6q9qtpUtBmvBDj2UdObNL9
         WJ3mx6vU/ZCntOvogeK/PfsJO7jds/Ryo7lM1ckfP+nLGrVx/erOhHHE2uX61P85bvpQ
         dK6Ja6oXaVjT0m2quINyTQpfnjmSQ8JlgPtW1HDeU0/tMOpBA1LaPM5JVz1TJ6jeHjco
         WaU1aK29TwHrVYgEe5sEW8SMWGXZK98nQQAx2JS3Rd4ua26nW1ZHm+8QawIRa+gTBLEJ
         BVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077733; x=1752682533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWJwjP5JhXB4E4jhBRzQOBoSBpIWzHh5dZu6sOpyxcc=;
        b=VG563MgqR/QKsazl3fBQI4/bn4k1YuP2hexCI9aDw1R3XjoGcBHJEx8oI6EOQd1xXu
         TmWk8Xhr90+mUb8OWXQEd/G5hvexWqA1pIAuKF8hCuAtJ7+cWwNGbQ7OI75sZSlqolgK
         O1YRjaYp4RepShKarfpaqx2TtzZrkmlQe5AeJwIkxGEMb8cfXUEx8iJ4L7tUMz0VSn0X
         ipF8boBNWJr14fsJPj02pr7SdVstvF8PbwZcAAQtkbLMIbKsGPnCt4nFXQI+RP4svoTI
         G+bPU6no3jMjETq7AcDSXOZilaX2mUaBScT96AIppcbCxHkb55L6Fv6XpWXkMwSNT7e+
         L4vA==
X-Forwarded-Encrypted: i=1; AJvYcCUAcMN+sbpVt+bgUmzjUY7zIOrRThKdgFs2AXsKAq5Fsu/QEHFr4q2IE0HHMYBPU2y5pB2tY5EbImTt8DgNviPhQHY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHQhnBmg0ofz794YJ44ARbjcHgsgKs5wVLHjX/NNt4a/GMnKb5
	g6zG3K0Afiigfz2ZrxELwelaSoadHjRPQvtN5OqjfqiK//ZfDtMZviIA
X-Gm-Gg: ASbGncsfPYy05S9VO2eWN54Vyc5cXap82un1C4pTJGxTd33r/wWFiDuFHQ17SnTMk6Y
	WXWfETXx71/xn6euvf5QJw7PehzEmWLsUNdjxjgme4dnXU7/jwfdaJEy2ReHxQIruPNZrbEzfeb
	KFRdHHXYZDgl5AmBe8dQMRRklEROW9QCYmSNJ3jYS70KDVnsWAXIis3KHpflbLIfBHQkPHs9IiM
	wS8XwK2I9+Ud95utAmOU41TUvZAG+b+EO9Z3Vsdel++tkGNmHw/n3YkXZ7hg8X9I2aAry1yrFdO
	f+6Qp5hvLSxGC/CeyybNMulu5CPZ0T44T+3ifhF0gCE3n+8nhBlxAZ8ovsBOZGF3CdYIBnWL7xL
	aAWcY7yp7hUXY6wysQT/YmPbQu3Hg7lntX+wOVxC1k453g9pCuQ==
X-Google-Smtp-Source: AGHT+IGks3tCd4boUqgEtoxcO/zYLFj7Lo7HhABr3W4HsUdYbDPfn7ordCgHaJh9Nz/e9+B6uwHL7g==
X-Received: by 2002:a17:902:ec91:b0:23c:7876:e6a8 with SMTP id d9443c01a7336-23ddb3524d7mr47390265ad.51.1752077732585;
        Wed, 09 Jul 2025 09:15:32 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d1b7:aad6:2c95:a1d8? ([2601:646:8201:fd20:d1b7:aad6:2c95:a1d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bca96sm141473535ad.242.2025.07.09.09.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 09:15:32 -0700 (PDT)
Message-ID: <acffd07e-6eea-4669-a03d-28d37c0bb2ce@gmail.com>
Date: Wed, 9 Jul 2025 09:15:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 1/4] fwupd: update from 1.9.25 to 1.9.30
To: mikko.rapeli@linaro.org, openembedded-devel@lists.openembedded.org
References: <20250708100330.138561-1-mikko.rapeli@linaro.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250708100330.138561-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 16:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118354

fails to build on YP AB

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/766/steps/14/logs/stdio

On 7/8/25 3:03 AM, Mikko Rapeli via lists.openembedded.org wrote:
> Changes:
> 
> https://github.com/fwupd/fwupd/releases/tag/1.9.30
> 
> This release fixes the following bugs:
> 
>      Add several devices with broken firmware to the UEFI dbx blocklist
>      Add /sys/firmware/efi/efivars to ReadWritePaths
>      Do not export Redfish backup partitions as devices
>      Do not show messages or prompt for answers in fwupdtool --json mode
>      Fix a crash when installing some Wacom firmware types
>      Fix deploying RMM updates on the Dell Kestrel dock
>      Fix SMBIOS parsing for SPI ROM size >= 16MiB
>      Never allow updating updatable-hidden devices with fwupdtool
>      Recognize a very old dbx hash to allow upgrades to continue
>      Reduce the Dell dock HID timeout, as retries already cover it
> 
> https://github.com/fwupd/fwupd/releases/tag/1.9.29
> 
> This release adds the following features:
> 
>      Prepend the missing capsule header also when using CoD
>      Support cabinet archives greater in size than 2GB
> 
> This release fixes the following bugs:
> 
>      Do not add a Redfish release date if set to 00:00:00Z
>      Do not add invalid CoSWID entities
>      Fix creating the Redfish user when the ETAG is set
>      Fix dbx deployment by ignoring missing PE/COFF sections
>      Fix writing EFI variables on new kernel versions
>      Include a SHA-256 checksum when using fwupdtool self-sign
>      Include the length in Wacom USB scaler update for future hardware support
>      Increase the timeout for RMM ack when updating Dell Kestrel docks
>      Mark the Redfish progress as finished even if the update never got to 100%
>      Set the Redfish MIME form-data filename correctly
>      Use the metadata version format to set the lowest possible version
> 
> This release adds support for the following hardware:
> 
>      Lenovo USB-C Dual Display Travel Dock
> 
> https://github.com/fwupd/fwupd/releases/tag/1.9.28
> 
> Released: 2025-01-28
> 
> This release adds the following features:
> 
>      Add support for intel-csme19 version format
> 
> This release fixes the following bugs:
> 
>      Avoid downstream port resets of Parade USB hubs
>      Cleanup Dell dock devices when disconnected
>      Correctly parse PE files with zero sized sections
>      Correctly set the package version of the Dell dock
>      Run the FwupdClient::changed callback in the correct thread
>      Run the UEFI capsule reboot cleanup action when required
>      Split up the AMD GPU VBIOS P/N for the version
>      Use the ISO date as a dbx version number
> 
> This release adds support for the following hardware:
> 
>      HP 400/405
>      More ELAN fingerprint readers
> 
> https://github.com/fwupd/fwupd/releases/tag/1.9.27
> 
> This release fixes the following bugs:
> 
>      Add a power quirk for Framework systems
>      Allow cros-ec repair the device after flush failure
>      Check the VLI USB3 firmware size before erasing
>      Disallow DBX updates on the Samsung Galaxy Book2 360
>      Do not show 'Device has been removed' as a dock error
>      Do not use a CMSE11 function when using CSME18
>      Fix an unlikely memory leak when using ModemManger Sahara devices
>      Fix a tiny memory leak in algoltek-usb when checking status
>      Mark UEFI dbx updates as affecting full disk encryption
>      Parse FDTs with missing END tokens
>      Rename the dell-k2 plugin to dell-kestrel and rework the update flow
> 
> This release adds support for the following hardware:
> 
>      Google GID8 Headset
>      Parade PS188
>      Primax Ryder Mouse
> 
> https://github.com/fwupd/fwupd/releases/tag/1.9.26
> 
> This release fixes the following bugs:
> 
>      Add HSI tests for Arrow and Meteor Lake CSME
>      Allow UEFI capsule config values to be set with fwupdmgr modify-config
>      Check for the logitech-bulkcontroller response packet length correctly
>      Fix using ID_LIKE for fallback when ESP isn't mounted
>      Fix various Coverity-reported overflowed constants
>      Only compare the first 10 characters of the AMD GPU part number
> 
> This release adds support for the following hardware:
> 
>      Jabra PanaCast
>      Some Lenovo Legion HID devices
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta-oe/recipes-bsp/fwupd/{fwupd_1.9.25.bb => fwupd_1.9.30.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.25.bb => fwupd_1.9.30.bb} (98%)
> 
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
> similarity index 98%
> rename from meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
> rename to meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
> index a098bf8eea5a..52d80be05b41 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
> @@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-na
>   
>   SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
>              file://run-ptest"
> -SRC_URI[sha256sum] = "a1d484778ae87c69b38f417659b33fe3d689373ce0831d1f95617b8aa76e8c37"
> +SRC_URI[sha256sum] = "a69de9a494a364095cc820faa10a68ec38d31f55eed5388322182048b81d10b3"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118303): https://lists.openembedded.org/g/openembedded-devel/message/118303
> Mute This Topic: https://lists.openembedded.org/mt/114043642/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


