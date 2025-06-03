Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F5FC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:28:06 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.6325.1748939281935802516
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QzkJbyfx;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad51ba0af48so1118184966b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 01:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748939280; x=1749544080; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2xNCnbTe4Ta9H8mKYx9Xx9v9MI1dtXNfnYsVFkUk+4=;
        b=QzkJbyfx9h1cyOXA/LmUJOj+hCryIYa4TOAEGuzzrPzidNEqmAGsaQjsz9M7idLFUZ
         vdbX1Yre0zobSTUMjIDa6glU+HslcDd0nBb3saInmHrkauWmET9P8o1wA6TzTCcKOU5s
         JOEmqzxAQBBEqXaZf0p5lQ3URWg0gXjrby9UAHWUj+NmA4gBjsAFQc8UQncmyLp8xYo+
         9cPBoqjs2kHV9lfRvuuQt0sw7GsYJlTIEkIf7Jvld3KnTCnF4lOEM+E9UqPRIi8+B8ON
         4Gl+bWaDc4GKf2BCFmhMEBlEjGY4AMECVtqmHLhBZ18C9MdRqIP7oXBtXgyoHxQKZcY4
         cATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748939280; x=1749544080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2xNCnbTe4Ta9H8mKYx9Xx9v9MI1dtXNfnYsVFkUk+4=;
        b=Js2TkS6RJP7ZqDhsSbIc5IPiP8UP6SAZkP8bT17HVtJK3Rhgm72J5j7Nnd0KP5dv5Q
         6f2l7XD5JcQLegojgLo5y8QaMH3PwnVPKmi8y2SmsVbsoNA5wAY3BEA3ORUcxu4wXO/C
         HDhB3lx6HdI0tljwp8Ed4+lb/FTP40V/WZgQvDE1eHeOWONywWSFvL49+yLkeO+hDQgz
         K/I9ZP1OVKQezC7eUCtZPkOHPXxBSdlvni6Bj6LRRLlls1aQZewbVAPdy4JXpkGGtL1q
         TZAe/C8/gECz4aWHv3e/CoFDWWwWxde3LoFSNWa0J/PCjtJEybODjF2cfq/a/32G1pfj
         ssZg==
X-Forwarded-Encrypted: i=1; AJvYcCWnQaEcGcws9i2XMNxROMvqvfdkh1HxrVKTfZ3Y7Ozv7lu3TZM4XNwmPSSOCRXNYv72YiUkumbb8NVD3oVCL8T5zqk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8KjWEoHpdMORaeVqXdwp/SB7DyoKWLfBerL2H/sT+HbRcP/QV
	sH/4F0TMUnbO9gfmz1ycPSB6KC7tnVznaxUHjIVAgL4Nn6F9JBjNQd7q
X-Gm-Gg: ASbGncuOdCf0IZf5fDh2Pdhgp4dcM+a4xrEoQoABUMtIJefoHffPOz7rN7aAe/yW1OW
	xY3F+bQbmlz1k9rD042jYmcNtY2158oRiPcJ1KlNaLjxv6nboFejHMwQtM52/HjJBC4w34y3tub
	3IAGJRGVh/4aPPNBkjD6mnDP7qzQ4wYXuQ8qXttdOByO45EMQ7icHT9jvY38XuMCVqVPIvjcGA6
	M2dhLsYjaEMTk8WvxSeAXifQsKM7Al+B0Gh4FlMqua2i+jc4lWyFO7dH1BPvMIOdIPt4lXMSDbA
	DOwJERgyPoYkTrD1y/4bw4hnrWrEVKXNZmF0ULMQSVqm6oX2aAJd01nobmA=
X-Google-Smtp-Source: AGHT+IHDyKEPGAQt53vvr+Rq2abaRETBdCULeoCrJbAuW1mkSE1/I11KASJcPMLV5Ape0gtAcVY8IQ==
X-Received: by 2002:a17:907:1c9f:b0:ad5:5a7e:bcd with SMTP id a640c23a62f3a-adde5ec8284mr190593566b.8.1748939280044;
        Tue, 03 Jun 2025 01:28:00 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e878178sm932458166b.91.2025.06.03.01.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 01:27:59 -0700 (PDT)
Message-ID: <9f7eca94-4a39-44a2-9c09-cba41c537d43@gmail.com>
Date: Tue, 3 Jun 2025 10:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [scarthgap][PATCHv2] imagemagick: guard sed operations in
 do_install for optional files
To: sanakazi720@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250602115123.103345-1-sanakazi720@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250602115123.103345-1-sanakazi720@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 08:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117720

At the first sight it looks like this would be useful for master branch
too - do you think you could send a patch for that also?

As a separate note, maybe checking if the files themselves exist
(instead of checking the pkgconfig values) would be more explicit -
though that's more like a random thought, and I don't have strong
feelings about this.

On 6/2/25 13:51, Sana Kazi via lists.openembedded.org wrote:
> When PACKAGECONFIG options like 'cxx' 'webp' and 'xml' are disabled,
> certain files such as Magick++-config.im7, configure.xml, or
> delegates.xml are not installed. Unconditionally running sed
> on these files results in errors during do_install
> Error:
> sed: can't read .../image/usr/bin/Magick++-config.im7: No such file or directory
>
> Signed-off-by: Nikhil R <nikhilr5@kpit.com>
> Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> ---
>  .../imagemagick/imagemagick_7.1.1.bb          | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
> index 5407c4e400..752fef303b 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
> @@ -36,13 +36,24 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
>  PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxml2"
>  
>  do_install:append:class-target() {
> -    for file in MagickCore-config.im7 MagickWand-config.im7 Magick++-config.im7; do
> -        sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${bindir}/"$file"
> +    for file in MagickCore-config.im7 MagickWand-config.im7; do
> +        sed -i 's,${STAGING_DIR_TARGET},,g' "${D}${bindir}/$file"
>      done
> -    sed -i 's,${S},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
> -    sed -i 's,${B},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
> -    sed -i 's,${RECIPE_SYSROOT},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
> -    sed -i 's,${HOSTTOOLS_DIR},${bindir},g' ${D}${sysconfdir}/ImageMagick-7/delegates.xml
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'cxx', 'true', 'false', d)}; then
> +        sed -i 's,${STAGING_DIR_TARGET},,g' "${D}${bindir}/Magick++-config.im7"
> +    fi
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'xml', 'true', 'false', d)}; then
> +        xml_config="${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml"
> +        sed -i 's,${S},,g' "$xml_config"
> +        sed -i 's,${B},,g' "$xml_config"
> +        sed -i 's,${RECIPE_SYSROOT},,g' "$xml_config"
> +    fi
> +
> +    if ${@bb.utils.contains_any('PACKAGECONFIG', 'webp openjpeg', 'true', 'false', d)}; then
> +        sed -i 's,${HOSTTOOLS_DIR},${bindir},g' "${D}${sysconfdir}/ImageMagick-7/delegates.xml"
> +    fi
>  }
>  
>  FILES:${PN} += "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117705): https://lists.openembedded.org/g/openembedded-devel/message/117705
> Mute This Topic: https://lists.openembedded.org/mt/113426936/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


