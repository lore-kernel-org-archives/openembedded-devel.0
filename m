Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.19663.1607110072655502921
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Dec 2020 11:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m1KbfNrV;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id r6so4777482qtm.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Dec 2020 11:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TNW4CE/t7dF+7aMtPSZxkggLbZD3FdAmkPBZz45Yfzg=;
        b=m1KbfNrVNLAIkv5mL0HkMM0feKSPlLC4sPK1/G+rw/6Dl/hRoEsVgAW/i7LDliTRhQ
         ftbHfnJXeJn61NROLKCL7crG/p5ljFZnumzqCqLwWblvxPy11KB/BiLIASNF3O04Riq3
         c0Bb5uoKLeXWC64z4Oma8JC7pXejM4IVCyQNkNyeeht8lbSpzDK7IjIetHswmQxxhew/
         OgGA6n9XQlBULaisvhS+HgGU14GFrydl5Ge4N0U0T0jqG3dBsc0SP7uEQ2eIanN2Dbdo
         e/7hCTH3/ssk/zi/yzYB65Y5mj7TGjiCl2wVkQTILkymkfjngMn3kpyXTad7OP6Jh/us
         G7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TNW4CE/t7dF+7aMtPSZxkggLbZD3FdAmkPBZz45Yfzg=;
        b=s+Xfpyasg6MM64Lg9bKL5JM4eF38WXkXIqYoTFIFnRexlXd2WXdgi7F/9nEBnBQSXJ
         +U2cjUJCQyc1/zFOuLv8PldeEmUPpL6EzqQ1I5n6MKQN9CyyIwjwPTxKkcOhjCUbsu1Z
         odBTOp0h3uX0XTYWTk4HGoaEWNang+keWJFyharJiB/UKqC4+uOVeoiJHOrnW/2M28fV
         RhOod2AoGcZ2rWpwshbuoTG+SQ2fR0kGQryg61f+R0w2dNwlTayC1cX3wAgWHV79pevQ
         ZfEc4KmMFYUQUp09JTCxZcikpAU06GJJI30IKH/jfASswp9i/tJrfrty/1bx56xplGiE
         eGYw==
X-Gm-Message-State: AOAM533aFAaEbN7X/UZiBOKELkt6S/FBLHLNAwOaXT9vzVfsk0dbFHSg
	GV/8B8VpKZe5J01SXRRp4QCNbAQYsfiusnc12PY=
X-Google-Smtp-Source: ABdhPJx6U4PET5veli/MUD//RQNTpdPViq7cUHck5ql8kR502OhAf/ZbbP6TZnwX+B1I+HgTj0QLBc1qLhr6gFiGJLk=
X-Received: by 2002:ac8:6ec4:: with SMTP id f4mr646610qtv.194.1607110071601;
 Fri, 04 Dec 2020 11:27:51 -0800 (PST)
MIME-Version: 1.0
References: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
In-Reply-To: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 4 Dec 2020 11:27:25 -0800
Message-ID: <CAMKF1spd4fmBwizAWPsZswe_X8abbqaT4Gt5TbM_7L3v6L0ksQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] firmwared: add recipe
To: Robert Karszniewicz <r.karszniewicz@phytec.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 4, 2020 at 9:05 AM Robert Karszniewicz
<r.karszniewicz@phytec.de> wrote:
>
> This program is needed for loading external firmware via Linux' fallback
> mechanism.
>

Please add it to packagegroup-meta-oe as well.

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

remove PR setting

> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=7b486c2338d225a1405d979ed2c15ce8 \
> +                    file://COPYING;md5=daa868b8e1ae17d03228a1145b4060da"
> +
> +SRC_URI = "git://github.com/teg/firmwared.git \
> +           file://firmwared.service"
> +
> +PV = "1+git${SRCPV}"

Lets start with 0+git.... if there is no official version released yet.

> +SRCREV = "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "glib-2.0 systemd"

Does it depend on systemd at runtime ? if so lets also add

inherit features_check
REQUIRED_DISTRO_FEATURES = "systemd"

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
