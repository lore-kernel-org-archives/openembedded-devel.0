Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779F1C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 21:12:28 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.3093.1651525943234838151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 14:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IciuGoEP;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id z126so12357016qkb.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/TBElgDwgJOtTLTTV1b/NXZ89yI/rmR6hhDC5OGvg2Q=;
        b=IciuGoEPH0nlN3OEFmH78pYYa3cWc5gx3CTGZdx0EE1lD9NtSeH5OJb4oiMBbWnvyr
         S3HFyN/jav8mVbSK9JFlDJuoxnazjhTBqKlu0UnpVsl2hs6cDjIFd73FJ2BOcwWvlXZM
         Ohh7JfG6PdJq24kFv/7QyBzRiJurDr6MNWg0seVoyVPG/pPFSW0MHOqouWs7tJWHdPUt
         ZvJrOrSaDFLjaVVWUMyOE++vMvMo+ndYlr+JLqFaF3Hi9dm76vxaB/Djp0f1haHvZhNd
         kLwh/BH6tiiJeFOUnOfBD6S3Q+1OAA70zCMZ2eEw9rjEgHnPoTsYk6heZTAG4h1l3gAx
         7Sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/TBElgDwgJOtTLTTV1b/NXZ89yI/rmR6hhDC5OGvg2Q=;
        b=EoxEfWX4X341Wy69W1PaT95m1rO19eiqrh+SRBO5TmVNm1rUKxq+hgRmLefvbmRmyz
         jtfL6MUvYdkPySnwtadvt0A1RGKNkfIme94Wd2Y0+60IRNzDdoYZ/G4yxjLX28Y78T/O
         pf4RGnvDTAgCa9hjyQc9KVFWZJAuZpvk998cV3AUKxzuVhIV+76Ag9cKPs6TWTXUtxFD
         WK+dznzQ1nnj4dtr4XBt8DobGtu53hfv3gC+6xy9mFITlkEqpnZhb3n8Te19UA3TxAu6
         nucmsK2cO++nCe4++cJHg8EUUu5GauOHnscEJ1ztnAyv7Elwl8nlKUq/ptu8sfgN/AHa
         W2nQ==
X-Gm-Message-State: AOAM5331khJD+8O5DWiuudbPzgRI1tkVjExxMMhyaKYUZ6lSJ8Ehk+6j
	bpBLJ1g1Abq97su5e3zn6KgDQ/pERqG+oeJFi9o=
X-Google-Smtp-Source: 
 ABdhPJwIvn6moYZxD6b443JlXca3gmO1A/KVHA76G3LCnYh1WMyWWAB86Deea0L+aN8TJZ8emzvYwipoauDSLt4eMFM=
X-Received: by 2002:a05:620a:170f:b0:69f:bfbe:9095 with SMTP id
 az15-20020a05620a170f00b0069fbfbe9095mr10195148qkb.149.1651525942256; Mon, 02
 May 2022 14:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220502141441.26320-1-windel@windel.nl>
In-Reply-To: <20220502141441.26320-1-windel@windel.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2022 14:11:56 -0700
Message-ID: 
 <CAMKF1sr9BcOz32MEqhb723ALz5mWH4EDQm5Defc5n8=GKcf+rg@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] Add zfs recipe
To: Windel Bouwman <windel.bouwman@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Windel Bouwman <windel@windel.nl>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 21:12:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96943

looks better this time but fails in packaging

https://errors.yoctoproject.org/Errors/Details/655897/

On Mon, May 2, 2022 at 7:15 AM Windel Bouwman <windel.bouwman@gmail.com> wrote:
>
> Signed-off-by: Windel Bouwman <windel@windel.nl>
> ---
>  .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
>
> diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> new file mode 100644
> index 000000000..01a64cc95
> --- /dev/null
> +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
> @@ -0,0 +1,46 @@
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
> +EXTRA_OECONF:append = " \
> +    --disable-pyzfs \
> +    --with-linux=${STAGING_KERNEL_DIR} --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
> +    --enable-systemd \
> +    --disable-sysvinit \
> +    --without-dracutdir \
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
> View/Reply Online (#96929): https://lists.openembedded.org/g/openembedded-devel/message/96929
> Mute This Topic: https://lists.openembedded.org/mt/90833225/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

