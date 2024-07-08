Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF8AC3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 11:17:07 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.77321.1720437417868558569
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 04:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gld87jrs;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so13276361fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 04:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720437416; x=1721042216; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wx0KxJh6qMC9Rmh4aQVJt8+bnOZybAqPi+lCVYXuzqE=;
        b=gld87jrsXktaKOFgUhoMqvfG8AGDqLTmBnfvY/lM4rWDEm1ydwCcQxk+PuGZ9VLXoz
         Wg3GgPOGN238NdV6Ja0ZzGym0EhtgvbtFsBCdsgYtKxQGbSoUm57SPzizaHcvv+QHM40
         vHuVDxIxQEkSA1ablndRq/R35xrmMevqRnx4ol80TGHOi70oJs2ipZ/FQOqC1YGCOHsn
         MiWEPrgWoTN/ckmNJIyCFcTE6tyZhaHtFweuTeAoTNK3ryYOn74qwDO6dipjX8tEgb53
         Z2Ohil0b5sDQrWQe9Dj/+T8nObysLBCsuwNuFNGc9xpq5HaFhoIIAOvpHEmY4muvya9R
         i8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720437416; x=1721042216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wx0KxJh6qMC9Rmh4aQVJt8+bnOZybAqPi+lCVYXuzqE=;
        b=tZnodEPID3lyApmgrDRiz5zkrjxvbsRdRfOaaKds80vmIeTVImDk28yVAmj5N9yARO
         OedUydGK3IiRDq91tM4H3PyFK0qExMosJyycsbT+ZVEtAQcnjKEWaNDj4TzSEIqNfgIQ
         TyXWwbFpmwh6zuk007MNrTSISuxW6khwo3c8LRC2sP13yfRXEbq4lubVOYCUGgx0o3rm
         Pe++zKBSX9NMm5RkX20vdVeIQizN6N1oRJBEnc1MDbb26yoHRGReNY1CSvPJ0tSfz5Oi
         q1N6NiFuLhDcRYfBPuB85+/DszCPEwqwwc17YKDct68tLM3Fqpt3B4trXgTDy2izSj34
         u3bg==
X-Gm-Message-State: AOJu0YzwelczaJS5ekq2cbKMdFwn4J0OQ7pDvZklftwpAXoRMtAJIinp
	oO5NGz3ufW+cc5btemL2SVjCPncSzPsuLaviKsvFF8XEs2Q+Q386s841naN6RJBf/tR9LibiFb2
	aJKGXxHYOvTTHBbjI4jfPStgXiV0=
X-Google-Smtp-Source: AGHT+IHbN5dcgfz7+ADt7ZXWLAfl/gVHk0o25JGlUqh8LCuNmMhD8lwpwA7P//EZamA8m7cMjCjxGAXABU5z69pWdAU=
X-Received: by 2002:a2e:8789:0:b0:2ee:8817:422d with SMTP id
 38308e7fff4ca-2ee8ed69ce3mr93522241fa.5.1720437415653; Mon, 08 Jul 2024
 04:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240614140101.641467-1-nikhil.r@kpit.com>
In-Reply-To: <20240614140101.641467-1-nikhil.r@kpit.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Jul 2024 13:16:48 +0200
Message-ID: <CA+chaQd5rg2Ps4+cfX+JTQ9EYwDrRHGx--9Z9Ba1oHRP5PyiFA@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] giflib: upgrade to version 5.2.2
To: nikhilar2410@gmail.com
Cc: openembedded-devel@lists.openembedded.org, bindu.bhabu@kpit.com, 
	Nikhil R <nikhil.r@kpit.com>, Bhabu Bindu <bhabubindu@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 11:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111263

This seems to break build with gold, because libutil.so is built with
empty soname param (libgif.so is fine):

giflib-5.2.2 $ grep soname ../temp/log.do_compile
ccache aarch64-webos-linux-gcc  -mcpu=3Dcortex-a72+crc
-mbranch-protection=3Dstandard -fstack-protector-strong  -O2
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
-Werror=3Dreturn-type --sysroot=3D/OE/lge/build/webos/styhe
ad/BUILD/work/raspberrypi4_64-webos-linux/giflib/5.2.2/recipe-sysroot
-std=3Dgnu99 -fPIC -Wall -Wno-format-truncation -O2 -shared -Wl,-O1
-Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
-fmacro-prefix-map=3D/OE/lge/build/webos/styhea
d/BUILD/work/raspberrypi4_64-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/s=
rc/debug/giflib/5.2.2
 -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_6=
