Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68209C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 16:09:27 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.9143.1648742966044004441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ip+ogB80;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id k7so20077876qvc.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4HOzqpJ+QQu13gdzKNX/1yIrzizOqvRduWHF+SAnD6Q=;
        b=ip+ogB80dYg0s1maf0vknrkOhkeaQjgPHJ8kK55D/Q7Iu4OjRcglkaZ9Il0FIiKffo
         0B3uUD4vq6tIs55ATWhrfedspbzZ9x7mureXKilkKpdrjpTQFbIjSKu+BLbPLmckFrvc
         4BcddxC4b+7WQqCwKCOc0ww5/GzZknLMQemS6/AyD/br6Kx6YhM9ksE3PoKFaPrJzoRE
         owIkBczJNMuEwde4BDFrr/AvjqeQa08rynVImJW+fXB28dxk7B1JSi30P0s8UXcGf2V2
         AZrQ98nG8QU5Qa7VYA+QeK8tCYCTnf97jE67BrHrSUsOONZ5HSTarD3ssRA4x3TZ06W6
         1wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4HOzqpJ+QQu13gdzKNX/1yIrzizOqvRduWHF+SAnD6Q=;
        b=ocxzAELzqR0hb1ek+X9qQU5C/Sb/N1bwC/I/uDRqJd4q+kEh1s4abAHOlYxPHpvtRt
         JVe0nZeJQc1kdDx1FYcheSxeoQ0zKw10SdUwa8ui5VrU4RDCHS40Og1KAJgcpMs3F5g7
         PgXrx81EUrUGKLOhPbPZVp6m/6d9Lk6nKvLNnrJIEP9h+4ZJrrwawEuklEmvQjrw53bz
         bXz8ZH2R0Od5KFzkXxQ0YgfO8nUSAI0AJF22vZJyWAKI1itTef9ePpV8umZ2XBrAqjIL
         ji9ElSahMPru6HCwZk3Z1Hcw2OvEXEY7AY+3+L6Q6ATz1DnJpfhH/DA6Y5lOFaU0Ru37
         cytg==
X-Gm-Message-State: AOAM533RzsZKOzbfHteWSNlYvWRV83F0mz9fPRERDpXjwF5yAbYrVijB
	1x3xSDMMlJKOrfWr//pacplE2u487JvQiqcEBe5qTbqkHgY=
X-Google-Smtp-Source: 
 ABdhPJxTdCLxPX9bKJnJbeKJQZiVnIWZbPo5cZWur26fRlQEoCdcqX143xgVZ4f40JGPLCWdXG4TkVVG52+RWynuw/M=
X-Received: by 2002:ad4:5aa3:0:b0:443:9ba7:3f27 with SMTP id
 u3-20020ad45aa3000000b004439ba73f27mr3441227qvg.63.1648742965026; Thu, 31 Mar
 2022 09:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220331064935.2763629-1-schnitzeltony@gmail.com>
 <20220331064935.2763629-2-schnitzeltony@gmail.com>
In-Reply-To: <20220331064935.2763629-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 09:08:58 -0700
Message-ID: 
 <CAMKF1soHzWsBnGVWH4ZPmbb=C=_KSD-b_1xFOq7u30eS4D09NA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/6] gnome-commander: initial add 1.14.2
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 16:09:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96299

seeing this build failure on arm64 ( I use clang )

| In file included from
../../../gnome-commander-1.14.2/src/intviewer/searcher.cc:27:
| In file included from
../../../gnome-commander-1.14.2/src/intviewer/libgviewer.h:40:
| In file included from
../../../gnome-commander-1.14.2/src/intviewer/viewer-window.h:27:
| In file included from
../../../gnome-commander-1.14.2/src/intviewer/../gnome-cmd-includes.h:24:

             | In file included from
../../../gnome-commander-1.14.2/libgcmd/libgcmd.h:26:
| ../../../gnome-commander-1.14.2/libgcmd/libgcmd-widget-factory.h:167:70:
warning: 'format' attribute argument not supported: gnu_printf
[-Wignored-attributes]
|     void create_error_dialog (const gchar *msg, ...) __attribute__
((format (gnu_printf, 1, 2)));
|                                                                      ^
| ../../../gnome-commander-1.14.2/src/intviewer/searcher.cc:303:5:
error: cannot initialize a parameter of type 'gint *' (aka 'int *')
with an rvalue of type 'void *'
|     g_atomic_int_compare_and_exchange (&src->priv->progress_value,
oldval, (gint)d);
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
| /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-commander/1.14=
.2-r0/recipe-sysroot/usr/include/glib-2.0/glib/gatomic.h:160:44:
note: expanded from macro 'g_atomic_int_co
mpare_and_exchange'
|     __atomic_compare_exchange_n ((atomic), (void *)
(&(gaicae_oldval)), (newval), FALSE, __ATOMIC_SEQ_CST,
__ATOMIC_SEQ_CST) ? TRUE : FALSE; \
|                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| 1 warning and 1 error generated.
| make[3]: *** [Makefile:521: searcher.o] Error 1
| make[3]: Leaving directory
'/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-commander/1.14.=
2-r0/build/src/intviewer'

On Wed, Mar 30, 2022 at 11:50 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../gnome-commander/gnome-commander_1.14.2.bb | 22 +++++++++++++++++++
>  .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-commander/gnome-comman=
der_1.14.2.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.1=
4.2.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
> new file mode 100644
> index 000000000..c67242299
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "A light and fast file manager"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +
> +DEPENDS =3D " \
> +    glib-2.0-native \
> +    gtk+ \
> +"
> +
> +inherit gnomebase itstool gettext gnome-help features_check
> +ANY_OF_DISTRO_FEATURES =3D "${GTK2DISTROFEATURES}"
> +
> +SRC_URI[archive.sha256sum] =3D "1378efd24f8af18a09031d83d918f9662a3f5eba=
5a6f9df9fc55870f2e6f0ee9"
> +
> +PACKAGECONFIG ??=3D "exiv2 taglib libgsf poppler"
> +PACKAGECONFIG[exiv2] =3D "--with-exiv2,--without-exiv2,exiv2"
> +PACKAGECONFIG[taglib] =3D "--with-taglib,--without-taglib,taglib"
> +PACKAGECONFIG[libgsf] =3D "--with-libgsf,--without-libgsf,libgsf"
> +PACKAGECONFIG[poppler] =3D "--with-poppler,--without-poppler,poppler"
> +
> +FILES:${PN} +=3D "${datadir}/metainfo"
> +FILES:${PN}-dev +=3D "${libdir}/${BPN}/lib*${SOLIBSDEV}"
> diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-=
apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.=
bb
> index 481dd727d..dc446237b 100644
> --- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
> +++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
> @@ -15,6 +15,7 @@ RDEPENDS:${PN} =3D " \
>      ghex \
>      gnome-calculator \
>      gnome-calendar \
> +    gnome-commander \
>      gnome-font-viewer \
>      gnome-photos \
>      gnome-screenshot \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96282): https://lists.openembedded.org/g/openembedded=
-devel/message/96282
> Mute This Topic: https://lists.openembedded.org/mt/90150027/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

