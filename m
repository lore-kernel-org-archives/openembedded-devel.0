Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAE0C10F1E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 15:18:25 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.52706.1671549503153917497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 07:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R5WkZZrp;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3cbdd6c00adso173067097b3.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 07:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bu2y9zAyztiS/7E82neHFruxh6TWGGYdr3EQDW+fTYA=;
        b=R5WkZZrph98/X55z+qmqsC0EYdw1S5NZwVPoons/jzvW0lvadwV+oar+JFuVIjbHh1
         tHxn8amkWb/FQA76AG5opNdz/t88Uq0IPByPzsH/vQsA4wajMm65/XYrViE76O9b7pz/
         fj1h0PE2nLWIbkGq9xcZO11ilxnsHlx9YHsUDXxSoM2bt6zTil4koK38fRybwCml8NGN
         217r9k2e4A0BKQgvFYqTHFg/HCKiXjeOM6PHiwKFVdIJDqQZqJ4L1tuy3neOwpI9OFh1
         zTtvtEBuNWrXohjN/jhabGIgRugJnwDUmnvVQNiVresT7MrLSWgjuKfoil9vhxUW8pSr
         2rBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu2y9zAyztiS/7E82neHFruxh6TWGGYdr3EQDW+fTYA=;
        b=fq6V+YQXPNKAR47Os+b25g+ty5TAwkVWX1NvoYk4rF6OeYmegF3XErbdNfbKvKQMne
         +g/sLNbUt5euo0idwY5rHDBuk22kGnc8SE0KfwjZ8i9CzpKyxrmL0vxLh1jI2B6MJEgg
         MgUoXRhv53Ojksa6y+gBMV8tJA2tnCXriaR3HlvdpGhX2xpinvNBWl1z5UBVZxi6U7fe
         cnuax/F9/QG+EV+F04abJ15pu7lTW4cCOboTdIEdyKAgBK+qy8XdkDvALfQhIH622YrY
         32U1Hn4ApxwDrAAqP3hH9zr4TPgZfSA84rW+7Cv16fvazkN2opEoFFWwkL3SuZ/3ifzH
         524A==
X-Gm-Message-State: ANoB5pkHVE3TgHwIcOvAnvveB5UvuzSL4xCxDRbm0crSP31CVSpzU1q3
	mCXVgiRBb6rWfUmmYKSJLsM=
X-Google-Smtp-Source: AA0mqf7uIDQbY4U8yqUsWlYej0EnmDxIVwwe4jCvfjfc3PoYxEMXWBY4wXxc7wGo1YODrAKX8qUZmw==
X-Received: by 2002:a05:7500:1d09:b0:eb:113e:e4fa with SMTP id du9-20020a0575001d0900b000eb113ee4famr3762430gab.52.1671549502242;
        Tue, 20 Dec 2022 07:18:22 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b? ([2600:1700:9190:ba10:9fde:e2bd:d2b4:8a4b])
        by smtp.gmail.com with ESMTPSA id q28-20020a05620a2a5c00b006f7ee901674sm9358496qkp.2.2022.12.20.07.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 07:18:21 -0800 (PST)
Message-ID: <843f6068-4ade-c9f8-e783-c18284149cfe@gmail.com>
Date: Tue, 20 Dec 2022 10:18:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-oe][PATCH] bubblewrap: import recipe from
 meta-security
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20221219203614.3540198-1-f_l_k@t-online.de>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221219203614.3540198-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 15:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100156



On 12/19/22 3:36 PM, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

Will you be sending a patch to remove it from meta-security?

- armin
> ---
>   .../bubblewrap/bubblewrap_0.6.2.bb            | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb
>
> diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb
> new file mode 100644
> index 000000000..50f61adf8
> --- /dev/null
> +++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.6.2.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "Unprivileged sandboxing tool"
> +HOMEPAGE = "https://github.com/containers/bubblewrap"
> +LICENSE = "LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> +
> +DEPENDS = "libcap"
> +
> +SRC_URI = "https://github.com/containers/${BPN}/releases/download/v${PV}/${BP}.tar.xz"
> +SRC_URI[sha256sum] = "8a0ec802d1b3e956c5bb0a40a81c9ce0b055a31bf30a8efa547433603b8af20b"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/containers/bubblewrap/releases"
> +UPSTREAM_CHECK_REGEX = "bubblewrap-(?P<pver>\d+(\.\d+)+)\.tar"
> +
> +inherit autotools bash-completion manpages pkgconfig
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
> +PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native docbook-xsl-stylesheets-native xmlto-native"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
> +PACKAGECONFIG[setuid] = "--with-priv-mode=setuid,--with-priv-mode=none"
> +
> +PACKAGES += "${PN}-zsh-completion"
> +
> +FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
> +
> +BBCLASSEXTEND = "native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100116): https://lists.openembedded.org/g/openembedded-devel/message/100116
> Mute This Topic: https://lists.openembedded.org/mt/95773343/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


