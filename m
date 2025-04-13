Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0FDC3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 11:28:54 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.27009.1744543732029144961
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 04:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FgyCN0of;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf3d64849dso666100466b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744543730; x=1745148530; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iY9PbrzjOo9AMx53wl3NR/vSIPPT/oHH1sBzcuqTqM=;
        b=FgyCN0of/6OazAzPOzHzvDpuztqkhe4c5kmamuEwSULFa0hY8vjyPmG9AhJSAPAaB9
         6K1XeJlumQ+2M5YhJ5h4xVinBTbvPEC4+Zzbc1C50wG6hyxdV0r4dO0Q1qHWmHpV/dMz
         d1GQ+tGaDpA1r7bZ5et2bSTY0psIYd0Vy0ZUaS+ibh1Y7IkeZEKfODCXE/SGm/gUOmsT
         GFhf1+k6MesciJlXX4ZRAlYokgTgsMUYnVc1Pk7SbswzpcY7ZbBNZjPVokknKHLlzNgm
         s+7+a4OOHHIhsw1U+ZzGkMiRaESrZilTkU4RIlOpiz6obbjABd4UHOWn8vQxjZbCa184
         gu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744543730; x=1745148530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iY9PbrzjOo9AMx53wl3NR/vSIPPT/oHH1sBzcuqTqM=;
        b=i2yhMWBsY1I7BeD4DPd1jr0o1VlWZdhOGc8FBeJX/bLlVwn2RIu37faOJtnr2HJZ00
         cfS4m5ADhkz9GHJIyMBIz74w8zl0Hbuis8s1jBUoPfIl6UupueswdFkP3v2iM6spCBln
         kbjBaNMb45vkfYn0mDxv1KNWM91ZZXJ4ovIiVJxPVWHSYqP9EIABRFrPQ5GWYbBm5GYG
         JeZeQroCW8c8x4XnKSt+qkBsD32f+L+7H6dNcKrPqGcxvx/0i1zM6JjZyvJrEdRtxMfz
         +OWPAO9GLagjOZHuUuf9PEQgT0K6u2HiBh9rsMk/ya+eVqZQUReqClG7xcLppUuDVV3M
         xrUw==
X-Forwarded-Encrypted: i=1; AJvYcCUFIyrj/sAZq8Eo99DHMpVUoD/jE5RrFQWNLvfYrpUw1xGveV2zylhJrI76gKAf3YHoZNlMvnAxhJQ76kNTDFzJK7c=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxlSo2F61ooI168Oc5rVIYR04TRe+8+ZjpRxHsEK5o75VU22+0x
	3D0fq08mytKvw8PbdxvXfgKsfyXws8idXe7rrLxJcJXyB0RHfO/v
X-Gm-Gg: ASbGncv3vgYJbO5zl+ptMRt/tlrwQW8JNVnpJTOdI3QqWZcQGShNcTxIP4HVpfwOLxY
	sDVETGueSRqfr5m7Nx8z1GCzyJHCaJoGxe6Yev2f1U689owgyHlkEA7InbcjoOnky4wwJoYHu5q
	e2AY33h8mGhwEbYjYhISSlLPI0C16IBs5PzSc2x/j9xGzmPcey3x6XWRt3bk9/lSKhrKqYCtVKG
	NapKK0mp5wMt+npxgna+9OvR3eF+3/yNew3WqkcpUm8KwUk5JNQ2tsLJhQDAGDo2+ScrLT5UC2f
	LsfyWn3Z3vCvFXizzZcq/ZG/CvHeA+m7FgsGfKcuv47q5E5k
X-Google-Smtp-Source: AGHT+IFoFFj5iYXVrI4NYHHXu5Dr4wn7WBdgPNtafaHSnVYr2pzamJ2suo6Mip+/NohyVy/sLLbo4Q==
X-Received: by 2002:a17:907:f818:b0:aca:c789:133e with SMTP id a640c23a62f3a-acad36d4966mr789580266b.50.1744543729886;
        Sun, 13 Apr 2025 04:28:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c0227bsm723965866b.82.2025.04.13.04.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 04:28:49 -0700 (PDT)
Message-ID: <c03275f9-0f14-43c3-8696-7b8e2d3026d7@gmail.com>
Date: Sun, 13 Apr 2025 13:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] Propose a contribution: "simplelog-topic".
To: nguyenthaithuanalg@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250413104350.34628-1-nguyenthaithuanalg@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250413104350.34628-1-nguyenthaithuanalg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 11:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116830

Some initial thoughts:
1. Could you please add some description in the commit message, what is
it, and the benefits or reason of adding it to the layer?
2. Please remove the unneeded comments from the recipe. Also, add some
more standard metadata, like SUMMARY, DESCRIPTION or HOMEPAGE (see some
standard details of the other recipes)
3. There is an existing folder-hierachy for the recipes, e.g there is
recipes-support, recipes-core... please move the recipe to the
corresponding folder (instead of recipes-libsimplelog)
4. For the commit summary, please use "RECIPENAME: summary" format. E.g.
"libsimplelog: add recipe". See the other commits for examples.

On 4/13/25 12:43, Thuận Nguyễn-Thái via lists.openembedded.org wrote:
> ---
>  .../libsimplelog/libsimplelog_git.bb          | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> new file mode 100644
> index 000000000..8c403ed88
> --- /dev/null
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -0,0 +1,24 @@
> +# Recipe created by recipetool
> +# This is the basis of a recipe and may need further editing in order to be fully functional.
> +# (Feel free to remove these comments when editing.)
> +
> +# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
> +# your responsibility to verify that the values are complete and correct.
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
> +
> +SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
> +
> +# Modify these as desired
> +PV = "1.0+git"
> +SRCREV = "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
> +#ff30ba71807db1d7e1962dd014c2bb0a060572a3
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE += "-DUNIX_LINUX=1"
> +
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116829): https://lists.openembedded.org/g/openembedded-devel/message/116829
> Mute This Topic: https://lists.openembedded.org/mt/112239337/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