4-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
 -
fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-=
webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
 -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_6=
4-webos-linux/giflib/5.2.2
/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
-fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64=
-webos-linux/giflib/5.2.2/recipe-sysroot=3D
 -fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_6=
4-webos
-linux/giflib/5.2.2/recipe-sysroot=3D
-fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64=
-webos-linux/giflib/5.2.2/recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now -Wl,-soname -Wl,libgif.so.7 -o libgif.so
dgif_lib.o egif_l
ib.o gifalloc.o gif_err.o gif_font.o gif_hash.o openbsd-reallocarray.o
ccache aarch64-webos-linux-gcc  -mcpu=3Dcortex-a72+crc
-mbranch-protection=3Dstandard -fstack-protector-strong  -O2
-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security
-Werror=3Dreturn-type --sysroot=3D/OE/lge/build/webos/styhe
ad/BUILD/work/raspberrypi4_64-webos-linux/giflib/5.2.2/recipe-sysroot
-std=3Dgnu99 -fPIC -Wall -Wno-format-truncation -O2 -shared -Wl,-O1
-Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
-fmacro-prefix-map=3D/OE/lge/build/webos/styhea
d/BUILD/work/raspberrypi4_64-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/s=
rc/debug/giflib/5.2.2
 -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_6=
4-webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
 -
fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-=
webos-linux/giflib/5.2.2/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
 -fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_6=
4-webos-linux/giflib/5.2.2
/giflib-5.2.2=3D/usr/src/debug/giflib/5.2.2
-fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64=
-webos-linux/giflib/5.2.2/recipe-sysroot=3D
 -fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_6=
4-webos
-linux/giflib/5.2.2/recipe-sysroot=3D
-fdebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64=
-webos-linux/giflib/5.2.2/recipe-sysroot-native=3D
 -Wl,-z,relro,-z,now -Wl,-soname -Wl, -o libutil.so qprintf.o
quantize.o getarg
.o

giflib-5.2.2 $ grep -R LIBGIFSOMAJOR .
./Makefile:LIBGIFSOMAJOR        =3D libgif.$(SOEXTENSION).$(LIBMAJOR)
./Makefile:LIBGIFSOMAJOR   =3D libgif.$(LIBMAJOR).$(SOEXTENSION)
./Makefile:     $(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname
-Wl,$(LIBGIFSOMAJOR) -o $(LIBGIFSO) $(OBJECTS)
./Makefile:     rm -f $(LIBGIFSOMAJOR)
./Makefile:     ln -sf $(LIBGIFSOVER) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSOMAJOR)=
"
./Makefile:     ln -sf $(LIBGIFSOMAJOR) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSO)"
./Makefile:             rm -f libgif.a $(LIBGIFSO) $(LIBGIFSOMAJOR)
$(LIBGIFSOVER)

but
giflib-5.2.2 $ grep -R LIBUTILMAJOR .
./Makefile:     $(CC) $(CFLAGS) -shared $(LDFLAGS) -Wl,-soname
-Wl,$(LIBUTILMAJOR) -o $(LIBUTILSO) $(UOBJECTS)

causing:

11.4.0/ld: fatal error: -soname: must take a non-empty argument
collect2: error: ld returned 1 exit status
make: *** [Makefile:112: libutil.so] Error 1

lld doesn't seem to fail with empty -soname argument, but gold does.

See https://sourceforge.net/p/giflib/bugs/143/
introduced in:
https://sourceforge.net/p/giflib/code/ci/b65c7ac2905c0842e7977a7b51d83af448=
6ca7b8/

I think LIBUTILMAJOR should be LIBUTILSOMAJOR


