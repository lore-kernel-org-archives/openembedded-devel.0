Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19C5C83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 07:00:51 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.2538.1752130845484594330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 00:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FudXIZeM;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5561d41fc96so672024e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752130844; x=1752735644; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=47tSVWc3vMjS88xAywOVzV1GMcUhG6sqmA9ZxX5gu04=;
        b=FudXIZeMrydCPzogpOmH8wAjyNpEz7SiGVQmLEIuZALoFzOK/Pa7u2/PDr9YQfY22p
         FURyVwVgiwVXCSTlORSOPLONQIjuj7L1ZoF/t8AFxFhk4oLhMbxYzKDA5uNpHiBMdFCH
         VP21NWx3gETmzZ/z2DWfKLiTDP/SNRgrhzGw3pOAXu+W6KM9wX8d7AfG7SFN0Qd11iqv
         24lTxcA6q4T9rk65SASxiOlQ10IFc5WHdJBLogWxCFySV8x8xrhUoecfyj5hU69eXSrU
         nVvgVwgmnI65aTZHG1nz4toTziEx+WGfL6y/Ckc9XeBKRqhWis3+np4JkfFblTA2WAiT
         ZUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752130844; x=1752735644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47tSVWc3vMjS88xAywOVzV1GMcUhG6sqmA9ZxX5gu04=;
        b=ExBbOyWlVd2meiK0ZUEEsFsdB1ImEZy+h0zTQQRYWu9FQ2XbqdrSW1JHDaBBMEM1YC
         IhDISHCtlug8QzDmzs25R5mUOgOqHdQlA883Iga0ZQgBISKcnuH5cqRUtPfsdBHqMxCW
         JTGlQ75scwfF9uCW8O7Ii5Ci9jKjhyWrTJbMgfBQKm4Ua31RMCpfoBtPiP8KOZ60f+qq
         xCJVcNe0nRSYc0b72yR65oDC0XdWDXoxYTgO8rvcs8hNSmJ17y5xeSAG1/vsMHVAslD9
         38yjRNoOT2kFkaXAkBLe34IknLK2AVyYkV8X2ziNaGPBsAH9F1H1/43yRtu9vvwSDY+u
         9yCQ==
X-Gm-Message-State: AOJu0YzY2mHGG422ww4rfuSuAOmMHfFB5CV1UbX6GsiLjyMr9EIWrFCR
	9PsrWGPrPU0tuExPEkB0Z4P7VZbxdgh1KJwkT6UunHnpbOCc6I4jLUksOdlfqPZKghs=
X-Gm-Gg: ASbGncskV8fUT+sbJTZRzzr5dSdAzdyPYtU15f37Jj+Y7lpWV6j1LJexq15zqjYczLf
	1ehNwy9Frg+zps2nwcx5AqrdSKWP/k8aZ66KKpc+OkSqP+vtutmvptlTUyR7qk7OHWZBNOUMDZm
	9zFqJtkns/fB1GeGQzv25oJ3QhIKEIEluzBR+xX+ZoIJaY4fA4nA0pesyyxPh2xtDiNWoFRLbaX
	kUS6vjuNyNtgP2X9xsdSaPyRJT+J2m5w9HqC8PO0M87p4AX/7h3hL2EwV6lP6hY/xaA0GyPvqCc
	8knTXqHIwYDNJ0UgsbHDCz+Ta+5qBMNktq7QCexPdtCVXfc58RUKDMSGlw6/dkxNt4VrP6JrNQk
	CZNelkUZC2rLi1Zo2kmM=
X-Google-Smtp-Source: AGHT+IHio5G8a6ZfJZfS2n0ccXZ7vDr82yibxzBgqe6KbqF64bTL2Z5cgV/xJnFf9BaXON2XzgE4fQ==
X-Received: by 2002:a05:6512:1286:b0:553:2c58:f973 with SMTP id 2adb3069b0e04-55935b409d5mr584546e87.52.1752130843477;
        Thu, 10 Jul 2025 00:00:43 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b635ecsm236370e87.166.2025.07.10.00.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:00:43 -0700 (PDT)
Date: Thu, 10 Jul 2025 10:00:41 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 1/4] fwupd: update from 1.9.25 to 1.9.30
Message-ID: <aG9lGYEUgzTiVhmp@nuoska>
References: <20250708100330.138561-1-mikko.rapeli@linaro.org>
 <acffd07e-6eea-4669-a03d-28d37c0bb2ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acffd07e-6eea-4669-a03d-28d37c0bb2ce@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 07:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118397

Hi,

On Wed, Jul 09, 2025 at 09:15:31AM -0700, Khem Raj wrote:
> fails to build on YP AB
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/766/steps/14/logs/stdio

Ok, will try to reproduce. Possibly just a missing build dendency to
hwdata which isn't installed on this build machine?

Cheers,

-Mikko

