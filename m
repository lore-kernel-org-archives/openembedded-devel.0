Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234AAC433F5
	for <webhook@archiver.kernel.org>; Sat, 20 Nov 2021 01:12:49 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.2257.1637370768021446833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 17:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q5CADetg;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id r138so444115pgr.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 17:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=y733XA9dnxLRXUmr+nvnf4iI1+VkPj8iLfXW3oI9Dyw=;
        b=q5CADetgrX2/Z33HU9yCfruIgpEELrseam2Sp29dn79M9VasW+flY3EozSNtPdhCIo
         aeCPpD+pWsIqC/+moG/J6jwJFxZNdhQCdy5EUw5i4HvML6zS8aebqEXHYJ23wApL8b/e
         u+GPK6vqGMHY52L8N87rgqDSPeUw0D7ypYiGUWc7RtjFzpxVZ+TKeWriZHRIAawaj5yW
         QCOJOwygtYTEJkgy3Evi085hPSwxFxl6kHf4HuOsd/1YxsAMRzSwvbBJP6iMyTHVV35C
         Z8SjfUNg9wMQlhcee2AmgrxuxcCcKWyh5288BeYDrVA5/z0QwQpICefAst0oNA/XvSiA
         9hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=y733XA9dnxLRXUmr+nvnf4iI1+VkPj8iLfXW3oI9Dyw=;
        b=cMkEUBAD58T0RUMigIoyhyAqOqD8+FdwbCwbynr6c8OAAyhECzRM1q17v9jWyrDjIm
         MAc3idon+1eDfimHlx1DNvd0cXLDoOQQMAXm/zPkJBmvORdh/tTwQtT5NeFX68teaNNX
         WWrc2RuDRn2qDQNmuX3p6EmN/BqbbNJpjdHgqrFXfXc3hVYq3fB+yQk78rMSsxAUd/G6
         0PQms3mFOJXSJMtnEgKw4RK9JUyr0ddIZozaODK+G/JFSiuqfUq9SdCxej9BnViLdKlO
         BkgMO1iwQVY+rDHbhSjhqIJtyyooSQ/V4g7NueFlCZeWe0FPBP6sxRO78IC4r20xm5PH
         Najw==
X-Gm-Message-State: AOAM531v/NYk0Hm1IbIcDdwg5FjEdlP8Y0EmgWeYm7p6HNAXQt4WDBUm
	TXnkfUtUsb0hvPgZU2oTQy8=
X-Google-Smtp-Source: 
 ABdhPJx5L5AQ2cuKH1W6tRyj7GAfVo8bhjO3LzNzq88rcmVSlZyXHxB2duHsVIgt3eNqBEJP409Teg==
X-Received: by 2002:aa7:83c9:0:b0:481:1d47:3362 with SMTP id
 j9-20020aa783c9000000b004811d473362mr68945034pfn.5.1637370767341;
        Fri, 19 Nov 2021 17:12:47 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:78f1:44c6:f9d6:76?
 ([2601:646:9200:a0f0:78f1:44c6:f9d6:76])
        by smtp.gmail.com with ESMTPSA id
 j13sm821401pfc.87.2021.11.19.17.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 17:12:47 -0800 (PST)
Message-ID: <7fca4b13-199a-ff2a-4680-370cb8a48a01@gmail.com>
Date: Fri, 19 Nov 2021 17:12:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [oe] [meta-games][PATCH v2] neverball: Add neverball
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
Cc: cazfi74@gmail.com, hs@denx.de
References: <20211119220833.133927-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211119220833.133927-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Nov 2021 01:12:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94073



On 11/19/21 2:08 PM, Marek Vasut wrote:
> This is an interactive game with a rolling ball, useful for
> testing whether point sprites work correctly in GPU drivers.
> 
> The user should install both neverball neverball-data packages.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> V2: Use cp -R --no-dereference --preserve=mode,links
> ---
>   recipes-games/neverball/neverball-data_git.bb | 16 ++++++++++++
>   recipes-games/neverball/neverball.inc         | 26 +++++++++++++++++++
>   recipes-games/neverball/neverball_git.bb      | 16 ++++++++++++

