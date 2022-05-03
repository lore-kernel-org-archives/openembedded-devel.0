Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01ECDC433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 14:52:15 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.60.1651589531633621350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 07:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e7zJmang;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id 126so12846315qkm.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EDKxmSclRpmhnv0Sj2x3v/dV/gkXyA6KwXlYR0mQYyE=;
        b=e7zJmangoRevioZlcZtXRqyHk9lEguCw+hivcHBe9MdNdgvxIe530/TZhxBSnIjWog
         avH+hqLX0ZF1BwWK+tGt39ZqtnuKKCcx282phC5xdq8f8CdsTgonunFx/CfoNjIumQV4
         wNRRZbZ8NGwctPnkeVXwnxr5XmhzUT8B8eZDl7hfnMWBOVRDJ76NUEahSCWKHfIAfm7T
         elIiz0Bkopx3QfMREMYiZ3oSzWbRSQ6QqexiGLHX+hnw6+OmKbBYSwA0dNsP9mCUl+8E
         Ddyh+gEsTNuG5ua1snbbILhy/AkcqbzuuvBHEcJn1H2ikb1PcZjusP+nE5RR3PGVWnWU
         xs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EDKxmSclRpmhnv0Sj2x3v/dV/gkXyA6KwXlYR0mQYyE=;
        b=a+XUyAE3odN7ucinJeYBZF0LsPNudQwfRU0i85oV4dsljqQ9/q5xDtxtp1vqB4zIbL
         2DeG8wIjbcQ15zJ8CXrhNsh4zJjfVnu0JKhsrV54EOFXxpP4Oz8XV26GCrFfenIOH+/c
         YSJvKA23+BLxsFdnugCKU6iz4bTwt5mfHN/36xHpqWxbWPw0SH2cTcfWKaESi3ATI711
         KOOJYNJOhS/o+Jq8GOeit42CX1lHkCSr2aq5Dx+dfV6r3FMREam0bzFgSqKVkXHTW/LP
         waN7Txp0R54xcMcVNIWWhyAFSPgC0Q9YF8UUBg5FJkmARbzeCAW/hBDLdvKyKRvwmlko
         TT9g==
X-Gm-Message-State: AOAM532fEr0t3/YWEh7SbcvaKMOJZQGnhUe8NksqtLxyY2soKr5b9LbJ
	KlsAJp/iptYItgVCG8fFrzvO25JR4Dqez2RS2Mc=
X-Google-Smtp-Source: 
 ABdhPJyjuiF5dJue/PjIwJK2syJLQ0OcUfFc2GX79azzTuTZs59DPjABaT+285b36n0lV3b1cQdP/Gjwnul3rFfKdtY=
X-Received: by 2002:a05:620a:17ac:b0:69e:b8d5:3fd2 with SMTP id
 ay44-20020a05620a17ac00b0069eb8d53fd2mr12352463qkb.227.1651589530677; Tue, 03
 May 2022 07:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220502141441.26320-1-windel@windel.nl>
 <CAMKF1sr9BcOz32MEqhb723ALz5mWH4EDQm5Defc5n8=GKcf+rg@mail.gmail.com>
 <CAHMaQtBurE424MVsK4bt8ddpUo8kwfUaK3mE08MRUXovZ7BXFQ@mail.gmail.com>
In-Reply-To: 
 <CAHMaQtBurE424MVsK4bt8ddpUo8kwfUaK3mE08MRUXovZ7BXFQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2022 07:51:44 -0700
Message-ID: 
 <CAMKF1srj1nNrZTagSQ7Vxoz-tyKw6hqo7BDs+us0YXeUJtKs7A@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] Add zfs recipe
To: Windel Bouwman <windel.bouwman@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Windel Bouwman <windel@windel.nl>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 May 2022 14:52:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96951

On Tue, May 3, 2022 at 4:02 AM Windel Bouwman <windel.bouwman@gmail.com> wrote:
>
> Hi Khem,
>
> I tried to reproduce this build error, but the recipe builds fine at my local setup.
>
> What system did you use to test?

this is wit usrmerge in DISTRO_FEATURES because modules should get
installed into base_libdir
and it seems the build system for this package is hardcoding the
install path to /lib which is the problem
its reporting here.

>
> Regards,
> Windel
>
> On Mon, May 2, 2022 at 11:12 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> looks better this time but fails in packaging
>>
>> https://errors.yoctoproject.org/Errors/Details/655897/
>>
>> On Mon, May 2, 2022 at 7:15 AM Windel Bouwman <windel.bouwman@gmail.com> wrote:
>> >
>> > Signed-off-by: Windel Bouwman <windel@windel.nl>
>> > ---
>> >  .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 46 +++++++++++++++++++
>> >  1 file changed, 46 insertions(+)
>> >  create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
>> >
>> > diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
>> > new file mode 100644
>> > index 000000000..01a64cc95
>> > --- /dev/null
>> > +++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
>> > @@ -0,0 +1,46 @@
>> > +
>> > +SUMMARY = "OpenZFS on Linux and FreeBSD"
>> > +DESCRIPTION = "OpenZFS on Linux and FreeBSD"
>> > +LICENSE = "CDDL-1.0"
>> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
>> > +HOMEPAGE ="https://github.com/openzfs/zfs"
>> > +
>> > +SRC_URI = "https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz"
>> > +SRC_URI[sha256sum] = "3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6"
>> > +
>> > +# Using both 'module' and 'autotools' classes seems a bit odd, they both
>> > +# define a do_compile function.
>> > +# That's why we opt for module-base, also this prevents module splitting.
>> > +inherit module-base pkgconfig autotools
>> > +
>> > +DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl"
>> > +
>> > +EXTRA_OECONF:append = " \
>> > +    --disable-pyzfs \
>> > +    --with-linux=${STAGING_KERNEL_DIR} --with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
>> > +    --enable-systemd \
>> > +    --disable-sysvinit \
>> > +    --without-dracutdir \
>> > +    "
>> > +
>> > +do_install:append() {
>> > +    # /usr/share/zfs contains the zfs-tests folder which we do not need:
>> > +    rm -rf ${D}${datadir}/zfs
>> > +
>> > +    rm -rf ${D}${datadir}/initramfs-tools
>> > +}
>> > +
>> > +FILES:${PN} += "\
>> > +    ${base_sbindir}/* \
>> > +    ${base_libdir}/* \
>> > +    ${sysconfdir}/* \
>> > +    ${sbindir}/* \
>> > +    ${bindir}/* \
>> > +    ${libexecdir}/${BPN}/* \
>> > +    ${libdir}/* \
>> > +    "
>> > +
>> > +FILES:${PN}-dev += "\
>> > +    ${prefix}/src/zfs-${PV}/* \
>> > +    ${prefix}/src/spl-${PV}/* \
>> > +    "
>> > --
>> > 2.25.1
>> >
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#96929): https://lists.openembedded.org/g/openembedded-devel/message/96929
>> > Mute This Topic: https://lists.openembedded.org/mt/90833225/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >

