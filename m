Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87917C636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:28:53 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.30198.1675272531016255453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mhGDJs/E;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id bx13so10537894oib.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 09:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xOHFWZuePpkGcKHoBh1S9YVm34GiT99Ab/omFc/lmAw=;
        b=mhGDJs/Eu4kDUJvD4ZMasmBRTJ4Ry1M4RcAaUA+VLitEosgLHCR6RqinOghdIkDJpl
         RvavL1dyQb4BDHEXts8vsLX5fMdRGeOvaJ9Pt+8H6s4g6ZeZsSgxuhuqvSvWUl9XbMcY
         G3fU/m/Z3NPj0i9ifCfoD1xQVE8+ngtkLtQLR9DXwQJkPKyVA0RErOB031wJC1InChgm
         eKIv5W3LAK5rXED0pb7kM7Ss2lbQy3dxsSKEXQ0cZOjAP02QewDBEuQ8Hy9iB0grxyJc
         S9wFCCgaYr+cleOGXPjhzYisJR52Etr+trK57Kz588SIiqf6LSU/ZvqGDLAw4PLFF0kN
         pL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOHFWZuePpkGcKHoBh1S9YVm34GiT99Ab/omFc/lmAw=;
        b=TOV0h9slpwN+0DAHrSoxrkjvK1honUnXeycpMRs/AlWfDrqOVrpjZs3yzKYBm2HDsA
         x2DoIsOIHssglqubJ4CHaNkI0s6qcMPAb0eVjlnjRhXZCBgY/Lx59bhQaDtO2qsYAg04
         MF8ybK4tU/Mw0aIBmbsx+es7V7P5z2o4kEJs4RomijwsS4/xvAptv6QzmpWapWQl39L4
         SpUWxEHbxaXTKLi9vzB7vMt0D0oVX95lKU4wdBlTxZFqzjF8zx+duKcWBH3EHZNiySXe
         I+1es12pyS/wLNAVQciEgcVXCO1UreMIG9Z+SO0Hszte8PTGX30Vo8snJW6YStEhbXL+
         /ZIA==
X-Gm-Message-State: AO0yUKUOh7iENyDeXJoWcV/6VE4wxGFkflZOLnq43vpuqNHAzAxHpmWv
	nPxXX43ro3B0Wkp37IYy9nzzwBLN4zUYAF8OcRQ=
X-Google-Smtp-Source: AK7set8iWPsPv+owpVyGaduGS5hqyy8BjlzDY7/DLoaOigFvtqvI234vyyKbl0c0AOcHZwiWXHFsKbVlrEt3C31ZLNQ=
X-Received: by 2002:a05:6808:1383:b0:36e:f5f8:ccd9 with SMTP id
 c3-20020a056808138300b0036ef5f8ccd9mr208499oiw.55.1675272530200; Wed, 01 Feb
 2023 09:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20230201064915.79320-1-f_l_k@t-online.de>
In-Reply-To: <20230201064915.79320-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2023 09:28:24 -0800
Message-ID: <CAMKF1so4m98VxLNPrKw16xJireF3fTmVpPhEOCwFAOMyMfzh6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv4] system-config-printer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 17:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100909

its using python3-firewall from
meta-openembedded/meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld/firewalld_1.2.0.bb
so perhaps put this recipe in
meta-openembedded/meta-networking/dynamic-layers/meta-python/

On Tue, Jan 31, 2023 at 10:49 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> The OpenPrinting gui for cups configuration
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../system-config-printer_1.5.18.bb           | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
>
> diff --git a/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> new file mode 100644
> index 000000000..e70edef27
> --- /dev/null
> +++ b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
> @@ -0,0 +1,36 @@
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
> +DEPENDS = "cups glib-2.0 libusb xmlto-native intltool-native desktop-file-utils-native"
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +PACKAGECONFIG[systemd] = ",,systemd"
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
> View/Reply Online (#100900): https://lists.openembedded.org/g/openembedded-devel/message/100900
> Mute This Topic: https://lists.openembedded.org/mt/96671218/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