hmm, these recipes should belong to a layer, perhaps meta-oe or 
meta-multimedia

>   3 files changed, 58 insertions(+)
>   create mode 100644 recipes-games/neverball/neverball-data_git.bb
>   create mode 100644 recipes-games/neverball/neverball.inc
>   create mode 100644 recipes-games/neverball/neverball_git.bb
> 
> diff --git a/recipes-games/neverball/neverball-data_git.bb b/recipes-games/neverball/neverball-data_git.bb
> new file mode 100644
> index 0000000..b520f58
> --- /dev/null
> +++ b/recipes-games/neverball/neverball-data_git.bb
> @@ -0,0 +1,16 @@
> +require neverball.inc
> +
> +inherit allarch
> +
> +DEPENDS:append = " jpeg-native libpng-native libsdl2-native"
> +
> +do_compile() {
> +	oe_runmake CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE}/SDL2/" LDFLAGS="${BUILD_LDFLAGS} -lpng" mapc sols
> +}
> +
> +do_install() {
> +	install -d -m 755 ${D}${datadir}/neverball
> +	cp -R --no-dereference --preserve=mode,links ${B}/data ${D}${datadir}/neverball/
> +}
> +
> +FILES:${PN}:append = " ${datadir}/neverball"
> diff --git a/recipes-games/neverball/neverball.inc b/recipes-games/neverball/neverball.inc
> new file mode 100644
> index 0000000..1ef2ec4
> --- /dev/null
> +++ b/recipes-games/neverball/neverball.inc
> @@ -0,0 +1,26 @@
> +SUMMARY = "Tilt the floor to roll a ball through an obstacle course before time runs out. Neverball is part puzzle game, part action game, and entirely a test of skill."
> +SECTION = "graphics"
> +HOMEPAGE = "https://neverball.org/"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=200ddba3b50e856bfb681a2b13dfb523"
> +
> +SRC_URI = "git://github.com/Neverball/neverball.git;protocol=https"
> +SRCREV = "bb6a99b14b1f81d071efd54cc0effdc517704b95"
> +PV = "1.6.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +EXTRA_OEMAKE:append = " \
> +	ENABLE_FETCH=0 \
> +	ENABLE_OPENGLES=1 \
> +	DATADIR=/usr/share/neverball/data \
> +	LOCALEDIR=/usr/share/neverball/locale \
> +	"
> +
> +do_configure:append() {
> +	sed -i "s@sdl2-config@pkg-config sdl2@" ${S}/Makefile
> +	sed -i "s@libpng-config@pkg-config libpng@" ${S}/Makefile
> +}
> diff --git a/recipes-games/neverball/neverball_git.bb b/recipes-games/neverball/neverball_git.bb
> new file mode 100644
> index 0000000..5e2c358
> --- /dev/null
> +++ b/recipes-games/neverball/neverball_git.bb
> @@ -0,0 +1,16 @@
> +require neverball.inc
> +
> +DEPENDS:append = " gettext-native virtual/libgles1 virtual/libintl libvorbis jpeg libpng libsdl2 libsdl2-ttf"
> +
> +do_compile() {
> +	oe_runmake neverball neverputt locales desktops
> +}
> +
> +do_install() {
> +	install -d -m 755 ${D}${bindir}
> +	install -m 755 ${B}/neverball ${D}/${bindir}/
> +	install -m 755 ${B}/neverputt ${D}/${bindir}/
> +
> +	install -d -m 755 ${D}${datadir}/neverball
> +	cp -R --no-dereference --preserve=mode,links ${B}/locale ${D}${datadir}/neverball/
> +}
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94072): https://lists.openembedded.org/g/openembedded-devel/message/94072
> Mute This Topic: https://lists.openembedded.org/mt/87183365/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

