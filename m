Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A359AC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:04:39 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.10942.1651500269221464443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nhowsAFN;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id a76so3822431qkg.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivn1ms+hxZfiNqUmt01jS5nLW2c+MEHx+NHtMmP14Rg=;
        b=nhowsAFNi6uwUL9mjJ5LAXioJ7AIXjaw4nPFeYgf9823zF5qMsrITcrvHMeb3T5VMR
         0hvTX3YaEpzcg2KGvis2ADkiYmV6mkOwuzidyR0/3ro6diLkcu7xhM7uYs/ub0rQ4QUU
         1gSFbDoToTR3wP5b4Vt/gr96jopSw/q0B7wE3f0+fRVtMqoBtoUHdzrsIN+lnxLSSsKQ
         QQvWsf5a7qeZfD+6JvfpLc5hPWHdMhZVKIsrjZWfmvkA5Wnha907yG5lGF9a+44o+zu6
         m01ZkUEYTMcu6TAFsL2uhvxqCr4JNfmJso081HJfppFsB4HWhb2y4fK4DJS18qY5yglR
         NOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivn1ms+hxZfiNqUmt01jS5nLW2c+MEHx+NHtMmP14Rg=;
        b=yzmEaYxQGZZwh93a9TglBSCvEwhaZBo5mzlssozaAgG1Wu2WKZWSwGKRrLKIw0NDKA
         MM0ChcVJrEwEJUK97ps8o8m176yMettB51sgAX0ZM6aJtZCFnorccNdobxS3NQGxF8aG
         YFuWCywTUzAxA7YJRST4pryep6jQgAiGdWkPLcto1Ba3a8cG0432lOKMDocKmUTvTpQ9
         a/NgrZz0TXfKzRNkpvd0qnCQJILujYxCnvQhuENSgIrPsHGuBRtCojgeAQv8mPPaLKh7
         j1VE4pokaYFb0dNVEKBBL8pUk+gRfF4yeg3I9hCSpTSYfFZ9glJNT2KqRKwbT7Ee8hwX
         dghA==
X-Gm-Message-State: AOAM531T1F9/RH0vVPPgnb/3rGFmckt3GOsk3kiuiQsALngsZykspAsD
	sROqhb+j94clkS+zUtC1FEsOI4UD30MH27HNJVw=
X-Google-Smtp-Source: 
 ABdhPJz87b3fe7oCWP6VMCtC3W7Q+tkAtsu/SOcP1v+MDwXhvhE7moZEBxF9bxWlGd2O9ZJXvUevKEMoEbJpyACKWZE=
X-Received: by 2002:a37:b51:0:b0:69f:c378:e1e1 with SMTP id
 78-20020a370b51000000b0069fc378e1e1mr7635859qkl.180.1651500268219; Mon, 02
 May 2022 07:04:28 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAHMaQtDzj=eJrhrBfQjHLSZvw9GqPkRoyAVca4mSxzBfXDssww@mail.gmail.com>
In-Reply-To: 
 <CAHMaQtDzj=eJrhrBfQjHLSZvw9GqPkRoyAVca4mSxzBfXDssww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2022 07:04:01 -0700
Message-ID: 
 <CAMKF1spQ+San2UFoqDLX5bQTtoeZ72TQ_Xym2f84n6texffXJQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] Add zfs recipe
To: Windel Bouwman <windel.bouwman@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:04:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96928

Hello Windel

Thanks for the patch, this patch however I am unable to apply  this
patch as it seems to be malformed.

error: git diff header lacks filename information when removing 1
leading pathname component (line 7)
Patch failed at 0001 Add zfs recipe

perhaps use git format-patch and then git send-email for best results.

On Mon, May 2, 2022 at 5:02 AM Windel Bouwman <windel.bouwman@gmail.com> wrote:
>
> Add zfs recipe
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96927): https://lists.openembedded.org/g/openembedded-devel/message/96927
> Mute This Topic: https://lists.openembedded.org/mt/90833225/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

