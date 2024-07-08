Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8419AC3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 11:21:37 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.77349.1720437693798551182
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 04:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oye+Yhyv;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea33671ffso3385102e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720437692; x=1721042492; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXyxoabUL4MOUY+rY1dZbbctgIJHNBWCyPLfdfAUjPc=;
        b=Oye+YhyvKjJ9r0L5dDg+LQn4huitQpnPNGKOEc5IQwbIbe2mrlKGFGKPIL6Ce8XHDf
         suJfIxqatcXNuJJwIql0yc/3tw1gM70sywTF7C9Vt77pAOY9Z7xIN9Xx6oV9U776fCXE
         J9/cImF1GQORG3URXTAKLdBDFEgGH8oQ8a0rpQFPGJ2Net+mpL9yalHNtY7gzu/icEgu
         k3A/ZYNJihMfsBPATPG11qZSCOzDAqFBKlB8pTyPegOervUtEaN0FHcAAf/yZZfBZyVe
         vRzAjg1kjWg8mAUf2PFpQV4Pd/CaDrLY8Vp4zPC2HdNQW71HfzYi8/j/BD5goYRVthdu
         iljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720437692; x=1721042492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXyxoabUL4MOUY+rY1dZbbctgIJHNBWCyPLfdfAUjPc=;
        b=GauyJBb88DXQGTRh0DexgX01BaL0FZuvgZWiKUQ0NK1pDB99idu7+p11kpOoa850U+
         elUp66bUadYaCR+wz0g7Au0/HHXLWnEMuM3bEGNb5UQaz9umIPAw8aZcab25WkBcj4hd
         MBBpJfq3Ya/6KUoPIOIDunejQWzfUoD89ZXx42Gzi+bjDEnAbFs2h73Rl8WGx27iTL58
         ahLpwBlFlUSkLosYQpGDUdc+vDufay4WDW5+bD8Y1FEJXxWU19PrGlgugbLX+IwfSh7q
         G68bsROrAUW19vlBtLvFh0VB7fB+GShzQRvIRCB9AfT5nUElhagzE78LlGsJVH54W56j
         kNig==
X-Gm-Message-State: AOJu0YwwDRWE3NEUOAzzD2c+fbx7P7rvcRCV8I+A//DdpAfBlxnobAZP
	GwUJrZvTfDAo8+zxj1zAps3F64KnokPkVmOtJ/KUq0boPvX94fTtXnSIQrgFsKVn+SR6b8TXd8i
	Aay0XwWjkjLFUILJin6ezvpRnKyM=
X-Google-Smtp-Source: AGHT+IEhCjuduOn86TJEIAY7pRH2wKBPx8FxpdGPLHg8M70O6ZB/cCuIYOv3XMUypf3O8bm6Z40PLeCRHp7I/XhA0O4=
X-Received: by 2002:ac2:4c33:0:b0:52e:9958:1a66 with SMTP id
 2adb3069b0e04-52ea064c58cmr7189826e87.23.1720437691558; Mon, 08 Jul 2024
 04:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240614140101.641467-1-nikhil.r@kpit.com> <CA+chaQd5rg2Ps4+cfX+JTQ9EYwDrRHGx--9Z9Ba1oHRP5PyiFA@mail.gmail.com>
In-Reply-To: <CA+chaQd5rg2Ps4+cfX+JTQ9EYwDrRHGx--9Z9Ba1oHRP5PyiFA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Jul 2024 13:21:24 +0200
Message-ID: <CA+chaQfMbTxsQcdnz+E98-i0_0OAFOZX8VKHPTXZ3YS1=cGGxg@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] giflib: upgrade to version 5.2.2
To: nikhilar2410@gmail.com
Cc: openembedded-devel@lists.openembedded.org, bindu.bhabu@kpit.com, 
	Nikhil R <nikhil.r@kpit.com>, Bhabu Bindu <bhabubindu@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 11:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111264

And please use valid e-mail addresses when sending patches I got 2
rejects from bindu @kpit.com

Your message to bhabubindu@kpit.com has been blocked. See technical
details below for more information.
The response from the remote server was:

550 5.4.1 Recipient address rejected: Access denied.
[SG2PEPF000B66CD.apcprd03.prod.outlook.com 2024-07-08T11:16:59.022Z
08DC9E0559B2D7AA]

Your message to bindu.bhabu@kpit.com has been blocked. See technical
details below for more information.
The response from the remote server was:

550 5.4.1 Recipient address rejected: Access denied.
[SG2PEPF000B66CD.apcprd03.prod.outlook.com 2024-07-08T11:16:58.834Z
08DC9E0559B2D7AA]

