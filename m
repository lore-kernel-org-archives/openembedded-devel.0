Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.4530.1607338179129614431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 02:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=j6ggijpQ;
 spf=pass (domain: burtonini.com, ip: 209.85.208.196, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f196.google.com with SMTP id i15so7096113ljg.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Dec 2020 02:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KgYgzH40To6lcsR/X3icvukrIQtLpMzZmFeZsVKDnZ0=;
        b=j6ggijpQJetRJeLJhgIY23SNfhD5IP6j5i5yy4Tu3cDhDDP0xaqMNAGaf7aSJQX86N
         SzjEYIHSL2T4IxwrBH6TMmCOHENbdlM/w9yvFvthJMWAhtES4LOQqjDQQ2MQq7KuDLzg
         17uaUnIBR96EHfBGDenxgEp5gCuCl2lKzbXN7bcwvzL96alCG6gHOrYmyQcF7tbjXD9C
         mqXcgMzSWsNEuIyeCQcqefdroMwgRsly8IkytNQ4V6W3l3H3uNlaOG6fvavnYtodQIhn
         AD+dib9XSEp8RxFK9z+TbDNpUmCUaPkYwH0t1776QmgGsZjioz8nd/QMChaq6wb3yLDi
         fPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KgYgzH40To6lcsR/X3icvukrIQtLpMzZmFeZsVKDnZ0=;
        b=MPkl0+JggOayQkaGK//hhvY9Oi9V/CLAv5If6qGfgzxsOaENI+r48ZEZ2cNfRjBJZB
         +7vUI5k6IAbqH1hbnsQIUovKkxZVxGAKaauR9kH9GtQ6p7IjUI4ffvOvQBHOHSLv2ICC
         qwwSzJnxkepEYAxQAnyEJxjIxosJyu4+GMygIuWjkgFxkBYxXya7sslJBQ7mMBO5pVH4
         j4COukSUznACQl57A7+CgrsfvqrTo7a38B3Pki/B5c+2B0QoxxNys7qHnURGszv7axht
         2sexTTrMCYq7ZRt2quWMgLjcOtiMXNS1z/iZ7KecsKXzkBqtJeCRfhXRpT9wtqZv83lr
         4XZw==
X-Gm-Message-State: AOAM530OOQA9CQrmejhSNUY6I7ejo0qjrV3SdS4uJFb9VWP9OSsPE2GA
	f9mT4PUwEVyJEeAiR9Z5X+KzazbQHLkXfYH8xSGEqg==
X-Google-Smtp-Source: ABdhPJw+10cfg2j3FeCes9Re7v2ty1lrSlfl8P+HY7DDHOymYdJl8i9GTXUA2eqrvQVM4Vp0lkp0Nqkhq+g9KYu4hiY=
X-Received: by 2002:a2e:a167:: with SMTP id u7mr7993972ljl.186.1607338176984;
 Mon, 07 Dec 2020 02:49:36 -0800 (PST)
MIME-Version: 1.0
References: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
In-Reply-To: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 7 Dec 2020 10:49:25 +0000
Message-ID: <CAAnfSTvw9KrUNTRZYSF7tBztw+7FR2WRU_CJEWASOH0KoN-Qtw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] firmwared: add recipe
To: Robert Karszniewicz <r.karszniewicz@phytec.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Last touched four years ago.  Isn't this what udev does?  If this is
for people who don't want udev, I suggest you make that clear in the
summary.

Ross

On Fri, 4 Dec 2020 at 17:05, Robert Karszniewicz
<r.karszniewicz@phytec.de> wrote:
>
> This program is needed for loading external firmware via Linux' fallback
> mechanism.
>
> Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>
> ---
> I wasn't sure which subdirectory to put it in, but I picked recipes-bsp.
> Thanks.
>
>  .../firmwared/firmwared/firmwared.service          |  9 +++++++
>  meta-oe/recipes-bsp/firmwared/firmwared_git.bb     | 29 ++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
>  create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared_git.bb
>
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
> new file mode 100644
> index 000000000000..c2106a25168c
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=Linux Firmware Loader Daemon
> +
> +[Service]
> +Type=simple
> +ExecStart=@BINDIR@/firmwared -d /lib/firmware
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> new file mode 100644
> index 000000000000..3b2a8070bdd3
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "Linux Firmware Loader Daemon"
> +DESCRIPTION = "The Linux Firmware Loader Daemon monitors the kernel for \
> +firmware requests and uploads the firmware blobs it has via the sysfs \
> +interface."
> +HOMEPAGE = "https://github.com/teg/firmwared"
> +PR = "r0"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=7b486c2338d225a1405d979ed2c15ce8 \
> +                    file://COPYING;md5=daa868b8e1ae17d03228a1145b4060da"
> +
> +SRC_URI = "git://github.com/teg/firmwared.git \
> +           file://firmwared.service"
> +
> +PV = "1+git${SRCPV}"
> +SRCREV = "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "glib-2.0 systemd"
> +
> +inherit pkgconfig autotools systemd
> +
> +SYSTEMD_SERVICE_${PN} = "firmwared.service"
> +
> +do_install_append() {
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_unitdir}/system
> +    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/firmwared.service
> +}
> --
> 2.7.4
>
>
> 
>
