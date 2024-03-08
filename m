Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DECC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 18:03:54 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.114.1709921024524644912
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 10:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=coT8VtbW;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-21f70f72fb5so799599fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 10:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709921024; x=1710525824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbomaiNXXedgdi8lrHwNsx41StZ2oV26r4emnfygYMk=;
        b=coT8VtbWBoddfLZZucVpkKbr/EreiZblFAL7APn543gIQDblWb+jYskWMllUZKRqYJ
         mUM9XWds1pKtYVchjn8+4JDpr53L0uNKSxnXqVc4Iw7JrZ8TTUTUxZijdcMsCMzVy5qR
         rvf50Er+1RiamXvBt678RdlTR7h7gQz81r4+Z7NCpjkL7Ca4t+EUI3WH/RQUHX+5dSUS
         1irwjSMFB7ekYmzJ3thQvCasbWqfF4NgslWSyCMMKmRo5Ed6HHya5r/5lYg1oHZCDruk
         KXa5X8sHumqZaoyo40km6s8r2yolDykczTnT1Ogn34wiaYWAmCJFcU9nhMVV6hTYE18o
         ihlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709921024; x=1710525824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbomaiNXXedgdi8lrHwNsx41StZ2oV26r4emnfygYMk=;
        b=Yi2jd2Mp/Hi47JIlTxikeMPRP17iu9eBhvrm+W3WazdX8kLuZQwkzsKLcVVT++D0lJ
         U4Kele8ELyAxdPOEILcHA+kE7ObFylwF6F2fEljrYQNEvxEdAyJb0NOfyaKJaEFnM3UC
         glrIgSpA4MJEWVD8DwSt13xerqywHBXRjIguXYV5aJJuF/TLKeIFQYO8Uuox278DBEfF
         nmKVYaQxomWtJ3s3wMoo6YdC2cBD1WGfEuvep4XeiUClBt2UHELRTp4KQnKTAXLxYWZk
         9HB9jsCzRe2ySiD6n/VSmP6M6WfHHyakzPdDCwv7/DejCP/MA8lykFYW3C3rGYAeD47o
         zEZQ==
X-Gm-Message-State: AOJu0YxBZoF5LFtcBRefuFE24TrI+l1/yBcfeQ8qvhmIxINmNvq0X9Oa
	91N46UUacYe/36lx/Ymwt9P6LYCusWEK6OAs3U1yt75VaE7p76hyxt1r7XQTF0tjEoV/c63WNJy
	+u+0MojEVX4exVtRko6gHK6MwwBw=
X-Google-Smtp-Source: AGHT+IHHhk5XXBXS+pIgq8VGpgOPa4tOiNsUi9Ikm4AebJf7RIuFa/ploSGJ8RldjkMhrRW64218LY9DKKTDQoPmII4=
X-Received: by 2002:a05:6871:6a1:b0:21f:1f78:adc9 with SMTP id
 l33-20020a05687106a100b0021f1f78adc9mr4038144oao.29.1709921023580; Fri, 08
 Mar 2024 10:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20240308072243.106658-1-andre.paiusco@gmail.com>
In-Reply-To: <20240308072243.106658-1-andre.paiusco@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Mar 2024 10:03:16 -0800
Message-ID: <CAMKF1sqov-ts_JPUSupCftrR0zQw-bRqN5OwZsc-A3qfhW0emw@mail.gmail.com>
Subject: Re: [oe] [PATCH v5] ydotool: Add new package
To: =?UTF-8?Q?Andr=C3=A9_Paiusco?= <andre.paiusco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 18:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109233

Next errors.

https://errors.yoctoproject.org/Errors/Details/756397/
https://errors.yoctoproject.org/Errors/Details/756398/

On Thu, Mar 7, 2024 at 11:22=E2=80=AFPM Andr=C3=A9 Paiusco <andre.paiusco@g=
mail.com> wrote:
>
> Reviewed-by: Khem Raj <raj.khem@gmail.com>
> Reviewed-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb      |  1 +
>  .../recipes-graphics/ydotool/ydotool_git.bb    | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 6e2012dae..dd033208b 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D"\
>      xcursorgen \
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "=
", d)} \
>      yad \
> +    ydotool \
>      parallel-deqp-runner \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "=
", d)} \
>      ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts=
", "", d)} \
> diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/re=
cipes-graphics/ydotool/ydotool_git.bb
> new file mode 100644
> index 000000000..de515e398
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Generic Linux command-line automation tool (no X!)"
> +DESCRIPTION =3D "ydotool is not limited to Wayland. You can use it on an=
ything as long as it accepts keyboard/mouse/whatever input."
> +LICENSE =3D "AGPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deb1e647870add0502f8f010b19de3=
2af"
> +
> +PV =3D "1.0.4+git"
> +
> +SRC_URI =3D "git://github.com/ReimuNotMoe/ydotool;protocol=3Dhttps;branc=
h=3Dmaster"
> +SRCREV =3D "c07ae72be46c40912023b91b8ba737630d8720e1"
> +
> +inherit cmake systemd
> +
> +EXTRA_OECMAKE =3D "\
> +    -DBUILD_DOCS=3DOFF \
> +"
> +
> +SYSTEMD_SERVICE:${PN} =3D "ydotoold.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109225): https://lists.openembedded.org/g/openembedde=
d-devel/message/109225
> Mute This Topic: https://lists.openembedded.org/mt/104804851/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

