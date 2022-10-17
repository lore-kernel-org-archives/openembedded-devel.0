Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BA1C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 01:30:29 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.36330.1665970221927031141
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 18:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+uhddjE;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id cy15-20020a056830698f00b0065c530585afso5010475otb.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 18:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WnJgxxZCSJZcCMqTmeCMWfwRbCAFPX9qrQGb9LejrpM=;
        b=O+uhddjEcPFCjDJRYSGU9iPxhl8CP6kJo8ubOrXK1EaCj8ocWQ1H0sBeVRBdx720fV
         vBMgEfK+xxth5E1rubeCzzaKzjJOXeDgZyQOGwppxUMze4iGoX9XNFaHm02TuhZOtKVJ
         L7FfkuofTA2VgJue7nsH7QfUkWALIqymO7fWJ5NXf4xz12w79jTojLYuucTsfHfjRTxq
         PVya/WLO5XE2gEgpIghWo3/+SwfEeIp87DMvlO4IyaB32za5SrO2xid0/ASw7GE/yfLc
         cvkTpzkZbrbSelIXcZ7cmvjUfXq+xWq5gQxy2RgjJ+E4eh2Oq0UqDJU67RgG0zAiFP+g
         c+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnJgxxZCSJZcCMqTmeCMWfwRbCAFPX9qrQGb9LejrpM=;
        b=GGFv7421RFjb6JakrHqybwmpWzTSoCM3No61jdTN23NZPTcCdkKY2FsIGIOrdZ1O6c
         epKRxBzkr6jMH6T770cOBa1XEl23Icg0xl0OgXnc/lqf4rmXZ/jbJBBE/8seleAxa1MZ
         H80+o4rRFJOdWqCCWF/eo1r8cnisxZ5ai73sa1zBcNMSBnM9rebeistf4l1f0Stk56Br
         8y+fddwXzjSeUii+Kba4Br6qFMSOJ60JfkNTPpjjVWYmClPnZz1qRWK1xoz6NZm4E2U7
         PoRbEn8TzjiOBhyo+wunPd39kMI0mGkPJHsXaKrv8AoUr1PHoJDlm2259TnOSmzcOnSN
         uNtg==
X-Gm-Message-State: ACrzQf19U3j8h/lA1TXvIDzB9iLmmwNkVfbbQUAtSOGcobJjAtozbZ2z
	JAJeqUg5cOZuhcxvvylg7Qjdx3PS05UXyT+lOGg=
X-Google-Smtp-Source: AMsMyM4WREZ9slrqsXPCCIBUoAPStRiS0f/RYEiDb98xYhWKHczlv4/KUwPY16MbrA0sF2Adwon7rQfBD7hYhsF0+oA=
X-Received: by 2002:a9d:61d6:0:b0:661:c1ad:848f with SMTP id
 h22-20020a9d61d6000000b00661c1ad848fmr4007448otk.111.1665970221070; Sun, 16
 Oct 2022 18:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221016233720.79979-1-vince@underview.tech>
In-Reply-To: <20221016233720.79979-1-vince@underview.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2022 18:29:55 -0700
Message-ID: <CAMKF1sq_6yRurUKjxP2kXkb6L+uUYckvuK27rvgQzKF5d0s2+Q@mail.gmail.com>
Subject: Re: [oe] [OE-core][PATCH] linux-firmware: package amdgpu firmware
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 01:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99184

On Sun, Oct 16, 2022 at 4:37 PM Vincent Davis Jr <vince@underview.tech> wrote:
>
> Add packages for the firmware required by amdgpu kernel driver.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  .../linux-firmware/linux-firmware_20220913.bb        | 12 ++++++++++++

Thanks for the patch, this should however go to oe-core mailing list
since this recipe belongs to core layer.

>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
> index 45c9d0e861..bf15e53472 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
> @@ -228,6 +228,7 @@ do_install() {
>  PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-mt7601u-license ${PN}-mt7601u \
>               ${PN}-radeon-license ${PN}-radeon \
> +             ${PN}-amdgpu-license ${PN}-amdgpu \
>               ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
>               ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
>               ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
> @@ -428,6 +429,17 @@ FILES:${PN}-radeon = " \
>
>  RDEPENDS:${PN}-radeon += "${PN}-radeon-license"
>
> +# For amdgpu
> +LICENSE:${PN}-amdgpu = "Firmware-amdgpu"
> +LICENSE:${PN}-amdgpu-license = "Firmware-amdgpu"
> +
> +FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
> +FILES:${PN}-amdgpu = " \
> +  ${nonarch_base_libdir}/firmware/amdgpu \
> +"
> +
> +RDEPENDS:${PN}-amdgpu += "${PN}-amdgpu-license"
> +
>  # For lontium
>  LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99183): https://lists.openembedded.org/g/openembedded-devel/message/99183
> Mute This Topic: https://lists.openembedded.org/mt/94374455/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

