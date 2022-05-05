Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8270FC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 18:31:09 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.224.1651775466143501272
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 11:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TX4PSdZe;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id s4so3828221qkh.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 May 2022 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ge1lr+Bqa8Dg9eVWAYKpFYFbY5f4Hp21mCMJpFGt1jM=;
        b=TX4PSdZe5KTAFr1Wu+KjQb5n+uWGReKnyYYkOtb7zNJDJbw3ZO1IyA4Ze/cwYsLvcK
         r4n4GvJISA9XBp9THpHpWn+GlzL2gZJXEhE0im+Xz8/sjP9B5kS1YboUvstBOSegLlKF
         zcX+dh0+E2HsHMgyJSWLoDmAwx0XoFKtCsCDPToGXo16BGimQ0qSFQTbDRy2ZzjY/0Y5
         CFEb1v0Gdv+usktAU//CYJQlDqpe9WuIfhLRTGDi/rOPDZ/e9ne+T9y+DLsheBov0fyb
         MPFG5+u7iHePFYATlhNvoAvr2AsnL0blIbME+2dfWQC4VV1ZMOnfrFRGoDRZhLmn/1w9
         1ElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ge1lr+Bqa8Dg9eVWAYKpFYFbY5f4Hp21mCMJpFGt1jM=;
        b=L/5Qo0pGEPD3g0nW+GuJfrcFedTQxa4GRv4FS72RgQsBoQtwPHVJtbkdffkDf0arp2
         QL0gBI1mwygptgFhi3VmrcYVPKmprVfeIHWpo/XrpslWSMS4tfih2DTPIjP14cXO9DeJ
         U3hrBw2HX10M3c9695TvhB6FgrLKzF2CoyfIAQGXqT0DsTDQ5JwtixjVB//NE8qwlG60
         ++pJ/Vg+Owa2Vf8xlY3M8rCbeASj1DK+8eZdRQR6ZwQU275WTSGlQvtCR7oL7cvVmCVm
         zua1G8gKzvOrTj+JZZSp59hR0lqbnN8we+8m3d288KH1rD+k4PyhYwbx+kfDPxfMUQLB
         sREA==
X-Gm-Message-State: AOAM531fBp7Fj3u86gPdUM2svWGq5t0r/pAsLiL0865r27BoX8ny1EXI
	jQawhuXxuw8zmrsHzRhzmxgS/1WE7/h+kyrdsgE=
X-Google-Smtp-Source: 
 ABdhPJyahfAXZ+5zGiuXh7QUySgtnNcdGCzJmyAtTuZWJbAKudCyVdRW7BIQMoOPLmtJJxbueXgkCkaH9Qndz/wxCC8=
X-Received: by 2002:a37:b51:0:b0:69f:c378:e1e1 with SMTP id
 78-20020a370b51000000b0069fc378e1e1mr19399540qkl.180.1651775465208; Thu, 05
 May 2022 11:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220505142749.28938-1-windel@windel.nl>
In-Reply-To: <20220505142749.28938-1-windel@windel.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 May 2022 11:30:39 -0700
Message-ID: 
 <CAMKF1sqsSF17W0ptD97PDUyMVXsJM4tw-LGVgBfABPPvdr9RVA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] Add zfs recipe
To: Windel Bouwman <windel.bouwman@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Windel Bouwman <windel@windel.nl>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 May 2022 18:31:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96963

I think it needs a dep on curl see

https://errors.yoctoproject.org/Errors/Details/656276/

On Thu, May 5, 2022 at 7:29 AM Windel Bouwman <windel.bouwman@gmail.com> wrote:
>
> Signed-off-by: Windel Bouwman <windel@windel.nl>
> ---
>  .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
>
> diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> new file mode 100644
> index 000000000..ebe2ec39d
> --- /dev/null
> +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> @@ -0,0 +1,54 @@
> +
> +SUMMARY = "OpenZFS on Linux and FreeBSD"
> +DESCRIPTION = "OpenZFS on Linux and FreeBSD"
> +LICENSE = "CDDL-1.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
> +HOMEPAGE ="https://github.com/openzfs/zfs"
> +
> +SRC_URI = "https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6"
> +
> +# Using both 'module' and 'autotools' classes seems a bit odd, they both
> +# define a do_compile function.
> +# That's why we opt for module-base, also this prevents module splitting.
> +inherit module-base pkgconfig autotools
> +
> +DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl"
> +
> +PACKAGECONFIG[pam] = "--enable-pam --with-pamconfigsdir=${datadir}/pam-configs --with-pammoduledir=${libdir}/security, --disable-pam"
> +
> +EXTRA_OECONF:append = " \
> +    --disable-pyzfs \
> +    --with-linux=${STAGING_KERNEL_DIR} --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
> +    --with-mounthelperdir=${base_sbin} \
> +    --with-udevdir=${base_libdir}/udev \
> +    --enable-systemd \
> +    --disable-sysvinit \
> +    --without-dracutdir \
> +    "
> +
> +EXTRA_OEMAKE:append = " \
> +    INSTALL_MOD_PATH=${D}${root_prefix} \
> +    "
> +
> +do_install:append() {
> +    # /usr/share/zfs contains the zfs-tests folder which we do not need:
> +    rm -rf ${D}${datadir}/zfs
> +
> +    rm -rf ${D}${datadir}/initramfs-tools
> +}
> +
> +FILES:${PN} += "\
> +    ${base_sbindir}/* \
> +    ${base_libdir}/* \
> +    ${sysconfdir}/* \
> +    ${sbindir}/* \
> +    ${bindir}/* \
> +    ${libexecdir}/${BPN}/* \
> +    ${libdir}/* \
> +    "
> +
> +FILES:${PN}-dev += "\
> +    ${prefix}/src/zfs-${PV}/* \
> +    ${prefix}/src/spl-${PV}/* \
> +    "
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96960): https://lists.openembedded.org/g/openembedded-devel/message/96960
> Mute This Topic: https://lists.openembedded.org/mt/90833225/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

