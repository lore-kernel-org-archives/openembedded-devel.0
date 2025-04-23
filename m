Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4230EC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 15:51:18 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.12265.1745423472208133349
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 08:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HuyOIO/A;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3f6a92f234dso4143645b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423471; x=1746028271; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jyu7acwSIlN5ANLjdwqw6SlVkrEi3Jov/JUMg+8Gx94=;
        b=HuyOIO/ABAwWE99DDE82h2J9n8qxTBZm3+h+SwXGQgWKLfLSKQT7DwWsnxxbdUsChS
         r9HNAjR2+u6wSzIDnauItx+lrnUHZ3aqBoXAAU3Ku9iOsxFe0zgB20UdaDa0fI5L6RJH
         niP8Sm73QQfeCQFrQ6zrLbpX58rFquLXb8er0Oia0loX7Zm4ZRkvrDsTcLElYqYYb+A/
         7m1zHbnpu52kl75Bnu445mk47ks1cce3i0r2mnqWjf+DwIs5r9NSJqSSDftZG/pNkdoX
         pxqZVJJzoIJFluN+6HkZTaJXVybODa3O35pqmBga0YOK5LqNIoLiUFWeEFkW+Po5+zpg
         bX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423471; x=1746028271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jyu7acwSIlN5ANLjdwqw6SlVkrEi3Jov/JUMg+8Gx94=;
        b=KQ90380lPE6a/0+eUBh7JiEQAGyksVop6uEnGQIXWhN4RYKbB4l3fRB2o+ZQdXjL54
         EBIl+18uzzG6Fsccz19kE9yEiDlsQHm6oS5TaqodhKMlb9ovpMVNuXnSx/rlrOEvQlLc
         5QvKU3ULfrg68OoX2WjsoRcRaGrq+hXLOzjdLptinoaV22sZFJfu5ONzg8jy6NmXzqcr
         wJG9uROe/7cGmEfOScMTjLUP1xbr1NCDAvhMMTmczl/BgZq/RYdKRXtwIePcTxzrB+2k
         WDXsAI9hVBL3EfwSReIAcuq3tfprRim+tzIVPP83VBprDkf/SbKRE8eybJxs8CrYyVc0
         XCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWckmjXYc5X1NLeRvhImxcxb/E6K1GLrYs0gv6ltltenDNXhBgzYcXW1QWaQeCtOSm3yD1h5r2njlaJwKQFk1mvR0s=@lists.openembedded.org
X-Gm-Message-State: AOJu0YymnHPC0/xAa+B79pcCqJyd40Zq6zuzeIDua80dy5AYwRKn1IWx
	r0+UhUQ+qR6FOEVLQv/3Zl6YqgXvkupUlaSKyPlWG0vmeSLn73vExjXaVTCNALS6uto/3invzyV
	26U5d/V+RAXLNDAGC1Xkml/AIpuNFLD80
X-Gm-Gg: ASbGncvoKa4asBmnkxSrCLLsxUiFLLl/g5CtLeHchiGfjyGGTTz+RwyUtQYcyaS9G81
	+25JScIVBgzwnA3uHD1Awi3ErIJ9XGCXDQkjSjpUaJmkSm6FkEtecVkVBeLZ2cL/ZLIHuruiCap
	Sa7MNn2GgEvvxJ0yc/WLymwQ==
X-Google-Smtp-Source: AGHT+IFEK6N9Tb2GnZwrL0bySc7itc7wtNAzSWEYRKJvEkb41md53SV50n5X8ai2TxxvCvcwELCvdMTbI56I2yi0/Yk=
X-Received: by 2002:a05:6808:199:b0:400:b398:2e4e with SMTP id
 5614622812f47-401df2636ecmr3339406b6e.37.1745423471423; Wed, 23 Apr 2025
 08:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250410091111.82723-1-haixiao.yan.cn@eng.windriver.com> <cb93a647c71cec139811b2d87d69782b9900309a.camel@phytec.de>
In-Reply-To: <cb93a647c71cec139811b2d87d69782b9900309a.camel@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Apr 2025 08:50:44 -0700
X-Gm-Features: ATxdqUGebZmg_HnMzeOXACrAls1QR7eEWDE4KXeb7eZ6_XvaWwHwQTl4SZH2CI8
Message-ID: <CAMKF1spfzi+gf=X31UUeMN8cCJOtQLsX1mibfXZ8HAX2CsMNTA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lmsensors: Clean stale files for sensord to
 avoid incorrect GCC header dependencies
To: L.Anderweit@phytec.de
Cc: "Haixiao.Yan.CN@windriver.com" <Haixiao.Yan.CN@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 15:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117082

On Wed, Apr 23, 2025 at 5:45=E2=80=AFAM Leonard Anderweit via
lists.openembedded.org <L.Anderweit=3Dphytec.de@lists.openembedded.org>
wrote:
>
> Hi,
>
> the build of lmsensors fails this patch applied and PACKAGECONFIG =3D "".
> I've attached the do_install log with the error.
> The problem occurs on master and scarthgap.
>
> A possible solution is:
>
> do_install() {
> -    oe_runmake user_install DESTDIR=3D${D}
> +    oe_runmake user_install DESTDIR=3D${D} PROG_EXTRA=3D"sensors
> ${PACKAGECONFIG_CONFARGS}"
>

since we are doing same cmd in do_compile as well perhaps it might be
better to add it via
EXTRA_OEMAKE so it can be then used in both places automatically

> Leonard
>
> Am Donnerstag, dem 10.04.2025 um 17:11 +0800 schrieb Yan, Haixiao (CN)
> via lists.openembedded.org:
> > From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> >
> > After upgrading GCC=E2=80=94for example, from 14.1.0 to 14.2.0=E2=80=94=
building
> > lmsensors that
> > was previously compiled with GCC 14.1.0 may fail with an error like:
> > lmsensors/3.6.0/recipe-sysroot-native/usr/lib/x86_64-wrs-
> > linux/gcc/x86_64-wrs-linux/
> > 14.1.0/include/stddef.h can't find, which is needed by
> > 'prog/sensord/args.rd'.
> >
> > This occurs because prog/sensord/args.rd still references stale
> > headers from the
> > older GCC version.
> > The root cause is that stale *.rd and *.ro files under prog/sensord
> > are not
> > properly cleaned during do_configure. This patch ensures those files
> > are removed
> > to prevent broken dependencies when GCC is upgraded.
> > Also remove the same statement in do_compile.
> >
> > Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> > ---
> >  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > index 07027225c58b..9b072d70b20e 100644
> > --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > @@ -51,8 +51,11 @@ EXTRA_OEMAKE =3D 'EXLDFLAGS=3D"${LDFLAGS}" \
> >          LIBDIR=3D${libdir} \
> >          CC=3D"${CC}" AR=3D"${AR}"'
> >
> > +do_configure:prepend() {
> > +    sed -i -e 's:^#\(PROG_EXTRA\):\1:' ${S}/Makefile
> > +}
> > +
> >  do_compile() {
> > -    sed -i -e 's:^# \(PROG_EXTRA\):\1:' ${S}/Makefile
> >      # Respect LDFLAGS
> >      sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
> >      sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g'
> > \
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117077): https://lists.openembedded.org/g/openembedde=
d-devel/message/117077
> Mute This Topic: https://lists.openembedded.org/mt/112188003/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

