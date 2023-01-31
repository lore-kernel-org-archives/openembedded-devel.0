Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D900FC636D7
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 21:33:27 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.7142.1675200801513446723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 13:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PDYGDFtG;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id s66so14027708oib.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 13:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ab48jZRVkDKNbzrLTrOjyLo4Esb3n/aJWftJuG+EEPA=;
        b=PDYGDFtGsnS8BGPcyC1Iw5uGI6OyD3IerWtcm3qJu83EX/mphbIf4AX3cAp9Yilbz9
         Nu7QNYp+4uYhZT5yuiD/w59zx3ao0z4b3g4TZtkhu8xyYoBaT/TjFy7ojNhw5NdRVA/D
         4As24OargZ4HkUTFS+MNkf3fyivCFjDl7uQtJaMFsUSDKVU56iOe/4BE/HnJwYZ5Fdvu
         e/HwxGL3V4xFFxbBCYdCuLikRpOxYTWuo4rbjC3V3C9Y4SX75xFbb+anpw6q2M8YiN3G
         kLcVNRAcZZv2Ek1b/N2EMrHTI1JyNRU/ZJ7UUv4SVY/ckX4ZHteY1kaILCPc9KfQK/4p
         5G/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ab48jZRVkDKNbzrLTrOjyLo4Esb3n/aJWftJuG+EEPA=;
        b=ndAXqQRpBNwZi3ce6+JhAVZHwVYFNtHNFQrFS4mbJzxnrQIU2Iqhi1mfdBN7w59TUR
         vHDs3tNeCgznSVUnzIh+Lm8IdUPlF1XFzVYic0eLGG44axdl1UWsJUuHPwbP1dGTF8rK
         1J0C2F6moH2C0Kr139pj6fi7eGMhADmdrwv51XzK8UkA8K13HDb6WCfIDUgmRqCEhAex
         uDBEQFcQzlHPqADUJp6OwvtjgvlXc/Y8Xrf6m9BuRMVmLnwdZLRp/RVJZCRmjG05D0LS
         P9bylHL8i6ehmopgaTlDYKEdACj3ZfMCy745zJOdwHsbF1tB38RiMgXDvYTCOy1J7cg2
         V7kg==
X-Gm-Message-State: AO0yUKUjh5LDaPvwYEeuBNZ8y0/cpRC9seAhjQ3V+J4Y9BHYuDyThJpj
	thLM/JSeQGoaSmiRWQPi4WKS6Zp4V38q9/3hS38=
X-Google-Smtp-Source: AK7set9Z2JAgq7dAut8X57V1wddY8a3b1lRLbn2HK0DsuF8UjvfhWe2AkPvpnQ7q42Vmp85hR2hkvooWdWg+6/Rr08k=
X-Received: by 2002:a05:6808:1383:b0:36e:f5f8:ccd9 with SMTP id
 c3-20020a056808138300b0036ef5f8ccd9mr15376oiw.55.1675200800635; Tue, 31 Jan
 2023 13:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20230131185956.397741-1-f_l_k@t-online.de>
In-Reply-To: <20230131185956.397741-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Jan 2023 13:32:54 -0800
Message-ID: <CAMKF1spfu7pAcVtuvY0g8aLsZ+ozLpF-aKqafQ-bC+3fJu66Qg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] system-config-printer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 21:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100889

seeing this

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2423/steps/11/logs/errors

I guess you need to check for system distro feature to enable this recipe.

On Tue, Jan 31, 2023 at 11:01 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> The OpenPrinting gui for cups configuration
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../system-config-printer_1.5.18.bb           | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
>
> diff --git a/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> new file mode 100644
> index 000000000..84af6d9a1
> --- /dev/null
> +++ b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "a graphical user interface that allows the user to change print settings"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://github.com/OpenPrinting/system-config-printer.git;protocol=https;branch=master"
> +
> +SRCREV = "895d3dec50c93bfd4f142bac9bfcc13051bf84cb"
> +S = "${WORKDIR}/git"
> +
> +inherit autotools gettext pkgconfig python3native features_check
> +
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +
> +DEPENDS = "cups glib-2.0 libusb systemd xmlto-native intltool-native desktop-file-utils-native"
> +
> +do_configure:prepend() {
> +    # This file is not provided if fetching from git but required for configure
> +    touch ${S}/ChangeLog
> +}
> +
> +FILES:${PN} += "${libdir} ${datadir}"
> +
> +RDEPENDS:${PN} = " \
> +    dbus-x11 \
> +    gtk+3 \
> +    libnotify \
> +    python3-core \
> +    python3-dbus \
> +    python3-firewall \
> +    python3-pycups \
> +    python3-pycurl \
> +    python3-pygobject \
> +"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100887): https://lists.openembedded.org/g/openembedded-devel/message/100887
> Mute This Topic: https://lists.openembedded.org/mt/96659434/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