On Mon, Jul 8, 2024 at 1:16=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> This seems to break build with gold, because libutil.so is built with
> empty soname param (libgif.so is fine):
>
> giflib-5.2.2 $ grep soname ../temp/log.do_compile
> ccache aarch64-webos-linux-gcc  -mcpu=3Dcortex-a72+crc
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> -Werror=3Dreturn-type --sysroot=3D/OE/lge/build/webos/styhe
> ad/BUILD/work/raspberrypi4_64-webos-linux/giflib/5.2.2/recipe-sysroot
> -std=3Dgnu99 -fPIC -Wall -Wno-format-truncation -O2 -shared -Wl,-O1
> -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
> -fmacro-prefix-map=3D/OE/lge/build/webos/styhea
> d/BUILD/work/raspberrypi4_64-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr=
/src/debug/giflib/5.2.2
>  -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4=
_64-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
>  -
> fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_6=
4-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
>  -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4=
_64-webos-linux/giflib/5.2.2
> /giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
> -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_=
64-webos-linux/giflib/5.2.2/recipe-sysroot=3D
>  -fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4=
_64-webos
> -linux/giflib/5.2.2/recipe-sysroot=3D
> -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_=
64-webos-linux/giflib/5.2.2/recipe-sysroot-native=3D
>  -Wl,-z,relro,-z,now -Wl,-soname -Wl,libgif.so.7 -o libgif.so
> dgif_lib.o egif_l
> ib.o gifalloc.o gif_err.o gif_font.o gif_hash.o openbsd-reallocarray.o
> ccache aarch64-webos-linux-gcc  -mcpu=3Dcortex-a72+crc
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> -Werror=3Dreturn-type --sysroot=3D/OE/lge/build/webos/styhe
> ad/BUILD/work/raspberrypi4_64-webos-linux/giflib/5.2.2/recipe-sysroot
> -std=3Dgnu99 -fPIC -Wall -Wno-format-truncation -O2 -shared -Wl,-O1
> -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
> -fmacro-prefix-map=3D/OE/lge/build/webos/styhea
> d/BUILD/work/raspberrypi4_64-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr=
/src/debug/giflib/5.2.2
>  -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4=
_64-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
>  -
> fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_6=
4-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
>  -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4=
_64-webos-linux/giflib/5.2.2
> /giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
> -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_=
64-webos-linux/giflib/5.2.2/recipe-sysroot=3D
>  -fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4=
_64-webos
> -linux/giflib/5.2.2/recipe-sysroot=3D
> -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_=
64-webos-linux/giflib/5.2.2/recipe-sysroot-native=3D
>  -Wl,-z,relro,-z,now -Wl,-soname -Wl, -o libutil.so qprintf.o
> quantize.o getarg
> .o
>
> giflib-5.2.2 $ grep -R LIBGIFSOMAJOR .
> ./Makefile:LIBGIFSOMAJOR        =3D libgif.$(SOEXTENSION).$(LIBMAJOR)
> ./Makefile:LIBGIFSOMAJOR   =3D libgif.$(LIBMAJOR).$(SOEXTENSION)
> ./Makefile:     $(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname
> -Wl,$(LIBGIFSOMAJOR) -o $(LIBGIFSO) $(OBJECTS)
> ./Makefile:     rm -f $(LIBGIFSOMAJOR)
> ./Makefile:     ln -sf $(LIBGIFSOVER) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSOMAJO=
R)"
> ./Makefile:     ln -sf $(LIBGIFSOMAJOR) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSO)"
> ./Makefile:             rm -f libgif.a $(LIBGIFSO) $(LIBGIFSOMAJOR)
> $(LIBGIFSOVER)
>
> but
> giflib-5.2.2 $ grep -R LIBUTILMAJOR .
> ./Makefile:     $(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname
> -Wl,$(LIBUTILMAJOR) -o $(LIBUTILSO) $(UOBJECTS)
>
> causing:
>
> 11.4.0/ld: fatal error: -soname: must take a non-empty argument
> collect2: error: ld returned 1 exit status
> make: *** [Makefile:112: libutil.so] Error 1
>
> lld doesn't seem to fail with empty -soname argument, but gold does.
>
> See https://sourceforge.net/p/giflib/bugs/143/
> introduced in:
> https://sourceforge.net/p/giflib/code/ci/b65c7ac2905c0842e7977a7b51d83af4=
486ca7b8/
>
> I think LIBUTILMAJOR should be LIBUTILSOMAJOR
>
>
> On Fri, Jun 14, 2024 at 4:01=E2=80=AFPM nikhil via lists.openembedded.org
> <nikhilar2410=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Upgrade to latest version giflib v5.2.2.
> >
> > This version fixes bugs listed in link below:
> > Link: https://sourceforge.net/p/giflib/code/ci/5.2.2/tree/NEWS
> >
> > Fixes for CVE-2023-48161, CVE-2022-28506, CVE-2023-39742
> > Link: https://clients.neighbourhood.ie/yocto/1-40.html#:~:text=3DCVE%2D=
2023%2D39742%3A%20giflib%3Agiflib%2Dnative
> >
> > Added dependency on ImageMagick which includes "convert" utility,
> > to ensure availability of required tool during compilation process.
> >
> > Add patch to rename binary used in Makefile from
> > "convert" to "convert.im7" as installed by imagemagick package.
> >
> > Signed-off-by: Bhabu Bindu <bhabubindu@kpit.com>
> > ---
> >  ...x_to_convert_binary_used_in_Makefile.patch | 42 +++++++++++++++++++
> >  .../{giflib_5.2.1.bb =3D> giflib_5.2.2.bb}      |  9 ++--
> >  2 files changed, 48 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-oe/recipes-devtools/giflib/files/add_suffix_to=
_convert_binary_used_in_Makefile.patch
> >  rename meta-oe/recipes-devtools/giflib/{giflib_5.2.1.bb =3D> giflib_5.=
2.2.bb} (65%)
> >
> > diff --git a/meta-oe/recipes-devtools/giflib/files/add_suffix_to_conver=
t_binary_used_in_Makefile.patch b/meta-oe/recipes-devtools/giflib/files/add=
_suffix_to_convert_binary_used_in_Makefile.patch
> > new file mode 100644
> > index 000000000..a01b28ac6
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binar=
y_used_in_Makefile.patch
> > @@ -0,0 +1,42 @@
> > +Subject: Modify binary name "convert" to "convert.im7"
> > +
> > +The change is needed to resolve the below compilation error
> > +after giflib version upgrade. Log data follows:
> > +| DEBUG: Executing shell function do_compile
> > +| NOTE: make -j 8
> > +| make -C doc
> > +| make[1]: Entering directory '../giflib/5.2.2/giflib-5.2.2/doc'
> > +| convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
> > +| make[1]: convert: No such file or directory
> > +| make[1]: *** [Makefile:46: giflib-logo.gif] Error 127
> > +| make[1]: Leaving directory '../giflib/5.2.2/giflib-5.2.2/doc'
> > +| make: *** [Makefile:93: all] Error 2
> > +| ERROR: oe_runmake failed
> > +
> > +Added dependency on ImageMagick which includes "convert" utility,
> > +to ensure availability of required tool during compilation process.
> > +
> > +This patch updates the binary name used in Makefile from
> > +"convert" to "convert.im7" for resizing the logo image used in HTML
> > +documentation as Imagemagick installs binary in this format.
> > +
> > +Below commits justify the cause of adding the suffix to binaries
> > +provided by ImageMagic package:
> > +https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-=
support/imagemagick?id=3Ddcbb49f707e7ad9bf755dd3275ffc442154b8144
> > +https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-=
support/imagemagick?id=3D6e0c24e9b3f9d430dec57f61f8c12c74bca5375d
> > +
> > +Signed-off-by:   Bhabu Bindu <bhabubindu@kpit.com>
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- a/doc/Makefile
> > ++++ b/doc/Makefile
> > +@@ -43,7 +43,7 @@
> > +
> > + # Logo image file for HTML docs
> > + giflib-logo.gif: ../pic/gifgrid.gif
> > +-      convert $^ -resize 50x50 $@
> > ++      convert.im7 $^ -resize 50x50 $@
> > +
> > + # Philosophical choice: the website gets the internal manual pages
> > + allhtml: $(XMLALL:.xml=3D.html) giflib-logo.gif
> > diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb b/meta-oe/=
recipes-devtools/giflib/giflib_5.2.2.bb
> > similarity index 65%
> > rename from meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> > rename to meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
> > index 79afe9a70..7d8a175fe 100644
> > --- a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> > +++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
> > @@ -5,10 +5,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae11c61b04=
b2917be39b11f78d71519a"
> >
> >  CVE_PRODUCT =3D "giflib_project:giflib"
> >
> > -DEPENDS =3D "xmlto-native"
> > +DEPENDS =3D "xmlto-native imagemagick-native"
> > +
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
> > +           file://add_suffix_to_convert_binary_used_in_Makefile.patch"
> > +
> > +SRC_URI[sha256sum] =3D "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9=
048b8ee3b66b29d5fb"
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
> > -SRC_URI[sha256sum] =3D "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f=
77a6d9acf0077879bd"
> >
> >  do_install() {
> >      # using autotools's default will end up in /usr/local
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110909): https://lists.openembedded.org/g/openembed=
ded-devel/message/110909
> > Mute This Topic: https://lists.openembedded.org/mt/106670583/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