On Fri, Jun 14, 2024 at 4:01=E2=80=AFPM nikhil via lists.openembedded.org
<nikhilar2410=3Dgmail.com@lists.openembedded.org> wrote:
>
> Upgrade to latest version giflib v5.2.2.
>
> This version fixes bugs listed in link below:
> Link: https://sourceforge.net/p/giflib/code/ci/5.2.2/tree/NEWS
>
> Fixes for CVE-2023-48161, CVE-2022-28506, CVE-2023-39742
> Link: https://clients.neighbourhood.ie/yocto/1-40.html#:~:text=3DCVE%2D20=
23%2D39742%3A%20giflib%3Agiflib%2Dnative
>
> Added dependency on ImageMagick which includes "convert" utility,
> to ensure availability of required tool during compilation process.
>
> Add patch to rename binary used in Makefile from
> "convert" to "convert.im7" as installed by imagemagick package.
>
> Signed-off-by: Bhabu Bindu <bhabubindu@kpit.com>
> ---
>  ...x_to_convert_binary_used_in_Makefile.patch | 42 +++++++++++++++++++
>  .../{giflib_5.2.1.bb =3D> giflib_5.2.2.bb}      |  9 ++--
>  2 files changed, 48 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/giflib/files/add_suffix_to_c=
onvert_binary_used_in_Makefile.patch
>  rename meta-oe/recipes-devtools/giflib/{giflib_5.2.1.bb =3D> giflib_5.2.=
2.bb} (65%)
>
> diff --git a/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_=
binary_used_in_Makefile.patch b/meta-oe/recipes-devtools/giflib/files/add_s=
uffix_to_convert_binary_used_in_Makefile.patch
> new file mode 100644
> index 000000000..a01b28ac6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/giflib/files/add_suffix_to_convert_binary_=
used_in_Makefile.patch
> @@ -0,0 +1,42 @@
> +Subject: Modify binary name "convert" to "convert.im7"
> +
> +The change is needed to resolve the below compilation error
> +after giflib version upgrade. Log data follows:
> +| DEBUG: Executing shell function do_compile
> +| NOTE: make -j 8
> +| make -C doc
> +| make[1]: Entering directory '../giflib/5.2.2/giflib-5.2.2/doc'
> +| convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
> +| make[1]: convert: No such file or directory
> +| make[1]: *** [Makefile:46: giflib-logo.gif] Error 127
> +| make[1]: Leaving directory '../giflib/5.2.2/giflib-5.2.2/doc'
> +| make: *** [Makefile:93: all] Error 2
> +| ERROR: oe_runmake failed
> +
> +Added dependency on ImageMagick which includes "convert" utility,
> +to ensure availability of required tool during compilation process.
> +
> +This patch updates the binary name used in Makefile from
> +"convert" to "convert.im7" for resizing the logo image used in HTML
> +documentation as Imagemagick installs binary in this format.
> +
> +Below commits justify the cause of adding the suffix to binaries
> +provided by ImageMagic package:
> +https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-su=
pport/imagemagick?id=3Ddcbb49f707e7ad9bf755dd3275ffc442154b8144
> +https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-su=
pport/imagemagick?id=3D6e0c24e9b3f9d430dec57f61f8c12c74bca5375d
> +
> +Signed-off-by:   Bhabu Bindu <bhabubindu@kpit.com>
> +Upstream-Status: Inappropriate [OE specific]
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- a/doc/Makefile
> ++++ b/doc/Makefile
> +@@ -43,7 +43,7 @@
> +
> + # Logo image file for HTML docs
> + giflib-logo.gif: ../pic/gifgrid.gif
> +-      convert $^ -resize 50x50 $@
> ++      convert.im7 $^ -resize 50x50 $@
> +
> + # Philosophical choice: the website gets the internal manual pages
> + allhtml: $(XMLALL:.xml=3D.html) giflib-logo.gif
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb b/meta-oe/re=
cipes-devtools/giflib/giflib_5.2.2.bb
> similarity index 65%
> rename from meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> rename to meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
> index 79afe9a70..7d8a175fe 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
> @@ -5,10 +5,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dae11c61b04b2=
917be39b11f78d71519a"
>
>  CVE_PRODUCT =3D "giflib_project:giflib"
>
> -DEPENDS =3D "xmlto-native"
> +DEPENDS =3D "xmlto-native imagemagick-native"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
> +           file://add_suffix_to_convert_binary_used_in_Makefile.patch"
> +
> +SRC_URI[sha256sum] =3D "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a904=
8b8ee3b66b29d5fb"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
> -SRC_URI[sha256sum] =3D "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77=
a6d9acf0077879bd"
>
>  do_install() {
>      # using autotools's default will end up in /usr/local
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110909): https://lists.openembedded.org/g/openembedde=
d-devel/message/110909
> Mute This Topic: https://lists.openembedded.org/mt/106670583/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