> On 7/8/25 3:03 AM, Mikko Rapeli via lists.openembedded.org wrote:
> > Changes:
> > 
> > https://github.com/fwupd/fwupd/releases/tag/1.9.30
> > 
> > This release fixes the following bugs:
> > 
> >      Add several devices with broken firmware to the UEFI dbx blocklist
> >      Add /sys/firmware/efi/efivars to ReadWritePaths
> >      Do not export Redfish backup partitions as devices
> >      Do not show messages or prompt for answers in fwupdtool --json mode
> >      Fix a crash when installing some Wacom firmware types
> >      Fix deploying RMM updates on the Dell Kestrel dock
> >      Fix SMBIOS parsing for SPI ROM size >= 16MiB
> >      Never allow updating updatable-hidden devices with fwupdtool
> >      Recognize a very old dbx hash to allow upgrades to continue
> >      Reduce the Dell dock HID timeout, as retries already cover it
> > 
> > https://github.com/fwupd/fwupd/releases/tag/1.9.29
> > 
> > This release adds the following features:
> > 
> >      Prepend the missing capsule header also when using CoD
> >      Support cabinet archives greater in size than 2GB
> > 
> > This release fixes the following bugs:
> > 
> >      Do not add a Redfish release date if set to 00:00:00Z
> >      Do not add invalid CoSWID entities
> >      Fix creating the Redfish user when the ETAG is set
> >      Fix dbx deployment by ignoring missing PE/COFF sections
> >      Fix writing EFI variables on new kernel versions
> >      Include a SHA-256 checksum when using fwupdtool self-sign
> >      Include the length in Wacom USB scaler update for future hardware support
> >      Increase the timeout for RMM ack when updating Dell Kestrel docks
> >      Mark the Redfish progress as finished even if the update never got to 100%
> >      Set the Redfish MIME form-data filename correctly
> >      Use the metadata version format to set the lowest possible version
> > 
> > This release adds support for the following hardware:
> > 
> >      Lenovo USB-C Dual Display Travel Dock
> > 
> > https://github.com/fwupd/fwupd/releases/tag/1.9.28
> > 
> > Released: 2025-01-28
> > 
> > This release adds the following features:
> > 
> >      Add support for intel-csme19 version format
> > 
> > This release fixes the following bugs:
> > 
> >      Avoid downstream port resets of Parade USB hubs
> >      Cleanup Dell dock devices when disconnected
> >      Correctly parse PE files with zero sized sections
> >      Correctly set the package version of the Dell dock
> >      Run the FwupdClient::changed callback in the correct thread
> >      Run the UEFI capsule reboot cleanup action when required
> >      Split up the AMD GPU VBIOS P/N for the version
> >      Use the ISO date as a dbx version number
> > 
> > This release adds support for the following hardware:
> > 
> >      HP 400/405
> >      More ELAN fingerprint readers
> > 
> > https://github.com/fwupd/fwupd/releases/tag/1.9.27
> > 
> > This release fixes the following bugs:
> > 
> >      Add a power quirk for Framework systems
> >      Allow cros-ec repair the device after flush failure
> >      Check the VLI USB3 firmware size before erasing
> >      Disallow DBX updates on the Samsung Galaxy Book2 360
> >      Do not show 'Device has been removed' as a dock error
> >      Do not use a CMSE11 function when using CSME18
> >      Fix an unlikely memory leak when using ModemManger Sahara devices
> >      Fix a tiny memory leak in algoltek-usb when checking status
> >      Mark UEFI dbx updates as affecting full disk encryption
> >      Parse FDTs with missing END tokens
> >      Rename the dell-k2 plugin to dell-kestrel and rework the update flow
> > 
> > This release adds support for the following hardware:
> > 
> >      Google GID8 Headset
> >      Parade PS188
> >      Primax Ryder Mouse
> > 
> > https://github.com/fwupd/fwupd/releases/tag/1.9.26
> > 
> > This release fixes the following bugs:
> > 
> >      Add HSI tests for Arrow and Meteor Lake CSME
> >      Allow UEFI capsule config values to be set with fwupdmgr modify-config
> >      Check for the logitech-bulkcontroller response packet length correctly
> >      Fix using ID_LIKE for fallback when ESP isn't mounted
> >      Fix various Coverity-reported overflowed constants
> >      Only compare the first 10 characters of the AMD GPU part number
> > 
> > This release adds support for the following hardware:
> > 
> >      Jabra PanaCast
> >      Some Lenovo Legion HID devices
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   meta-oe/recipes-bsp/fwupd/{fwupd_1.9.25.bb => fwupd_1.9.30.bb} | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >   rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.25.bb => fwupd_1.9.30.bb} (98%)
> > 
> > diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
> > similarity index 98%
> > rename from meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
> > rename to meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
> > index a098bf8eea5a..52d80be05b41 100644
> > --- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
> > +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.30.bb
> > @@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-na
> >   SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
> >              file://run-ptest"
> > -SRC_URI[sha256sum] = "a1d484778ae87c69b38f417659b33fe3d689373ce0831d1f95617b8aa76e8c37"
> > +SRC_URI[sha256sum] = "a69de9a494a364095cc820faa10a68ec38d31f55eed5388322182048b81d10b3"
> >   UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
> >   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#118303): https://lists.openembedded.org/g/openembedded-devel/message/118303
> > Mute This Topic: https://lists.openembedded.org/mt/114043642/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 

