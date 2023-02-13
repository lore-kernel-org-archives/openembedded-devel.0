Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2BDC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 05:48:45 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.8228.1676267317715849328
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 21:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GD0lkRbK;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so3406055otj.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 21:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ayaIJ7/+sBZF66PUgSq65RCOu2DbLEiCaEDQpALo+YA=;
        b=GD0lkRbK6ruOE1GuC2KSYPRBPSAl4I2f1BYBmPLDwt5BNRfoUgZYwM1sf6NJ0IfVyH
         gDl6YMk986S/Mu3dRBE755kbBegCzISaKFKjhcuK/A8lIxKs5lndbMc5ACefKcQ7lI46
         r74tO2rKep4J4qSsKGR5LttJ/e8CDSEvwt8AP4cIz4DOYxhiRoFxU3UM0HjYqevHr1ZT
         DteXFrZQChx8JSNb1QXDI9xQO1ey8a+MXpep/oW4jLCj59IbpctksD3kS3wDBLBDKCez
         VafZN8Doay4JjMkmIWDOUOzL94N99MrL5wNCZMkpS+IlXpd/b4ruR8AiulU7DhS7ECIn
         aHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayaIJ7/+sBZF66PUgSq65RCOu2DbLEiCaEDQpALo+YA=;
        b=ChrhO8AyPJlq3uwLi6zwHRZUOHkdacsLt5hv93NvJzDA+v/d4Vo+NzkuYF+8F/j2PB
         o8ZddjwJzMO5D9e6oMrECXJQFZAM3wKvgaDMiwSe59lejD9RgWuza7Qcx9lKtg3kx65V
         fEMLh0tno6iA4A35M+VAdKfREuHwoLz1xgUW7j/ZnJ7DXWEBio+yg9EtcwDiDNRxkkiX
         cGpA9xtlu0r+8rqZq+LZAlG3YjHTxFylxoCC489RYmJrfMhC0uuS7NiF8kj9jhmZSpJr
         Da6XBBUDSezCRbZLdPIK4iaGNxZWbyuTGR26Ot7dM8X7bRsvX1+oSgmM5+d5MTx0/L3s
         iaSg==
X-Gm-Message-State: AO0yUKU2qndiuyJZXEkSRom1hg3lGlE5xxa9zm8ZH7/Ndt3nqQFzYo8e
	o+wyN5EhuQk2ke7fKbkMqrW0QszyS7rz9jV8MCs=
X-Google-Smtp-Source: AK7set/dxII2+beXW38lIH/xmNMA0P9afvJhllSLZizpM0FzH6MU1KvlYNEYyyKOYLHUsW2aPGJJ9Sx3J1BYrhX/io4=
X-Received: by 2002:a05:6830:314c:b0:68b:cd8e:70ee with SMTP id
 c12-20020a056830314c00b0068bcd8e70eemr2314909ots.21.1676267316863; Sun, 12
 Feb 2023 21:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20230212170320.284295-1-f_l_k@t-online.de>
In-Reply-To: <20230212170320.284295-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Feb 2023 21:48:10 -0800
Message-ID: <CAMKF1so3nbre37cM3R0SNwmf5-DuYQjMrHeCnyJR3kDK=DK6qg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] fwupd: fix polkit rules.d permissions
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Feb 2023 05:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101062

it seems to fail in do_install

https://errors.yoctoproject.org/Errors/Details/689713/

On Sun, Feb 12, 2023 at 9:03 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> This fixes:
>
> Error: Transaction test error:
>   file /usr/share/polkit-1/rules.d conflicts between attempted installs of fwupd-1.8.9-r0.intel_corei7_64 and polkit-122-r0.corei7_64
>   file /usr/share/polkit-1/rules.d conflicts between attempted installs of flatpak-1.15.1-r0.corei7_64 and fwupd-1.8.9-r0.intel_corei7_64
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
> index 0f889ca8f..c0f695753 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.8.9.bb
> @@ -13,7 +13,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>  # Machine-specific as we examine MACHINE_FEATURES to decide whether to build the UEFI plugins
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -inherit meson vala gobject-introspection systemd bash-completion pkgconfig gi-docgen ptest manpages
> +inherit meson vala gobject-introspection systemd bash-completion pkgconfig gi-docgen ptest manpages useradd
>
>  GIDOCGEN_MESON_OPTION = 'docs'
>  GIDOCGEN_MESON_ENABLE_FLAG = 'docgen'
> @@ -115,6 +115,15 @@ DISABLE_NON_X86:x86 = ""
>  DISABLE_NON_X86:x86-64 = ""
>  PACKAGECONFIG:remove = "${DISABLE_NON_X86}"
>
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
> +
> +do_install:append() {
> +       #Fix up permissions on polkit rules.d to work with rpm4 constraints
> +       chmod 700 ${D}/${datadir}/polkit-1/rules.d
> +       chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
> +}
> +
>  FILES:${PN} += "${libdir}/fwupd-plugins-* \
>                  ${libdir}/fwupd-${PV} \
>                  ${systemd_unitdir} \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101054): https://lists.openembedded.org/g/openembedded-devel/message/101054
> Mute This Topic: https://lists.openembedded.org/mt/96918159/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

