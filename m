Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF3AC7115E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:04 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.8331.1650035498804038953
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 08:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NFjQkXuq;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id i14so6616290qvk.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 08:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SLGHQJRSiiNdZOaTUswEkg+xOZ6R//UBtSFwrycEc58=;
        b=NFjQkXuqNsf1iHFG57905+aITzt4b/jFpLkMgsSPDk6i36NweP/DUR9Q3AhoK2beaM
         ByLkD1bD4kdj0VGIfxBsaQ5/7CCaSP7iCEcNBnrRwHurnMz6QXTOJEjgh6mfVxNoHuVB
         GEYFSvaCrXNFc+DjK4Aq9a0ojPSkHQQM4x1HQSFDe9K9Bz8P9hm+8KHjEf9PhtvsMDNh
         qeqYqb/ySFpUVZGiRKZ72uW87jucV6GKCgcotKclPns3xVP8758P2f4jNymlezK+VB1v
         xCqhIH4jUxV0aVHFLa3ioHUov4rkZNaT3TXTomn7A3dgp447SBp+ybK3MxkZd7uwpufh
         WHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SLGHQJRSiiNdZOaTUswEkg+xOZ6R//UBtSFwrycEc58=;
        b=Kx0dxU9mqKff1/KBp1bxejLlN/xDifoq+HawIRGzYHdAqTyM31Y/knXMwrQl0gl9o3
         8BiA9zipT33Ad1rDRXHXit4/JfhtWvlC5Yk+RnK6A+zJo3tIUzs9DIpQp/39xvcVA9oI
         541MxsCOWoDxKUY1OCzc2XFWKjY7qVsufH9HerryVICE+tp1v1jpbUNGoo89UyCAcYtu
         /sfP9RcV+/O3bBfPIbp6MrhnivVsFTAB0Wy0CVyKa7fXaaKvRzh/HWsrntC5E5Ieb7w1
         Fqqr12ybhq2kJ/07wT/CaH1iWS7EClpH+b6Wo117dsqtKV99VHWR7PTUf6XnOU2ZblpL
         CGuw==
X-Gm-Message-State: AOAM530tVzydlUubKcFvA3TPmte3xDuLAsQ214HAbZ1v1wZqOP7W5i9u
	6/pLDyA4xxF1IrSqbfUqohZAlyvvKwATOzyW4AAGZPI28Fk=
X-Google-Smtp-Source: 
 ABdhPJxZsUbrKOFVVOKtipSnPtXtu5FKWrT0KRVkcIgrVaYPa4cNS/4yBFFcyRJTcx0e4oBvRTVtrKTXT9k0KvB5gME=
X-Received: by 2002:ad4:5aa3:0:b0:443:9ba7:3f27 with SMTP id
 u3-20020ad45aa3000000b004439ba73f27mr8099256qvg.63.1650035497838; Fri, 15 Apr
 2022 08:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220415054504.647069-1-mingli.yu@windriver.com>
 <20220415054504.647069-2-mingli.yu@windriver.com>
In-Reply-To: <20220415054504.647069-2-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Apr 2022 08:11:12 -0700
Message-ID: 
 <CAMKF1srhKOR+5XM4FcfptUe13npitJ6Qh+ZR0VBrpJdr1U5y7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] libconfig-general-perl: move from
 meta-openstack
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96667

On Thu, Apr 14, 2022 at 10:45 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> tgt rdepends on libconfig-general-perl.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../perl/libconfig-general-perl_2.63.bb       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb
>
> diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb
> new file mode 100644
> index 000000000..51ce60ca8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Config file parser module"
> +HOMEPAGE = "http://search.cpan.org/dist/Config-General/"
> +LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
> +SECTION = "libs"
> +LIC_FILES_CHKSUM = "file://README;beginline=90;endline=90;md5=3ba4bbac1e79a08332688196f637d2b2"
> +
> +SRCNAME = "Config-General"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "e3ea2a6dc76931cf638b5227aceabf60"
> +SRC_URI[sha256sum] = "0a9bf977b8aabe76343e88095d2296c8a422410fd2a05a1901f2b20e2e1f6fad"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
> +
> +inherit cpan
> +
> +do_compile() {
> +    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"

I think it will not work with musl since libc so in called libc.so

> +    cpan_do_compile
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96663): https://lists.openembedded.org/g/openembedded-devel/message/96663
> Mute This Topic: https://lists.openembedded.org/mt/90481290/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

